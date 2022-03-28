#!/bin/bash
printf "Setting up Selfie SDK. \n"

set -a; source .env; set +a

# if no fixed selfie capture version, grab latest from jFrog
[[ $SELFIE_CAPTURE_VERSION ]] && LATEST_BINARY_URL=$SELFIE_CAPTURE_VERSION || LATEST_BINARY_URL="$(curl -u ""$ARTIFACTORY_USERNAME":"$ARTIFACTORY_PASSWORD"" https://truliooaws.jfrog.io/artifactory/generic-gg-tech-release-local/gg-sc-html-sdk/latest.txt)"
curl -L -u ""$ARTIFACTORY_USERNAME":"$ARTIFACTORY_PASSWORD"" $LATEST_BINARY_URL -o "GlobalGatewayPackage.zip"
unzip -q GlobalGatewayPackage.zip -d GlobalGatewayPackage
mkdir -p ./public/GlobalGatewayCapturePublicAcuant/GlobalGatewayFaceCapturePublic
cp -R ./GlobalGatewayPackage/public/GlobalGatewayFaceCapturePublic/ ./public/GlobalGatewayCapturePublicAcuant
rm -rf GlobalGatewayPackage
rm -f GlobalGatewayPackage.zip
