
using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OverlayPrototype
{
	public class Global : System.Web.HttpApplication
	{
	
		public static void RegisterRoutes (RouteCollection routes)
		{
			routes.IgnoreRoute ("{resource}.axd/{*pathInfo}");
			
			routes.MapRoute (
				"Default",
				"{controller}/{action}/{id}",
				new { controller = "Home", action = "Index", id = "" }
			);
			
		}

		protected virtual void Application_Start (Object sender, EventArgs e)
		{
			AreaRegistration.RegisterAllAreas ();
			RegisterRoutes (RouteTable.Routes);
		}
		
		protected virtual void Session_Start (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Application_BeginRequest (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Application_EndRequest (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Application_AuthenticateRequest (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Application_Error (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Session_End (Object sender, EventArgs e)
		{
		}
		
		protected virtual void Application_End (Object sender, EventArgs e)
		{
		}
	}
}

