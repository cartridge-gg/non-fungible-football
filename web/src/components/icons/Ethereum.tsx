import { Icon, StyleProps, IconProps } from "@chakra-ui/react";

const Ticket = (props: StyleProps & IconProps) => {
  return (
    <Icon
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="currentColor"
      {...props}
    >
      <path d="M6.5957 12.1765L11.9911 3L17.4055 12.1671L11.9815 15.5666L6.5957 12.1765Z" />
      <path d="M11.9815 16.6268L6.59575 13.2845L12.0197 21L17.3482 13.2842L11.9815 16.6268Z" />
    </Icon>
  );
};

export default Ticket;
