---
name: gitlab-ci
description: Load this skill when I am editing files .gitlab-ci.yml
---

# SKILL

try using to be continuous recipes.
Example for sonarqube or gitleaks :
```yaml
include:
    # Detect secrets in git repo
    # see : https://gitlab.com/to-be-continuous/gitleaks
    - project: 'to-be-continuous/gitleaks'
      ref: '2.10.0'
      file: '/templates/gitlab-ci-gitleaks.yml'

    # sonarQube static analysis using to-be-continuous template (run on test stage).
    # See also group CI/CD variables SONAR_HOST_URL, SONAR_TOKEN and sonar-project.properties at project's root
    - component: $CI_SERVER_FQDN/to-be-continuous/sonar/gitlab-ci-sonar@4.3.1
      inputs:
          host-url: https://sqaas.dos.tech.orange

stages:
    - install
    - test
    - report
    - build
    - deploy

# overload to-be-continuous sonar job : force sonar job to start after tests (to have code coverage artifact)
sonar:
    stage: report
    needs:
        - tests

gitleaks:
    stage: report
    allow_failure: true # FIXME temporary allow failure to let the team fix existing secrets in the codebase without breaking the pipeline. To be set to false once all secrets are fixed.
    needs: []

```

Try using needs, especially when no need : `needs: []` as this will speed up pipeline by allowing earlier start of jobs.


