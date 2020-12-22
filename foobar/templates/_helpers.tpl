{{/*
Return the proper image name
*/}}
{{- define "test.testImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.testImage "global" .Values.global ) -}}
{{- end -}}