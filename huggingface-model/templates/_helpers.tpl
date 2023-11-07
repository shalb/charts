{{/*
Generate internal container port.
*/}}
{{- define "huggingface-model.containerPort" -}}
{{- if .Values.huggingface }}
{{- default 8080 .Values.huggingface.containerPort  }}
{{- else }}
8080
{{- end }}
{{- end}}
{{- define "common.capabilities.kubeVersion" -}}
{{- if .Values.global }}
    {{- if .Values.global.kubeVersion }}
    {{- .Values.global.kubeVersion -}}
    {{- else }}
    {{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
    {{- end -}}
{{- else }}
{{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
{{- end -}}
{{- end -}}
{{/*
Expand the name of the chart.
*/}}
{{- define "huggingface-model.name" -}}
{{- default (default .Chart.Name .Values.nameOverride) .Values.model.name | trunc 63 | trimSuffix "-" | regexReplaceAll "\\W+" "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "huggingface-model.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := (regexReplaceAll "\\W+" (default (default .Chart.Name .Values.nameOverride) .Values.model.name) "-") | trunc 63 | trimSuffix "-" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "huggingface-model.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "huggingface-model.labels" -}}
helm.sh/chart: {{ include "huggingface-model.chart" . }}
{{ include "huggingface-model.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "huggingface-model.selectorLabels" -}}
app.kubernetes.io/name: {{ include "huggingface-model.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "huggingface-model.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "huggingface-model.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
