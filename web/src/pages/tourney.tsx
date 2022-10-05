import Head from "next/head";
import { useState } from "react";
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
import { Grid, MotionGridItem } from "../components/Grid";
import { Playoff, Group, Toggle } from "components/tourney";

enum State {
  GROUP,
  TOURNAMENT,
}

export default function Tourney() {
  const [state, setState] = useState<State>(State.GROUP);
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav py="50px" w="full" h="full" active={1} />
        </GridItem>
        <GridItem area={"spacer"} />
        <MotionGridItem area={"header"}>
          <Flex h="full" align="center" pr="48px">
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
        </MotionGridItem>
        <MotionGridItem area={"main"}>
          {state === State.GROUP ? <Group /> : <Playoff />}
        </MotionGridItem>
        <MotionGridItem area={"footer"}></MotionGridItem>
      </Grid>
    </>
  );
}
