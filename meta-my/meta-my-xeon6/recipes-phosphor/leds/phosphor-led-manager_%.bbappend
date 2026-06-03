FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SRC_URI:append:my-xeon6 = " file://led-group-config.json"

PACKAGECONFIG:append:my-xeon6 = " use-lamp-test"

do_install:append:my-xeon6() {
        install -m 0644 ${UNPACKDIR}/led-group-config.json ${D}${datadir}/phosphor-led-manager/
}
