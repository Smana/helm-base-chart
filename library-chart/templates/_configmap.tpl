{{- define "common.configmap.tpl" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  labels: {{- include "common.labels" . | nindent 4 }}
data: {}
{{- end -}}

{{- define "common.configmap" -}}
{{- include "common.util.merge" (append . "common.configmap.tpl") -}}
{{- end -}}