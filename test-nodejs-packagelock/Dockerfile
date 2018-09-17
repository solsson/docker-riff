FROM projectriff/node-function-invoker:0.0.9-snapshot@sha256:77adb936cc46e47403ca71b6d70be70929a62c0b9bfc2da718097dace5046e68

# https://github.com/projectriff/node-function-invoker/blob/master/node-invoker.yaml
# {{ if .FileExists "package.json" -}}
ENV FUNCTION_URI /functions/
COPY package*.json ${FUNCTION_URI}
RUN (cd ${FUNCTION_URI} && npm ci)
COPY . ${FUNCTION_URI}
# {{- else -}}
