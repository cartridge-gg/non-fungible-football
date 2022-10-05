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

export type NavProps = {
  active?: number;
};

export const Nav = ({ active = 0, ...rest }: NavProps & StyleProps) => {
  const items = [
    { name: "Mint Details", url: "/" },
    { name: "Tourney", url: "/tourney" },
  ];

  return (
    <VStack
      direction="column"
      align="flex-end"
      justify="space-between"
      {...rest}
    >
      <Logo />
      <VStack spacing="18px" w="full">
        {items.map((item, i) => (
          <Link href={item.url} key={i}>
            <HStack
              as="button"
              w="full"
              borderBottom="2px solid"
              color={active === i ? "yellow.500" : "blue.100"}
            >
              <Spacer maxWidth="50%" />
              <Text textStyle="boldUpper">{item.name}</Text>
            </HStack>
          </Link>
        ))}
      </VStack>
      <Word fill="blue.100" width="100px" height="100px" />
    </VStack>
  );
};
