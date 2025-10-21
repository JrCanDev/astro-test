# astro-test

To test locally:

Construct your image
``docker build -f Dockerfile.local -t astro-app .``

Run a contener
``docker run -d -p 8080:3000 --name astro_server astro-app``

Visit http://localhost:8080 with a browser and enjoy
