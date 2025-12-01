# astro-test

To test locally, you need to use docker :

Construct your image
``docker build -f Dockerfile.local -t astro-img .``

Run a contener 
``docker run -d -p 8080:3000 --name  test-astro astro-img``

Or for testing, automatically deletes the container when it exits.
``docker run --rm --init -p 8080:3000 --name test-astro astro-img``

Visit http://localhost:8080 with a browser and enjoy!

This is a test project for Astro (v?).
