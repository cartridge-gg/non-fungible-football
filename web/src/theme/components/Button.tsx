import type { ComponentStyleConfig } from "@chakra-ui/react";

export const Button: ComponentStyleConfig = {
  baseStyle: {
    fontFamily: "IBM Plex Sans",
    borderRadius: "24px",
    letterSpacing: "0.01em",
  },
  variants: {
    primary: {
      borderColor: "mint.500",
      border: "2px solid",
      color: "mint.500",
      fontSize: "16px",
    },
  },
  defaultProps: {
    variant: "primary",
  },
};
