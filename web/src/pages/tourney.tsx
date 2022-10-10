import Head from "next/head";
import { ReactNode, useEffect, useState } from "react";
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
import { defaultProvider } from "starknet";

enum State {
  GROUP,
  TOURNAMENT,
}

export default function Tourney() {
  const [results, setResults] = useState<{
    [team: number]: [number, number, number, number];
  }>();
  const [state, setState] = useState<State>(State.GROUP);
  useEffect(() => {
    defaultProvider
      .callContract({
        contractAddress:
          "0x0450a472cc83e3dc27529e7aef93e3893d9aa16a86fe8b6d49fd460f0537b408",
        entrypoint: "results",
        calldata: [
          "48",
          ...Array.from(Array(48).keys()).map((k) => "" + (k + 1)),
        ],
      })
      .then((response) => {
        response.result.shift();

        const results = {};
        for (var i = 0; i < response.result.length - 1; i += 2) {
          const idx = i / 2;
          const resultA = parseInt(response.result[i], 16) - 1;
          const resultB = parseInt(response.result[i + 1], 16) - 1;

          const teams = TournamentData.matches[idx];

          // Teams are 1 indexed in match data
          const teamA = teams[0] - 1;
          const teamB = teams[1] - 1;

          if (!(teamA in results)) {
            // PG	W	D	L	PTS
            results[teamA] = [0, 0, 0, 0];
          }

          if (!(teamB in results)) {
            // PG	W	D	L	PTS
            results[teamB] = [0, 0, 0, 0];
          }

          if (resultA === -1) {
            continue;
          }

          results[teamA][0] += 1;
          results[teamA][1] += Number(resultA > resultB);
          results[teamA][2] += Number(resultA === resultB);
          results[teamA][3] += Number(resultA < resultB);

          results[teamB][0] += 1;
          results[teamB][1] += Number(resultB > resultA);
          results[teamB][2] += Number(resultB === resultA);
          results[teamB][3] += Number(resultB < resultA);
        }

        setResults(results);
      });
  }, []);

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
                  return (
                    <Group
                      letter={letter}
                      key={idx}
                      teams={teams}
                      results={results}
                    />
                  );
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
