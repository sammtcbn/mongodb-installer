#!/bin/bash
SERVICE_NAME=mongodb.service
INS_PATH=/usr/local/sammtcbn/mongodb

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

./mongodb-download-ubuntu2004-x64.sh || exit 1

mkdir -p ${INS_PATH} || exit 1
cp -a -r -f mongodb/* ${INS_PATH} || exit 1
cp -a -f ${SERVICE_NAME} /etc/systemd/system || exit 1

mkdir -p ${INS_PATH}/data/db || exit 1

cp -a -f linux_uninstall.bash ${INS_PATH}/uninstall.bash || exit 1

systemctl daemon-reload || exit 1
chmod 664 /etc/systemd/system/${SERVICE_NAME} || exit 1
systemctl enable ${SERVICE_NAME} || exit 1
systemctl start ${SERVICE_NAME} || exit 1
