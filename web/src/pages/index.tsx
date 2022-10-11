import { useEffect, useMemo } from "react";
import Head from "next/head";
import { useRouter } from "next/router";
import {
  useConnectors,
  useStarknet,
  useStarknetExecute,
  useStarknetInvoke,
} from "@starknet-react/core";
import { GridItem, Button } from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid } from "../components/Grid";
import { MotionGridItem } from "components/MotionWrappers";
import { Details } from "components/details/Details";
import { CONTRACT_ETH, CONTRACT_PLAYER, PLAYER_PRICE } from "utils/constants";

export default function Home() {
  const router = useRouter();
  const { account } = useStarknet();

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
  }, [account]);

  const { data, loading, error, execute } = useStarknetExecute({ calls });

  useEffect(() => {
    if (data) {
      router.push(`/mint/${data}`);
    }
  }, [data]);

  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav w="full" h="full" />
        </GridItem>
        <MotionGridItem area={"main"} ml={[0, 0, "50px"]}>
          <Details
            onMint={() => {
              execute();
            }}
          />
        </MotionGridItem>
      </Grid>
    </>
  );
}
