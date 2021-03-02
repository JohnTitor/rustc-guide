#!/usr/bin/env bash

set -euo pipefail

# Ensure GitHub doesn't mess around with the uploaded file.
# Without the file, for example, files with an underscore in the name won't be
# included in the pages.
touch "${DEPLOY_DIR}/.nojekyll"

# Copy CNAME file to the deploy dir.
cp CNAME "${DEPLOY_DIR}"

cd "${DEPLOY_DIR}"

# Push the website to GitHub pages
git config user.name "Deploy from CI"
git config user.email ""
git add -f .
git commit -m "Deploy ${GITHUB_SHA} to gh-pages"
git branch --show-current
git show-ref
git push --quiet -f origin HEAD:gh-pages-test
