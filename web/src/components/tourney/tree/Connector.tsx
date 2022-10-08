import { Box, HStack, Circle, StyleProps } from "@chakra-ui/react";
import SwordsIcon from "components/icons/Swords";

const Connector = ({
  showIcon = false,
  ...rest
}: { showIcon?: boolean } & StyleProps) => {
  return (
    <HStack spacing="0"
    {...rest}>
      <Box
        w="full" 
        h="full"
        position="relative"
        borderRadius="0 4px 4px 0"
        border="1px solid"
        borderColor="blue.200"
        borderLeft="none"
      />
      {showIcon && (
        <>
          <Box h="1px" w="24px" bg="blue.200"></Box>
          <Circle
            size="24px"
            border="1px solid"
            borderColor="blue.200"
            bg="blue.300"
            position="absolute"
            transform="translateX(50%)"
          >
            <SwordsIcon color="yellow.500" size="sm" />
          </Circle>
        </>
      )}
    </HStack>
  );
};

export default Connector;
