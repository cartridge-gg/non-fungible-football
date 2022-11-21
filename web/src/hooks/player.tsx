import { useState, useCallback, useEffect } from "react";
import { useStarknet } from "@starknet-react/core";
import { Provider, InvokeTransactionReceiptResponse } from "starknet";
import { CONTRACT_PLAYER } from "utils/constants";
import dataUriToBuffer from "data-uri-to-buffer";
import { toFelt } from "starknet/dist/utils/number";
import Storage from "utils/storage";

const INTERVAL = 10000;
const RETRIES = 3;

export type Mints = {
  [address: string]: {
    tokenIds: number[];
  };
};

const provider = new Provider({
  sequencer: {
    network: "mainnet-alpha",
  },
});

export const usePlayer = () => {
  const { account } = useStarknet();
  const [tokenIds, setTokenIds] = useState<number[]>([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    if (account) {
      const cached = Storage.get("mints");
      if (cached) {
        setTokenIds(cached[account]?.tokenIds || []);
      }

      fetchPlayer(account);
    }
  }, [account]);

  const fetchPlayer = async (account: string) => {
    setLoading(true);
    let response = await provider.callContract({
      contractAddress: CONTRACT_PLAYER,
      entrypoint: "balanceOf",
      calldata: [toFelt(account)],
    });

    const balance = Number(response.result[0]);
    if (balance == 0) {
      return;
    }

    let mints: Mints = Storage.get("mints") || {};
    if (mints[account]?.tokenIds.length === balance) {
      setTokenIds(mints[account].tokenIds);
      setLoading(false);
      return;
    }

    let ids = Array<number>();
    for (let i = 0; i < balance; i++) {
      response = await provider.callContract({
        contractAddress: CONTRACT_PLAYER,
        entrypoint: "tokenOfOwnerByIndex",
        calldata: [toFelt(account), toFelt(i), toFelt(0)],
      });

      ids.push(Number(response.result[0]));
    }

    mints[account] = { tokenIds: ids };
    Storage.set("mints", mints);

    setTokenIds(ids);
    setLoading(false);
  };

  const waitForMint = useCallback(async (hash: string) => {
    await waitForTx(hash, RETRIES);
    const receipt = (await provider.getTransactionReceipt(
      hash,
    )) as InvokeTransactionReceiptResponse;

    //tokenId is 2nd event 3rd param
    const tokenIdLow = receipt.events[1].data[2];
    const tokenIdHigh = receipt.events[1].data[3];

    const uri = await provider.callContract({
      contractAddress: CONTRACT_PLAYER,
      entrypoint: "tokenURI",
      calldata: [toFelt(tokenIdLow), toFelt(tokenIdHigh)],
    });

    // discard length
    uri.result.shift();

    const data = uri.result.map((felt) =>
      Buffer.from(felt.substring(2), "hex").toString(),
    );

    const decodedUri = dataUriToBuffer(data.join(""));
    const json = JSON.parse(decodedUri.toString());

    return json.image;
  }, []);

  const waitForTx = async (hash: string, retries: number) => {
    try {
      await provider.waitForTransaction(hash, INTERVAL);
    } catch (e) {
      if (retries > 0 && e.message === "NOT_RECEIVED") {
        console.info("retrying waitForTx");
        await waitForTx(hash, retries - 1);
      } else {
        console.error(e);
      }
    }
  };

  return {
    tokenIds: tokenIds,
    loading: loading,
    waitForMint: waitForMint,
  };
};
