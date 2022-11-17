import { useEffect, useMemo } from "react";
import Head from "next/head";
import { useRouter } from "next/router";
import {
  useStarknet,
  useContract,
  useStarknetCall,
  useStarknetExecute,
} from "@starknet-react/core";
import { Flex } from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid } from "../components/Grid";
import { MotionFlex, MotionGridItem } from "components/MotionWrappers";
import { Details } from "components/details/Details";
import PlayerAbi from "abi/player_abi.json";
import { CONTRACT_ETH, CONTRACT_PLAYER, PLAYER_PRICE } from "utils/constants";
import { Abi } from "starknet";
import { uint256ToBN } from "starknet/dist/utils/uint256";

export default function Home() {
  const router = useRouter();
  const { account } = useStarknet();
  const { contract } = useContract({
    address: CONTRACT_PLAYER,
    abi: PlayerAbi as Abi,
  });

  const {
    data: callData,
    loading: loadingSupply,
    error: errorSupply,
  } = useStarknetCall({
    contract,
    method: "totalSupply",
  });

  const calls = useMemo(() => {
    const ethApprove = {
      contractAddress: CONTRACT_ETH,
      entrypoint: "approve",
      calldata: [CONTRACT_PLAYER, PLAYER_PRICE, "0"],
    };
    const mint = {
      contractAddress: CONTRACT_PLAYER,
      entrypoint: "purchase",
      calldata: [PLAYER_PRICE],
    };
    return [ethApprove, mint];
  }, []);

  const {
    data: executeData,
    loading,
    error,
    execute,
  } = useStarknetExecute({ calls });

  useEffect(() => {
    if (executeData) {
      router.push(`/mint/${executeData}`);
    }
  }, [router, executeData]);

  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <MotionFlex
        position="fixed"
        boxSize="full"
        align="center"
        justify="center"
      >
        <Details
          onMint={() => {
            window.open(
              "https://cartridge.gg/signup/non-fungible-football?redirect_uri=https://nff.gg/mint",
            );
          }}
          supply={callData && uint256ToBN(callData[0]).toString()}
        />
      </MotionFlex>
    </>
  );
}
