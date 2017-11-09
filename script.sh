# Create a new release

echo 'Updating Sentry Project: '${PLUGIN_SENTRY_PROJECT}
echo 'New Release: studiothirty/'${DRONE_REPO_NAME}':'${DRONE_COMMIT_SHA}

curl https://sentry.studiothirty.io/api/0/organizations/studiothirty/releases/ \
  -X POST \
  -H 'Authorization: Bearer '${SENTRY_TOKEN} \
  -H 'Content-Type: application/json' \
  -d '
  {
    "version": "'${DRONE_COMMIT_SHA}'",
    "refs": [{
        "repository":"studiothirty/'${DRONE_REPO_NAME}'",
        "commit":"'${DRONE_COMMIT_SHA}'"
    }],
    "projects":["'${PLUGIN_SENTRY_PROJECT}'"]
}
'
