import Head from "next/head";
import { Flex } from "@chakra-ui/react";
import Logo from "../components/brand/Logo";
import Word from "../components/brand/Word";

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
        w="100vw"
        position="fixed"
        align="center"
        justify="center"
        direction={["column", "row"]}
      >
        <Logo width="200px" height="200px" />
        <Word width="200px" height="200px" />
      </Flex>
    </>
  );
}
