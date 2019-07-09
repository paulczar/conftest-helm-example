package main

required_labels = ["app.kubernetes.io/name", "helm.sh/chart", "app.kubernetes.io/managed-by","app.kubernetes.io/instance"]
optional_labels = ["app.kubernetes.io/version", "app.kubernetes.io/component", "app.kubernetes.io/part-of"]

deny[msg] {
  kind = input.kind
  name = input.metadata.name
  label := required_labels[_]
  not check_labels(input.metadata.labels, label)
  msg = sprintf("%s/%s must contain label %s", [kind,name,label])
}

warn[msg] {
  kind = input.kind
  name = input.metadata.name
  label := optional_labels[_]
  not check_labels(input.metadata.labels, label)
  msg = sprintf("%s/%s should contain label %s", [kind,name,label])
}
