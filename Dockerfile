FROM alpine

RUN apk --no-cache add curl ca-certificates bash

COPY deploy.sh /bin

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/deploy.sh"]