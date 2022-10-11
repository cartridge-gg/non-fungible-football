import { Box, Flex, VStack, Button } from "@chakra-ui/react";
import { Callout } from "./Callout";
import BellIcon from "../../components/icons/Bell";
import EthereumIcon from "../../components/icons/Ethereum";
import TicketIcon from "../../components/icons/Ticket";
import RunnerIcon from "components/icons/Runner";
import { useStarknet } from "@starknet-react/core";

export const Details = ({ onMint }: { onMint: () => void }) => {
  const { account } = useStarknet();
  return (
    <Flex
      h="full"
      gap={["25px", "25px", "100px"]}
      align="center"
      justify="center"
      direction={["column", "column", "row"]}
    >
      <Box
        minWidth={["250px", "300px", "300px"]}
        minHeight={["250px", "300px", "300px"]}
        borderRadius="12px"
        background="url(/mint_random.gif) center"
        backgroundSize="contain"
        boxShadow="15px 15px 20px rgba(0,0,0,0.2)"
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
          description="0.01 ETH"
        />
        <Callout icon={<TicketIcon />} title="Restrictions" description="TBD" />
        {account && (
          <Box pt={[0, 0, "30px"]} w={["full", "full", "auto"]}>
            <Button variant="mint" onClick={onMint} w="inherit">
              <RunnerIcon />
              Mint
            </Button>
          </Box>
        )}
      </VStack>
    </Flex>
  );
};
