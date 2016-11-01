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
# sudo docker run -p 80:80 -t -i linode/lamp /bin/bash
#		docker run -v $ROOTDIR/data/contigs:/data/contigs \
#		    -v $ROOTDIR/data/konr:/data/refSeqProtDB \
#		    -v $ROOTDIR/out:/data/out  \
#		    -v $ROOTDIR/misc:/data/misc newpass:latest \
#		    maxDiversity --outputDIR /data/out --format --threads 8 --refseqKO /data/refSeqProtDB  --contigs /data/contigs  --megan /usr/local/bin/MEGAN --meganLicense /data/misc/MEGAN5-academic-license.txt
#################################################################

FROM linode/lamp

#Init###############################
RUN apt-get update && \
    apt-get install -y git unzip

RUN mkdir /var/www/nanolims && \
    mkdir -p /var/www/nanolims_config && \
    touch /var/www/nanolims_config/connection.txt && \
    chmod o+r /var/www/nanolims_config/connection.txt

WORKDIR /var/www/
RUN git clone https://github.com/cheinle/NanoLIMS.git /var/www/nanoLIMS

RUN mv /var/www/nanolims/Important\ Accessories.zip /var/www/ &&
    unzip /var/www/Important\ Accessories.zip 
#PERMS
RUN chmod o+rw /var/www/nanolims/sequencing/sequencing_form.xlxs && \
    chmod o+rw /var/www/nanolims/query_samples/document_name.xls && \
    chmod o+rw /var/www/nanolims/labels/document_name.xls


RUN service apache2 start
RUN service mysql start

RUN mysql -u root -p 


