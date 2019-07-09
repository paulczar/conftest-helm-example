package main

podTemplateKinds = ["Deployment","StatefulSet","ReplicationController","DaemonSet","ReplicaSet"]

check_labels(obj, key) {
  obj[key]
}

list_has_value(list, val) {
  element := list[_]
  element == val
}

has_pod_template(kind) {
  list_has_value(podTemplateKinds, kind)
}