FROM ubuntu:14.04.2

# Derived from cpuguy83/ldap
# Credit to original maintainer Brian Goff
# We just add volumes and move to Ubuntu
MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>
ENV REFRESHED_ON "03 Jul 2015"

RUN apt-get update -qq && apt-get install -y slapd ldap-utils -qq

ADD db.ldif /tmp/
ADD start_ldap.sh /usr/local/bin/

ENV LDAP_ROOTPASS password
ENV LDAP_ORGANISATION Internal LDAP
ENV LDAP_DOMAIN com

VOLUME ["/var/lib/ldap/"]
VOLUME ["/etc/ldap/slapd.d"]
EXPOSE 389 

ENTRYPOINT /usr/local/bin/start_ldap.sh
