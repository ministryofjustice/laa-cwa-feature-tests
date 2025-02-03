{{- define "cwa-tests.setup" -}}
{{- include "cwa-tests.setup.config-map" . }}
{{- include "cwa-tests.setup.redis-pvc" . }}
{{- include "cwa-tests.setup.redis-deployment" . }}
{{- include "cwa-tests.setup.redis-service" . }}
{{- end -}}

{{- define "cwa-tests.run" -}}
{{- include "cwa-tests.run.pod" . }}
{{- end -}}