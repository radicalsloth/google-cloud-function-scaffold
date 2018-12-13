# Google Cloud Function Scaffold
This repository provides a scaffold for building and developing Google Cloud Functions on your local machine. It is designed for building HTTP-triggered functions, and is recommended to be paried with something like [Postman](https://www.getpostman.com/).

## Dependencies
* [Docker](http://docker.com)
* [gcloud command-line tool](https://cloud.google.com/sdk/gcloud/)
* [GNU Make](https://www.gnu.org/software/make/)

## Installation
To install, make sure all dependencies are first met, then run the following command to build the docker image and install required dependencies.
```bash
# Builds a python-flask image and installs all required dependencies as specified by your project
make build
```

## Running Locally
To bring up your repository, use the `make run` command. This command simply echos `docker-compose up`, so feel free to use that instead.

```bash
# Starts a local python-flask container for serving your cloud function locally
make run
# To stop, use CTRL+C
```

This will bring up a development server on `0.0.0.0:8000`, allowing you to preview and work with your function before deployment.

### Available Make Commands
* `make run` - Will bring up the dev server in the current terminal
* `make up` - Will bring up the dev server in detached mode
* `make down` - Stops the dev server (even if running in detached mode)
* `make stop` - Stops the dev server (same as `make down`)
* `make rebuild` - Stops the dev server, rebuilds the image, and starts the server
* `make build` - Builds the dev server image
* `make deploy` - Deploys the current function to GCP


### Adding PyPI Requirements
When requirements are added to the `cloud_function/requirements.txt` file, you will need to trigger a rebuild of the docker image to install these in the container. You can do so with the following command:
```bash
# Stops the currently running containers, rebuilds them, and starts them again
make rebuild
```

## Deployment
To deploy to Google Cloud Functions, configure the [settings.txt file](settings.txt) with the following parameters (in order). Be sure there are no blank lines at the start of the file.
```txt
your-gcp-project-id
your_cloud_function_name
```

Once complete, you can run the `make deploy` command to deploy your cloud function to GCP.
