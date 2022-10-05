import "../styles/globals.css";
import { StarknetConfig } from "@starknet-react/core";
import { ChakraProvider } from "@chakra-ui/react";
import theme from "../theme";

function MyApp({ Component, pageProps }) {
  return (
    <ChakraProvider theme={theme}>
      <StarknetConfig>
        <Component {...pageProps} />
      </StarknetConfig>
    </ChakraProvider>
  );
}

export default MyApp;
