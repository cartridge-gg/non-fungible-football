import { Grid as ChakraGrid } from "@chakra-ui/react";
import { ReactNode } from "react";

export const Grid = ({ children }: { children: ReactNode }) => {
  const desktopArea = `"main"`;
  const desktopRow = "1fr";
  const desktopCol = " 1fr";

  const mobileArea = `"main"`;
  const mobileRow = "1fr";
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
