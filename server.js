// server.js
const http = require('http');
const fs = require('fs');
const port = 3000; // Obligé pour JrCanDev !!:

const server = http.createServer((req, res) => {
    // Définit l'en-tête de la réponse
    res.writeHead(200, { 'Content-Type': 'text/html' });

    // Lit et envoie le contenu du fichier index.html
    fs.readFile('index.html', (err, data) => {
        if (err) {
            res.writeHead(404);
            res.write('Erreur: Fichier introuvable!');
        } else {
            res.write(data);
        }
        res.end();
    });
});

server.listen(port, (err) => {
    if (err) {
        return console.log('Erreur de démarrage du serveur: ' + err);
    }
    console.log(`Le serveur est prêt et écoute sur http://localhost:${port}`);
    console.log(`Arrêtez le serveur avec CTRL + C`);
});