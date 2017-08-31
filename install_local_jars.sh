#!/usr/bin/env bash

set -e
set -o pipefail

source ./version_tag.sh

echo "Starting local jar install"

echo "Delete Existing heron jars"

rm -rf $HOME/.m2/repository/com/twitter/heron

echo "Get Version Tag"

VERSION_TAG=$(getVersionTag)

echo "Found Version Tag $VERSION_TAG"

echo "Install Jars ..."

echo "Install Heron Api"

mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG.jar
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG-sources.jar -Dclassifier=sources
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-api/heron-api-$VERSION_TAG-javadoc.jar -Dclassifier=javadoc

echo "Install Heron Spi"

mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG.jar
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG-sources.jar -Dclassifier=sources
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-spi/heron-spi-$VERSION_TAG-javadoc.jar -Dclassifier=javadoc

echo "Install Heron Storm"

mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG.jar
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG-sources.jar -Dclassifier=sources
mvn install:install-file -DpomFile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG.pom -Dfile=./jar_release_bundle/$VERSION_TAG/heron-storm/heron-storm-$VERSION_TAG-javadoc.jar -Dclassifier=javadoc

echo "Finish Jars ..."