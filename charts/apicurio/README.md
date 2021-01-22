# Apicurio

## Common

| Parameter         | Description                        | Default  |
|-----------------  |----------------------------------  |----------|
| nameOverride      | Override the resource name prefix  | `nil`    |
| fullnameOverride  | Override the full resource names   | `nil`    |

## API Component

| Parameter                 | Description                                                    | Default                            |
|-------------------------  |--------------------------------------------------------------- |------------------------------------|
| api.image.repository      | API component image repository                                 | `"apicurio/apicurio-studio-api"`   |
| api.image.tag             | API component image tag                                        | `"0.2.47.Final"`                   |
| api.image.pullPolicy      | API component image pull policy                                | `"IfNotPresent"`                   |
| api.app.keyCloakClientId  | The Client ID of the Keycloak client to use for authentication | `"apicurio-api"`                   |
| api.app.loggingLevel      | Default logging level                                          | `"INFO"`                           |
| api.app.minHeap           | Minimum java heap setting                                      | `"768m"`                           |
| api.app.maxHeap           | Maximum java heap setting                                      | `"2048m"`                          |
| api.app.githubApiUrl      | URL of the GitHub API                                          | `"https://api.github.com"`         |
| api.app.gitlabApiUrl      | URL of the GitLab API                                          | `"https://gitlab.com"`             |
| api.app.bitbucketApiUrl   | URL of the Bitbucket API                                       | `"https://api.bitbucket.org/2.0"`  |
| api.env                   | API component additional environment variables                 | `[]`                               |
| api.resources             | API component resource requests & limits                       | `{}`                               |

## UI Component

| Parameter                | Description                                                     | Default                          |
|------------------------  |-----------------------------------------------------------------|----------------------------------|
| ui.image.repository      | UI component image repository                                   | `"apicurio/apicurio-studio-ui"`  |
| ui.image.tag             | UI component image tag                                          | `"0.2.47.Final"`                 |
| ui.image.pullPolicy      | UI component image pull policy                                  | `"IfNotPresent"`                 |
| ui.app.keyCloakClientId  | The Client ID of the Keycloak client to use for authentication  | `"apicurio-studio"`              |
| ui.app.loggingLevel      | Default logging level                                           | `"INFO"`                         |
| ui.app.minHeap           | Minimum java heap setting                                       | `"768m"`                         |
| ui.app.maxHeap           | Maximum java heap setting                                       | `"2048m"`                        |
| ui.app.apiAbsolutePath   | API component absolute (optional, see below)                    | `""`                             |
| ui.app.wsAbsolutePath    | WS component absolute (optional, see below)                     | `""`                             |
| ui.env                   | UI component additional environment variables                   | `[]`                             |
| ui.resources             | UI component resource requests & limits                         | `{}`                             |

## WS Component

| Parameter            | Description                                    | Default                          |
|--------------------  |------------------------------------------------|----------------------------------|
| ws.image.repository  | WS component image repository                  | `"apicurio/apicurio-studio-ws"`  |
| ws.image.tag         | WS component image tag                         | `"0.2.47.Final"`                 |
| ws.image.pullPolicy  | WS component image pull policy                 | `"IfNotPresent"`                 |
| ws.app.loggingLevel  | Default logging level                          | `"INFO"`                         |
| ws.app.minHeap       | Minimum java heap setting                      | `"768m"`                         |
| ws.app.maxHeap       | Maximum java heap setting                      | `"2048m"`                        |
| ws.resources         | WS component additional environment variables  | `[]`                             |
| ws.resources         | WS component resource requests & limits        | `{}`                             |

## Database Access Properties

| Parameter                              | Description                                                             | Default                          |
|----------------------------------------|-------------------------------------------------------------------------|----------------------------------|
| dbConnection.driver                    | Database driver name. <br> Possible values: h2, mysql, and postgresql.  | `mysql`                          |
| dbConnection.name                      | Database name                                                           | `"apicurio"`                     |
| dbConnection.host                      | Database host                                                           | `localhost`                      |
| dbConnection.port                      | Database port                                                           | `3306`                           |
| dbConnection.username                  | Database username                                                       | `"apicurio"`                     |
| dbConnection.password                  | Database password                                                       | `"apicurio"`                     |
| dbConnection.passwordFromSecretKeyRef  | Database password from Secret (check values.yaml)                       | `{}`                             |
| dbConnection.properties                | Database JDBC properties                                                | `[useLegacyDatetimeCode=false]`  |

## Keycloak Connection Parameters

| Parameter                     | Description                                                    | Default                                  |
|-------------------------------|--------------------------------------------------------------- |------------------------------------------|
| keycloak.url                  | The URL to the Keycloak authentication server.                 | `"https://studio-auth.apicur.io/auth/"`  |
| keycloak.realm                | The name of the Keycloak realm to use for authentication       | `"apicurio"`                             |
| keycloak.disableTrustManager  | disable the HTTP client trust manager when accessing Keycloak  | `true`                                   |
| keycloak.forceSSL             | The Keycloak server must be accessed via HTTPS                 | `false`                                  |
| keycloak.service.name         | If `Ingress` enabled, then the Keycloak `Service` name         | `""`                                     |

## External Access (Ingress) Parameters

If you enable Ingress and set keycloak.service.name property, then the keycloak.url property work as a relative path.

| Parameter               | Description                                                    | Default  |
|-------------------------|----------------------------------------------------------------|----------|
| keycloak.service.port   | If `Ingress` enabled, then the Keycloak `Service` port number  | `8080`   |
| ingress.enabled         | Enable `Ingress`                                               | `false`  |
| ingress.annotations     | `Ingress` annotations                                          | `{}`     |
| ingress.host            | `Ingress` host name                                            | `""`     |
| ingress.tls.enabled     | Enable TLS for `Ingress`                                       | `false`  |
| ingress.tls.secretName  | `Secret` name that contains a TLS private key and certificate  | `""`     |
