{{/* vim: set filetype=mustache: */}}
{{/*
Kubernetes labels
*/}}
{{- define "common.labels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
{{- end -}}
