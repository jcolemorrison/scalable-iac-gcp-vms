#!/bin/bash

apt update && apt install -y unzip

# Install Fake Service
curl -LO https://github.com/nicholasjackson/fake-service/releases/download/v0.23.1/fake_service_linux_amd64.zip
unzip fake_service_linux_amd64.zip
mv fake-service /usr/local/bin
chmod +x /usr/local/bin/fake-service

# Fake Service Systemd Unit File
cat > /etc/systemd/system/server.service <<- EOF
[Unit]
Description=Server
After=syslog.target network.target

[Service]
Environment="MESSAGE='Hello from the Test Server Service'"
Environment="NAME=server"
Environment="LISTEN_ADDR=0.0.0.0:80"
ExecStart=/usr/local/bin/fake-service
ExecStop=/bin/sleep 5
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload unit files and start the database service
systemctl daemon-reload
systemctl start server