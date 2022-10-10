# Set environment variables stage
# Write your script here ...

# Set $wincore parameter

$env:VERSION_MAJOR = "1"
$env:VERSION_MINOR = "0"
$env:VERSION_PATCH = "0"

$env:PROJECT_NAME = "9b9/dotnet-sample"
$env:IMAGE_NAME = "$env:PROJECT_NAME"

$env:LOCAL_IMAGE_NAME_BUILD_TAG = "${env:PROJECT_NAME}.local.build.env:build"
$env:LOCAL_IMAGE_NAME_TEST_TAG = "${env:PROJECT_NAME}.local.build.env:test"

$env:RELEASE_VER = "$env:VERSION_MAJOR.$env:VERSION_MINOR.$env:VERSION_PATCH"