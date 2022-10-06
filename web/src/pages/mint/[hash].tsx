import { ReactNode, useEffect, useState } from "react";
import { useRouter } from "next/router";
import NextLink from "next/link";
import Head from "next/head";
import {
  Box,
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
import { defaultProvider } from "starknet";
import { motion } from "framer-motion";

export default function Mint() {
  const router = useRouter();
  const { hash } = router.query as { hash: string };
  const [isFinalized, setFinalized] = useState<boolean>(false);
  const [error, setError] = useState<Error>();
  const [imgSrc, setImgSrc] = useState<string>("mint_random.gif");

  useEffect(() => {
    if (hash) {
      defaultProvider
        .waitForTransaction(hash, 1000)
        .then(() => {
          setFinalized(true);
          setImgSrc("animation_USA_15.gif");
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [hash]);

  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Flex
        as={motion.div}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        h="full"
        w="full"
        position="fixed"
        justify="center"
        align="center"
      >
        <VStack spacing="50px">
          <Image
            src={`/${imgSrc}`}
            borderRadius="10px"
            height="300px"
            width="300px"
          />
          <HStack spacing="20px">
            {error ? (
              <Text>ERROR: {error.message}</Text>
            ) : (
              <>
                <Circle size="48px" bg="blue.200">
                  <Runner />
                </Circle>
                <VStack align="flex-start" spacing="0">
                  <Text textStyle="boldUpper">
                    {isFinalized ? "SUCCESS" : "PENDING..."}{" "}
                  </Text>
                  <Link
                    color="mint.500"
                    textDecor="underline"
                    isExternal
                    href={`https://goerli.voyager.online/tx/${hash}`}
                  >
                    See on Voyager
                  </Link>
                </VStack>
              </>
            )}
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
