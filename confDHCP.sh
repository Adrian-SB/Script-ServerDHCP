#! \bin\bash

#Script ejecutado en vagrant
sudo su
#Instalación del servidor dhcp
apt-get update 
apt-get install -y isc-dhcp-server 
#Configuramos fichero  /etc/default/isc-dhcp-server,asignando eth1 a ipv4
sed -i 's/INTERFACESv4=""/INTERFACESv4="eth1"/g' /etc/default/isc-dhcp-server
#Configuramos el fichero /etc/dhcp/dhcpd.conf
echo "subnet 192.168.100.0 netmask 255.255.255.0 {">> /etc/dhcp/dhcpd.conf
echo "range 192.168.100.10 192.168.100.253;" >> /etc/dhcp/dhcpd.conf
echo "option routers 192.168.100.2" >> /etc/dhcp/dhcpd.conf
echo "option domain-name-servers 8.8.8.8;" >> /etc/dhcp/dhcpd.conf
echo "option broadcast-address 192.168.1.255;" >> /etc/dhcp/dhcpd.conf
echo "}" >> /etc/dhcp/dhcpd.conf

#Reinicamos el servicio
/etc/init.d/isc-dhcp-server restart