import { Grid as ChakraGrid } from "@chakra-ui/react";
import { ReactNode } from "react";

export const Grid = ({ children }: { children: ReactNode }) => {
  const desktopArea = `"nav header"
                        "nav main"
                        "nav footer"`;
  const desktopRow = "minmax(100px, 130px) 1fr minmax(100px, 130px)";
  const desktopCol = "minmax(100px, 300px) 1fr";

  const mobileArea = `"nav"
                      "header"
                      "main"
                      "footer"`;
  const mobileRow = "100px 80px 1fr 100px";
  const mobileCol = "1fr";

  return (
    <ChakraGrid
      padding={["10px", "10px", 0]}
      templateAreas={[mobileArea, mobileArea, desktopArea]}
      gridTemplateRows={[mobileRow, mobileRow, desktopRow]}
      gridTemplateColumns={[mobileCol, mobileCol, desktopCol]}
      position="fixed"
      w="full"
      h="100vh"
    >
      {children}
    </ChakraGrid>
  );
};
