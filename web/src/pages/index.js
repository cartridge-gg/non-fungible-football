import Head from "next/head";
import { Button, Flex } from "@chakra-ui/react";
import Logo from "../components/brand/Logo";
import Word from "../components/brand/Word";
import Ethereum from "../components/icons/Ethereum";

export default function Home() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
        <meta name="" content="" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Flex
        h="100vh"
        w="full"
        position="fixed"
        align="center"
        justify="center"
        direction={["column", "row"]}
      >
        <Logo />
        <Word />
      </Flex>
    </>
  );
}
