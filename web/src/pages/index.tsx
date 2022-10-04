import { ReactNode } from "react";
import {
  Flex,
  Box,
  HStack,
  VStack,
  Text,
  Circle,
  useBreakpointValue,
} from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import BellIcon from "../components/icons/Bell";
import EthereumIcon from "../components/icons/Ethereum";
import TicketIcon from "../components/icons/Ticket";

const Callout = ({
  icon,
  title,
  description,
}: {
  icon: ReactNode;
  title: String;
  description: string;
}) => (
  <HStack spacing="24px">
    <Circle size="50px" bgColor="blue.300">
      {icon}
    </Circle>
    <VStack align="flex-start" spacing="0">
      <Text textStyle="h1">{title}</Text>
      <Text color="whiteAlpha.400">{description}</Text>
    </VStack>
  </HStack>
);

export default function Home() {
  return (
    <>
      <Flex
        h="100vh"
        w="full"
        gap="10px"
        position="fixed"
        direction={["column", "row"]}
      >
        <Nav flex="1" />
        <Flex flex="3" justify="center" align="center">
          <Flex
            gap="50px"
            align="center"
            direction={["column", "column", "row"]}
          >
            <Box
              minWidth="300px"
              minHeight="300px"
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
        </Flex>
      </Flex>
    </>
  );
}
