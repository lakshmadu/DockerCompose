FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS base
WORKDIR /app
EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
WORKDIR /src
COPY ["NoteAPI.Models/NoteAPI.Models.csproj","NoteAPI.Models/"]
COPY ["NoteAPI.DataAccess/NoteAPI.DataAccess.csproj","NoteAPI.DataAccess/"] 
COPY ["NoteAPI/NoteAPI.csproj", "NoteAPI/"]
RUN dotnet restore "NoteAPI/NoteAPI.csproj"
COPY . .
WORKDIR "/src/NoteAPI"
RUN dotnet build "NoteAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NoteAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NoteAPI.dll"]
