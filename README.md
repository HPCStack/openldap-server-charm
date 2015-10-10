# Overview

OpenLDAP is a free, open source implementation of the Lightweight Directory
Access Protocol (LDAP) developed by the OpenLDAP Project. It is released under
its own BSD-style license called the OpenLDAP Public License. LDAP is a
platform-independent protocol. [OpenLDAP.org](www.openldap.org)

Instructions to setup OpenLDAP server for OpenStack was taken from
   (https://wiki.openstack.org/wiki/OpenLDAP)

# Usage

Step by step instructions on using the charm:

    juju deploy openldap-server
    juju deploy keystone
    juju add-relation openldap-server keystone


You can then use

   dpkg-reconfigure slapd

to configure the service.

# Configuration

The configuration options will be listed on the charm store, however If you're making assumptions or opinionated decisions in the charm (like setting a default administrator password), you should detail that here so the user knows how to change it immediately, etc.

# Contact Information

Though this will be listed in the charm store itself don't assume a user will know that, so include that information here:


- Upstream website
- Upstream bug tracker
- Upstream mailing list or contact information
- Feel free to add things if it's useful for users
