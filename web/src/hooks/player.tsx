import { useState, useCallback, useEffect } from "react";
import { defaultProvider, InvokeTransactionReceiptResponse } from "starknet";
import { CONTRACT_PLAYER } from "utils/constants";
import dataUriToBuffer from "data-uri-to-buffer";
import { bnToUint256 } from "starknet/utils/uint256";
import { toFelt } from "starknet/utils/number";

const INTERVAL = 2500;

export const usePlayer = () => {
  const [svg, setSvg] = useState<string>();
  const [loading, setLoading] = useState<boolean>();

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

    setSvg(json.image);
    setLoading(false);
  }, []);

  return {
    svg: svg,
    loading: loading,
    waitForMint: waitForMint,
  };
};
