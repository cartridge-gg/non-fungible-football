import { useState, useCallback, useEffect } from "react";
import { useStarknet } from "@starknet-react/core";
import { defaultProvider, InvokeTransactionReceiptResponse } from "starknet";
import { CONTRACT_PLAYER } from "utils/constants";
import dataUriToBuffer from "data-uri-to-buffer";
import { bnToUint256 } from "starknet/utils/uint256";
import { toFelt, hexToDecimalString } from "starknet/utils/number";

const INTERVAL = 2500;

export const usePlayer = () => {
  const { account } = useStarknet();
  const [players, setPlayers] = useState<string[]>([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(()=>{
    if(account) {
      fetchPlayer(account);
    }
  }, [account])

  const fetchPlayer = async (account: string) => {
    const response = await defaultProvider.callContract({
      contractAddress: CONTRACT_PLAYER,
      entrypoint: "balanceOf",
      calldata: [toFelt(account)],
    });

    const balance = Number(response.result[0]);

    if(balance == 0) {
      return;
    }

    // check if cached
    
  }

  const waitForMint = useCallback(async (hash: string) => {
    setLoading(true);
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

    setLoading(false);
    return json.image;
  }, []);

  return {
    players: players,
    loading: loading,
    waitForMint: waitForMint,
  };
};
