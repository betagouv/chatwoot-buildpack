# chatwoot-buildpack
Chatwoot Buildpack

# Deployer l'app sur scalingo

Ajouter le lien vers le buildpack dans un fichier .buildpacks
Ajouter un addon redis et un addons postgresql à votre app
Deployer
Scaler le container release et le container worker, puis restart les 3 containers

CHATWOOT_VERSION=2.2.1

# ENV var pour la suite :

se crée automatiquement lors de l'ajout des addons dans l'interface scalingo
DATABASE_URL=$SCALINGO_POSTGRESQL_URL
REDIS_URL=$SCALINGO_REDIS_URL

# ENV var for prod :
SECRET_KEY_BASE=

# ENV var à définir pour enregistrer les fichiers :
https://www.chatwoot.com/docs/self-hosted/deployment/storage/supported-providers
ACTIVE_STORAGE_SERVICE=s3_compatible
STORAGE_ACCESS_KEY_ID=
STORAGE_BUCKET_NAME=
STORAGE_ENDPOINT=
STORAGE_REGION=
STORAGE_SECRET_ACCESS_KEY=

# ENV var fr :
DEFAULT_LOCALE='fr'

# Env var extra :
ENABLE_ACCOUNT_SIGNUP=false
FRONTEND_URL=url_du_site

# To receive email :
in the interface of a mailbox :
`/app/accounts/1/settings/inboxes/1` define IMAP

# To send email :
Define default SMTP server via env var :
SMTP_ADDRESS=
SMTP_PASSWORD=
SMTP_PORT=
SMTP_USERNAME=

Then in the interface `/app/accounts/1/settings/inboxes/1` you can define SMTP server for each inbox :
use same value for "Address" and "Domain"

You can also set in env var :
MAILER_SENDER_EMAIL=Equipe John Doe <votre@adresse.fr>

# DEBUG BUILDPACK 
docker run --name chatwoot -it -p 8065:8065 -v "$(pwd)"/.env:/env/.env -v "$(pwd)":/buildpack scalingo/scalingo-18:latest bash

bash buildpack/bin/detect
bash buildpack/bin/compile /build /cache /env
bash buildpack/bin/release

