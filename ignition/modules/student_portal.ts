// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";



const studenPortal = buildModule("studenPortal", (m) => {

  const studenPortal = m.contract("studenPortal");

  return { studenPortal };
});

export default studenPortal;
