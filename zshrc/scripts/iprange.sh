#!/bin/bash

# IPアドレス表記 -> 32bit値 に変換
function ip2decimal(){
    local IFS=.
    local c=($1)
    printf "%s" $(( (${c[0]} << 24) | (${c[1]} << 16) | (${c[2]} << 8) | ${c[3]} ))
}

# 32bit値 -> IPアドレス表記 に変換
function decimal2ip(){
    local n=$1
    printf "%d.%d.%d.%d" $(($n >> 24)) $(( ($n >> 16) & 0xFF)) $(( ($n >> 8) & 0xFF)) $(($n & 0xFF))
}

# CIDR 表記のネットワークアドレスを 32bit値に変換
function cidr2decimal(){
    printf "%s" $(( 0xFFFFFFFF ^ ((2 ** (32-$1))-1) ))
}

# ネットワークアドレス
function network() {
    decimal2ip $(( $(ip2decimal $1) & $(cidr2decimal $2) ))
}

# ブロードキャストアドレス
function broadcast() {
    decimal2ip $(( $(ip2decimal $1) | (0xFFFFFFFF ^ $(ip2decimal $2)) ))
}

if [ $# -ne 1 ]; then
    echo "[Usage] $0 x.x.x.x/y"
    exit 1
fi

IPMASK="$1"

IFS='/'
set -- $IPMASK

IP=$1
MASK=$2

if [ -z "$IP" ]; then
    echo "[Usage] $0 x.x.x.x/y"
    exit 1
fi
if [ -z "$MASK" ]; then
    echo "[Usage] $0 x.x.x.x/y"
    exit 1
fi
# 
# if [ "$(echo $MASK | grep '\.')" ]; then
#     echo $MASK
#     MASK=$(ip2decimal $MASK)
#     echo $MASK
# fi
# 
MASK_ADDR=$(decimal2ip $(cidr2decimal "$MASK"))
NETWORK_ADDR=$(network "$IP" "$MASK")
BROADCAST_ADDR=$(broadcast "$IP" "$MASK_ADDR")

echo "+---------------------------------+"
echo -n "| INPUT     |"
printf " %-19s |\n" "$IPMASK"
echo -n "| Netmask   |"
printf " %-19s |\n" "$MASK_ADDR($MASK)"
echo "+---------------------------------+"
echo -n "| Network   |"
printf " %-19s |\n" "$NETWORK_ADDR"
echo -n "| Broadcast |"
printf " %-19s |\n" "$BROADCAST_ADDR"
echo "+---------------------------------+"

