import { ReactNode } from "react";
import { Flex, FlexProps, GridItem, GridItemProps } from "@chakra-ui/react";
import { motion } from "framer-motion";

export const MotionGridItem = ({
  children,
  ...rest
}: { children?: ReactNode } & GridItemProps) => (
  <GridItem
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
  </GridItem>
);

export const MotionFlex = ({
  layoutId,
  children,
  ...rest
}: {
  layoutId?: string;
  children: ReactNode;
} & FlexProps) => (
  <Flex
    as={motion.div}
    initial={{ opacity: 0 }}
    animate={{ opacity: 1 }}
    // initial={{ x: "100%" }}
    // animate={{ x: "0" }}
    layoutId={layoutId}
    {...rest}
  >
    {children}
  </Flex>
);
