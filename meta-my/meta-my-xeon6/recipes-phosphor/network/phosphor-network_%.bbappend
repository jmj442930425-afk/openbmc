PACKAGECONFIG:append:my-xeon6 = " sync-mac"

FILES:${PN}:append:my-xeon6 = " ${datadir}/network/config.json"

do_install:append:my-xeon6() {
    install -d ${D}${datadir}/network/
    if ${@bb.utils.contains('MACHINE_FEATURES', 'bonding', 'true', 'false', d)};
    then
        echo '{"bond0":"bmc","eth0":"bmc","eth1":"bmc"}' \
            > ${D}${datadir}/network/config.json
    else
        echo '{"eth0":"bmc"}' > ${D}${datadir}/network/config.json
    fi
}
