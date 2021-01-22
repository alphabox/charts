{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "apicurio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apicurio.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "apicurio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "apicurio.labels" -}}
helm.sh/chart: {{ include "apicurio.chart" . }}
{{ include "apicurio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "apicurio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "apicurio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "apicurio.postgresql.name" -}}
{{- printf "%s-postgresql" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "apicurio.ws.name" -}}
{{- printf "%s-ws" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "apicurio.api.name" -}}
{{- printf "%s-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "apicurio.ui.name" -}}
{{- printf "%s-ui" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "apicurio.db.connectionUrl" -}}
{{- $scheme := printf "%s:%s" "jdbc" .Values.dbConnection.driver -}}
{{- $host := printf "%s:%d" .Values.dbConnection.host (.Values.dbConnection.port | int) -}}
{{- $path := printf "/%s" .Values.dbConnection.name -}}
{{- $properties := .Values.dbConnection.properties | join "&" -}}

{{- urlJoin (dict "scheme" $scheme "host" $host "path" $path "query" $properties) -}}
{{- end -}}

{{- define "apicurio.db.type" -}}
{{- $types := dict "h2" "h2" "mysql" "mysql5" "postgresql" "postgresql9" -}}
{{- if not (hasKey $types .Values.dbConnection.driver) -}}
{{- printf "Not supported driver: %s" .Values.dbConnection.driver | fail -}}
{{- else -}}
{{- get $types .Values.dbConnection.driver | quote -}}
{{- end -}}
{{- end -}}

{{- define "apicurio.db.password" -}}
{{- if .Values.dbConnection.passwordFromSecretKeyRef -}}
valueFrom:
  secretKeyRef:
    name: {{ .Values.dbConnection.passwordFromSecretKeyRef.name }}
    key: {{ .Values.dbConnection.passwordFromSecretKeyRef.key }}
{{- else -}}
value: {{ .Values.dbConnection.password | quote }}
{{- end -}}
{{- end -}}

{{- define "apicurio.keycloak.sslRequired" -}}
{{- if or .Values.keycloak.forceSSL (and .Values.ingress.enabled .Values.ingress.tls.enabled) }}
{{- printf "%s" "ALL" -}}
{{- else -}}
{{- printf "%s" "NONE" -}}
{{- end -}}
{{- end -}}

{{- define "apicurio.ui.wsPath" -}}
{{- if .Values.ui.app.wsAbsolutePath -}}
{{- printf "%s" .Values.ui.app.wsAbsolutePath -}}
{{- else if .Values.ingress.tls.enabled -}}
{{- printf "wss://%s/ws" .Values.ingress.host -}}
{{- else -}}
{{- printf "ws://%s/ws" .Values.ingress.host -}}
{{- end -}}
{{- end -}}

{{- define "apicurio.ui.apiPath" -}}
{{- if .Values.ui.app.apiAbsolutePath -}}
{{- printf "%s" .Values.ui.app.apiAbsolutePath -}}
{{- else if .Values.ingress.tls.enabled -}}
{{- printf "https://%s/studio-api" .Values.ingress.host -}}
{{- else -}}
{{- printf "http://%s/studio-api" .Values.ingress.host -}}
{{- end -}}
{{- end -}}

{{- define "apicurio.api.keycloakPath" -}}
{{- if and .Values.ingress.enabled .Values.keycloak.service.name -}}
    {{- if .Values.ingress.tls.enabled -}}
        {{- printf "https://%s%s" .Values.ingress.host .Values.keycloak.url -}}
    {{- else -}}
        {{- printf "http://%s%s" .Values.ingress.host .Values.keycloak.url -}}
    {{- end -}}
{{- else -}}
{{- printf "%s" .Values.keycloak.url -}}
{{- end -}}
{{- end -}}
