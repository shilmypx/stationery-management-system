using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class ChangePasswordsController : Controller
    {
      
        private ChangePasswordsModel em = new ChangePasswordsModel();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChangePasswords()
        {
            return View("ChangePasswords");
        }       
    }
}
