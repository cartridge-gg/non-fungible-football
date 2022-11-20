import { useState, useCallback, useEffect } from "react";
import { useStarknet } from "@starknet-react/core";
import { defaultProvider, InvokeTransactionReceiptResponse } from "starknet";
import { CONTRACT_PLAYER } from "utils/constants";
import dataUriToBuffer from "data-uri-to-buffer";
import { toFelt } from "starknet/dist/utils/number";
import Storage from "utils/storage";

const INTERVAL = 10000;

export type Mints = {
  [address: string]: {
    tokenIds: number[];
  };
};

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
    let response = await defaultProvider.callContract({
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
      response = await defaultProvider.callContract({
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
    await defaultProvider.waitForTransaction(hash, INTERVAL);
    const receipt = (await defaultProvider.getTransactionReceipt(
      hash,
    )) as InvokeTransactionReceiptResponse;

    //tokenId is 2nd event 3rd param
    const tokenIdLow = receipt.events[1].data[2];
    const tokenIdHigh = receipt.events[1].data[3];

    const uri = await defaultProvider.callContract({
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

  return {
    tokenIds: tokenIds,
    loading: loading,
    waitForMint: waitForMint,
  };
};
