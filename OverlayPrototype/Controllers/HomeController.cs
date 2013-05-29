using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace OverlayMVCPrototype.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index ()
		{
			ViewData ["Message"] = "lookserver:";
			return View ();
		}

		public struct RuntimeSearchResults
		{
			public string[] VariableNames;
			public string[] GlobalNames;
		}

		[HttpGet]
		public JsonResult SearchRuntimeFor(string partialName)
		{
			var searchResults = new RuntimeSearchResults();
			searchResults.VariableNames = new string[] { "One", "Two", "Three" };
			searchResults.GlobalNames = new string[] { "Six", "Seven", "Eight" };
			return Json(searchResults, JsonRequestBehavior.AllowGet);
		}
	}
}

