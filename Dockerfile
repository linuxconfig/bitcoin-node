FROM debian:8

MAINTAINER Lubos Rendek <web@linuxconfig.org>

RUN echo 'Acquire::http { Proxy "http://10.1.1.11:3142"; };' > /etc/apt/apt.conf.d/30proxy
ADD sources.list /etc/apt/
RUN apt-get update
RUN apt-get install -y wget

# Install bitcoin daemon
RUN wget -q https://bitcoin.org/bin/bitcoin-core-0.11.0/bitcoin-0.11.0-linux64.tar.gz
RUN tar xzf bitcoin-0.11.0-linux64.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-0.11.0/bin/*; mkdir /root/.bitcoin/

# Include bitcoind statup script
ADD start-node.sh /
RUN chmod 755 start-node.sh

# Clean up
RUN rm -fr bitcoin-0.11.0 bitcoin-0.11.0-linux64.tar.gz

CMD ["/start-node.sh"]
