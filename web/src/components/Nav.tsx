import Link from "next/link";
import {
  Flex,
  Box,
  Text,
  HStack,
  VStack,
  Spacer,
  StyleProps,
} from "@chakra-ui/react";
import Logo from "../components/brand/Logo";
import Word from "../components/brand/Word";
import { Connect } from "./Connect";
import { usePlayer } from "hooks/player";
import { useEffect } from "react";
import { Owned } from "./Owned";

export type NavProps = {
  active?: number;
};

export const Nav = ({ active = 0, ...rest }: NavProps & StyleProps) => {
  const { tokenIds } = usePlayer();
  const items = [
    { name: "Mint", url: "/" },
    { name: "Tourney", url: "/tourney" },
  ];

  return (
    <Flex
      py={[0, 0, "20px"]}
      direction={["row", "row", "column"]}
      align="center"
      justify="space-between"
      {...rest}
    >
      <HStack>
        <Logo height="60px" width="60px" />
        <Word pl="10px" width="100px" height="100px" />
      </HStack>
      <VStack w="full" spacing="40px">
        <Owned tokenIds={tokenIds} />
        <Flex
          w="full"
          gap={["5px", "5px", "18px"]}
          direction={["row", "row", "column"]}
          justify="flex-end"
        >
          {items.map((item, i) => (
            <Link href={item.url} key={i}>
              <HStack
                as="button"
                w={["auto", "auto", "full"]}
                borderBottom="2px solid"
                color={active === i ? "yellow.500" : "blue.100"}
                px="10px"
              >
                <Spacer maxWidth="60%" display={["none", "none", "block"]} />
                <Text textStyle="boldUpper">{item.name}</Text>
              </HStack>
            </Link>
          ))}
        </Flex>
      </VStack>
      <Connect display={["none", "none", "flex"]} minHeight="50px" />
    </Flex>
  );
};
