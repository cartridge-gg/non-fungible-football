import { extendTheme } from "@chakra-ui/react";
import { textStyles, fonts } from "./typography";
import colors from "./colors";
import * as Components from "./components";

const theme = extendTheme({
  colors,
  fonts,
  textStyles,
  styles: {
    global: {
      body: {
        background: "blue.200",
        color: "white",
        fontSize: "13px",
        letterSpacing: "0.01em",
        WebkitTapHighlightColor: "transparent",
      },
    },
  },
  components: {
    ...Components,
  },
});

export default theme;
