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
import { useStarknet } from "@starknet-react/core";
import { usePlayer } from "hooks/player";

export type NavProps = {
  active?: number;
};

export const Nav = ({ active = 0, ...rest }: NavProps & StyleProps) => {
  const items = [
    { name: "Mint", url: "/" },
    { name: "Tourney", url: "/tourney" },
  ];

  return (
    <Flex
      py={[0, 0, "50px"]}
      direction={["row", "row", "column"]}
      align="center"
      justify="space-between"
      {...rest}
    >
      <HStack>
        <Link href="/">
          <Logo height="60px" width="60px" _hover={{ cursor: "pointer" }} />
        </Link>

        <Word pl="10px" width="100px" height="100px" />
      </HStack>
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
      <Connect display={["none", "none", "flex"]} />
    </Flex>
  );
};
