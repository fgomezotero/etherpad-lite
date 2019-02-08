FROM node
WORKDIR /app
COPY . /app
RUN chown -R 1000 /app && \
chmod -R u+x /app/bin && \
chgrp -R 0 /app && \
chmod -R g=u /app
RUN bin/installDeps.sh
EXPOSE 9001
VOLUME [ "/app/var" ]
USER 1000
ENTRYPOINT [ "./bin/run.sh" ]