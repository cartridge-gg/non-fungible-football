import { Icon, useStyleConfig } from "@chakra-ui/react";

const Logo = (props: any) => {
  const { variant, size, ...rest } = props;
  const styles = useStyleConfig("Logo", { variant, size });
  return (
    <Icon
      width="81px"
      height="80px"
      viewBox="0 0 61 60"
      __css={styles}
      {...rest}
    >
      <path d="M10.1313 16.8609C7.79489 20.4254 6.52641 24.4099 6.26445 28.4198L13.0804 35.5417L11.5073 45.0439C12.7651 46.6058 14.242 48.0326 15.9277 49.2815C17.6202 50.5354 19.4214 51.5339 21.2881 52.2834L30.1867 47.9917L38.7523 52.4304C42.4989 51.0062 45.9296 48.6339 48.6477 45.3666L47.3158 35.5669L54.1807 28.7954C53.974 24.7187 52.7323 20.7117 50.5186 17.1991L40.7932 15.4397L36.4797 6.82929C32.4641 5.74421 28.2632 5.73626 24.2991 6.74033L19.6342 15.4223L10.1313 16.8609ZM12.3548 54.1036C-0.95697 44.2411 -3.75327 25.4536 6.10925 12.1419C15.9718 -1.16986 34.7593 -3.96616 48.071 5.89636C61.3828 15.7589 64.1791 34.5464 54.3165 47.8581C44.454 61.1699 25.6665 63.9662 12.3548 54.1036Z" />
      <path d="M37.3365 27.0161L32.9528 26.9551L27.9073 20.2815L27.8594 27.0465L23.3363 27.2773C23.3363 27.2773 23.4713 23.7903 23.7064 20.682C23.9937 17.996 24.2984 15.7367 24.2984 15.7367L28.0335 15.3623L32.5479 20.3903L32.0952 15.3231L35.778 15.6148C35.778 15.6148 36.2221 17.8567 36.6574 20.5122C37.0492 23.5857 37.3365 27.0161 37.3365 27.0161Z" />
      <path d="M29.5921 30.7424L29.6966 35.1131L23.1144 34.9912L23.332 37.1243L27.8769 37.3159L28.0815 40.6113L23.7761 40.3675L24.5292 44.4988L20.2847 44.4683C20.2847 44.4683 19.9626 41.3122 19.3139 38.2475C18.8003 34.7126 18.5173 30.8556 18.5173 30.8556C18.5173 30.8556 20.8332 30.8469 23.4757 30.8251C26.4142 30.7946 29.5921 30.7424 29.5921 30.7424Z" />
      <path d="M42.4952 30.3201L42.369 34.0509L37.2016 34.6647L37.0667 36.8022L40.8976 36.2537L40.4666 39.3837L36.7489 40.0541L36.196 44.2942L31.8732 44.6773C31.8732 44.6773 31.9559 42.0784 32.0255 38.8874C32.0647 35.0565 32.0517 30.6814 32.0517 30.6814C32.0517 30.6814 35.112 30.59 37.8894 30.4986C40.3534 30.4028 42.4952 30.3201 42.4952 30.3201Z" />
    </Icon>
  );
};

export default Logo;
