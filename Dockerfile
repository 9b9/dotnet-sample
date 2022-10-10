ARG TEST_RESULT_DIR=TestResults

# get base imgae for build dotnet core app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base-dev-env
WORKDIR /source

# copy csproj and restore as distinct layers
COPY /src/Sample/*.csproj ./src/Sample/
COPY /test/SampleTests/*.csproj ./test/SampleTests/
COPY *.sln ./
RUN dotnet restore

# ========== BUILD STAGE ==========
FROM base-dev-env AS build

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out

# ========== TEST STAGE ==========
FROM build AS test
ARG TEST_RESULT_DIR

# run unit tests
RUN dotnet test --no-restore --logger:trx --results-directory:%TEST_RESULT_DIR%;