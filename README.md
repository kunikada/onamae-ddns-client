# Onamae DDNS client

For update DNS records of Onamae.com.

## Usage

    sudo docker run -it \
                -e USERID=yourid \
                -e PASSWORD=yourpassword \
                -e DOMAIN=yourdomain \
                -e SUBDOMAIN=yourhost \
                -e SUBDOMAIN2=otherhost \
                --health-interval=5m \
                -d kunikada/onamae-ddns-client

### INTERVAL

Option `--health-interval` (default 5m)

### ENVIRONMENT VARIABLES

 * USERID : Login ID
 * PASSWORD : Login password
 * DOMAIN : Onamae.com domain name
 * SUBDOMAIN : Onamae.com host names (SUBDOMAIN2, SUBDOMAIN3...)
   * Optional (Default blank)
