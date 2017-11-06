Write-Host "Setting version"

if("$(git status --porcelain --untracked-files=no)" -ne ""){
    $global:DIRTY="-dirty"
}
$global:COMMIT="$(git rev-parse --short HEAD)"
$global:GIT_TAG="$(git tag -l --contains HEAD | select -First 1)"
if ( "$DIRTY" -eq "" -and "$GIT_TAG" -ne "" ) {
    $global:VERSION=$GIT_TAG
    $global:IMAGE_VERSION=${VERSION}
}
else{
    $global:VERSION="${COMMIT}${DIRTY}"
    $global:IMAGE_VERSION="dev"
}

if ( "$ARCH" -eq "" ) {
    $global:ARCH="amd64"
}