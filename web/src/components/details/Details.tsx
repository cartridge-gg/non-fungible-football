import { Box, Flex, Stack, VStack, Button } from "@chakra-ui/react";
import { Callout } from "./Callout";
import BellIcon from "../../components/icons/Bell";
import EthereumIcon from "../../components/icons/Ethereum";
import TicketIcon from "../../components/icons/Ticket";
import EatenAppleIcon from "../../components/icons/EatenApple";
import RunnerIcon from "components/icons/Runner";
import { BigNumberish } from "starknet/dist/utils/number";
export const Details = ({
  supply,
  onMint,
}: {
  supply: BigNumberish;
  onMint: () => void;
}) => {
  const spacing = ["12px", "12px", "24px"];
  return (
    <Flex
      h="full"
      gap={["25px", "25px", "100px"]}
      align="center"
      justify="center"
      direction={["column", "column", "row"]}
    >
      <Box
        boxSize={["320px", "320px", "400px"]}
        borderRadius="12px"
        background="url(/mint_random.gif) center"
        backgroundSize="contain"
        boxShadow="15px 15px 20px rgba(0,0,0,0.2)"
      />
      <VStack spacing="24px" align="flex-start">
        <Stack direction={["row", "row", "column"]} spacing={spacing}>
          <VStack spacing={spacing} align="flex-start">
            <Callout icon={<BellIcon />} title="Mint Time" description="TBD" />
            <Callout
              icon={<EthereumIcon />}
              title="Mint Price"
              description="FREE"
            />
          </VStack>
          <VStack spacing={spacing} align="flex-start">
            <Callout
              icon={<TicketIcon />}
              title="Restrictions"
              description="One per account"
            />
            <Callout
              icon={<EatenAppleIcon boxSize="18px" />}
              title="Supply"
              description="832 Players"
              //description={`${supply} of 846 Minted`}
            />
          </VStack>
        </Stack>
        <Box pt={[0, 0, "30px"]} w={["full", "full", "auto"]}>
          <Button variant="mint" onClick={onMint} w="inherit">
            <RunnerIcon />
            Mint Player
          </Button>
        </Box>
      </VStack>
    </Flex>
  );
};
