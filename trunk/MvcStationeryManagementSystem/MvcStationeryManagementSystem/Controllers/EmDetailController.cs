using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class EmDetailController : Controller
    {
        //
        // GET: /EmDetail/
        DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();
        public ActionResult Emdetail()
        {
            Employee e = (Employee)Session["Employee"];
            ViewData["role"] = dc.Roles.Where(r => r.RoleId == e.RoleId).First();

            return View();
        }

    }
}
