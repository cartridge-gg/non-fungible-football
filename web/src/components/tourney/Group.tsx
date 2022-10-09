import Image from "next/future/image";
import { useEffect, useState, useCallback } from "react";
import {
  HStack,
  VStack,
  Text,
  Table,
  TableContainer,
  Tbody,
  Th,
  Thead,
  Tr,
  useBreakpointValue,
} from "@chakra-ui/react";
type TeamData = {
  name: string;
  code: string;
};

export type GroupProps = {
  letter: string;
  teams: TeamData[];
};

export const Group = ({ letter, teams: data }: GroupProps) => {
  const [teams, setTeams] = useState<TeamData[]>([]);
  const isMobile = useBreakpointValue([true, true, false]);

  useEffect(() => {
    setTeams(data);
  }, []);

  return (
    <TableContainer w="full">
      <Table variant="custom">
        <Thead>
          <Tr>
            <Th pl="0">
              <HStack gap="10px" w="140px">
                <Text flex="1">Group {letter}</Text>
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
          {teams.map(({ name, code }) => (
            <Tr bg="blue.200" key={name}>
              <Th minWidth="200px" pl="12px">
                <HStack spacing="24px">
                  <Image
                    height="48"
                    width="72"
                    src={`/flags/${name.toUpperCase()}.svg`}
                    style={{
                      minHeight: "48px",
                      borderRadius: "2px",
                      boxShadow: "0 3px 5px rgba(0,0,0,0.3)",
                    }}
                    alt={`${name} flag`}
                  />
                  <VStack align="flex-start">
                    <Text>{!isMobile ? name : code}</Text>
                  </VStack>
                </HStack>
              </Th>
              {!isMobile && <Th>{"--"}</Th>}
              <Th>{"--"}</Th>
              <Th>{"--"}</Th>
              <Th>{"--"}</Th>
              {!isMobile && <Th>{"--"}</Th>}
            </Tr>
          ))}
        </Tbody>
      </Table>
    </TableContainer>
  );
};
