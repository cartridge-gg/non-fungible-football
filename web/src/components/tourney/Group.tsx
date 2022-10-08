import Image from "next/future/image";
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
  useBreakpointValue,
} from "@chakra-ui/react";
import TournamentData from "tournament.json";
import { motion } from "framer-motion";

type TeamData = {
  flag: string;
  name: string;
  code: string;
  status: string;
  games: string;
  wins: string;
  draws: string;
  losses: string;
  pts: string;
  isMobile: boolean;
};

export const Group = ({ name }: { name: string }) => {
  const [group, setGroup] = useState(name);
  const [teams, setTeams] = useState<Partial<TeamData>[]>([]);
  const isMobile = useBreakpointValue([true, true, false]);

  useEffect(() => {
    const data = TournamentData.groups[group].map((name) => {
      return {
        name: name,
        code: TournamentData.teams[name],
        isMobile: isMobile,
      } as TeamData;
    });
    setTeams(data);
  }, [group]);

  return (
    <TableContainer w="full">
      <Table variant="custom">
        <Thead>
          <Tr>
            <Th pl="0">
              <HStack gap="10px" w="140px">
                <Text flex="1">Group {group}</Text>
              </HStack>
            </Th>
            {!isMobile && <Th>PG</Th>}
            <Th>W</Th>
            <Th>D</Th>
            <Th>L</Th>
            {!isMobile && <Th>PTS</Th>}
          </Tr>
        </Thead>
        <Tbody>
          {teams.map(
            ({ name, code, games, wins, draws, status, losses, pts }) => {
              return (
                <>
                  <Tr bg="blue.200" key={name}>
                    <Th width="300px" pl="12px">
                      <HStack spacing="24px">
                        <Image
                          height="48"
                          width="72"
                          src={`/flags/${name.toUpperCase()}.svg`}
                          style={{ borderRadius: "2px" }}
                          alt="flag"
                        />
                        <VStack align="flex-start">
                          <Text>{!isMobile ? name : code}</Text>
                          {status && <Text textStyle="bracket">{status}</Text>}
                        </VStack>
                      </HStack>
                    </Th>
                    {!isMobile && <Th>{games || "--"}</Th>}
                    <Th>{wins || "--"}</Th>
                    <Th>{draws || "--"}</Th>
                    <Th>{losses || "--"}</Th>
                    {!isMobile && <Th>{pts || "--"}</Th>}
                  </Tr>
                  <Spacer minHeight="10px" />
                </>
              );
            },
          )}
        </Tbody>
      </Table>
    </TableContainer>
  );
};
