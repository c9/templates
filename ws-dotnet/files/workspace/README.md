     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--,
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    -----------------------------------------------------------------


Hi there! Welcome to Cloud9 IDE! This is the template for .NET Core!

You'll find 4 sample applications within this image
- ConsoleApplicationCS (CSharp)
- ConsoleApplicationFS (FSharp)
- WebApp


All applications have their own runners and can be executed from the top "Run" menu by right-clicking on it

If you run any of WebApplications, you'll be able to browse it by clicking "Preview" in top menu
Since only port 8080 is available, you can run only one web application at a time

To create new a new application, you can use **yo** command in your bash command line interface:

```sh
$ yo aspnet
```
The tool will ask you to chose project template and type it name.
New folder will be created with the project.

For those who are not very familiar with how .NET Core works, you can now go into the folder of the newly created application and use following commands:

```sh
$ dotnet restore
```
Which will install all necessary dependencies

And run it with

```sh
$ dotnet run
```

However, for web application to listen on correct port, you'll have to create hosting.json file with following content:

```sh
{
    "server.urls": "http://0.0.0.0:8080"
}
```

You can also add in a `.UseUrls("http://0.0.0.0:3000")` right below `.UseStartup<Startup>()` in your program.cs of the ASP.NET program to set the port.


To create an f# console application, you have to create it with
```sh
$ dotnet new --lang f#
```