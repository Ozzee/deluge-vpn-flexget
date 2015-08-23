FROM binhex/arch-delugevpn
MAINTAINER ozzee

# additional files
##################

# add supervisor conf file for app
ADD delugevpn.conf /etc/supervisor/conf.d/

# add bash scripts to install app, and setup iptables, routing etc
ADD install.sh /root/

# add bash script to run deluge
ADD apps/nobody/flexget.sh /home/nobody/

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/install.sh /home/nobody/flexget.sh && \
	/bin/bash /root/install.sh

# run supervisor
################

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]
