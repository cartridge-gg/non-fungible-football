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
  <HStack spacing="24px">
    <Circle size="50px" bgColor="blue.300">
      {icon}
    </Circle>
    <VStack align="flex-start" spacing="0">
      <Text textStyle="h1">{title}</Text>
      <Text color="whiteAlpha.400">{description}</Text>
    </VStack>
  </HStack>
);
