FROM ubuntu:14.04.4

# Derived from cpuguy83/ldap
# Credit to original maintainer Brian Goff
# We just add volumes and move to Ubuntu

MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>
ENV REFRESHED_ON "08 Jul 2015"

RUN apt-get update && apt-get install -y slapd ldap-utils 

