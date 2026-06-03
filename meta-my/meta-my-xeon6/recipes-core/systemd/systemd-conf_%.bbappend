FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SRC_URI:append:my-xeon6 = " file://my-xeon6-resolv.conf"
BONDING_CONF = "\
    file://10-bmc-bond0.netdev \
    file://bond-eth0.conf \
    file://bond-eth1.conf \
    file://bond0.conf \
    "
SRC_URI:append:my-xeon6 = "${@bb.utils.contains('MACHINE_FEATURES', 'bonding',\
                        ' ${BONDING_CONF}', '', d)}"

FILES:${PN}:append:my-xeon6 = "\
    ${sysconfdir}/systemd/resolved.conf.d/my-xeon6-resolv.conf \
    ${sysconfdir}/systemd/network/00-bmc-eth0.network.d/ \
    ${sysconfdir}/systemd/network/00-bmc-eth1.network.d/ \
    "
BONDING_CONF_PATH = "\
    ${sysconfdir}/systemd/network/10-bmc-bond0.netdev \
    ${sysconfdir}/systemd/network/00-bmc-bond0.network.d/bond0.conf \
    "
FILES:${PN}:append:my-xeon6 = "${@bb.utils.contains('MACHINE_FEATURES', 'bonding',\
                         ' ${BONDING_CONF_PATH}', '', d)}"

do_install:append:my-xeon6() {
    install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
    install -m 0644 ${UNPACKDIR}/my-xeon6-resolv.conf \
        ${D}${sysconfdir}/systemd/resolved.conf.d/
    install -d ${D}${sysconfdir}/systemd/network/
    install -d ${D}${sysconfdir}/systemd/network/00-bmc-eth0.network.d/
    install -d ${D}${sysconfdir}/systemd/network/00-bmc-eth1.network.d/
    if ${@bb.utils.contains('MACHINE_FEATURES', 'bonding', 'true', 'false', d)};
    then
        install -d ${D}${sysconfdir}/systemd/network/00-bmc-bond0.network.d/
        install -m 0644 ${UNPACKDIR}/bond-eth0.conf \
            ${D}${sysconfdir}/systemd/network/00-bmc-eth0.network.d/
        install -m 0644 ${UNPACKDIR}/bond-eth1.conf \
            ${D}${sysconfdir}/systemd/network/00-bmc-eth1.network.d/
        install -m 0644 ${UNPACKDIR}/10-bmc-bond0.netdev \
            ${D}${sysconfdir}/systemd/network/
        install -m 0644 ${UNPACKDIR}/bond0.conf \
            ${D}${sysconfdir}/systemd/network/00-bmc-bond0.network.d/
    else
        echo -e "[Network]\nLinkLocalAddressing=ipv6" > \
            ${D}${sysconfdir}/systemd/network/00-bmc-eth0.network.d/eth0.conf
        echo -e "[Network]\nLinkLocalAddressing=ipv6" > \
            ${D}${sysconfdir}/systemd/network/00-bmc-eth1.network.d/eth1.conf
    fi
}
