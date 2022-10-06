import "../styles/globals.css";
import {
  StarknetProvider,
  getInstalledInjectedConnectors,
} from "@starknet-react/core";
import { ChakraProvider } from "@chakra-ui/react";
import theme from "../theme";

function MyApp({ Component, pageProps }) {
  return (
    <StarknetProvider autoConnect connectors={getInstalledInjectedConnectors()}>
      <ChakraProvider theme={theme}>
        <Component {...pageProps} />
      </ChakraProvider>
    </StarknetProvider>
  );
}

export default MyApp;
