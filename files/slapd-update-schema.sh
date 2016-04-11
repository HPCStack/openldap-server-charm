#!/bin/bash
# https://wiki.debian.org/LDAP/OpenLDAPSetup

# /etc/init.d/slapd stop
# slapindex
# chown -R openldap:openldap /var/lib/ldap
# /etc/init.d/slapd start
WDIR=$(dirname $(readlink -f "$0" ))

ldapmodify -Y EXTERNAL -H ldapi:/// -f $WDIR/olcDbIndex.ldif
ldapmodify -Y EXTERNAL -H ldapi:/// -f $WDIR/olcAccess.ldif

# copy modified schema files
cp -f core.schema inetorgperson.schema /etc/ldap/schema/
test -d /tmp/slapd.d && rm -rf /tmp/slapd.d
mkdir /tmp/slapd.d
slaptest -f $WDIR/slapd-test.conf -F /tmp/slapd.d/
DST="/etc/ldap/slapd.d/cn=config/cn=schema"
SRC="/tmp/slapd.d/cn=config/cn=schema"
# cp -p $SRC/*.ldif $DST
rsync -avrH $SRC/*ldif $DST/
chown openldap.openldap $DST/*.ldif
sleep 1
service slapd restart
