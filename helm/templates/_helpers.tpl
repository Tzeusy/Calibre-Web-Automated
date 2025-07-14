{{/* Helm template helpers for naming */}}
{{- define "calibre-web-automated.name" -}}
calibre-web-automated
{{- end -}}

{{- define "calibre-web-automated.fullname" -}}
{{ include "calibre-web-automated.name" . }}
{{- end -}}
