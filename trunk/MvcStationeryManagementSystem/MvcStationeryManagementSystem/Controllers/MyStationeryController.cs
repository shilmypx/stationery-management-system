using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcStationeryManagementSystem.Controllers
{
    public class MyStationeryController : Controller
    {
        //
        // GET: /MyStationery/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MyStationery()
        {
            return View("MyStationery");
        }

    }
}
