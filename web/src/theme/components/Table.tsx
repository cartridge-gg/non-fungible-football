import type { ComponentMultiStyleConfig } from "@chakra-ui/theme";

export const Table: ComponentMultiStyleConfig = {
  parts: ["table", "thead", "tbody", "tr", "th", "td", "tfoot", "caption"],
  variants: {
    custom: {
      thead: {
        textTransform: "uppercase",
        fontSize: "16px",
      },
      tbody: {
        th: {
          h: "72px",
          fontSize: "16px",
          textTransform: "capitalize",
          ":first-of-type": {
            borderRadius: "4px 0 0 4px",
          },
        },
      },
    },
  },
};
