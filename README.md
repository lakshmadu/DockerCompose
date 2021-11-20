# DockerCompose
Docker compose with class library and mssql image

In this project made with two class libries with single ASP.Net core API. Using this project i made docker image folowing are the steps for make it.

I make docker image for mssql server using this command:- docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" `
   -p 1433:1433 --name sql1 -h sql1 `
   -d mcr.microsoft.com/mssql/server:2019-latest
   
   Here is the link for documantation https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-powershell

I make this docker project using Visual Studio Code.

To make web api - dotnet new webapi -o TodoApi

Link for additional detail:- https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-6.0&tabs=visual-studio-code

To add sln file:- dotnet new  sln

Make class library using terminal:- dotnet new classlib -o [Name for lib]

To add class library to sln file:- dotnet sln add NoteAPI.Models/NoteAPI.Models.csproj // NoteAPI is example api name

To add reference to class libry to API:- dotnet add NodeAPI/NoteAPI.csproj reference NoteAPI.Models/NoteAPI.Models.csproj

To make single image for docker:- docker build -t {DockerID}/{Imagename} .

Move docker file to solution level(if it is created inside API. If not You Should make it in solution file level)

move your docker-compose.yml and docker-compose.debug.yml to solution level (How ever it's working for me:- 
          Because i think we don't make single docker image again. Now we can make docker file using docker-compose up command)
          
          Note that: - if you modify your project code you should delete the image and docker compoers and again run 'docker-composer up command'

modify dockerfile using second link(It is work for me)

              like this -https://imranarshad.com/dockerize-net-core-web-app-with-dependent-class-library/

              https://stackoverflow.com/questions/64557885/how-to-include-class-library-reference-into-docker-file

run command - docker-compose up(You can see the docker composer is made up with docker images)








