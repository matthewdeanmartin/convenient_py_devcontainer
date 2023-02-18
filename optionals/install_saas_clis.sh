#!/usr/bin/env bash
# Various SaaS CLIs that will just take up space if you're not using them.

# Gitlab CLI
curl https://gitlab.com/gitlab-org/cli/-/releases/v1.24.1/downloads/glab_1.24.1_Linux_x86_64.deb  \
    --output glab.deb --location && apt-get install ./glab.deb -y -q && rm glab.deb

# Jira CLI
curl https://github.com/ankitpokhrel/jira-cli/releases/download/v1.3.0/jira_1.3.0_linux_x86_64.tar.gz \
    --location | tar -xz --touch && mv jira_1.3.0_linux_x86_64/bin/jira /usr/bin

# Sentry CLI, not pinned may need to pin the the really old version we have.
curl -sL https://sentry.io/get-cli/ | bash