import "../styles/globals.css";
import { StarknetProvider } from "@starknet-react/core";
import { ChakraProvider } from "@chakra-ui/react";
import theme from "../theme";
import ControllerConnector from "@cartridge/connector";

const connectors = [
  new ControllerConnector(),
];

function MyApp({ Component, pageProps }) {
  return (
    <StarknetProvider autoConnect connectors={connectors}>
      <ChakraProvider theme={theme}>
        <Component {...pageProps} />
      </ChakraProvider>
    </StarknetProvider>
  );
}

export default MyApp;
