FROM vromero/activemq-artemis:2.6.2

COPY assets/docker-entrypoint.sh /
COPY assets/drain.sh /

EXPOSE 9876

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["artemis-server"]
