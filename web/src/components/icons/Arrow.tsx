import { Icon, useStyleConfig } from "@chakra-ui/react";

const Arrow = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Icon", { variant, size });

  return (
    <Icon viewBox="0 0 24 24" fill="currentColor" __css={styles} {...rest}>
      <path
        d="M13.4492 5.37985L19.7344 11.3793C19.904 11.5411 20 11.7654 20 12C20 12.2346 19.904 12.4585 19.7344 12.6207L13.4492 18.6202C13.1066 18.946 12.5643 18.9337 12.2372 18.5911C11.9102 18.2519 11.9225 17.7073 12.2662 17.3791L17.0051 12.8581H4.85743C4.38425 12.8581 4 12.4738 4 12.0006C4 11.5275 4.38425 11.1439 4.85743 11.1439H17.0028L12.2639 6.62287C11.9208 6.29406 11.91 5.74946 12.235 5.40913C12.5636 5.0663 13.0742 5.05416 13.4492 5.37985Z"
        fill="black"
      />
    </Icon>
  );
};

export default Arrow;
