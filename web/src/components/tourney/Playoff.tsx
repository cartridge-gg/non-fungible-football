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

const SPACING = 40;
const PLAYER_HEIGHT = 34;
const BRACKET_HEIGHT = PLAYER_HEIGHT * 2;
const CONNECTOR_HEIGHT = BRACKET_HEIGHT + SPACING;

export const Playoff = (props: StyleProps) => {
  return (
    <Flex {...props} gap="0" align="center">
      <VStack spacing={`${SPACING}px`}>
        <HStack spacing="0">
          <VStack spacing={`${SPACING}px`}>
            <Bracket height={`${PLAYER_HEIGHT}px`} />
            <Bracket height={`${PLAYER_HEIGHT}px`} />
          </VStack>
          <Connector height={`${CONNECTOR_HEIGHT}px`} showIcon />
        </HStack>
        <HStack spacing="0">
          <VStack spacing={`${SPACING}px`}>
            <Bracket height={`${PLAYER_HEIGHT}px`} />
            <Bracket height={`${PLAYER_HEIGHT}px`} />
          </VStack>
          <Connector height={`${CONNECTOR_HEIGHT}px`} showIcon />
        </HStack>
      </VStack>
      <HStack spacing="0">
        <VStack spacing={`${SPACING}px`}>
          <Bracket height={`${PLAYER_HEIGHT}px`} />
          <Spacer minHeight={`${BRACKET_HEIGHT}px`} />
          <Bracket height={`${PLAYER_HEIGHT}px`} />
        </VStack>
        <Connector height={`${CONNECTOR_HEIGHT * 2}px`} showIcon />
      </HStack>
      <VStack>
        <Bracket height={`${PLAYER_HEIGHT}px`} isChampionship />
      </VStack>
    </Flex>
  );
};
