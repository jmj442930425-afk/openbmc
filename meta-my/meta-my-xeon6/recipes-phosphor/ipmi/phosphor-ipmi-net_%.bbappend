RMCPP_IFACE:my-xeon6 = "${@bb.utils.contains("MACHINE_FEATURES", "bonding", "bond0", "${DEFAULT_RMCPP_IFACE}", d)}"
