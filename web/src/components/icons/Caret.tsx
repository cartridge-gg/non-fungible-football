import { Icon, useStyleConfig } from "@chakra-ui/react";

const Caret = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Icon", { variant, size });

  return (
    <Icon
      height="10px"
      width="6px"
      viewBox="0 0 6 10"
      fill="currentColor"
      __css={styles}
      {...rest}
    >
      <path d="M5.75 5.00011C5.75 5.17602 5.68286 5.35202 5.54858 5.48608L1.42358 9.61108C1.15503 9.87964 0.719971 9.87964 0.451416 9.61108C0.182861 9.34253 0.182861 8.90747 0.451416 8.63892L4.09141 5.00011L0.451953 1.36065C0.183398 1.0921 0.183398 0.657041 0.451953 0.388487C0.720507 0.119932 1.15557 0.119932 1.42412 0.388487L5.54912 4.51349C5.6834 4.64776 5.75 4.82394 5.75 5.00011Z" />
    </Icon>
  );
};

export default Caret;
