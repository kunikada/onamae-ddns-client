# Onamae DDNS client

# What is this?

For update DNS records of Onamae.com.

# Usage

    sudo docker run -it \
                -e USERID=yourid
                -e PASSWORD=yourpassword
                -e DOMAIN=yourdomain
                -e SUBDOMAIN=yourhost
                -e SUBDOMAIN2=otherhost
                -d kunikada/onamae-ddns-client

ENVIRONMENT VARIABLES

 * USERID : Login ID
 * PASSWORD : Login password
 * DOMAIN : Onamae.com domain name
 * SUBDOMAIN : Onamae.com host names (SUBDOMAIN2, SUBDOMAIN3...)
