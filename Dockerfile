FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

RUN dotnet restore

# Build and publish a release
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "GloComX.csproj.dll"]
