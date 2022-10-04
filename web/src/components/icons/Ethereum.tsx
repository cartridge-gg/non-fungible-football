import { Icon, StyleProps, IconProps, useStyleConfig } from "@chakra-ui/react";

const Ethereum = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Icon", { variant, size });

  return (
    <Icon viewBox="0 0 24 24" fill="currentColor" __css={styles} {...rest}>
      <path d="M6.5957 12.1765L11.9911 3L17.4055 12.1671L11.9815 15.5666L6.5957 12.1765Z" />
      <path d="M11.9815 16.6268L6.59575 13.2845L12.0197 21L17.3482 13.2842L11.9815 16.6268Z" />
    </Icon>
  );
};

export default Ethereum;
