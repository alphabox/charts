| Parameter                               | Description                                                    | Default                                 |
|-----------------------------------------|--------------------------------------------------------------- |-----------------------------------      |
| nameOverride                            | Override the resource name prefix                              | `nil`                                   |
| fullnameOverride                        | Override the full resource names                               | `nil`                                   |
| api.image.repository                    | API component image repository                                 | `"apicurio/apicurio-studio-api"`        |
| api.image.tag                           | API component image tag                                        | `"0.2.47.Final"`                        |
| api.image.pullPolicy                    | API component image pull policy                                | `"IfNotPresent"`                        |
| api.app.keyCloakClientId                | The Client ID of the Keycloak client to use for authentication | `"apicurio-api"`                        |
| api.app.loggingLevel                    | Default logging level                                          | `"INFO"`                                |
| api.app.minHeap                         | Minimum java heap setting                                      | `"768m"`                                |
| api.app.maxHeap                         | Maximum java heap setting                                      | `"2048m"`                               |
| api.app.githubApiUrl                    | URL of the GitHub API                                          | `"https://api.github.com"`              |
| api.app.gitlabApiUrl                    | URL of the GitLab API                                          | `"https://gitlab.com"`                  |
| api.app.bitbucketApiUrl                 | URL of the Bitbucket API                                       | `"https://api.bitbucket.org/2.0"`       |
| api.resources                           | API component resource requests & limits                       | `{}`                                    |
| ui.image.repository                     | UI component image repository                                  | `"apicurio/apicurio-studio-ui"`         |
| ui.image.tag                            | UI component image tag                                         | `"0.2.47.Final"`                        |
| ui.image.pullPolicy                     | UI component image pull policy                                 | `"IfNotPresent"`                        |
| ui.app.keyCloakClientId                 | The Client ID of the Keycloak client to use for authentication | `"apicurio-studio"`                     |
| ui.app.loggingLevel                     | Default logging level                                          | `"INFO"`                                |
| ui.app.minHeap                          | Minimum java heap setting                                      | `"768m"`                                |
| ui.app.maxHeap                          | Maximum java heap setting                                      | `"2048m"`                               |
| ui.app.apiAbsolutePath                  | API component absolute (optional, see below)                   | `""`                                    |
| ui.app.wsAbsolutePath                   | WS component absolute (optional, see below)                    | `""`                                    |
| ui.resources                            | UI component resource requests & limits                        | `{}`                                    |
| ws.image.repository                     | WS component image repository                                  | `"apicurio/apicurio-studio-ws"`         |
| ws.image.tag                            | WS component image tag                                         | `"0.2.47.Final"`                        |
| ws.image.pullPolicy                     | WS component image pull policy                                 | `"IfNotPresent"`                        |
| ws.app.loggingLevel                     | Default logging level                                          | `"INFO"`                                |
| ws.app.minHeap                          | Minimum java heap setting                                      | `"768m"`                                |
| ws.app.maxHeap                          | Maximum java heap setting                                      | `"2048m"`                               |
| ws.resources                            | WS component resource requests & limits                        | `{}`                                    |
| postgresql.enabled                      | Enable PostgreSQL deployment                                   | `true`                                  |
| postgresql.image.repository             | PostgreSQL image repository                                    | `"postgres"`                            |
| postgresql.image.tag                    | PostgreSQL image tag                                           | `"12.2-alpine"`                         |
| postgresql.image.pullPolicy             | PostgreSQL image pull policy                                   | `"IfNotPresent"`                        |
| postgresql.properties.username          | PostgreSQL user with superuser power                           | `"apicurio"`                            |
| postgresql.properties.password          | PostgreSQL user password                                       | `"apicurio"`                            |
| postgresql.properties.database          | PostgreSQL database name                                       | `"apicurio"`                            |
| postgresql.persistence.enabled          | Enable persistence using PVC                                   | `false`                                 |
| postgresql.persistence.size             | `PersistenceVolumeClaim` size                                  | `"1Gi"`                                 |
| postgresql.persistence.storageClassName | `PersistenceVolumeClaim` storage class                         | `""`                                    |
| postgresql.persistence.existingClaim    | Existing `PersistentVolumeClaim` name                          | `""`                                    |
| postgresql.resources                    | PostgreSQL resource requests & limits                          | `{}`                                    |
| mysqlExternal.enabled                   | Use an external MySQL instance                                 | `false`                                 |
| mysqlExternal.service.name              | External MySQL instance `Service` name                         | `""`                                    |
| mysqlExternal.service.port              | External MySQL instance `Service` port number                  | `3306`                                  |
| mysqlExternal.properties.username       | External MySQL instance username                               | `{}`                                    |
| mysqlExternal.properties.password       | External MySQL instance password                               | `{}`                                    |
| mysqlExternal.properties.database       | External MySQL instance database                               | `""`                                    |
| postgresqlExternal.enabled              | Use an external PostgreSQL instance                            | `false`                                 |
| postgresqlExternal.service.name         | External PostgreSQL instance `Service` name                    | `""`                                    |
| postgresqlExternal.service.port         | External PostgreSQL instance `Service` port number             | `5432`                                  |
| postgresqlExternal.properties.username  | External PostgreSQL instance username                          | `{}`                                    |
| postgresqlExternal.properties.password  | External PostgreSQL instance password                          | `{}`                                    |
| postgresqlExternal.properties.database  | External PostgreSQL instance database                          | `""`                                    |
| keycloak.url                            | The URL to the Keycloak authentication server.                 | `"https://studio-auth.apicur.io/auth/"` |
| keycloak.realm                          | The name of the Keycloak realm to use for authentication       | `"apicurio"`                            |
| keycloak.disableTrustManager            | disable the HTTP client trust manager when accessing Keycloak  | `true`                                  |
| keycloak.forceSSL                       | The Keycloak server must be accessed via HTTPS                 | `false`                                 |
| keycloak.service.name                   | If `Ingress` enabled, then the Keycloak `Service` name         | `""`                                    |
| keycloak.service.port                   | If `Ingress` enabled, then the Keycloak `Service` port number  | `8080`                                  |
| ingress.enabled                         | Enable `Ingress`                                               | `false`                                 |
| ingress.annotations                     | `Ingress` annotations                                          | `{}`                                    |
| ingress.host                            | `Ingress` host name                                            | `""`                                    |
| ingress.tls.enabled                     | Enable TLS for `Ingress`                                       | `false`                                 |
| ingress.tls.secretName                  | `Secret` name that contains a TLS private key and certificate  | `""`                                    |

If you enable Ingress and set keycloak.service.name property, then the keycloak.url property work as a relative path.
