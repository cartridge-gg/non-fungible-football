import { Grid } from "@chakra-ui/react";
import { ReactNode } from "react";

const NffGrid = ({ children }: { children: ReactNode }) => (
  <Grid
    templateAreas={`"nav main"
                    "nav footer"`}
    gridTemplateRows={"1fr minmax(100px, 150px)"}
    gridTemplateColumns={"minmax(100px, 300px) 1fr"}
    position="fixed"
    gap="10px"
    w="full"
    h="100vh"
  >
    {children}
  </Grid>
);

export default NffGrid;
