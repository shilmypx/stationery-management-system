using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class Default1Controller : Controller
    {
       //lop chua cac method mahoa va giai ma
        private DescyptandEnscryt de = new DescyptandEnscryt();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MyRequest10()
        {
            RequestModel rq = new RequestModel();
            RequestModel22 rq22 = new RequestModel22();
            Employee e = (Employee)Session["Employee"];
            ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();
            ViewData["lst1"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")).OrderByDescending(r => r.DDispatch1).ToList();
            ViewData["lst2"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2") && r.Acc1 == true).OrderByDescending(r => r.DDispatch1).ToList();
            ViewData["lst3"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1 == false).OrderByDescending(r => r.DDispatch1).ToList();
            ViewData["lst4"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("3") ).OrderByDescending(r => r.DDispatch1).ToList();
            ViewData["lst5"] = rq22.Listrq2().Where(r1 => e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();

            return View();
        }

        
       

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Login()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(FormCollection formvalue)
        {
            Employee el = new Employee();
            el = de.Login(formvalue["EmployeeNumber"].ToString(), formvalue["Password"].ToString());
            if(! ModelState.IsValid)
            {
                 return View();
            }

            if ( el == null)
           {
               ViewData["kq"] = "Not found account";
               return View();
           }
            Session["Employee"] = el;

            return RedirectToAction("myrequest10");

           
        }

    }
}
