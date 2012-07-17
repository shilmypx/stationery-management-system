﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;
using System.Net.Mail;
using System.Text;

namespace MvcStationeryManagementSystem.Controllers
{
    public class Default1Controller : Controller
    {
       //lop chua cac method mahoa va giai ma
        private DescyptandEnscryt de = new DescyptandEnscryt();
        private DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();
        public ActionResult Index()
        {
            return View();
        }
       
        public ActionResult MyRequest10(string id)
        {
            Session["ac"] = id;
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            RequestModel rq = new RequestModel();
            RequestModel22 rq22 = new RequestModel22();
            Employee e = (Employee)Session["Employee"];
            //my newrequest/
            ViewData["lst"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1") && r.Acc1 == true || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("5") && r.Acc1==true)) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("5")&& r.Acc1==true)).OrderByDescending(r => r.DDispatch1).ToList();
            //Request Approved/
            ViewData["lst1"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")) ||(e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("9") && r.Acc1==false)|| (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("6") && r.Acc1 == true) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("6") && r.Acc1 == true) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("66") && r.Acc1 == true) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("66") && r.Acc1 == true) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("7") && r.Acc1 == false) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("7") && r.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
           
            //My Accept/
            ViewData["lst2"] = rq.ListRQ().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1 == true) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("7") && r.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
           //My Reject/
            ViewData["lst3"] = rq.ListRQ().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1 == false) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("8") && r.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
          
            //Request No Approved/
            ViewData["lst4"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("3")) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("6") && r.Acc1 == false) || (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("6") && r.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
            //New Request
            ViewData["lst5"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
            //
            ViewData["lst55"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == true) || (r1.Stte1.Equals("5") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
            //Withdraw Request/
            ViewData["lst6"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == false) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("5") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
            //
            ViewData["lst66"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == false) || (r1.Stte1.Equals("5") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
           //Cancel Request/
            ViewData["lst7"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("2") && r1.Acc1 == false) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("7") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
            //
            ViewData["lst77"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("2") && r1.Acc1 == false) || (r1.Stte1.Equals("7") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();
            //Accept Request/
            ViewData["lst8"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("4") && r1.Acc1 == true) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("7") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
            // 
            ViewData["lst88"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("4") && r1.Acc1 == true) || (r1.Stte1.Equals("7") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();
          /*  if (Session["email"] == null)
            {
                Response.Write(" ");
            }
            else if (Convert.ToInt32(Session["email"]) == 1)
            {
                Response.Write("<Script type='text/javascript'>alert('Succesfull')</script>");
                Session.Remove("email");
            }
            else
            {
                Response.Write("<Script type='text/javascript'>alert('No Succesfull')</script>");
                Session.Remove("email");
            }*/
            //Request_Stationery
            return View("myrequest10");
        }
        public ActionResult Back()
        {
            return RedirectToAction("myrequest10");
        }
        //bat dau
        public ActionResult DetailRQ(int id)
        {
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);
            Employee el = (Employee)Session["Employee"];
            ViewData["em"] = dc.Employees.Where(i => i.EmployeeNumber.Equals(el.RegistrationNumber)).ToList().First();
            
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult update11()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult update11(FormCollection form)
        {
            Config cf = dc.Configs.OrderByDescending(c => c.BuildDate).ToList().First();
                RequestModel rq = new RequestModel();
                Employee e = (Employee)Session["Employee"];
                Employee e1 = dc.Employees.Where(ee => ee.EmployeeNumber == e.RegistrationNumber).ToList().First();
                ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();

                string From = cf.MailName;
                string To = e1.Email;
                string type = cf.Type;
                int post = Convert.ToInt32(cf.Ports);
                string mailnetword = cf.MailNetwork;
                string pass = cf.Password;
                string Subject = "Request Name: " + form["rname"].ToString();
                string Message = "<span>From: " + e.FullName + "</span><br/>" + "Date Dispatch: " + form["dd"].ToString() + "<br/>" + "Content: " + form["rc"].ToString() + "<br/>" + "Description: " + form["dt"].ToString();
                if (rq.Send(From, To, Subject, Message, "type", post, mailnetword, pass))
                {
                    rq.update(Convert.ToInt32(form["requestid"]), form["rname"].ToString(), form["st"].ToString(), Convert.ToDateTime(form["dd"]), DateTime.Now, Convert.ToBoolean(form["acc"]), form["rc"].ToString(), form["en"].ToString(), form["dt"].ToString(), Convert.ToInt32(form["ctid"]));
                    Session["email"] = 1;
                }
                  else
                      Session["email"] = 2;
              
              
             return RedirectToAction("MyRequest10");
            
        }
        [AcceptVerbs(HttpVerbs.Post)]
       
       
        //ket thuc
        //2
        public ActionResult DetailRQ2(int id)
        {
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);

            return View();
        }
        public ActionResult DetailRQ22(int id)
        {
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);

            return View();
        }
        public ActionResult update2(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel rq = new RequestModel();
            RequestModel22 rq22 = new RequestModel22();
            Employee e = (Employee)Session["Employee"];

            ViewData["lst1"] = rq22.Listrq2().Where(r => (e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("2")) || (e.EmployeeNumber.Equals(r.RNumber1) && r.Stte1.Equals("6") && r.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();

            rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");

        }
        //
        //3
        public ActionResult DetailRQ3(int id)
        {
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);

            return View();
        }
        public ActionResult update3(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];

            ViewData["lst2"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("4") && r.Acc1 == true).OrderByDescending(r => r.DDispatch1).ToList();
            rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");

        }
        //
        //4
        public ActionResult DetailRQ4(int id)
        {
            Employee el = (Employee)Session["Employee"];
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);
            ViewData["role"] = dc.Roles.Where(r => r.RoleId == el.RoleId).ToList().First();
            return View();
        }
        public ActionResult update4(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            RequestModel22 rq22 = new RequestModel22();
            ViewData["lst5"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == true) || (r1.Stte1.Equals("5") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();

            rq.update(requestid, rname, st, dd, DateTime.Now, acc, rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");

        }
        //

        //
        public ActionResult update44(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];
            RequestModel22 rq22 = new RequestModel22();
            ViewData["lst5"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("1") && r1.Acc1 == true) || (r1.Stte1.Equals("5") && r1.Acc1 == true)).OrderByDescending(r => r.DDispatch1).ToList();

            rq.update(requestid, rname, st, dd, DateTime.Now, acc, rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");

        }
        //
        //5
        public ActionResult DetailRQ5(int id)
        {
            RequestModel rm = new RequestModel();
            Request_StationeryModel rm1 = new Request_StationeryModel();
            ViewData["if"] = rm.Infomation(id);
            ViewData["if1"] = rm1.ListR_S(id);

            return View();
        }
        public ActionResult update5(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        {
            RequestModel22 rq22 = new RequestModel22();
            RequestModel rq = new RequestModel();
            Employee e = (Employee)Session["Employee"];

            ViewData["lst7"] = rq22.Listrq2().Where(r1 => (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("2") && r1.Acc1 == false) || (e.EmployeeNumber.Equals(r1.RNumber1) && r1.Stte1.Equals("7") && r1.Acc1 == false)).OrderByDescending(r => r.DDispatch1).ToList();

            rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
            return RedirectToAction("MyRequest10");

        }
        //
        //6
        //public ActionResult DetailRQ6(int id)
        //{
        //    RequestModel rm = new RequestModel();
        //    Request_StationeryModel rm1 = new Request_StationeryModel();
        //    ViewData["if"] = rm.Infomation(id);
        //    ViewData["if1"] = rm1.ListR_S(id);

        //    return View();
        //}
        //public ActionResult update6(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        //{
        //    RequestModel rq = new RequestModel();
        //    Employee e = (Employee)Session["Employee"];

        //    ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();

        //    rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
        //    return RedirectToAction("MyRequest10");

        //}
        ////
        ////7
        //public ActionResult DetailRQ7(int id)
        //{
        //    RequestModel rm = new RequestModel();
        //    Request_StationeryModel rm1 = new Request_StationeryModel();
        //    ViewData["if"] = rm.Infomation(id);
        //    ViewData["if1"] = rm1.ListR_S(id);

        //    return View();
        //}
        //public ActionResult update7(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        //{
        //    RequestModel rq = new RequestModel();
        //    Employee e = (Employee)Session["Employee"];

        //    ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();

        //    rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
        //    return RedirectToAction("MyRequest10");

        //}
        ////
        ////8
        //public ActionResult DetailRQ8(int id)
        //{
        //    RequestModel rm = new RequestModel();
        //    Request_StationeryModel rm1 = new Request_StationeryModel();
        //    ViewData["if"] = rm.Infomation(id);
        //    ViewData["if1"] = rm1.ListR_S(id);

        //    return View();
        //}
        //public ActionResult update8(int requestid, string rname, string st, DateTime dd, DateTime da, bool acc, string rc, string en, string dt, int ctid)
        //{
        //    RequestModel rq = new RequestModel();
        //    Employee e = (Employee)Session["Employee"];

        //    ViewData["lst"] = rq.ListRQ().Where(r => e.EmployeeNumber.Equals(r.ENumber1) && r.Stte1.Equals("1")).OrderByDescending(r => r.DDispatch1).ToList();

        //    rq.update(requestid, rname, st, dd, da, acc, rc, en, dt, ctid);
        //    return RedirectToAction("MyRequest10");

        //}
        ////
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
