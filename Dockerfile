FROM alpine
ENV VERYSYNC_VERSION = 2.8.2 \
    CPU = arm
ADD http://dl.verysync.com/releases/v$VERYSYNC_VERSION/verysync-linux-$CPU-v$VERYSYNC_VERSION.tar.gz /
RUN tar xzf verysync-linux-$CPU-v$VERYSYNC_VERSION.tar.gz verysync-linux-$CPU-v$VERYSYNC_VERSION/verysync \
 && rm verysync-linux-$CPU-v$VERYSYNC_VERSION.tar.gz \
 && mv /verysync-linux-$CPU-v$VERYSYNC_VERSION /verysync
EXPOSE 8886 22330
ENTRYPOINT ["/verysync/verysync", "-gui-address", "0.0.0.0:8886"]
