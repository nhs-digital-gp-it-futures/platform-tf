#!/bin/bash
set -e

#branchName=git rev-parse --abbrev-ref HEAD
branchName=feature/7977-build-pipeline-for-tf

if [[ "$branchName" == master ]]; then
    echo "master"
    release=$("dummy")
    # Do Nothing
    #namespace=$(echo "bc-$BUILD_SOURCEBRANCHNAME-$SYSTEM_PULLREQUEST_PULLREQUESTNUMBER" | sed 's/[[:punct:]]/-/g')
elif [[ "$branchName" == feature* ]]; then
    echo "feature branch"
    release=$(echo "${branchName%%-*}" | sed 's!/!-!g')
else
    echo "unknown branch"
    return 1
fi

echo "release=$release"
#echo "##vso[task.setvariable variable=Namespace;isOutput=true]$namespace"