import { Icon, useStyleConfig } from "@chakra-ui/react";

const Lock = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Icon", { variant, size });

  return (
    <Icon viewBox="0 0 24 24" fill="currentColor" __css={styles} {...rest}>
      <path
        d="M7.375 9.75V7.5C7.375 5.0148 9.38945 3 11.875 3C14.3605 3 16.375 5.0148 16.375 7.5V9.75H17.5C18.741 9.75 19.75 10.759 19.75 12V18.75C19.75 19.991 18.741 21 17.5 21H6.25C5.00723 21 4 19.991 4 18.75V12C4 10.759 5.00723 9.75 6.25 9.75H7.375ZM9.0625 9.75H14.6875V7.5C14.6875 5.9468 13.4289 4.6875 11.875 4.6875C10.3211 4.6875 9.0625 5.9468 9.0625 7.5V9.75ZM5.6875 18.75C5.6875 19.0594 5.93922 19.3125 6.25 19.3125H17.5C17.8094 19.3125 18.0625 19.0594 18.0625 18.75V12C18.0625 11.6906 17.8094 11.4375 17.5 11.4375H6.25C5.93922 11.4375 5.6875 11.6906 5.6875 12V18.75Z"
        fill="black"
      />
    </Icon>
  );
};

export default Lock;
