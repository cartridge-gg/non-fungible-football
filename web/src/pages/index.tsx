import Head from "next/head";
import {
  Box,
  Text,
  Flex,
  GridItem,
  HStack,
  VStack,
  Circle,
  Button,
} from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Callout } from "../components/details/Callout";
import { Grid, MotionGridItem } from "../components/Grid";
import BellIcon from "../components/icons/Bell";
import EthereumIcon from "../components/icons/Ethereum";
import TicketIcon from "../components/icons/Ticket";
import RunnerIcon from "../components/icons/Runner";
import CartridgeIcon from "../components/icons/Cartridge";
import LogoutIcon from "../components/icons/Logout";

export default function Home() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav py="50px" w="full" h="full" />
        </GridItem>
        <GridItem area={"spacer"} />
        <MotionGridItem area={"header"}></MotionGridItem>
        <MotionGridItem area={"main"}>
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
        </MotionGridItem>
        <MotionGridItem area={"footer"}>
          <HStack
            h="full"
            align="center"
            justify="flex-end"
            px="50px"
            spacing="12px"
          >
            <Circle
              size="46px"
              border="2px solid"
              borderColor="blue.100"
              as="button"
            >
              <LogoutIcon />
            </Circle>
            <Button variant="secondary">
              <CartridgeIcon /> Mr. Fax
            </Button>
            <Button>
              <RunnerIcon />
              Mint
            </Button>
          </HStack>
        </MotionGridItem>
      </Grid>
    </>
  );
}
