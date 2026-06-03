FILESEXTRAPATHS:prepend:my-xeon6 := "${THISDIR}/${PN}:"

SYSTEMD_OVERRIDE:${PN}:remove:my-xeon6 = "poweron.conf:phosphor-watchdog@poweron.service.d/poweron.conf"
SYSTEMD_SERVICE:${PN}:my-xeon6 = " phosphor-watchdog.service \
                              phosphor-watchdog-host-reset.service \
                              phosphor-watchdog-host-poweroff.service \
                              phosphor-watchdog-host-powercycle.service \
                            "
