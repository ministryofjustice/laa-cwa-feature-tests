{{- define "cwa-tests.setup" -}}
{{- include "setup/config-map.yaml" . }}
{{- include "setup/pvc.yaml" . }}
{{- include "setup/redis-deployment.yaml" . }}
{{- include "setup/redis-service.yaml" . }}
{{- include "setup/redis-setup.yaml" . }}
{{- end -}}

{{- define "cwa-tests.run" -}}
{{- include "run/pod.yaml" . }}
{{- end -}}