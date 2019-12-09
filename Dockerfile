FROM nginx:stable-alpine AS final

ARG GIT_BRANCH
ARG GIT_URL
ARG GIT_VERSION

LABEL Maintainer="Christian Höltje <https://docwhat.org>"
LABEL Name="dianewillis.org"
LABEL Version="Website for dianewillis.org"
LABEL org.opencontainers.image.authors="Christian Höltje <https://docwhat.org>"
LABEL org.opencontainers.image.title="Website for dianewillis.org"
LABEL org.opencontainers.image.url="https://dianewillis.org/"
LABEL org.opencontainers.image.source="${GIT_URL}#${GIT_BRANCH}"
LABEL org.opencontainers.image.version="${GIT_VERSION}"

HEALTHCHECK --interval=5s --timeout=5s CMD wget http://localhost/nginx-health -q -O - > /dev/null 2>&1

COPY nginx.conf /etc/nginx/nginx.conf
COPY /src/ /html/
