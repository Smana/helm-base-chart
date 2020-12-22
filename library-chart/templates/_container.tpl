
{{- define "common.container.tpl" -}}
{{- $ := get . "top" | default $ -}}
{{- $image := .image }}
name: {{ include "common.names.name" $ }}
image: "{{ $image.repository }}:{{ $image.tag }}"
imagePullPolicy: {{ $image.pullPolicy }}
ports: []
resources: {}
livenessProbe: {}
readinessProbe: {}
{{- end -}}

{{/*
Return a container template
{{ include "common.container" ( dict "top" $ "image" .Values.testImage "overrides" "test-chart1.container" ) }}
*/}}
{{- define "common.container" -}}
{{- /* clear new line so indentation works correctly */ -}}
{{- println "" -}}
{{- $ := get . "top" | default $ -}}
{{- $ctx := deepCopy . }}
{{- $ctx := set $ctx "default" "common.container.tpl" }}
{{- $ctx := set $ctx "overrides" .overrides }}
{{- include "common.util.mergeMap" $ctx -}}
{{- end -}}