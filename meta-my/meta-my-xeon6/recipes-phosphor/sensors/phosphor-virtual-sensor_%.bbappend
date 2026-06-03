FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SRC_URI:append:my-xeon6 = " file://virtual_sensor_config.json "

do_install:append:my-xeon6() {
    install -m 0644 -D ${UNPACKDIR}/virtual_sensor_config.json ${D}${datadir}/phosphor-virtual-sensor/
}
