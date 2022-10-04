import { Icon, useStyleConfig } from "@chakra-ui/react";

const Logout = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Icon", { variant, size });

  return (
    <Icon viewBox="0 0 24 24" fill="currentColor" __css={styles} {...rest}>
      <path d="M10.0022 18.2524C10.0022 18.6682 9.6677 19.0027 9.25192 19.0027H7.0011C5.34362 19.0027 4 17.6591 4 16.0016V7.99866C4 6.34118 5.34362 4.99756 7.0011 4.99756H9.25192C9.6677 4.99756 10.0022 5.33331 10.0022 5.74783C10.0022 6.16205 9.6677 6.49811 9.25192 6.49811H7.0011C6.1758 6.49811 5.50055 7.17335 5.50055 7.99866V16.0016C5.50055 16.8269 6.1758 17.5021 7.0011 17.5021H9.25192C9.6677 17.5021 10.0022 17.8366 10.0022 18.2524ZM19.8027 11.4874L15.8293 7.23588C15.545 6.93302 15.0703 6.91951 14.7693 7.20365C14.4674 7.48694 14.4529 7.96174 14.737 8.26372L17.5174 11.2498H9.72397C9.33633 11.2498 9.00183 11.5875 9.00183 12.0001C9.00183 12.4128 9.33789 12.7504 9.72397 12.7504H17.4893L14.6783 15.7377C14.394 16.0396 14.4087 16.5143 14.7105 16.7978C14.8852 16.9332 15.0697 17.002 15.226 17.002C15.4253 17.002 15.6246 16.9228 15.7721 16.7656L19.7455 12.514C20.0746 12.2252 20.0746 11.775 19.8027 11.4874Z" />
    </Icon>
  );
};

export default Logout;
