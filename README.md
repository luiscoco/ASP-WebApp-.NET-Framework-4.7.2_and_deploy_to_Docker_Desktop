# How to create my first ASP WebApp .NET Framework 7.2

## 1. Run Visual Studio and create the WebApp

We run Visual Studio 2022 Community Edition and we create a new project

We select the project template

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/66a42969-3cdb-42a1-b6ed-adf974f5d8d9)

We input the location and the project name

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/83e3097a-c322-4bb8-b499-7fb48cbf78c8)

We chose the new project main features

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/9dff42cd-5778-413e-aef1-cd28a8dbb981)

## 2. Project folder structure and main files description

### 2.1. Default Folder Structure

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/fd781122-ebaa-4aa4-9bb0-e1c64e736d2e)

**App_Data**

Used to store application data files like local databases, XML files, etc. 

It's a secure folder that is not accessible directly via URLs.

**App_Start**

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/e3a4eaa7-b4ad-4c4e-9ec0-19f899d70330)

Contains class files which are executed at application start. 

Common files include **RouteConfig.cs** for routing configuration, **BundleConfig.cs** for bundling and minification of CSS and JS files, etc.

**Content**

Houses **CSS** files and other static content like **images**.

**Controllers**

Contains Controller classes. 

Controllers respond to HTTP requests and execute appropriate actions.

**Models**

Contains classes representing data models. 

These models often correspond to database tables.

**Scripts**

Stores JavaScript files and libraries, such as jQuery, Bootstrap JS, etc.

**Views**

![image](https://github.com/luiscoco/ASP-WebApp-.NET-Framework-7.2/assets/32194879/3736745e-65b6-41ff-ad43-b3675201d0fa)

Holds the Razor view files for the application. It's typically structured into subfolders corresponding to the controllers.

**_ViewStart.cshtml** - Contains common view settings; executed before the rendering of each view.

**_Layout.cshtml** - Common layout file (like a template) used by other views.

**Fonts**

(Optional) For custom fonts used in your application.

**bin**

Contains the compiled assemblies (DLLs) including your application’s code.

### 2.2. Main Files

**Global.asax**

Allows you to write code that responds to system-level events, such as application start and end.

**Web.config**

The main configuration file for the application. It includes settings for databases, security configurations, custom error pages, etc.

**Package.config**

Lists the NuGet packages used in the project.

Other Files and Folders

**Properties**

Contains the AssemblyInfo.cs file which includes metadata like version number, company name, etc.

**.csproj** file

The project file which includes references to all the other files and folders in your project. It's used by Visual Studio to build your application.

**Solution (.sln)** file

If your application is part of a larger solution, this file ties together the various projects.

## 3. Workflow after running the WebApp

This is the workflow summary:

**Global.asax** -> **App_Start/RouterConfig.cs** -> **https://localhost:44327/Home/Index** -> Call Index action inside the Home controller **Controllers/HomeController.cs** -> Call Home view (**Views/Home/Index.cshtml**) -> the Index.cshtl view is Rendered inside the **Views/Shared/_Layout.cshtml** as defined in _ViewStart.cshtml

### 3.1. When we run the application the first file we start is **Global.asax**

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace WebApplication1
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
```

The **Application_Start** method is a special method in ASP.NET. 

**It is automatically called by the framework when the web application starts**. 

This method is typically used to perform application-level **initializations**, such as configuring routes, filters, and bundles:

**AreaRegistration.RegisterAllAreas()**

This line registers all areas in the application. Areas are an ASP.NET MVC feature that helps organize a large application into smaller functional groupings.

**FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters)**

This line registers global filters. Filters in ASP.NET MVC can be used for cross-cutting concerns like logging, exception handling, and authorization. 

Global filters are applied to all controllers and actions.

**RouteConfig.RegisterRoutes(RouteTable.Routes)**

This configures the URL routing for the application. Routing is how ASP.NET MVC matches a URI to an action method in a controller. 

RegisterRoutes method sets up the routes that the application recognizes.

**BundleConfig.RegisterBundles(BundleTable.Bundles)**

This registers bundles for JavaScript and CSS files. 

Bundling and minification are features that help improve request load time by reducing the number of requests to the server and reducing the size of requested assets (like CSS and JavaScript).

Overall, this MvcApplication class is central to setting up important aspects of the ASP.NET MVC web application when it starts, ensuring that areas, filters, routes, and bundles are all registered and ready to use.

### 3.2. The Global.asax calls the App_Start/RouterConfig.cs file

In this file we configure the default entry point in my web application. 

In this case we call the Index action inside the Home controller

This is the web application entry point: https://localhost:44327/Home/Index

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApplication1
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
```

### 3.3. The WebApp default entry point automatically calls the Controllers/HomeController.cs file

When the application starts with the default route: https://localhost:44327/Home/Index

automatically the Index action inside the Home controller is invoked

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
```

### 3.4. The Index action inside the HomeController calls the Views/Home/Index.cshtml view

```html
@{
    ViewBag.Title = "Home Page";
}

<main>
    <section class="row" aria-labelledby="aspnetTitle">
        <h1 id="title">ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="https://asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
    </section>

    <div class="row">
        <section class="col-md-4" aria-labelledby="gettingStartedTitle">
            <h2 id="gettingStartedTitle">Getting started</h2>
            <p>
                ASP.NET MVC gives you a powerful, patterns-based way to build dynamic websites that
                enables a clean separation of concerns and gives you full control over markup
                for enjoyable, agile development.
            </p>
            <p><a class="btn btn-outline-dark" href="https://go.microsoft.com/fwlink/?LinkId=301865">Learn more &raquo;</a></p>
        </section>
        <section class="col-md-4" aria-labelledby="librariesTitle">
            <h2 id="librariesTitle">Get more libraries</h2>
            <p>NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.</p>
            <p><a class="btn btn-outline-dark" href="https://go.microsoft.com/fwlink/?LinkId=301866">Learn more &raquo;</a></p>
        </section>
        <section class="col-md-4" aria-labelledby="hostingTitle">
            <h2 id="hostingTitle">Web Hosting</h2>
            <p>You can easily find a web hosting company that offers the right mix of features and price for your applications.</p>
            <p><a class="btn btn-outline-dark" href="https://go.microsoft.com/fwlink/?LinkId=301867">Learn more &raquo;</a></p>
        </section>
    </div>
</main>
```

### 3.5. The Views/Home/Index.cshtml view is rendered inside the Views/Shared/_Layout.cshtml view

```
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@ViewBag.Title - My ASP.NET Application</title>
    @Styles.Render("~/Content/css")
    @Scripts.Render("~/bundles/modernizr")
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            @Html.ActionLink("Application name", "Index", "Home", new { area = "" }, new { @class = "navbar-brand" })
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li>@Html.ActionLink("Home", "Index", "Home", new { area = "" }, new { @class = "nav-link" })</li>
                    <li>@Html.ActionLink("About", "About", "Home", new { area = "" }, new { @class = "nav-link" })</li>
                    <li>@Html.ActionLink("Contact", "Contact", "Home", new { area = "" }, new { @class = "nav-link" })</li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container body-content">
        @RenderBody()
        <hr />
        <footer>
            <p>&copy; @DateTime.Now.Year - My ASP.NET Application</p>
        </footer>
    </div>

    @Scripts.Render("~/bundles/jquery")
    @Scripts.Render("~/bundles/bootstrap")
    @RenderSection("scripts", required: false)
</body>
</html>
```
