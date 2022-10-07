import { useEffect, useState, useCallback } from "react";
import {
  Flex,
  Spacer,
  HStack,
  VStack,
  Text,
  Table,
  TableCaption,
  TableContainer,
  Tbody,
  Thead,
  Th,
  Td,
  Tr,
  useBreakpointValue,
} from "@chakra-ui/react";
import { Toggle } from "./Toggle";
import TournamentData from "tournament.json";
import { motion } from "framer-motion";

type TeamData = {
  flag: string;
  name: string;
  status: string;
  games: string;
  wins: string;
  draws: string;
  losses: string;
  pts: string;
  isMobile: boolean;
};

export const Group = () => {
  const [group, setGroup] = useState("A");
  const [teams, setTeams] = useState<Partial<TeamData>[]>([]);
  const isMobile = useBreakpointValue([false, false, true]);

  useEffect(() => {
    const data = TournamentData.groups[group].map((team) => {
      return {
        name: team,
        isMobile: isMobile,
      } as TeamData;
    });
    setTeams(data);
  }, [group]);

  const onNext = useCallback(() => {
    const keys = Object.keys(TournamentData.groups);
    const idx = keys.indexOf(group);
    setGroup(keys[idx + 1]);

    return idx !== keys.length - 2;
  }, [group]);

  const onPrev = useCallback(() => {
    const keys = Object.keys(TournamentData.groups);
    const idx = keys.indexOf(group);
    setGroup(keys[idx - 1]);

    return idx !== 1;
  }, [group]);

  return (
    <TableContainer w="full">
      <Table variant="custom">
        <Thead>
          <Tr>
            <Th pl="0">
              <HStack gap="10px" w="140px">
                <Text flex="1">Group {group}</Text>
                <Toggle flex="1" next={onNext} prev={onPrev} size="sm" />
              </HStack>
            </Th>
            {isMobile && <Th>PG</Th>}
            <Th>W</Th>
            <Th>D</Th>
            <Th>L</Th>
            {isMobile && <Th>PTS</Th>}
          </Tr>
        </Thead>
        <Tbody>
          {teams.map(({ name, games, wins, draws, status, losses, pts }) => {
            return (
              <Tr bg="blue.200" key={name}>
                <Td>
                  <VStack align="flex-start">
                    <Text>{name}</Text>
                    {status && <Text textStyle="bracket">{status}</Text>}
                  </VStack>
                </Td>
                {isMobile && <Td>{games || "--"}</Td>}
                <Td>{wins || "--"}</Td>
                <Td>{draws || "--"}</Td>
                <Td>{losses || "--"}</Td>
                {isMobile && <Td>{pts || "--"}</Td>}
              </Tr>
            );
          })}
        </Tbody>
      </Table>
    </TableContainer>
  );
};
