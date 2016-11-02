#################################################################
# Dockerfile
#
# Version:          0.0.1
# Software:         nanoLIMS
# Description:      A gene centric metagenomics assembly and annotation pipeline
# Website:          https://github.com/cheinle/NanoLIMS/
# Tags:             Genomics Metagenomics Transcriptomics NextGenerationSequencing LIMS
# Provides:         
# Base Image:       
#Run CMD:  	ROOTDIR=/Users/uesu/github/reAssemble/justK03043
# docker run -it -p 80:80  cheinle/nanolims  /bin/bash
#################################################################

FROM linode/lamp

#Init###############################
RUN apt-get update && \
    apt-get install -y git unzip && \ 
    mkdir /var/www/nanolims && \
    mkdir -p /var/www/nanolims_config

COPY connection.txt /var/www/nanolims_config/connection.txt 


WORKDIR /var/www/
RUN git clone -b docker https://github.com/etheleon/NanoLIMS.git /var/www/nanolims && \
    mv /var/www/nanolims/Important\ Accessories.zip /var/www/ && \
    unzip /var/www/Important\ Accessories.zip && \
    cp /var/www/nanolims/nanolims.com.conf /etc/apache2/sites-available/nanolims.com.conf

#PERMISSIONS

RUN chmod o+r /var/www/nanolims_config/connection.txt && \
    chmod o+rw /var/www/nanolims/sequencing/sequencing_form.xlsx && \
    chmod o+rw /var/www/nanolims/query_samples/document_name.xls

#remove default
RUN rm -rf /etc/apache2/sites-available/examples.com.conf /etc/apache2/sites-enabled/examples.com.conf

RUN service mysql start && \
    mysql -u root -pAdmin2015 < /var/www/nanolims/nanolims_demo.sql && \
    service mysql stop && \ 
    a2ensite nanolims.com.conf
