FROM ubuntu:14.04

# Derived from cpuguy83/ldap
# Credit to original maintainer Brian Goff
# We just add volumes and move to Ubuntu
MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>

RUN apt-get update -qq && apt-get install -y slapd ldap-utils -qq
RUN rm -rf /etc/ldap/slapd.d && rm -rf /var/lib/ldap/*
ADD slapd.tar.gz /etc/ldap
ADD db.ldif /tmp/

ADD start_slapd.sh /usr/local/bin/start_slapd
RUN mkdir /var/run/ldap

EXPOSE 389 636

VOLUME ["/var/lib/ldap","/etc/ldap/slapd.d"]

ENTRYPOINT ["/usr/local/bin/start_slapd", "-h ldapi:/// ldap:/// ldaps:///"]

CMD []
