FROM docker.io/satcom886/arch-builder:base

# add the custom repo
RUN sed -i '/^\[core\]/i \[s886\]\nSigLevel = Optional TrustAll\nServer = https://repo.mcld.eu/$arch' /etc/pacman.conf

# Install Blender
RUN pacman -Sy --noconfirm --noprogressbar blender python-pyzmq

# Download CR's scripts
RUN git clone https://github.com/crowdrender/cr-docker.git

# CR environment variables
ENV CR_VERSION latest
ENV persistent "false"
ENV local "true"
ENV usegpu "false"

# Copy CR's scripts
WORKDIR /CR
RUN cp /cr-docker/download_cr.sh .
RUN cp /cr-docker/start_cr_server.sh .
RUN cp /cr-docker/install_addon.py .

# no longer needed
RUN rm -r /cr-docker

# Change the path to Blender
RUN sed -i -e 's/\/usr\/local\/blender\/blender/\/usr\/bin\/blender/g' start_cr_server.sh

RUN chmod +x ./download_cr.sh && chmod +x ./start_cr_server.sh
RUN chmod -R 777 /CR

ENTRYPOINT ./start_cr_server.sh
