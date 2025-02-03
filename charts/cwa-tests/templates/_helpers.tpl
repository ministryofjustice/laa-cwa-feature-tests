{{- define "cwa-tests.setup" -}}
{{- include "templates/setup/config-map.yaml" . }}
{{- include "templates/setup/pvc.yaml" . }}
{{- include "templates/setup/redis-deployment.yaml" . }}
{{- include "templates/setup/redis-service.yaml" . }}
{{- include "templates/setup/redis-setup.yaml" . }}
{{- end -}}

{{- define "cwa-tests.run" -}}
{{- include "templates/run/pod.yaml" . }}
{{- end -}}