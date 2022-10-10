# Tests stage
# Write your script here ...

param (
    [string]$testRestultDir = "TestResults"
)

if (-not (Test-Path env:LOCAL_IMAGE_NAME_BUILD_TAG)) { $env:LOCAL_IMAGE_NAME_BUILD_TAG = "9b9/dotnet-sample:build" }
if (-not (Test-Path env:LOCAL_IMAGE_NAME_TEST_TAG)) { $env:LOCAL_IMAGE_NAME_TEST_TAG = "9b9/dotnet-sample:test" }

if (Test-Path -Path $testRestultDir) {
    Remove-Item "$testRestultDir\\*.trx" -Recurse -Force
}

docker build `
    --cache-from $env:LOCAL_IMAGE_NAME_BUILD_TAG `
    --cache-from $env:LOCAL_IMAGE_NAME_TEST_TAG `
    --target test `
    --build-arg RELEASE_VER=$env:RELEASE_VER `
    --build-arg TEST_RESULT_DIR=$testRestultDir `
    -t $env:LOCAL_IMAGE_NAME_TEST_TAG `
    .

$tempContainerName = docker create `
    $env:LOCAL_IMAGE_NAME_TEST_TAG

try
{
    docker cp `
        ${tempContainerName}:c:\source\${testRestultDir} `
        .
}
finally
{
    docker rm $tempContainerName
}