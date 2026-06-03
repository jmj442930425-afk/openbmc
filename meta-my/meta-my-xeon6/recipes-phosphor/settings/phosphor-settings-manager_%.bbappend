FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SRC_URI:append:my-xeon6 = " file://chassis-capabilities.override.yml \
                       file://power-policy-set-default.override.yml \
                     "

PACKAGECONFIG:append:my-xeon6 = " boot_type"
