# Create a new release

echo "Updating Sentry Project: ${PROJECT_NAME}"
echo "New Release: ${MAINTAINER_NAME}/${REPO_NAME}: ${VERSION}"

curl ${SENTRY_BASE_URL}/api/0/organizations/${SENTRY_ORG_ALIAS}/releases/ \
  -X POST \
  -H "Authorization: Bearer ${SENTRY_API_RELEASE_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "
  {
    \"version\": \"${VERSION}\",
    \"refs\": [{
        \"repository\":\"${MAINTAINER_NAME}/${REPO_NAME}\",
        \"commit\":\"${COMMIT_SHA}\"
    }],
    \"projects\":[\"${PROJECT_ALIAS}\"]
}
" | python -m json.tool
