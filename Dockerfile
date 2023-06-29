ARG IMAGE=intersystemsdc/irishealth-community
FROM $IMAGE

WORKDIR /home/irisowner/dev/

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly