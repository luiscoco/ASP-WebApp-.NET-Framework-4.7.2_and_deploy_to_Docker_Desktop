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


## 3. Workflow after running the WebApp

When we run the application the first file we start is **Global.asax**

```
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
