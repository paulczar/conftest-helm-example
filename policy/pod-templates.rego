# podTemplates should have specific matchLabel selectors.
# https://github.com/helm/helm/blob/master/docs/chart_best_practices/pods.md#podtemplates-should-declare-selectors

package main

selectors = ["app.kubernetes.io/name", "app.kubernetes.io/instance"]

deny[msg] {
  kind = input.kind
  name = input.metadata.name
  label := selectors[_]
  not check_labels(input.spec.selector.matchLabels, label)
  has_pod_template(kind)
  msg = sprintf("%s/%s must have spec.selector.matchLabels.%s", [kind,name,label])
}

deny[msg] {
  kind = input.kind
  name = input.metadata.name
  label := selectors[_]
  not check_labels(input.spec.template.metadata.labels, label)
  has_pod_template(kind)
  msg = sprintf("%s/%s must have spec.selector.matchLabels.%s", [kind,name,label])
}