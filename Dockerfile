FROM chainmapper/walletbase-xenial
	
ENV WALLET_URL=https://github.com/HIVENetwork1/HIVE/releases/download/v1.0/hive-linux.zip

RUN wget $WALLET_URL -O /tmp/wallet.zip \
	&& unzip -j /tmp/wallet.zip -d /usr/local/bin \
	&& chmod +x /usr/local/bin/*

#rpc port & mainport
EXPOSE 6666 1234

RUN mkdir /data
ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
RUN chmod 777 /*.sh
CMD /start.sh hive.conf HIVE hived