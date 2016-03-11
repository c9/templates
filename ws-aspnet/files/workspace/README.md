# ASP.NET Cloud9 Template

You'll find 4 sample applications within this image
- ConsoleApplication
- WebApiApplication
- WebApplication
- WebBasicApplication

All applications have their own runners and can be executed from the top "Run" menu by rigght-clicking on it

If you run any of WebApplications, you'll be able to browse it by clicking "Preview" in top menu
Since only port 8080 is available, you can run only one web application at a time

To create new appication, you can use **yo** command in your bash command line interface:
```sh
$ yo aspnet
```
The tool will ask you to chose project template and type it name.
New folder will be created with the project.

For those who are not very familiar with how asp.net works, you can now go into the folder of the newly created application and use following commands:
```sh
$ dnu restore
```
Which will install all necessary dependencies

And run it with
```sh
$ dnx run
```
For console application, or
```sh
$ dnx web
```
For web applications

However, for web application to listen on correct port, you'll have to create hosting.json file with following content:
```sh
{
    "server.urls": "http://0.0.0.0:8080"
}
```

Hope it serve you well ;)


