Notifies Sentry about a new release version from Drone CI.

# Enviroments

#### PROJECT_NAME
Project's name to log which project is beaing notified.

#### PROJECT_ALIAS
In Sentry, when you create a project, it is required to set an alias which is unique and unchangable. It is used in URIs to identify the project in API Endpoints.


#### MAINTAINER_NAME
Maintainer in git repository.

#### REPO_NAME
Repository name which identifies the git repository.

#### SENTRY_BASE_URL
Sentry URL.

#### SENTRY_ORG_ALIAS

In Sentry, when you create an organization (or uses the default **Internal**, it always has an alias which is unique and unchangable. It is used in URIs to identify the project in API Endpoints.

For **Internal** organization (if you have not created your own, it is `sentry`).


#### SENTRY_API_RELEASE_TOKEN

You have to create an API Token with `project:release` scope.

#### VERSION

Which version will be notified

#### COMMIT_SHA

Which git revision will be linked to the version, so Sentry can fetch related commits and get several information about the release.

# Usage

```
docker run -tid --rm --name sentry-release \
    -e PROJECT_NAME=My Beautiful project \
    -e PROJECT_ALIAS=my-beautiful-project \
    -e MAINTAINER_NAME=hugoseabra \
    -e REPO_NAME=drone-sentry-release \
    -e SENTRY_BASE_URL=https://sentry.mydomain.io \
    -e SENTRY_ORG_ALIAS=sentry \
    -e SENTRY_API_RELEASE_TOKEN=<token> \
    -e VERSION=1.4.22 \
    -e COMMIT_SHA=1bb9cd04237ce4e1bb188154624b2b165f1fa4a8 \
    hugoseabra19/drone-sentry-release
```