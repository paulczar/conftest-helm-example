# pods and pod templates should contain images

# podTemplates should have specific matchLabel selectors.
# https://github.com/helm/helm/blob/master/docs/chart_best_practices/pods.md#podtemplates-should-declare-selectors

package main

# Check that images contain tags
deny[msg] {
  kind = input.kind
  name = input.metadata.name
  has_pod_template(kind)
  image = input.spec.template.spec.containers[_].image
  not contains(image,":")
  msg = sprintf("%s/%s must specify a container image tag (%s)", [kind,name,image])
}
deny[msg] {
  kind = "Pod"
  name = input.metadata.name
  image = input.spec.containers[_].image
  not contains(image,":")
  msg = sprintf("%s/%s must specify a container image tag (%s)", [kind,name,image])
}

# Check that images don't use latest tag
warn[msg] {
  kind = input.kind
  name = input.metadata.name
  has_pod_template(kind)
  image = input.spec.template.spec.containers[_].image
  endswith(image,"latest")
  msg = sprintf("%s/%s shouldn't use latest image tag (%s)", [kind,name,image])
}
warn[msg] {
  kind = "Pod"
  name = input.metadata.name
  image = input.spec.containers[_].image
  endswith(image,"latest")
  msg = sprintf("%s/%s shouldn't use latest image tag (%s)", [kind,name,image])
}
