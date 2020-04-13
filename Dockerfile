FROM hyperized/scratch:latest as trigger
# Used to trigger Docker hubs auto build, which it wont do on the official images

FROM alpine as builder

RUN apk -U add gettext

FROM alpine

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"

RUN apk -U add libintl

COPY --from=builder /usr/bin/envsubst /usr/bin/envsubst

ENTRYPOINT ["/usr/bin/envsubst"]
