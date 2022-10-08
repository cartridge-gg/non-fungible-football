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
import {Country, CountryProps} from "./Country";
import CalendarIcon from "../../icons/Calendar";
import Connector from "./Connector";

export type BracketProps = {
  playerOne?: CountryProps;
  playerTwo?: CountryProps;
  date?: string;
  isChampionship?: boolean;
};


 const Bracket = ({
  playerOne,
  playerTwo,
  date,
  isChampionship = false,
}: BracketProps & StyleProps) => {
  const height = "64px";
  const width = "200px";
  return (
    <VStack align="flex-start" position="relative" w="full">
      <HStack spacing="0" w="full" >
        <VStack
          w={width}
          h={height}
          spacing="1px"
          bg="blue.300"
          borderRadius="4px"
          overflow="hidden"
          boxShadow="0 3px 5px rgba(0,0,0,0.3)"
        >
          <Country />
          <Country />
        </VStack>
        {!isChampionship && <Connector height={`calc(${height}/2)`} flex="1" />}
      </HStack>
      <HStack color="blue.100" spacing="5px" position="absolute" bottom="-25px">
        <CalendarIcon size="sm" />
        <Text textStyle="date">{date || "TBD"}</Text>
      </HStack>
    </VStack>
  );
};

export default Bracket;