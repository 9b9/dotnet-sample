# get base imgae for build dotnet core app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY /src/Sample/*.csproj ./src/Sample/
COPY /test/SampleTests/*.csproj ./test/SampleTests/
COPY *.sln ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out

# run unit tests
RUN dotnet test