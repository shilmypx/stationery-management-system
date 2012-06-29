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
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            RequestModel rq = new RequestModel();
            RequestModel22 rq22 = new RequestModel22();
            Employee e = (Employee)Session["Employee"];
            //my newrequest
            ViewData["lst"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1") && r.Acc1 == true || (r.Stte1.Equals("5") && r.Acc1==true)) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("5")&& r.Acc1==true)).OrderByDescending(r => r.DDispatch1).ToList();
            //Request Approved
            ViewData["lst1"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")) || (e.EmployeeNumber.Equals(r.RNumber1) &&r.Stte1.Equals("6") && r.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
           //My Accept
            ViewData["lst2"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1==true).OrderByDescending(r => r.DDispatch1).ToList();
           //My Reject
            ViewData["lst3"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1 == false).OrderByDescending(r => r.DDispatch1).ToList();
           //Request No Approved
            ViewData["lst4"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("3")) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("6") && r.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
            //New Request
            ViewData["lst5"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == true) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("5")&&r1.Acc1==true)).OrderByDescending(r => r.DDispatch1).ToList();
            //Withdraw Request
            ViewData["lst6"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == false) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("5") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
           //Cancel Request
            ViewData["lst7"] = rq22.Listrq2().Where(r1 => e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("2") && r1.Acc1 == false).OrderByDescending(r => r.DDispatch1).ToList();
            //Accept Request
            ViewData["lst8"] = rq22.Listrq2().Where(r1 => e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("4") && r1.Acc1 == true).OrderByDescending(r => r.DDispatch1).ToList();
            return View();
        }


        public ActionResult DetailRQ(int id)
        {
            RequestModel rm = new RequestModel();
            ViewData["if"] = rm.Infomation(id);
            return View();
        }
        //public ActionResult infor1(int rid)
        //{
        //    RequestModel rq = new RequestModel();
        //    ViewData["if1"] = rq.infor1(rid);
        //    return View();
        //}
        public ActionResult update11(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
          
            ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();
           
            rq.update1(requestid,rname,st, dd,da,acc,rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");
        
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

        //logout
        public ActionResult logout()
        {
            Session.Remove("Employee");
            return RedirectToAction("MyRequest10");
        }

    }
}
