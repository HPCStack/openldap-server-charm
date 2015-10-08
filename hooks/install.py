#!/usr/bin/python

import setup
setup.pre_install()

from charmhelpers.core import hookenv
from charmhelpers import fetch


def install():
    hookenv.log('Installing openldap-server')
    # add steps for installing dependencies and packages here
    # e.g.: from charmhelpers import fetch
    #       fetch.apt_install(fetch.filter_installed_packages(['nginx']))
    fetch.apt_install(fetch.filter_installed_packages(['slapd']))


if __name__ == "__main__":
    install()
