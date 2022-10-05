import { Box, Flex, VStack } from "@chakra-ui/react";
import { Callout } from "./Callout";
import BellIcon from "../../components/icons/Bell";
import EthereumIcon from "../../components/icons/Ethereum";
import TicketIcon from "../../components/icons/Ticket";

export const Details = () => {
  return (
    <Flex
      h="full"
      gap={["50px", "50px", "100px"]}
      align="center"
      justify="center"
      direction={["column", "column", "row"]}
    >
      <Box
        minWidth={["200px", "300px"]}
        minHeight={["200px", "300px"]}
        borderRadius="12px"
        background="url(/trophy.png) center"
        backgroundSize="contain"
        filter="drop-shadow(15px 15px 20px #555)"
      />
      <VStack spacing="24px" align="flex-start">
        <Callout
          icon={<BellIcon />}
          title="Mint Time"
          description="Opens at 12:30 ET / 9:30 PT"
        />
        <Callout
          icon={<EthereumIcon />}
          title="Mint Price"
          description="0.05 ETH"
        />
        <Callout
          icon={<TicketIcon />}
          title="Mint Limit"
          description="1 Entry per Person"
        />
      </VStack>
    </Flex>
  );
};
