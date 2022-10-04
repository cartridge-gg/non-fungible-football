import {
  Grid as ChakraGrid,
  GridItem as ChakraGridItem,
  GridItemProps,
} from "@chakra-ui/react";
import { ReactNode } from "react";
import { motion } from "framer-motion";

export const Grid = ({ children }: { children: ReactNode }) => (
  <ChakraGrid
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
  </ChakraGrid>
);

export const MotionGridItem = ({
  children,
  ...rest
}: { children?: ReactNode } & GridItemProps) => (
  <ChakraGridItem
    as={motion.div}
    initial={{
      opacity: 0,
    }}
    animate={{
      opacity: 1,
    }}
    {...rest}
  >
    {children}
  </ChakraGridItem>
);
