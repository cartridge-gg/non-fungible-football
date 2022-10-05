import NextLink from "next/link";
import Head from "next/head";
import {
  Flex,
  Text,
  Image,
  Link,
  Button,
  Circle,
  HStack,
  VStack,
} from "@chakra-ui/react";
import Runner from "components/icons/Runner";
import Logo from "components/brand/Logo";
import { motion } from "framer-motion";

export default function Mint() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Flex
        as={motion.div}
        initial={{
          opacity: 0,
        }}
        animate={{
          opacity: 1,
        }}
        h="full"
        w="full"
        position="fixed"
        justify="center"
        align="center"
      >
        <VStack spacing="50px">
          <Image
            src="/mint_random.gif"
            height="300px"
            width="300px"
            borderRadius="10px"
          />
          <HStack spacing="20px">
            <Circle size="48px" bg="blue.200">
              <Runner />
            </Circle>
            <VStack align="flex-start" spacing="0">
              <Text textStyle="boldUpper">PENDING...</Text>
              <Link
                color="mint.500"
                textDecor="underline"
                isExternal
                href="https://goerli.voyager.online"
              >
                See on Voyager
              </Link>
            </VStack>
          </HStack>
          <NextLink href="/tourney">
            <Button variant="mint">
              <Logo width="24px" height="24px" fill="mint.500" /> Tournament
            </Button>
          </NextLink>
        </VStack>
      </Flex>
    </>
  );
}
