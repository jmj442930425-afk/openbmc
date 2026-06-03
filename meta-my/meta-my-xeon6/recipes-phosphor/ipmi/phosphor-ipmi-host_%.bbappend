FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

DEPENDS:append:my-xeon6 = " my-xeon6-yaml-config"

EXTRA_OEMESON:append:my-xeon6 = " \
        -Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/my-xeon6-yaml-config/ipmi-fru-read.yaml \
        -Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/my-xeon6-yaml-config/ipmi-sensors.yaml \
        -Dinvsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/my-xeon6-yaml-config/ipmi-inventory-sensors.yaml \
        "
