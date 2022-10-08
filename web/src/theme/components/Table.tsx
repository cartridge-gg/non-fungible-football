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
          height: "74px",
          fontSize: "16px",
          textTransform: "capitalize",
          ":first-of-type": {
            borderRadius: "4px 0 0 4px",
          },
          ":last-of-type": {
            borderRadius: ["0 4px 4px 0", "0 4px 4px 0", 0],
          },
        },
      },
    },
  },
};
