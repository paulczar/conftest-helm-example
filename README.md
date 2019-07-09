# conftest for helm charts

A quick demo showing how you can apply helm chart best practices into tests that can be
run by conftest.

conftest [here](https://github.com/instrumenta/conftest)


```bash
   Pod/release-name-test-test-connection must specify a container image tag (busybox)
   Service/release-name-test should contain label app.kubernetes.io/component
   Service/release-name-test should contain label app.kubernetes.io/part-of
   Pod/release-name-test-test-connection should contain label app.kubernetes.io/component
   Pod/release-name-test-test-connection should contain label app.kubernetes.io/part-of
   Deployment/release-name-test shouldn't use latest image tag (nginx:latest)
   Deployment/release-name-test should contain label app.kubernetes.io/component
   Deployment/release-name-test should contain label app.kubernetes.io/part-of

$ helm template . | conftest test -

```
