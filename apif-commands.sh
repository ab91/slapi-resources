# APIF Mocking

docker pull quay.io/saucelabs/piestry

docker run --platform linux/amd64 -v "$(pwd)/:/dir" -p 8000:5000 quay.io/saucelabs/piestry -u /dir/openapi-specs/demoapi-openapi.yaml

docker run --platform linux/amd64 -v "$(pwd)/:/dir" -p 8000:5000 quay.io/saucelabs/piestry -u /dir/openapi-specs/demoapi-openapi-x.yaml

curl localhost:8000/api/retail/product

# APIF Contract Testing

docker run --platform linux/amd64 -v "$(pwd)/:/dir" -p 8000:5000 quay.io/saucelabs/piestry -u /dir/openapi-specs/demoapi-openapi.yaml --logger https://$SAUCE_USERNAME:$SAUCE_ACCESS_KEY@api.us-west-1.saucelabs.com/api-testing/rest/v4/$API_WEBHOOK/insights/events/_contract --validate-request

# APIF Load Testing

docker run --platform linux/amd64 --pull always --rm --env SAUCE_URI=wss://api.us-west-1.saucelabs.com/api-testing/ws/v4/loadtesting --env SAUCE_AUTH=$SAUCE_USERNAME:$SAUCE_ACCESS_KEY quay.io/saucelabs/loadtestingjs:latest

# APIF `apifctl`

docker pull quay.io/saucelabs/apifctl

docker run --platform linux/amd64 quay.io/saucelabs/apifctl run -H https://$SAUCE_USERNAME:$SAUCE_ACCESS_KEY@api.us-west-1.saucelabs.com/api-testing/rest/v4/$API_WEBHOOK -i 63054c8f9abb2f1dc2ed35b8

# APIF REST API

https://api.us-west-1.saucelabs.com/api-testing/rest/v4/$API_WEBHOOK/tests/_run-all

# APIF Logger

docker run --platform linux/amd64 -v "$(pwd)/:/dir" -p 8000:5000 quay.io/saucelabs/piestry -u /dir/openapi-specs/demoapi-openapi.yaml --logger https://$SAUCE_USERNAME:$SAUCE_ACCESS_KEY@api.us-west-1.saucelabs.com/api-testing/rest/v4/$API_WEBHOOK/logger