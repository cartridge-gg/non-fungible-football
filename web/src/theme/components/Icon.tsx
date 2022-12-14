import type { ComponentStyleConfig } from "@chakra-ui/theme";

export const Icon: ComponentStyleConfig = {
  baseStyle: {
    fill: "white",
  },
  sizes: {
    lg: {
      height: "48px",
      width: "48px",
    },
    md: {
      height: "24px",
      width: "24px",
    },
    sm: {
      height: "16px",
      width: "16px",
    },
  },
  defaultProps: {
    size: "md",
  },
};
