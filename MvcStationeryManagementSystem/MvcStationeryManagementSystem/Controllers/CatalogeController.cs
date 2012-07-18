using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class CatalogeController : Controller
    {
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private CatalogeModel ca = new CatalogeModel();
        public ActionResult Cataloge()
        {
           
            ViewData["count1"] = ca.count1();
            ViewData["CCHH"] = ca.Listcataloge();
            return View();
        }
        //cac ham cua Cataloge
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult InsertCataloge()
        {

            return View();
        }



        public ActionResult InsertCataloge(string CatalogeName)
        {

            ca.add(CatalogeName);
            Session.Remove("kt");
            return RedirectToAction("Cataloge");

        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult updateCataloge(int id)
        {
            ViewData["update1"] = ca.infomation(id);
            return View("updateCataloge");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcessUpdateCataloge(int CatalogeId, string CatalogeName)
        {
            try
            {
                List<Cataloge> ls = ca.Listcataloge();
                ca.Edit(CatalogeId, CatalogeName);
                Cataloge cg = ls.Where(u => u.CatalogeId == CatalogeId).FirstOrDefault();
                ls.RemoveAll(m => m.CatalogeId == CatalogeId);
                ls.Insert(0, cg);
                ViewData["count1"] = ca.count1();
                Session.Remove("kt");
                ViewData["CCHH"] = ls;
            }
            catch
            { }
           
            return View("Cataloge");
        }
        public ActionResult DeleteCataloge(int id)
        {
            try
            {
                ca.delete(id);
                Session.Remove("kt");
                return RedirectToAction("Cataloge");
            }
            catch
            {
                Session["kt"] = "<div class='response-msg error ui-corner-all'><span>Error message</span>Message:This Cataloge can not be removed</div>";
                return RedirectToAction("Cataloge");
            }
        }
        public ActionResult Check(string id)
        {
            try
            {
                List<Cataloge> ls = ca.search(id);
                string chuoi = "";

                foreach (Cataloge s in ls)
                {
                    chuoi += "<tr>";
                    chuoi += "<td>" + s.CatalogeId + "</td>";
                    chuoi += "<td>" + s.CatalogeName + "</td>";
                    chuoi += "<td><a href='/Cataloge/updateCataloge/" + s.CatalogeId + "'>Edit</a>||<a href='/Cataloge/DeleteCataloge/" + s.CatalogeId + "' class='xoa'>Delete</a></td>";
                    chuoi += "</tr>";
                }
                Session.Remove("kt");
                Response.Write(chuoi);
            }
            catch { }
            return null;
        }
        public JsonResult Check2(FormCollection Formvalue)
        {
            System.Threading.Thread.Sleep(1000);
            string name = Formvalue["CatalogRQName"];
            var kt = dct.Cataloges.Where(k => k.CatalogeName.Equals(name)).Count();

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
