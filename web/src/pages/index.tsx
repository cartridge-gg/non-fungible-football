import { useEffect } from "react";
import Head from "next/head";
import { GridItem } from "@chakra-ui/react";
import { Nav } from "../components/Nav";
import { Grid } from "../components/Grid";
import { MotionGridItem } from "components/MotionWrappers";
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
          <Nav w="full" h="full" />
        </GridItem>
        <MotionGridItem area={"main"}>
          <Details />
        </MotionGridItem>
      </Grid>
    </>
  );
}
