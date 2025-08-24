#!/data/data/com.termux/files/usr/bin/bash

# Configurações
ROUTER_IP="192.168.0.1"        # IP do seu roteador
ROUTER_USER="root"             # Usuário SSH do OpenWrt (normalmente root)
FIRMWARE_URL="https://downloads.openwrt.org/releases/24.10.0/targets/ramips/mt76x8/openwrt-24.10.0-ramips-mt76x8-tplink_archer-c20-v4-squashfs-tftp-recovery.bin"
FIRMWARE_FILE="firmware.bin"

echo "[*] Baixando firmware factory..."
wget -O $FIRMWARE_FILE $FIRMWARE_URL

echo "[*] Enviando firmware para o roteador..."
scp $FIRMWARE_FILE ${ROUTER_USER}@${ROUTER_IP}:/tmp/

echo "[*] Instalando firmware no roteador..."
ssh ${ROUTER_USER}@${ROUTER_IP} "sysupgrade -v /tmp/$FIRMWARE_FILE"
