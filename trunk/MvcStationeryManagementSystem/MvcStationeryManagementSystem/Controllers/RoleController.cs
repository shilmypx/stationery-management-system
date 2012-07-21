using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class RoleController : Controller
    {
        public ActionResult Rolement()
        {
            RoleModel r = new RoleModel();
            ViewData["Rolemi"] = r.ListRole();
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult UpdateRole(int id)
        {
            RoleModel r = new RoleModel();
            ViewData["ctrole"] = r.ClickRole(id);
            return View("UpdateRole");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcesUpdate(int role,string rname, double Amount)
        {
            RoleModel r1 = new RoleModel();
            r1.UDate(role,rname, Amount);
            ViewData["Rolemi"] = r1.ListRole();
            return RedirectToAction("Rolement");
        }
        //public ActionResult xulycapnhat(int RoleID, decimal Amount)
        //{
        //    RoleModel r = new RoleModel();
        //    r.UDate(RoleID, Amount);
        //    //ViewData["dshdt"] = r.ListRole();
        //    return RedirectToAction("Rolement", "Role");
        //}
      
        
    }
}
