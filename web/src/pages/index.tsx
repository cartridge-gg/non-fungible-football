import { useEffect } from "react";
import Head from "next/head";
import { GridItem } from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid, MotionGridItem } from "../components/Grid";
import { Details } from "components/details/Details";
import { Connect } from "components/Connect";

export default function Home() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <Grid>
        <GridItem area={"nav"}>
          <Nav py="50px" w="full" h="full" />
        </GridItem>
        <GridItem area={"spacer"} />
        <MotionGridItem area={"header"}></MotionGridItem>
        <MotionGridItem area={"main"}>
          <Details />
        </MotionGridItem>
        <MotionGridItem area={"footer"}>
          <Connect />
        </MotionGridItem>
      </Grid>
    </>
  );
}
