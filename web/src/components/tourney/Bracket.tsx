import {
  Box,
  Flex,
  Text,
  HStack,
  VStack,
  Spacer,
  Circle,
  Button,
  StyleProps,
} from "@chakra-ui/react";
import CalendarIcon from "../icons/Calendar";
import Connector from "./Connector";

type Player = {
  name?: string;
  flag?: string;
  score?: number;
};

export type BracketProps = {
  playerOne?: Player;
  playerTwo?: Player;
  date?: string;
  isChampionship?: boolean;
};

export const Bracket = ({
  playerOne,
  playerTwo,
  date,
  isChampionship = false,
  ...rest
}: BracketProps & StyleProps) => {
  return (
    <VStack align="flex-start" position="relative">
      <HStack spacing="0">
        <VStack
          spacing="1px"
          bg="blue.300"
          borderRadius="4px"
          overflow="hidden"
          filter="drop-shadow(0px 5px 3px rgba(0,0,0,0.3))"
        >
          <PlayerBracket {...rest} />
          <PlayerBracket {...rest} />
        </VStack>
        {!isChampionship && <Connector {...rest} />}
      </HStack>
      <HStack color="blue.100" spacing="5px" position="absolute" bottom="-25px">
        <CalendarIcon size="sm" />
        <Text textStyle="date">{date || "TBD"}</Text>
      </HStack>
    </VStack>
  );
};

const PlayerBracket = ({ name, flag, score, ...rest }: Player & StyleProps) => {
  return (
    <HStack w="160px" bg="blue.200" pl="10px" textStyle="bracket" {...rest}>
      <Box
        width="24px"
        height="18px"
        bg="blue.100"
        opacity="0.3"
        borderRadius="2px"
        bgImage={`url('${flag}')`}
      />
      <Text color="blue.100">{name || "TBD"}</Text>
      <Spacer />
      <Flex h="full" w="40px" bg="blue.300" align="center" justify="center">
        {score || "-"}
      </Flex>
    </HStack>
  );
};
