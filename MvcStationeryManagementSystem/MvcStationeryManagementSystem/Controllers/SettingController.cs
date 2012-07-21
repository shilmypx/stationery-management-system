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
        private ConfigModel se = new ConfigModel();
        public ActionResult Setting()
        {
            ViewData["st"] = dc.Configs.OrderByDescending(o=>o.BuildDate).ToList();
            return View();
        }
        public ActionResult AddConfig()
        {
            return View();
        }

        public ActionResult InsertSet(string mailname, string mailnetwork, string password, string ports, string type, string description)
        {
            
            se.AddConfig(mailname, mailnetwork, mahoa_giaima.maHoa(password), ports, type, DateTime.Now, description);
            return RedirectToAction("Setting");
        }

        public ActionResult EditSet(int id)
        {
            ViewData["infomation"] = se.InfoSet(id);
            return View();
        }

        public ActionResult EditSetting(int id, string mailname, string mailnetwork, string ports, string type, string description)
        {
            se.Edit(id, mailname, mailnetwork, ports, type, DateTime.Now, description);
            return RedirectToAction("Setting");
        }

        public ActionResult Details(int id)
        {
            ViewData["detail"] = se.InfoSet(id);
            return View();
        }

        public ActionResult DeleteId(int id)
        {
            se.Delete(id);
            return RedirectToAction("Setting");
        }

        public ActionResult IdenEmail(string id)
        {
            string email = "";
            var rs2 = dc.Configs.Where(dd => dd.MailName == id).ToList();
            var rs3 = dc.Configs.Where(d => d.MailNetwork == id).ToList();
            if (rs2.Count > 0 || rs3.Count >0)
            {
                email += "Email " + "<b>" + id + "</b>" + " has been used! please enter another email";
            }
            else
            {
                email += "";
            }
            Response.Write(email);
            return null;
        }


    }
}
