import { Icon, StyleProps, IconProps } from "@chakra-ui/react";

const Cartridge = (props: StyleProps & IconProps) => {
  return (
    <Icon
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="currentColor"
      {...props}
    >
      <path
        d="M8.45902 10.6801H15.4672V8.90978H8.46078C8.46078 9.09066 8.45902 10.6968 8.45902 10.6801Z"
        fill="black"
      />
      <path
        d="M20.3231 7.03328L16.0408 5.22592C15.7594 5.08845 15.4523 5.01149 15.1394 5H8.86057C8.54749 5.01151 8.24026 5.08846 7.95857 5.22592L3.67686 7.03328C3.46971 7.13895 3.2964 7.30092 3.17675 7.50068C3.05709 7.70043 2.99591 7.92991 3.00021 8.16288V15.3935C3.00021 15.6194 3.00021 15.8453 3.22556 16.0712L4.57827 17.4268C4.80362 17.6527 4.97279 17.6527 5.25433 17.6527H8.35191C8.35191 17.8469 8.35191 19.4765 8.35191 19.4589H15.6744V17.6503H8.35776V15.8453H5.02897C4.80362 15.8453 4.80362 15.6194 4.80362 15.6194V7.03328C4.80362 7.03328 4.80362 6.80736 5.02897 6.80736H18.9716C19.197 6.80736 19.197 7.03328 19.197 7.03328V15.6194C19.197 15.6194 19.197 15.8453 18.9716 15.8453H15.6762V17.6527H18.7463C19.0278 17.6527 19.197 17.6527 19.4223 17.4268L20.7744 16.0712C20.9998 15.8453 20.9998 15.6194 20.9998 15.3935V8.16288C21.004 7.92992 20.9428 7.70048 20.8232 7.50073C20.7035 7.30099 20.5303 7.139 20.3231 7.03328Z"
        fill="black"
      />
    </Icon>
  );
};

export default Cartridge;
