FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"
SRC_URI:append:my-xeon6 = " file://power-config-host0.json"

do_install:append:my-xeon6() {
    install -m 0755 -d ${D}/${datadir}/${BPN}
    install -m 0644 ${UNPACKDIR}/power-config-host0.json ${D}${datadir}/${BPN}
}
