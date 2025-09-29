# Configuration parameters  # OVPN_POOL config any network are OK except your local network
OVPN_DIR="/etc/openvpn"
OVPN_PKI="/etc/easy-rsa/pki"
OVPN_PORT="1194"
OVPN_PROTO="udp"
OVPN_POOL="192.168.8.0 255.255.255.0"
OVPN_DNS="${OVPN_POOL%.* *}.1"
OVPN_DOMAIN="$(uci get dhcp.@dnsmasq[0].domain)"
 
# Fetch WAN IP address
. /lib/functions/network.sh
network_flush_cache
network_find_wan NET_IF
network_get_ipaddr NET_ADDR "${NET_IF}"
OVPN_SERV="${NET_ADDR}"
 
# Fetch FQDN from DDNS client
NET_FQDN="$(uci -q get ddns.@service[0].lookup_host)"
if [ -n "${NET_FQDN}" ]
then OVPN_SERV="${NET_FQDN}"
fi

# Configuration parameters
export EASYRSA_PKI="${OVPN_PKI}"
export EASYRSA_REQ_CN="ovpnca"
export EASYRSA_BATCH="1"
export EASYRSA_CERT_EXPIRE="3650" # Increases the client cert expiry from the default of 825 days to match the CA expiry
 
# Remove and re-initialize PKI directory
easyrsa init-pki
 
# Generate DH parameters
easyrsa gen-dh
 
# Create a new CA
easyrsa build-ca nopass
 
# Generate server keys and certificate
easyrsa build-server-full server nopass
openvpn --genkey tls-crypt-v2-server ${EASYRSA_PKI}/private/server.pem
 
# Generate client keys and certificate
easyrsa build-client-full client nopass
openvpn --tls-crypt-v2 ${EASYRSA_PKI}/private/server.pem \
--genkey tls-crypt-v2-client ${EASYRSA_PKI}/private/client.pem

# Configure firewall
uci rename firewall.@zone[0]="lan"
uci rename firewall.@zone[1]="wan"
uci del_list firewall.lan.device="tun+"
uci add_list firewall.lan.device="tun+"
uci -q delete firewall.ovpn
uci set firewall.ovpn="rule"
uci set firewall.ovpn.name="Allow-OpenVPN"
uci set firewall.ovpn.src="wan"
uci set firewall.ovpn.dest_port="${OVPN_PORT}"
uci set firewall.ovpn.proto="${OVPN_PROTO}"
uci set firewall.ovpn.target="ACCEPT"
uci commit firewall
/etc/init.d/firewall restart

# Configure VPN service and generate client profiles
umask go=
OVPN_DH="$(cat ${OVPN_PKI}/dh.pem)"
OVPN_CA="$(openssl x509 -in ${OVPN_PKI}/ca.crt)"
ls ${OVPN_PKI}/issued \
| sed -e "s/\.\w*$//" \
| while read -r OVPN_ID
do
OVPN_TC="$(cat ${OVPN_PKI}/private/${OVPN_ID}.pem)"
OVPN_KEY="$(cat ${OVPN_PKI}/private/${OVPN_ID}.key)"
OVPN_CERT="$(openssl x509 -in ${OVPN_PKI}/issued/${OVPN_ID}.crt)"
OVPN_EKU="$(echo "${OVPN_CERT}" | openssl x509 -noout -purpose)"
case ${OVPN_EKU} in
(*"SSL server : Yes"*)
OVPN_CONF="${OVPN_DIR}/${OVPN_ID}.conf"
cat << EOF > ${OVPN_CONF} ;;
user nobody
group nogroup
dev tun
port ${OVPN_PORT}
proto ${OVPN_PROTO}
server ${OVPN_POOL}
topology subnet
client-to-client
keepalive 10 60
persist-tun
persist-key
push "dhcp-option DNS ${OVPN_DNS}"
push "dhcp-option DOMAIN ${OVPN_DOMAIN}"
push "redirect-gateway def1"
push "persist-tun"
push "persist-key"
<dh>
${OVPN_DH}
</dh>
EOF
(*"SSL client : Yes"*)
OVPN_CONF="${OVPN_DIR}/${OVPN_ID}.ovpn"
cat << EOF > ${OVPN_CONF} ;;
user nobody
group nogroup
dev tun
nobind
client
remote ${OVPN_SERV} ${OVPN_PORT} ${OVPN_PROTO}
auth-nocache
remote-cert-tls server
EOF
esac
cat << EOF >> ${OVPN_CONF}
<tls-crypt-v2>
${OVPN_TC}
</tls-crypt-v2>
<key>
${OVPN_KEY}
</key>
<cert>
${OVPN_CERT}
</cert>
<ca>
${OVPN_CA}
</ca>
EOF
done
/etc/init.d/openvpn restart
# ls ${OVPN_DIR}/*.ovpn
echo "Done"