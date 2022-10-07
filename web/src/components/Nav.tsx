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

export type NavProps = {
  active?: number;
};

export const Nav = ({ active = 0, ...rest }: NavProps & StyleProps) => {
  const items = [
    { name: "Mint Details", url: "/" },
    { name: "Tourney", url: "/tourney" },
  ];

  return (
    <Flex
      py={[0, 0, "50px"]}
      direction={["row", "row", "column"]}
      align={["center", "center", "flex-end"]}
      justify="space-between"
      {...rest}
    >
      <Link href="/">
        <Logo order="1" _hover={{ cursor: "pointer" }} />
      </Link>
      <VStack
        spacing={["5px", "5px", "18px"]}
        w="full"
        order={[3, 3, 2]}
        align="flex-end"
      >
        {items.map((item, i) => (
          <Link href={item.url} key={i}>
            <HStack
              as="button"
              w={["auto", "auto", "full"]}
              borderBottom="2px solid"
              color={active === i ? "yellow.500" : "blue.100"}
            >
              <Spacer maxWidth="50%" />
              <Text textStyle="boldUpper">{item.name}</Text>
            </HStack>
          </Link>
        ))}
      </VStack>
      <Word
        fill="blue.100"
        pl="10px"
        width="100px"
        height="100px"
        order={[2, 2, 3]}
      />
    </Flex>
  );
};
