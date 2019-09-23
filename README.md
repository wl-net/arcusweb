# Arcus - Web Application

The Arcus Web application is built on DoneJS.

## Getting started

Currently, the i2web project requires Node 8.x LTS and NPM > v3. It is recommended that you install [NVM](https://github.com/creationix/nvm) so you can easily switch between NPM versions. After installing NVM, run:

```
cd i2web
nvm install
nvm use
```

Clone the repository into a local folder. Install all dependencies using

```
npm install donejs@1.0 -g
npm install
npm run bundle-dev
```

## Running tests/linting

Tests and ESLint can be run with

```
npm run test
```

## Development mode

The first time, add a host entry for:

```
127.0.0.1 localdev.irisbylowes.com
```

Then create a certificate:
`openssl genrsa -out bin/localhost.key 2048`
`openssl req -new -x509 -key localhost.key -out localhost.cert -days 3650 -subj /CN=localhost`

Development mode can be started with:

```
donejs develop
```
or:
```
npm run develop
```

and navigating to

```
https://localdev.irisbylowes.com:8443
```

## Build and production mode

To build the application into a production bundle run

```
npm run build
```

In Unix environment the production application can be started like this:

```
npm run start
```

If you run into problems with npm run start, you may need to create a couple folders:
```
mkdir build
cd build
mkdir dist
cd ..
npm run start
```

## Building containers for production

`./gradlew :tools:khakis:distDocker`
