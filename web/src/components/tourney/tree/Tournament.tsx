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
import Bracket from "./Bracket";

export const Tournament = () => {
  
  return (
    <HStack w="full">
      <VStack flex="1" h="full" >
        <Bracket />
      </VStack>
      <VStack  flex="1"  h="full">
        <Text>2</Text>
      </VStack>
      <VStack  flex="1"  h="full">
        <Text>3</Text>
      </VStack>
    </HStack>
  )
}