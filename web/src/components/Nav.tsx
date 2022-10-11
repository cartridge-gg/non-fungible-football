import Link from "next/link";
import {
  Flex,
  Box,
  Text,
  HStack,
  VStack,
  Spacer,
  StyleProps,
  useBreakpointValue,
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
  const isMobile = useBreakpointValue([true, true, false]);
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
      <Flex
        w="full"
        gap={["5px", "5px", "20px"]}
        direction={["row", "row", "column"]}
        justify="flex-end"
        align="flex-end"
      >
        {items.map((item, i) => (
          <Link href={item.url} key={i}>
            <HStack
              as="button"
              px="10px"
              w={["auto", "auto", "full"]}
              borderBottom="2px solid"
              color={active === i ? "yellow.500" : "blue.100"}
              _hover={{ color: active === i ? "yellow.500" : "white" }}
              transition="all 0.25s ease"
            >
              <Spacer maxWidth="60%" display={["none", "none", "block"]} />
              <Text textStyle="boldUpper">{item.name}</Text>
            </HStack>
          </Link>
        ))}
        <Owned tokenIds={tokenIds} />
      </Flex>
      <Connect display={["none", "none", "flex"]} minHeight="50px" />
    </Flex>
  );
};
