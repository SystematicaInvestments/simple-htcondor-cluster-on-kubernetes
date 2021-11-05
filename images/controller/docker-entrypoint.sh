#!/bin/sh

# Configuration
echo "CONDOR_HOST = $CONDOR_HOST" > /etc/condor/config.d/docker
echo "SEC_PASSWORD_FILE = $SEC_PASSWORD_FILE" >> /etc/condor/config.d/docker

# Run the controller
python3 /htcondor-pool.py
