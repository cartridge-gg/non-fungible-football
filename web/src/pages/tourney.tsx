import Head from "next/head";
import { ReactNode, useEffect, useRef, useState } from "react";
import {
  Flex,
  Box,
  Text,
  Circle,
  HStack,
  VStack,
  Spacer,
  GridItem,
} from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid } from "../components/Grid";
import { MotionFlex, MotionGridItem } from "components/MotionWrappers";
import { Playoff, Group, Toggle } from "components/tourney";
import { Connect } from "components/Connect";
import panzoom from "panzoom";

enum State {
  GROUP,
  TOURNAMENT,
}

export default function Tourney() {
  const playoffRef = useRef<HTMLDivElement>(null);
  const [state, setState] = useState<State>(State.GROUP);
  useEffect(() => {
    const pz =
      state === State.TOURNAMENT ? panzoom(playoffRef.current) : undefined;

    return () => {
      pz?.dispose();
    };
  }, [state]);
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav w="full" h="full" active={1} />
        </GridItem>
        <MotionGridItem area={"main"} ml={[0, 0, "140px"]}>
          <Flex py="50px" align="center" pr={[0, 0, "48px"]}>
            <VStack spacing="5px" align="flex-start">
              {state === State.GROUP ? (
                <>
                  <Text textStyle="h1">Group Stage</Text>
                  <Text color="whiteAlpha.400">
                    December 3rd to December 18th
                  </Text>
                </>
              ) : (
                <>
                  <Text textStyle="h1">Tournament Stage</Text>
                  <Text color="whiteAlpha.400">
                    December 3rd to December 18th
                  </Text>
                </>
              )}
            </VStack>
            <Spacer />
            <HStack>
              <Toggle
                next={() => {
                  setState(1);
                  return false;
                }}
                prev={() => {
                  setState(0);
                  return false;
                }}
              />
            </HStack>
          </Flex>
          {state === State.GROUP && (
            <MotionFlex h="full" alignItems="flex-start">
              <Group />
            </MotionFlex>
          )}
          {state === State.TOURNAMENT && (
            <MotionFlex h="full" alignItems="flex-start">
              <Flex ref={playoffRef}>
                <Playoff />
              </Flex>
            </MotionFlex>
          )}
        </MotionGridItem>
        <MotionGridItem area={"footer"}>
          <Connect />
        </MotionGridItem>
      </Grid>
    </>
  );
}
