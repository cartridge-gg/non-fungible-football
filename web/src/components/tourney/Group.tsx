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
  Th,
  Thead,
  Tr,
} from "@chakra-ui/react";
import { Toggle } from "./Toggle";
import TournamentData from "tournament.json";

type TeamData = {
  flag: string;
  name: string;
  status: string;
  games: string;
  wins: string;
  draws: string;
  losses: string;
  pts: string;
};

const Row = ({
  flag,
  name,
  status,
  games,
  wins,
  draws,
  losses,
  pts,
}: Partial<TeamData>) => {
  return (
    <>
      <Tr bg="blue.200" key={name}>
        <Th>
          <VStack align="flex-start">
            <Text>{name}</Text>
            {status && <Text textStyle="bracket">{status}</Text>}
          </VStack>
        </Th>
        <Th>{games || "--"}</Th>
        <Th>{wins || "--"}</Th>
        <Th>{draws || "--"}</Th>
        <Th>{losses || "--"}</Th>
        <Th>{pts || "--"}</Th>
      </Tr>
      <Spacer minHeight="10px" />
    </>
  );
};

export const Group = () => {
  const [group, setGroup] = useState("A");
  const [teams, setTeams] = useState<Partial<TeamData>[]>([]);

  useEffect(() => {
    const data = TournamentData.groups[group].map((team) => {
      return {
        name: team,
      };
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
    <TableContainer>
      <Table variant="custom">
        <Thead>
          <Tr>
            <Th pl="0">
              <HStack gap="10px" w="150px">
                <Text flex="1">Group {group}</Text>
                <Toggle flex="1" next={onNext} prev={onPrev} size="sm" />
              </HStack>
            </Th>
            <Th>PG</Th>
            <Th>W</Th>
            <Th>D</Th>
            <Th>L</Th>
            <Th>PTS</Th>
          </Tr>
        </Thead>
        <Tbody>{teams.map((team) => Row(team))}</Tbody>
      </Table>
    </TableContainer>
  );
};
