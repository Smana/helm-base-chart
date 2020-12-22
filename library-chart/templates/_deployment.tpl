{{- define "common.deployment.tpl" -}}
{{- $ := get . "top" | default $ -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  labels: {{- include "common.labels" $ | nindent 4 }}
spec:
  template:
    metadata:
      labels: {{- include "common.labels" $ | nindent 8 }}
    spec:
      containers: []
{{- end -}}

{{/*
Return a deployment template
{{ include "common.deployment" ( dict "top" $ "overrides" "foobar.deployment" ) }}
*/}}
{{- define "common.deployment" -}}
{{- $ := get . "top" | default $ -}}
{{- $ctx := deepCopy . }}
{{- $ctx := set $ctx "default" "common.deployment.tpl" }}
{{- $ctx := set $ctx "overrides" .overrides }}
{{- include "common.util.mergeMap" $ctx -}}
{{- end -}}