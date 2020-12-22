{{/*
Return a certificate template
{{ include "common.certificate.tpl" ( dict top $ "certificate" .Values.certificate }}
*/}}
{{- define "common.certificate.tpl" -}}
{{- $ := get . "top" | default $ -}}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  labels: {{- include "common.labels" $ | nindent 4 }}
  name: {{ include "common.names.name" $ }}
spec:
{{- $dnsName := .certificate.dnsName }}
{{- $issuerName := .certificate.issuerName }}
{{- $issuerType := "ClusterIssuer" }}
{{- if .certificate.issuerType }}
  {{- $issuerType = .certificate.issuerType -}}
{{- end }}
  commonName: {{ $dnsName }}
  dnsNames:
  - {{ $dnsName }}
  duration: {{ default "120h" .certificate.duration }}
  issuerRef:
    kind: {{ $issuerType }}
    name: {{ $issuerName }}
  renewBefore: {{ default "70h" .certificate.renewBefore }}
  secretName: {{ $dnsName | replace "." "-" }}
{{- end -}}