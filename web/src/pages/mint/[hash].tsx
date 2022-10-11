import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import NextLink from "next/link";
import Head from "next/head";
import {
  Box,
  Flex,
  Text,
  Link,
  Button,
  Circle,
  HStack,
  VStack,
} from "@chakra-ui/react";
import Runner from "components/icons/Runner";
import Logo from "components/brand/Logo";
import { usePlayer } from "hooks/player";
import { motion } from "framer-motion";
import Confetti from "react-dom-confetti";

export default function Mint() {
  const router = useRouter();
  const { hash } = router.query as { hash: string };
  const { waitForMint } = usePlayer();
  const [svg, setSvg] = useState<string>();
  const [error, setError] = useState<Error>();
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    if (hash) {
      setLoading(true);
      waitForMint(hash)
        .then((svg) => setSvg(svg))
        .catch((e) => setError(e))
        .finally(() => setLoading(false));
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
          <Box
            height="300px"
            width="300px"
            borderRadius="10px"
            background={`url('${
              svg ? svg.replace(/#/g, "%23") : "/mint_random.gif"
            }') no-repeat center/100%`}
            boxShadow="0px 0px 20px rgba(0,0,0,0.2)"
          />
          <Confetti active={!loading} />
          <HStack spacing="20px">
            <Circle size="48px" bg="blue.200">
              <Runner />
            </Circle>
            <VStack align="flex-start" spacing="0">
              {!error ? (
                <Text textStyle="boldUpper">
                  {loading ? "PENDING..." : "SUCCESS"}
                </Text>
              ) : (
                <Text>ERROR: {error.message}</Text>
              )}

              <Link
                color="mint.500"
                textDecor="underline"
                isExternal
                href={`https://goerli.voyager.online/tx/${hash}`}
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
