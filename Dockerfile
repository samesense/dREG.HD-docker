FROM samesense/dreg-docker
MAINTAINER Perry Evans <https://github.com/samesense>

RUN apt-get update -qqq \
&& apt-get install -y wget curl git bedtools \
&& wget "http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig" -O /bin/bedGraphToBigWig

RUN chmod +x /bin/bedGraphToBigWig

RUN git clone https://github.com/samesense/dREG.HD \
&& cd dREG.HD \
&& R CMD INSTALL dREG.HD

RUN apt-get install -y r-cran-snow
RUN R --vanilla << "install.packages('snowfall', repos='http://cran.us.r-project.org'); q();"

RUN apt-get autoremove -y \
&& apt-get remove --purge -y git

ENV PATH dREG.HD/:/bin/:$PATH
