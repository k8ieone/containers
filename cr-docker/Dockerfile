FROM docker.io/k8ieone/blender:latest

# Download CR's scripts
RUN git clone https://github.com/crowdrender/cr-docker.git

# CR environment variables
ENV CR_VERSION latest
ENV BLENDER_VERSION "2.93"
ENV BLENDER_PYV "py_3_10"
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
