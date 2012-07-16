using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class CatalogeRQController : Controller
    {
        private CatalogeRQModel rq = new CatalogeRQModel();
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();

        public ActionResult CatalogeRQ()
          {
              ViewData["listrq"] = rq.list();
              ViewData["count"] = rq.count();
              return View();

          }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult insertRQ()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcessInsert(string CatalogRQName)
        {
           
                rq.add(CatalogRQName);
                Session.Remove("kt");
                return RedirectToAction("CatalogeRQ");
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult updateRQ(int id)
        {
            ViewData["info"] = rq.infomation(id);
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcessUpdateCataloge(int CatalogRQId, string CatalogRQName)
        {
            try
            {
                List<CatalogeRQ> ls = rq.list();
                rq.Edit(CatalogRQId, CatalogRQName);
                CatalogeRQ cr = ls.Where(s => s.CatalogRQId == CatalogRQId).FirstOrDefault();
                ls.RemoveAll(z => z.CatalogRQId == CatalogRQId);
                ls.Insert(0, cr);
                ViewData["count"] = rq.count();
                Session.Remove("kt");
                ViewData["listrq"] = ls;
                
            }
            catch
            { }
            return View("CatalogeRQ");
        }
        public ActionResult DeleteCatalogeRQ(int id)
        {
            try
            {
                rq.delete(id);
                Session.Remove("kt");
                return RedirectToAction("CatalogeRQ");
            }
            catch
            {
                Session["kt"] = "Message:This CatalogeRQ can not be removed";
                return RedirectToAction("CatalogeRQ");
            
            }
           
        }
        public ActionResult Check(string id)
        {
            try
            {
                List<CatalogeRQ> ls = rq.search(id);
                string chuoi = "";

                foreach (CatalogeRQ s in ls)
                {
                    chuoi += "<tr>";
                    chuoi += "<td>" + s.CatalogRQId + "</td>";
                    chuoi += "<td>" + s.CatalogRQName + "</td>";
                    chuoi += "<td><a href='/CatalogeRQ/updateRQ/" + s.CatalogRQId + "'>Edit</a>||<a href='/CatalogeRQ/DeleteCatalogeRQ/" + s.CatalogRQId + "' class='xoa'>Delete</a></td>";
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
            var kt = dct.CatalogeRQs.Where(k => k.CatalogRQName.Equals(name)).Count();

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
