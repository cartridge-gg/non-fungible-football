import "../styles/globals.css";
import {
  StarknetProvider,
  getInstalledInjectedConnectors,
} from "@starknet-react/core";
import { ChakraProvider } from "@chakra-ui/react";
import theme from "../theme";
import ControllerConnector from "@cartridge/connector";

const connectors = [
  new ControllerConnector(
    [
      {
        target:
          "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7",
        method: "approve",
      },
      {
        target:
          "0x06fa2819e4f65121408027cc149e07093e80f7bd58720f4c27a6b1a40645fa54",
        method: "purchase",
      },
    ]
  )
]

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
