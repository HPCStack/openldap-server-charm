#!/bin/sh
# https://wiki.debian.org/LDAP/OpenLDAPSetup

# /etc/init.d/slapd stop
# slapindex
# chown -R openldap:openldap /var/lib/ldap
# /etc/init.d/slapd start

ldapmodify -Y EXTERNAL -H ldapi:/// -f /var/lib/juju/olcDbIndex.ldif
ldapmodify -Y EXTERNAL -H ldapi:/// -f /var/lib/juju/olcAccess.ldif

# copy modified schema files
cp -f core.schema inetorgperson.schema /etc/ldap/schema/
test -d /tmp/slapd.d && rm -rf /tmp/slapd.d
mkdir /tmp/slapd.d
slaptest -f /var/lib/juju/slapd-test.conf -F /tmp/slapd.d/
DST="/etc/ldap/slapd.d/cn=config/cn=schema"
SRC="/tmp/slapd.d/cn=config/cn=schema"
# cp -p $SRC/*.ldif $DST
rsync -avrH $SRC/*ldif $DST/
chown openldap.openldap $DST/*.ldif
sleep 1
service slapd restart
