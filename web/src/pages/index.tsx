import Head from "next/head";
import { MotionFlex } from "components/MotionWrappers";
import { Details } from "components/details/Details";

export default function Home() {
  return (
    <>
      <Head>
        <title>Non-Fungible Football</title>
      </Head>
      <MotionFlex
        position="fixed"
        boxSize="full"
        align="center"
        justify="center"
      >
        <Details />
      </MotionFlex>
    </>
  );
}
