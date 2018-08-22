FROM samesense/dreg-docker
MAINTAINER Perry Evans <https://github.com/samesense>

RUN apt-get update -qqq \
&& apt-get install -y wget curl git bedtools \
&& wget "http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig" -O /bin/bedGraphToBigWig

RUN chmod +x /bin/bedGraphToBigWig

RUN git clone https://github.com/Danko-Lab/dREG.HD \
&& cd dREG.HD \
&& R CMD INSTALL dREG.HD

RUN apt-get autoremove -y \
&& apt-get remove --purge -y git

RUN rm -rf dREG.HD
