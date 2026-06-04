# phosphor-hostlogger inherits OE's stock "systemd" class (not OpenBMC's
# obmc-phosphor-systemd), so its generated postinst runs
# "systemctl enable hostlogger@.service" against the bare template unit.
# systemd >= 257 refuses to enable a bare template that has no
# DefaultInstance, so the postinst exits non-zero and do_rootfs fails:
#
#   Failed to enable hostlogger@.service, destination unit
#   multi-user.target is a non-template unit.
#
# Add DefaultInstance to the template's [Install] section so enabling the
# bare template resolves to the ttyVUART0 instance we use here.
do_install:append() {
    sed -i '/^\[Install\]/a DefaultInstance=${DEFAULT_INSTANCE}' \
        ${D}${systemd_system_unitdir}/hostlogger@.service
}
