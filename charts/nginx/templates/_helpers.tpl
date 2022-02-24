{{- define "{{ .Chart.Name }}.strategy" }}
{{- with .Values.deploy.strategy }}
{{- if eq .strategy  "RollingUpdate" }}
type: RollingUpdate
rollingUpdate:
    maxSurge: {{ .rollingUpdate.maxSurge }}
    maxUnavailable: {{ .rollingUpdate.maxUnavailable }}
{{- else }}
type: Recreate
{{- end }}
{{- end }}
{{- end }}

{{- define "{{ .Chart.Name }}.serviceType" }}
{{- with .Values.service }}
{{- if .type }}
{{- if  or (eq .type "NodePort") (eq .type "LoadBalancer") }}
nodePort: {{ .nodePort }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}