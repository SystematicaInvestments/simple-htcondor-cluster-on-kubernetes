ARG HTCONDOR_GIT_URL="https://github.com/SystematicaInvestments/htcondor.git"
FROM artifactory.systematica.com/docker-virtual/htcondor/cm:9.0.1-el7
USER root

COPY condor_config.local /etc/condor/
COPY collector /etc/condor/config.d
COPY htcondor-collector-liveness /usr/local/bin/

COPY docker-entrypoint.sh /
ENV HTCONDOR_GIT_URL="https://github.com/SystematicaInvestments/htcondor.git"
CMD ["/docker-entrypoint.sh"]
