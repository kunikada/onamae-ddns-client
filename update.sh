#!/bin/sh

dest=ddnsclient.onamae.com
logfile=update.log

function error_exit() {
  echo $1 1>&2
  exit 1
}

function on_exit() {
  local exit_code=$1
  exit $exit_code
}

function request() {
  rm -f $logfile

  env | awk -v ipv4=$1 -F= '
/^USERID/ { userid = $2 }
/^PASSWORD/ { password = $2 }
/^DOMAIN/ { domain = $2 }
/^SUBDOMAIN/ { subdomain[NR] = $2 }
END {
  if (userid == "" || password == "" || domain == "" || length(subdomain) == 0) {
    exit 1
  }
  print "LOGIN"
  print "USERID:" userid
  print "PASSWORD:" password
  print "."
  for (i in subdomain) {
    print "MODIP"
    print "HOSTNAME:" subdomain[i]
    print "DOMNAME:" domain
    print "IPV4:" ipv4
    print "."
  }
  print "LOGOUT"
  print "."
}' > $logfile
  [ -s $logfile ] || error_exit "Invalid params."

  openssl s_client -ign_eof -connect $dest:65010 -quiet < $logfile
}

function main() {
  trap 'on_exit $?' EXIT

  ipv4=`echo | nc $dest 65000 | awk '/^IPV4/{print $2}'`
  [ $ipv4 ] || error_exit "IPV4 not found."

  request $ipv4
}

main
