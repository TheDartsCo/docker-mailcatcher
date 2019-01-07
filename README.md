# mailcatcher docker image

This is an unofficial very small Dockerfile image (~34 MB uncompressed) for [mailcatcher gem][mailcatcher]. It is based on [Alpine Linux][alpinehubpage] and using the last available release from the official Github repo of [mailcatcher][mailcatcher].

The difference between this image and most of the other ones that the port numbers are envinronment varibales. You can change them to suit your needs.

Here is an example on how your docker-compose file should look

```yaml
ports:
  - "1080:1080"
  - "1025:1025"
environment:
  - HTTP_PORT=1080
  - SMTP_PORT=1025
```

## Usage

Get it:

    docker pull thedartsco/mailcatcher

Run it:

    docker run -d -p 1080:1080 --name mailcatcher thedartsco/mailcatcher

Link it:

    docker run -d --link mailcatcher -e SMTP_HOST=mailcatcher --name php56 thedartsco/php:5.6

Then you can send emails from your app and check out the web interface: `http://<your docker host\>:1080/`.

If you want to send emails from your host you can map the 1025 port:

    docker run -d -p 1080:1080 -p 1025:1025 --name mail thedartsco/mailcatcher

then send yout emails through your docker host on port 1025 (or any port you want)

## Build

Just clone this repo and run:

    docker build -t thedartsco/mailcatcher .

### Inspired by:

- https://hub.docker.com/r/jeanberu/mailcatcher
- https://hub.docker.com/r/tophfr/mailcatcher

[mailcatcher]: http://mailcatcher.me/ "MailCatcher fake SMTP server with web interface"
[dockerhubpage]: https://hub.docker.com/r/thedartsco/mailcatcher/ "Mailcatcher docker hub page"
[alpinehubpage]: https://hub.docker.com/_/alpine/ "A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!"
