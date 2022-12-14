import { ReactNode } from "react";
import { Text, HStack, VStack, Circle, StyleProps } from "@chakra-ui/react";

export const Callout = ({
  icon,
  title,
  description,
}: {
  icon: ReactNode;
  title: String;
  description: string;
} & StyleProps) => (
  <HStack spacing={["12px", "12px", "24px"]}>
    <Circle size={"50px"} bgColor="blue.200">
      {icon}
    </Circle>
    <VStack align="flex-start" spacing="0">
      <Text textStyle="boldUpper">{title}</Text>
      <Text color="whiteAlpha.400">{description}</Text>
    </VStack>
  </HStack>
);
