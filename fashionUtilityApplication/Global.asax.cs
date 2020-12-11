﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using fashionUtilityApplication.Models;
using fashionUtilityApplication.Logic;

namespace fashionUtilityApplication
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Initialize the product database.
            Database.SetInitializer(new ProductDatabaseInitializer());

            // Create the custom role and user.
            RoleActions roleActions = new RoleActions();
           // roleActions.AddUserAndRole();

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);
        }
        protected void Application_BeginRequest()
        {
            Response.AddHeader("X-Frame-Options", "SAMEORIGIN");
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs.

            // Get last error from the server
            Exception exc = Server.GetLastError();

            if (exc is HttpUnhandledException)
            {
                if (exc.InnerException != null)
                {
                    exc = new Exception(exc.InnerException.Message);
                    Server.Transfer("ErrorPage.aspx?handler=Application_Error%20-%20Global.asax",
                        true);
                }
            }
        }
        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "ProductsByCategoryRoute",
                "Category/{categoryID}",
                "~/ProductList.aspx"
            );
            routes.MapPageRoute(
                "ProductByNameRoute",
                "Product/{productID}",
                "~/ProductDetails.aspx"
            );
        }
    }
}