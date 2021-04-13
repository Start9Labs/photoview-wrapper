FROM viktorstrate/photoview:2.3.0

# Install mariadb mysql database server
RUN apt-get update \
  && apt-get install -y mariadb-server wget \
  # Cleanup
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/mikefarah/yq/releases/download/v4.6.3/yq_linux_arm.tar.gz -O - |\
  tar xz && mv yq_linux_arm /usr/bin/yq

ADD ./docker_entrypoint.sh /app/docker_entrypoint.sh
RUN chmod a+x /app/docker_entrypoint.sh

ENTRYPOINT ["/app/docker_entrypoint.sh"]
