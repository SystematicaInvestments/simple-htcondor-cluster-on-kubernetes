ARG HTCONDOR_GIT_URL="https://github.com/SystematicaInvestments/htcondor.git"
FROM artifactory.systematica.com/docker-virtual/htcondor/build-centos7:V9_0_2
USER root
COPY condor_config.local /etc/condor/
COPY htcondor-pool.py /
COPY docker-entrypoint.sh /

RUN rm /etc/yum.repos.d/* && \
echo "[Artifactory]" > /etc/yum.repos.d/artifactory.repo && \
echo "baseurl=https://artifactory.systematica.com/artifactory/rpm-remote/\$releasever/os/\$basearch/" >> /etc/yum.repos.d/artifactory.repo && \
echo "enabled=1" >> /etc/yum.repos.d/artifactory.repo && \
echo "gpgcheck=0" >> /etc/yum.repos.d/artifactory.repo && \
echo "[global]" > /etc/pip.conf && \
echo "#index-url = https://artifactory.systematica.com/artifactory/api/pypi/pypi/simple" >> /etc/pip.conf && \
echo "proxy = http://82.150.123.115:3128" >> /etc/pip.conf && \
echo "index-url=https://pypi.org/simple" >> /etc/pip.conf && \
echo "trusted-host = pypi.python.org" >> /etc/pip.conf && \
echo "               pypi.org" >> /etc/pip.conf && \
echo "               files.pythonhosted.org" >> /etc/pip.conf && \
echo "               mirrors.aliyun.com" >> /etc/pip.conf && \
pip3 install htcondor classad requests && \
yum -y install python-requests && \
chmod +x /docker-entrypoint.sh && \
mkdir -p /etc/condor/config.d

ENV HTCONDOR_GIT_URL="https://github.com/SystematicaInvestments/htcondor.git"
ENV HTTPS_PROXY=lhcproxy2.eu.options-it.com:3128
ENV https_proxy=lhcproxy2.eu.options-it.com:3128
RUN git clone -c http.sslVerify=false $HTCONDOR_GIT_URL /home/build/htcondor
CMD ["/docker-entrypoint.sh"] \

