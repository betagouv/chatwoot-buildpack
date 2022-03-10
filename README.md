# chatwoot-buildpack
Chatwoot Buildpack

# Deploy on scalingo

- Add the link this buildpack in a .buildpacks file : https://github.com/betagouv/chatwoot-buildpack#main
- In scalingo :
    - set the chatwoot version in the env var : CHATWOOT_VERSION=2.2.1
    - Add redis and postgresql addon to your app
    - Deploy
    - Scale release and worker container to 1 and restart all 3 container

# Env var :

Check that you have the following env var (they should be set automaticaly when adding addons)
DATABASE_URL=$SCALINGO_POSTGRESQL_URL
REDIS_URL=$SCALINGO_REDIS_URL

## ENV var for prod :
SECRET_KEY_BASE=

## ENV var to store files on S3 storage :
https://www.chatwoot.com/docs/self-hosted/deployment/storage/supported-providers
ACTIVE_STORAGE_SERVICE=s3_compatible
STORAGE_ACCESS_KEY_ID=
STORAGE_BUCKET_NAME=
STORAGE_ENDPOINT=
STORAGE_REGION=
STORAGE_SECRET_ACCESS_KEY=

## ENV var fr :
DEFAULT_LOCALE='fr'

## Env var extra :
ENABLE_ACCOUNT_SIGNUP=false
FRONTEND_URL=url_du_site

# Send and receive emails

## To receive email :
When you create a mailbox then you should go to the interface of a mailbox :
`/app/accounts/1/settings/inboxes/1` and define IMAP

## To send email :
Define default SMTP server via env var :
SMTP_ADDRESS=
SMTP_PASSWORD=
SMTP_PORT=
SMTP_USERNAME=

Then in the interface `/app/accounts/1/settings/inboxes/1` you can define SMTP server for each inbox :
use same value for "Address" and "Domain"

You can also set in env var :
MAILER_SENDER_EMAIL=Equipe John Doe <votre@adresse.fr>

# Release container crash :
You can scale it to 0.
It is needed only for db migration, that can be run using : "bundle exec rails db:chatwoot_prepare"

# DEBUG BUILDPACK 
docker run --name chatwoot -it -p 8065:8065 -v "$(pwd)"/.env:/env/.env -v "$(pwd)":/buildpack scalingo/scalingo-18:latest bash

bash buildpack/bin/detect
bash buildpack/bin/compile /build /cache /env
bash buildpack/bin/release

