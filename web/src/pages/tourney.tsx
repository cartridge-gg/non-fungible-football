import Head from "next/head";
import { ReactNode, useState } from "react";
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
import TournamentData from "tournament.json";

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
          <Nav w="full" h="full" active={1} />
        </GridItem>
        <MotionGridItem area={"main"} ml={[0, 0, "140px"]} overflowY="auto">
          <Flex direction="column" h="full">
            <Flex
              align="flex-end"
              pr={[0, 0, "48px"]}
              py={[0, 0, "48px"]}
              justify="space-between"
            >
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
              <MotionFlex direction="column" gap="40px">
                {Object.keys(TournamentData.groups).map((letter, idx) => {
                  const teams = TournamentData.groups[letter];
                  return <Group letter={letter} key={idx} teams={teams} />;
                })}
              </MotionFlex>
            )}
            {state === State.TOURNAMENT && (
              <>
                <MotionFlex h="full">
                  <Playoff />
                </MotionFlex>
                <Spacer minHeight="100px" />
              </>
            )}
          </Flex>
        </MotionGridItem>
      </Grid>
    </>
  );
}
