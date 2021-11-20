# DockerCompose
Docker compose with class library and mssql image

to add sln file:- dotnet new  sln

Make class library using terminal

:- dotnet new classlib -o [Name for lib]

to add class library to sln file:- dotnet sln add NoteAPI.Models/NoteAPI.Models.csproj

to add reference to class libry to API:- dotnet add NodeAPI/NoteAPI.csproj reference NoteAPI.Models/NoteAPI.Models.csproj


move docker file to outside of project

modify dockerfile

like this -https://imranarshad.com/dockerize-net-core-web-app-with-dependent-class-library/

run command - docker-compose up





