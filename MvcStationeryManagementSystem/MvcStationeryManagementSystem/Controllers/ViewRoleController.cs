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
        [HttpGet]
        public ActionResult ViewRole()
        {
            ViewRoleModel vrd = new ViewRoleModel();
            Employee eml = (Employee)Session["Employee"];

          
            ViewData["data"] = vrd.ro(Convert.ToInt32(eml.RoleId));

            Role r = vrd.ro(Convert.ToInt32(eml.RoleId));            
            return View("ViewRole");
        }

        
        public ActionResult ViewRole(string id, int role)
        {
            return null;
        }

        


    }
}
