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
        public ActionResult Index1()
        {
            return View();
        }
        public ActionResult MyRequest()
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            ViewData["lst"] = rq.ListRQ().Where(r=>e.EmployeeNumber.Equals(r.ENumber1)).ToList();
            ViewData["lst1"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")).ToList();
            return View();
        }
        public ActionResult MyRequest1()
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1)).ToList();
            ViewData["lst1"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")).ToList();
            ViewData["lst2"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2") && r.Acc1==true).ToList();
            return View();
        }

        public ActionResult MyRequest2()
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1)).ToList();
            ViewData["lst1"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")).ToList();
            ViewData["lst2"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2") && r.Acc1 == true).ToList();
            return View();
        }
        public ActionResult RequestsApproved()
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")).ToList();
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

            return RedirectToAction("index");

           
        }

    }
}
