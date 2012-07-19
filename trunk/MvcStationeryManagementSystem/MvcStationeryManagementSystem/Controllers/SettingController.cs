using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;
namespace MvcStationeryManagementSystem.Controllers
{
    public class SettingController : Controller
    {
        //
        // GET: /Setting/
        private DataClassesStationeryDataContext dc=new DataClassesStationeryDataContext();
        public ActionResult Setting()
        {
            ViewData["st"] = dc.Configs.ToList();
            return View();
        }

    }
}
