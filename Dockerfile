FROM vromero/activemq-artemis:2.6.2

COPY assets/docker-entrypoint.sh /
COPY assets/drain.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["artemis-server"]
