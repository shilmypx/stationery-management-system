using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class ViewRoleController : Controller
    {
        //
        // GET: /ViewRole/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewRole()
        {
            return View("ViewRole");
        }

    }
}
