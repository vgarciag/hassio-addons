# Home Assistant Add-on: Gandi DNS

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant front-end to **Supervisor** -> **Add-on Store**.
2. Find the "Gandi DNS" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

1. Visit the [Gandi Developer Portal][gandi-dev] and create a PAT key for the Gandi account that is hosting the domain you want to use for Home Assistant.
2. In the Gandi DNS add-on configuration, perform the following:
    - Copy the PAT key and secret tokens from Gandi and paste into the `pat` option.
    - Update the `domain` option with the full domain name that is hosted by Gandi. E.g., `my-gandi-domain.com`.
    - Update the `hostname` option with a name you want to use under the domain. E.g., `my-hostname`.
3. If you want the add-on to automatically obtain a SSL certificate from Let's Encrypt and enable HTTPS, you must agree to the [Let's Encrypt Subscriber Agreement][le-legal] and perform the following:
    - Change `lets_encrypt.accept_terms` to `true`.
    - Configure the [HTTP Integration][http-integration] to use the SSL certificate.

## Configuration

Add-on configuration:

```yaml
lets_encrypt:
  accept_terms: true
  certfile: fullchain.pem
  keyfile: privkey.pem
  renewal_period: 5184000
  dns_delay: 60
pat: H0l4C4r4C0l4
domain: my-gandi-domain.com
hostname: my-hostname
ttl: 600
scan_interval: 300
```

In this example, the add-on will register the fully qualified domain name `my-hostname.my-gandi-domain.com` with the public IP address you are currently using and obtain a Let's Encrypt SSL certificate for that domain name.

Additionally, you'll need to configure the Home Assistant Core to pick up the SSL certificates.
This is done by setting the following configuration for the [HTTP Integration][http-integration] configuration in your `configuration.yaml`:

```yaml
http:
  ssl_certificate: /ssl/fullchain.pem
  ssl_key: /ssl/privkey.pem
```

### Option group `lets_encrypt`

The following options are for the option group: `lets_encrypt`.
These settings only apply to Let's Encrypt SSL certificates.

#### Option `lets_encrypt.accept_terms`

Once you have read and accepted the [Let's Encrypt Subscriber Agreement][le-legal], change value to `true` in order to use Let's Encrypt services.

#### Option `lets_encrypt.certfile`

The name of the certificate file generated by Let's Encrypt.
The file is used for SSL by Home Assistant add-ons and is recommended to keep the filename as-is (`fullchain.pem`) for compatibility.

**Note**: _The file is stored in `/ssl/`, which is the default for Home Assistant_

#### Option `lets_encrypt.keyfile`

The name of the private key file generated by Let's Encrypt.
The private key file is used for SSL by Home Assistant add-ons and is recommended to keep the filename as-is (`privkey.pem`) for compatibility.

**Note**: _The file is stored in `/ssl/`, which is the default for Home Assistant_

#### Option `lets_encrypt.renewal_period`

The number of seconds to wait before renewing Let's Encrypt certificates.
The default of 60 days is recommended by Let's Encrypt.

#### Option `lets_encrypt.dns_delay`

The number of seconds to wait between deploying the challenge DNS record and requesting the certificate.
If this delay is not long enough to allow propagation, Let's Encrypt may not recieve the challenge DNS record.

### Option: `ipv4` (optional)

By default, the add-on will use the response from https://api.ipify.org/ to auto-detect your IPv4 address.
This option allows you to override the auto-detection and specify an IPv4 address manually.

If you specify a URL here, contents of the resource it points to will be fetched and used as the address.
This enables getting the address with an alternative service like https://ipv4.text.wtfismyip.com

### Option: `ipv6` (optional)

By default, the add-on will use the response from https://api6.ipify.org/ to auto-detect your IPv6 address.
This option allows you to override the auto-detection and specify an IPv6 address manually.

If you specify a URL here, contents of the resource it points to will be fetched and used as the address.
This enables getting the address with an alternative service like https://ipv6.text.wtfismyip.com

### Option: `pat`

The PAT key that you receive from Gandi's PAT Key Management.


### Option: `domain`

A domain registered under your Gandi account.

### Option: `hostname`

A hostname you want to use under the domain for accessing Home Assistant.

### Option: `scan_interval`

The number of seconds to wait before checking whether DNS records need updating or Let's Encrypt certificates need renewing.

## Known issues and limitations

- You must have a domain hosted by Gandi.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/vgarciag/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[gandi-dev]: https://api.gandi.net/
[le-legal]: https://letsencrypt.org/repository/
[http-integration]: https://www.home-assistant.io/integrations/http/
