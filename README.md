# chatwoot-buildpack
Chatwoot Buildpack

docker run --name chatwoot -it -p 8065:8065 -v "$(pwd)"/.env:/env/.env -v "$(pwd)":/buildpack scalingo/scalingo-18:latest bash

bash buildpack/bin/detect
bash buildpack/bin/compile /build /cache /env
bash buildpack/bin/release