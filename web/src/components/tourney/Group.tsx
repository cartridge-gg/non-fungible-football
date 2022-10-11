import Image from "next/future/image";
import { useEffect, useState, useMemo } from "react";
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
  results: { [team: number]: [number, number, number, number] };
};

const GroupTeam = ({
  name,
  code,
  result,
}: TeamData & {
  result?: [number, number, number, number];
}) => {
  const isMobile = useBreakpointValue([true, true, false]);

  return (
    <Tr bg="blue.200" key={name}>
      <Th minWidth={["150px", "200px", "300px"]} pl="12px">
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
      {!isMobile && <Th>{result && result[0] > 0 ? result[0] : "--"}</Th>}
      <Th>{result && result[1] > 0 ? result[1] : "--"}</Th>
      <Th>{result && result[2] > 0 ? result[2] : "--"}</Th>
      <Th>{result && result[3] > 0 ? result[3] : "--"}</Th>
    </Tr>
  );
};

export const Group = ({ letter, teams, results }: GroupProps) => {
  const isMobile = useBreakpointValue([true, true, false]);

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
          </Tr>
        </Thead>
        <Tbody>
          {teams.map((team, i) => (
            <GroupTeam
              key={i}
              {...team}
              result={results ? results[i] : undefined}
            />
          ))}
        </Tbody>
      </Table>
    </TableContainer>
  );
};
