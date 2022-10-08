import {
  Box,
  Flex,
  Text,
  HStack,
  Spacer,
} from "@chakra-ui/react";

export type CountryProps = {
  name?: string;
  flag?: string;
  score?: number;
};


export const Country = ({ name, flag, score }: CountryProps) => {
  return (
    <HStack bg="blue.200" pl="10px" textStyle="bracket" h="full" w="full">
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
