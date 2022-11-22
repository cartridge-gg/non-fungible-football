import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import Confetti from "react-confetti";
import Head from "next/head";
import {
  Box,
  Flex,
  Text,
  Link,
  Circle,
  HStack,
  VStack,
  useDisclosure,
} from "@chakra-ui/react";
import Runner from "components/icons/Runner";
import { usePlayer } from "hooks/player";
import { motion } from "framer-motion";
import { Howto } from "components/modals/Howto";

export default function Mint() {
  const router = useRouter();
  const { hash } = router.query as { hash: string };
  const { waitForMint } = usePlayer();
  const [error, setError] = useState<Error>();
  const [loading, setLoading] = useState<boolean>(true);
  const [svg, setSvg] = useState<string>();
  const { isOpen, onOpen, onClose } = useDisclosure();

  useEffect(() => {
    if (hash) {
      waitForMint(hash)
        .then((svg) => setSvg(svg))
        .catch((e) => setError(e))
        .finally(() => setLoading(false));
    }
  }, [hash, waitForMint]);

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
        <VStack spacing="30px">
          <VStack
            spacing="5px"
            opacity={svg ? 1 : 0}
            transition="opacity 0.1s ease"
          >
            <Text fontSize="17px" fontWeight="bold">
              {"You've claimed your NFF starterpack"}
            </Text>
            <Text fontSize="13px" color="whiteAlpha.400">
              Reveal Coming Soon
            </Text>
          </VStack>
          <Box
            height="300px"
            width="300px"
            borderRadius="10px"
            background={`url('${
              svg ? svg.replace(/#/g, "%23") : "/mint_random.gif"
            }') no-repeat center/100%`}
            boxShadow="0px 0px 20px rgba(0,0,0,0.2)"
          />
          <HStack spacing="20px">
            <Circle size="48px" bg="blue.200">
              <Runner />
            </Circle>
            <VStack align="flex-start" spacing="0">
              {!error ? (
                <Text textStyle="boldUpper">
                  {svg ? "SUCCESS" : "PENDING..."}
                </Text>
              ) : (
                <Text>ERROR: {error.message}</Text>
              )}

              <Link
                color="mint.500"
                textDecor="underline"
                isExternal
                href={`https://starkscan.co/tx/${hash}`}
              >
                View on Starkscan
              </Link>
            </VStack>
          </HStack>
          <Circle
            as="button"
            size="45px"
            border="2px solid"
            borderColor="blue.100"
            fontSize="24px"
            _hover={{
              bgColor: "blue.100",
            }}
            onClick={onOpen}
          >
            ?
          </Circle>
        </VStack>
      </Flex>
      {svg && (
        <Confetti
          width={window.innerWidth}
          height={window.innerHeight}
          run={!!svg}
          colors={[
            "#FFBD00",
            "rgba(255, 191, 0, 0.85)",
            "rgba(255, 191, 0, 0.4)",
            "#FFF",
          ]}
          opacity={0.4}
        />
      )}
      <Howto isOpen={isOpen} onClose={onClose} />
    </>
  );
}
