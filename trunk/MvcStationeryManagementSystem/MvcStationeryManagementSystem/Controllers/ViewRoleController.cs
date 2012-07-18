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
            return View("ViewRole");
        }

        [HttpPost]
        public ActionResult ViewRole(string id, int role)
        {
            ViewRoleModel vrd = new ViewRoleModel();
            Employee eml = (Employee)Session["Employee"];
            //if (eml.RoleId.Equals(id))
            //{
                ViewData["roleid"] = id;
                ViewData["data"] = vrd.ro(Convert.ToInt32(eml.RoleId));
           // } 
            Role r = vrd.ro(Convert.ToInt32(eml.RoleId));
            Response.Write(Convert.ToString(r.RoleName));
                return null;
        }

        //lay gia tri role name + amount



    }
}
