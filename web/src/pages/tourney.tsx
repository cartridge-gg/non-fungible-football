import Head from "next/head";
import {
  Flex,
  Box,
  Text,
  HStack,
  VStack,
  Spacer,
  GridItem,
} from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid, MotionGridItem } from "../components/Grid";
import { Playoff } from "components/tourney";

export default function Tourney() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav py="50px" w="full" h="full" active={1} />
        </GridItem>
        <MotionGridItem area={"main"}>
          <Flex w="full" h="full" align="center" justify="center">
            <Playoff />
          </Flex>
        </MotionGridItem>
        <MotionGridItem area={"footer"}></MotionGridItem>
      </Grid>
    </>
  );
}
