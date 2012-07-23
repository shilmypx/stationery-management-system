using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class mystationeryController : Controller
    {
        private DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();   
        
        public ActionResult MyStationery()
        {
            Employee e = (Employee)Session["Employee"];
            List<Request> r1 = dc.Requests.Where(r => (r.State.Equals("4") && r.Accept == true) || (r.State.Equals("7") && r.Accept == true)).ToList();
            if (r1.Count > 0)
            {
                if (r1.Where(rr => rr.EmployeeNumber == e.EmployeeNumber).ToList().Count > 0)
                {
                    Request r2 = r1.Where(rr => rr.EmployeeNumber == e.EmployeeNumber).ToList().First();


                    List<Request_Stationery> lst = dc.Request_Stationeries.Where(l => l.RequestId == r2.RequestId).ToList();
                    List<Stationery> st = dc.Stationeries.ToList();
                    List<Mystationerymodel> st1 = new List<Mystationerymodel>();
                    //List<Stationery> st11 = new List<Stationery>();

                    foreach (Stationery s in st)
                    {
                        foreach (Request_Stationery s1 in lst)
                        {
                            if (s.ProductId == s1.ProductId)
                            {

                                st1.Add(new Mystationerymodel(Convert.ToInt32(s.ProductId), s.ProductName, Convert.ToDouble(s.Rate), Convert.ToInt32(s1.Quantity), Convert.ToDouble(s.Arise), s1.Description));
                            }
                        }
                    }
                    ViewData["stn"] = st1;
                }
            }
                return View();
            
        }
       
        public ActionResult Search2(string id)
        {
           // ViewData["total"] = 0;

            // ls = Listrq2().Where(n => n.Rname.Trim().ToLower().Contains(RequestName.Trim().ToLower())).ToList();
            Employee e = (Employee)Session["Employee"];
            if (id != null)
            {
                List<Mystationerymodel> lmd = (List<Mystationerymodel>)ViewData["stn"];
               // List<Mystationerymodel> lm = null;



                List<Mystationerymodel> lm = lmd.Where(l => l.Productname.Trim().ToLower().Contains(id.Trim().ToLower())).ToList();

                //Session["total"] = lm.Count;
                
                string chuoi = "";

                foreach (Mystationerymodel s in lm)
                {
                    chuoi += "<tr>";
                    // chuoi += "<td>" + s.RId1 + "</td>";
                    chuoi += "<td>" + s.Productname + "</td>";
                    chuoi += "<td>" + s.Rate + "</td>";
                    chuoi += "<td>" + s.Quantity + "</td>";
                    //  chuoi += "<td>" + s.Arise + "</td>";
                    chuoi += "<td>" + s.Arise + "</td>";
                    chuoi += "<td>" + s.Description + "</td>";

                    chuoi += "</tr>";
                }

                Response.Write(chuoi);
            }
            else
            {
                List<Mystationerymodel> lmd = (List<Mystationerymodel>)ViewData["stn"];
                string chuoi = "";

                foreach (Mystationerymodel s in lmd)
                {
                    chuoi += "<tr>";
                    // chuoi += "<td>" + s.RId1 + "</td>";
                    chuoi += "<td>" + s.Productname + "</td>";
                    chuoi += "<td>" + s.Rate + "</td>";
                    chuoi += "<td>" + s.Quantity + "</td>";
                    //  chuoi += "<td>" + s.Arise + "</td>";
                    chuoi += "<td>" + s.Arise + "</td>";
                    chuoi += "<td>" + s.Description + "</td>";

                    chuoi += "</tr>";
                }
               // Session["total"] = lmd.Count;
                Response.Write(chuoi);
            }

            return null;
        }

    }
}
