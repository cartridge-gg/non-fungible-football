import Head from "next/head";
import { Flex, Box, Text, HStack, VStack, Spacer } from "@chakra-ui/react";
import { Nav } from "../components/Nav";

export default function Tourney() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Flex
        h="100vh"
        w="full"
        gap="10px"
        position="fixed"
        align="stretch"
        direction={["column", "row"]}
      >
        <Nav flex="1" active={1} />
        <Flex flex="3"></Flex>
      </Flex>
    </>
  );
}
