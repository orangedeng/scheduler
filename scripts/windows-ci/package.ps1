Write-Host "Packaging"

Invoke-Expression $PSScriptRoot/version

cd $PSScriptRoot/../../package
$SUFFIX="_windows"
if ("$TAG" -eq ""){
    $TAG="${IMAGE_VERSION}${SUFFIX}"
}
if ("$REPO" -eq ""){
    $REPO="rancher"
}
if ( -not (Test-Path ../bin/scheduler.exe) ){
    Invoke-Expression $PSScriptRoot/build
}
cp ../bin/scheduler.exe .
$IMAGE="${REPO}/scheduler:${TAG}"
docker build -f Dockerfile.windows -t ${IMAGE} .
mkdir -p ../dist
echo ${IMAGE} > ../dist/images
echo Built ${IMAGE}
