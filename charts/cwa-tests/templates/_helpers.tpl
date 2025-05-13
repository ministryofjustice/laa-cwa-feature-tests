{{- define "cwa-tests.setup" -}}
{{- include "cwa-tests.setup.config-map" . }}
{{- include "cwa-tests.setup.pvc" . }}
{{- include "cwa-tests.setup.redis-pvc" . }}
{{- include "cwa-tests.setup.redis-deployment" . }}
{{- include "cwa-tests.setup.redis-service" . }}
{{- include "cwa-tests.setup.redis-setup" . }}
{{- end -}}

{{- define "cwa-tests.run" -}}
{{- include "cwa-tests.setup.config-map" . }}
{{- include "cwa-tests.setup.pvc" . }}
{{- include "cwa-tests.setup.redis-pvc" . }}
{{- include "cwa-tests.setup.redis-deployment" . }}
{{- include "cwa-tests.setup.redis-service" . }}
{{- include "cwa-tests.run.feature-test-runner" . }}
{{- include "cwa-tests.run-screenshots-pvc" . }}
{{- end -}}