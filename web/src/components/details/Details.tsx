import { useState, useEffect } from "react";
import {
  Box,
  Flex,
  Stack,
  Circle,
  HStack,
  VStack,
  Button,
  useDisclosure,
} from "@chakra-ui/react";
import { Provider } from "starknet";
import { BigNumberish } from "starknet/dist/utils/number";
import { uint256ToBN } from "starknet/dist/utils/uint256";
import { CONTRACT_PLAYER } from "utils/constants";

import { Callout } from "./Callout";
import BellIcon from "../../components/icons/Bell";
import EthereumIcon from "../../components/icons/Ethereum";
import TicketIcon from "../../components/icons/Ticket";
import EatenAppleIcon from "../../components/icons/EatenApple";
import RunnerIcon from "components/icons/Runner";
import { Howto } from "components/modals/Howto";

const provider = new Provider({
  sequencer: {
    network: "mainnet-alpha",
  },
});

export const Details = () => {
  const [totalSupply, setTotalSupply] = useState<BigNumberish>();
  const { isOpen, onOpen, onClose } = useDisclosure();

  useEffect(() => {
    provider
      .callContract({
        contractAddress: CONTRACT_PLAYER,
        entrypoint: "totalSupply",
      })
      .then((res) => {
        setTotalSupply(
          uint256ToBN({
            high: res.result[1],
            low: res.result[0],
          }),
        );
      })
      .catch((e) => console.error(e));
  }, []);

  const spacing = ["12px", "12px", "24px"];

  return (
    <>
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
              <Callout
                icon={<BellIcon />}
                title="Mint Time"
                description="SOLD OUT"
              />
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
                description={
                  totalSupply ? `832 of 832 Minted` : "Loading..."
                }
              />
            </VStack>
          </Stack>
        </VStack>
      </Flex>
      <Howto isOpen={isOpen} onClose={onClose} />
    </>
  );
};
