FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SRC_URI:append:my-xeon6 = " file://my-xeon6-ipmb-channels.json"

do_install:append:my-xeon6(){
    install -m 0644 -D ${UNPACKDIR}/my-xeon6-ipmb-channels.json \
                   ${D}/${datadir}/ipmbbridge/ipmb-channels.json
}
