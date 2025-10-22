FROM node:20-alpine

# Installer git et openssh-client pour pouvoir cloner des repos privés si nécessaire
RUN apk add --no-cache git openssh-client bash

WORKDIR /usr/src/app

# Les arguments de build permettront de passer les variables au moment du build
ARG GIT_URL
ARG GIT_BRANCH=main


# Cloner le repository directement dans le répertoire de travail
RUN if [ -z "$GIT_URL" ]; then \
        echo "Erreur: GIT_URL non fourni"; \
        exit 1; \
    fi && \
    echo "Clonage depuis: ${GIT_URL} (branche: ${GIT_BRANCH})" && \
    cd /usr/src && \
    git clone --branch ${GIT_BRANCH} ${GIT_URL} app-temp && \
    echo "=== Contenu cloné ===" && \
    ls -la app-temp && \
    # Copier le contenu dans app (qui existe déjà via WORKDIR)
    cp -r app-temp/. app/ && \
    rm -rf app-temp && \
    echo "=== Contenu final dans /usr/src/app ===" && \
    ls -la /usr/src/app

# Installer les dépendances
RUN npm install

# Lancer l'application
#CMD [ "npm", "start" ]
#CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ld de production

#RUN npm run build

# Exposer le port
EXPOSE 3000

# Variable d'environnement pour la production
ENV NODE_ENV=production

# Lancer l'application en mode production
#CMD [ "node", ".output/server/index.mjs" ]]
#CMD [ "npm", "start" ]
CMD ["node", "server.js"]
