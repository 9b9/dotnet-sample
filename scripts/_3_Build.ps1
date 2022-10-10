# Build stage
# Write your script here ...

Write-Host Build bap

if (-not (Test-Path env:LOCAL_IMAGE_NAME_BUILD_TAG)) { $env:LOCAL_IMAGE_NAME_BUILD_TAG = "9b9/dotnet-sample:build" }

docker build `
    --target build `
    --cache-from $env:LOCAL_IMAGE_NAME_BUILD_TAG `
    --build-arg RELEASE_VER=$env:RELEASE_VER `
    -t $env:LOCAL_IMAGE_NAME_BUILD_TAG `
    .