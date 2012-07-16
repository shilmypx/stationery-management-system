using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class StationeryController : Controller
    {
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private Stationery tsa = new Stationery();
        private StationeryModel st = new StationeryModel();
        public ActionResult Statioery()
        {
            StationeryModel st = new StationeryModel();
            ViewData["count"] = st.count();
            ViewData["HHCC"] = st.ListStationery();
            ViewData["tt"] = st.thue();
            ViewData["sum"] = st.count3();
            //Session.Remove("kt");
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult InsertSta()
        {
            ViewData["dsCataloge"] = st.ListCataloge();
            return View("InsertSta");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult InsertStationery(string ProductName, double Rate, int Quantity,double Arise ,int CatalogeId, string Description)
        {
           
           
                st.insert(ProductName, Rate, Quantity, Arise, CatalogeId, Description);
                Session.Remove("kt");
               return RedirectToAction("Statioery");
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ProcessUpdate(int id)
        {
            ViewData["update"] = st.staInfomation(id);
            ViewData["dsCataloge"] = st.ListCataloge();
            return View("Update");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcessUpdate(int id, string ProductName, double Rate, int Quantity, int CatalogeId, string Description)
        {
                List<Stationery> ls = st.ListStationery();
                st.Edit(id, ProductName, Rate, Quantity, CatalogeId, Description);
                Stationery s12 = ls.Where(x => x.ProductId == id).FirstOrDefault();
                ls.RemoveAll(x1=>x1.ProductId==id);
                ls.Insert(0, s12);

                ViewData["count"] = st.count();
                ViewData["HHCC"] = ls;
                Session.Remove("kt");
                return View("Statioery");
            
        }

        public ActionResult DeleteStationery(int id)
        {
            try 
            {

                tsa= dct.Stationeries.Where(s => s.ProductId==id).First();
                dct.Stationeries.DeleteOnSubmit(tsa);
                dct.SubmitChanges();
                Session.Remove("kt");
                return RedirectToAction("Statioery");
                
            }
            catch
            {
                Session["kt"] = "Message:This product can not be removed";
                return RedirectToAction("Statioery");
            }
           
            
        }

        //public ActionResult MessageDelete(int id)
        //{
        //    bool kq = dct.Request_Stationeries.Where(r=>r.ProductId==id).Count()>0;
        //    if (kq)
        //        Response.Write("Khong the xoa item nay");
        //    else
        //    {
        //        st.Delete(id);
        //        Response.Write("co the xoa item nay");
        //    }
        //    return null;
        //}


        public ActionResult checkdelete(int id)
        {
            try
            {
                var kq = dct.Stationeries.Where(l => l.ProductId == id).ToList();
                if (kq.Count == 1)
                {
                    ViewData["kq"] = false;
                }
            }
            catch
            {
                ViewData["kq"] = true;
            }
            return RedirectToAction("Statioery");
        }
       
        public ActionResult Check(string id)
        {
            try
            {
                List<Stationery> ls = st.search(id);
                string chuoi = "";

                foreach (Stationery s in ls)
                {
                    chuoi += "<tr>";
                    chuoi += "<td>" + s.ProductId + "</td>";
                    chuoi += "<td>" + s.ProductName + "</td>";
                    chuoi += "<td>" + s.Rate + "</td>";
                    chuoi += "<td>" + s.Quantity + "</td>";
                    chuoi += "<td>" + s.Arise + "</td>";
                    chuoi += "<td>" + s.CatalogeId + "</td>";
                    chuoi += "<td>" + s.Description + "</td>";
                    chuoi += "<td><a href='/Stationery/ProcessUpdate/" + s.ProductId + "'>Edit</a>||<a href='/Stationery/DeleteStationery/" + s.ProductId + "' class='xoa'>Delete</a></td>";
                    chuoi += "</tr>";
                }
                
                Response.Write(chuoi);
            }
            catch { }
            return null;
        }
        public JsonResult Check2(FormCollection Formvalue)
        {
            System.Threading.Thread.Sleep(1000);
            string name = Formvalue["ProductName"];
            var kt = dct.Stationeries.Where(k => k.ProductName.Equals(name)).Count();

            if (kt == 1)
                {
                    Response.Write("notok");
                }
            else
            {
                Response.Write("ok");
            }
            return null;


        }
        public JsonResult Check4(FormCollection Formvalue)
        {
            System.Threading.Thread.Sleep(3000);
            string name = Formvalue["ProductName"];
            var kt = dct.Stationeries.Where(k => k.ProductName.Equals(name)).Count();

            if (kt == 1)
            {
                Response.Write("notok");
            }
            else
            {
                Response.Write("ok");
            }
            return null;


        }

    }
}
