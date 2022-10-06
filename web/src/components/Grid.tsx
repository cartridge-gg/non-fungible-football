import { Grid as ChakraGrid } from "@chakra-ui/react";
import { ReactNode } from "react";

export const Grid = ({ children }: { children: ReactNode }) => (
  <ChakraGrid
    templateAreas={`"nav header"
                    "nav main"
                    "nav footer"`}
    gridTemplateRows={"minmax(100px, 130px) 1fr minmax(100px, 130px)"}
    gridTemplateColumns={"minmax(100px, 300px) 1fr"}
    position="fixed"
    w="full"
    h="100vh"
  >
    {children}
  </ChakraGrid>
);
