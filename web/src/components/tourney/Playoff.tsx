import {
  Box,
  Spacer,
  Flex,
  HStack,
  VStack,
  StyleProps,
} from "@chakra-ui/react";
import { Bracket } from "./Bracket";
import Connector from "./Connector";

export const Playoff = (props: StyleProps) => {
  const spacing = "50px";
  const height = "64px";
  const width = "160px";
  return (
    <Flex {...props} gap="0" align="center">
      <VStack spacing={spacing}>
        <HStack spacing="0">
          <VStack spacing={spacing}>
            <Bracket height={height} width={width} />
            <Bracket height={height} width={width} />
          </VStack>
          <Connector height={`calc(${height} + ${spacing})`} showIcon />
        </HStack>
        <HStack spacing="0">
          <VStack spacing={spacing}>
            <Bracket height={height} width={width} />
            <Bracket height={height} width={width} />
          </VStack>
          <Connector height={`calc(${height} + ${spacing})`} showIcon />
        </HStack>
      </VStack>
      <HStack spacing="0">
        <VStack spacing={spacing}>
          <Bracket height={height} width={width} />
          <Spacer minHeight={height} />
          <Bracket height={height} width={width} />
        </VStack>
        <Connector height={`calc((${height} + ${spacing}) * 2)`} showIcon />
      </HStack>
      <VStack>
        <Bracket height={height} width={width} isChampionship />
      </VStack>
    </Flex>
  );
};
