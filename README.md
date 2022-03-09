# chatwoot-buildpack
Chatwoot Buildpack

# ENV var à définir

ACTIVE_STORAGE_SERVICE=s3_compatible
CHATWOOT_VERSION=2.2.1
DATABASE_URL=$SCALINGO_POSTGRESQL_URL
DEFAULT_LOCALE='fr'
ENABLE_ACCOUNT_SIGNUP=false
FRONTEND_URL=url_du_site
MAILER_SENDER_EMAIL=Equipe John Doe <votre@adresse.fr>
POSTGRES_DATABASE=unnomdedb
POSTGRES_PASSWORD=unpwdedb
POSTGRES_USERNAME=unnomdedb
RACK_ENV=production
RAILS_ENV=production
REDIS_URL=$SCALINGO_REDIS_URL
SECRET_KEY_BASE=
SMTP_ADDRESS=
SMTP_PASSWORD=
SMTP_PORT=
SMTP_USERNAME=
STORAGE_ACCESS_KEY_ID=
STORAGE_BUCKET_NAME=
STORAGE_ENDPOINT=
STORAGE_REGION=
STORAGE_SECRET_ACCESS_KEY=


# DEBUG
docker run --name chatwoot -it -p 8065:8065 -v "$(pwd)"/.env:/env/.env -v "$(pwd)":/buildpack scalingo/scalingo-18:latest bash

bash buildpack/bin/detect
bash buildpack/bin/compile /build /cache /env
bash buildpack/bin/release

