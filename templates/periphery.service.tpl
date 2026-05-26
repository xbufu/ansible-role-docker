[Unit]
Description=Agent to connect with Komodo Core

[Service]
Environment="HOME=/root"
ExecStart=/bin/sh -lc "/usr/local/bin/periphery --config-path {{ periphery_root_dir }}/periphery.config.toml"
Restart=on-failure
TimeoutStartSec=0

[Install]
WantedBy=default.target
