using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;
namespace MvcStationeryManagementSystem.Controllers
{
    public class RequestController : Controller
    {

        private StationeryModelcs s = new StationeryModelcs();


        //mo ve view Request

        public ActionResult Index()
        {
              DataClassesStationeryDataContext dtdc = new DataClassesStationeryDataContext();
            ViewModel vm = new ViewModel();
            if(Session["Employee"]==null)
            {
                return RedirectToAction("Login" , "Default1");
            }
            ViewData["sanpham"] = s.ListStationery();
            return View();
        }
        public ActionResult test()
        {
            DataClassesStationeryDataContext dtdc = new DataClassesStationeryDataContext();
            ViewModel vm = new ViewModel();
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login", "Default1");
            }
           
            return View();
        }
        
        public ActionResult laygiatri()
        {
            string chuoi = "";
            foreach( Stationery s1 in s.ListStationery() )
            {
                chuoi += "<tr>";
                chuoi += String.Format("<td>{0}</td>", s1.ProductName);
                chuoi += String.Format("<td>{0}</td>", s1.Rate);
                chuoi += String.Format("<td>{0}</td>", s1.Quantity);
                chuoi += String.Format("<td>{0}</td>", s1.Description);
                chuoi += String.Format("<td><button class='luachon'>Lua Chon</button><input type='hidden' class='giatri' value={0}></td>", s1.ProductId);
                
                chuoi += "</tr>";
            }
        System.Threading.Thread.Sleep(3000);
            Response.Write(chuoi);
            return null;

        }

        public ActionResult giohang(int id)
        {
            string a = "";
             StationeryModelcs sc = new StationeryModelcs();
             if (Session["giohang"] == null)
             {

                 List<GiohangModel> lg1 = new List<GiohangModel>();
                 GiohangModel gl = new GiohangModel();
                 gl.ProductName = sc.stati(id).ProductName;
                 gl.Productid = sc.stati(id).ProductId;
                 gl.Quality = Convert.ToInt32(sc.stati(id).Quantity);
                 gl.Descript = sc.stati(id).Description;
                 gl.Soluong = 1;
                 lg1.Add(gl);
                 Session["giohang"] = lg1;

                 a += "<tr class='remove' >";
                 a += String.Format("<td class='id'>{0}</td>", gl.Productid);
                 a += String.Format("<td>{0}</td>", gl.ProductName);
                 a += String.Format("<td>{0}</td>", gl.Quality);
                 a += String.Format("<td>{0}</td>", gl.Descript);
                 a += String.Format("<td><input type='type' class='sl' value='{0}'  /></td>", gl.Soluong);
                 a += String.Format("<td><button class='remove1'>Remove</button><input type='hidden' class='giatri1' value='{0}'></td></td>", gl.Productid);
                 a += "</tr>";

                 Response.Write(a);
             }
             else
             {
                 if (TestProduct(id))
                 {
                     string a1 = "";
                     updatequality(id);
                     List<GiohangModel> gh = (List<GiohangModel>)Session["giohang"];
                     foreach (GiohangModel g in gh)
                     {
                         a1 += "<tr class='remove'>";
                         a1 += String.Format("<td class='id'>{0}</td>", g.Productid);
                         a1 += String.Format("<td>{0}</td>", g.ProductName);
                         
                         a1 += String.Format("<td>{0}</td>", g.Quality);
                         a1 += String.Format("<td>{0}</td>", g.Descript);
                         a1 += String.Format("<td><input type='type' class='sl' value='{0}' /></td>", g.Soluong);
                         a1 += String.Format("<td><button class='remove1'>Remove</button><input type='hidden' class='giatri1' value='{0}'></td></td>", g.Productid);
                         a1 += "</tr>";
                     }
                     Response.Write(a1);

                 }
                 else
                 {
                     List<GiohangModel> lg1 = (List<GiohangModel>)Session["giohang"];
                     Stationery s1 = sc.stati(id);
                     GiohangModel gm1 = new GiohangModel();
                     gm1.Productid = s1.ProductId;
                     gm1.ProductName = s1.ProductName;
                     gm1.Quality = Convert.ToInt32(s1.Quantity);
                     gm1.Soluong = 1;
                     lg1.Insert(0, gm1);
                     
                     Session["giohang"] = lg1;

                     string a2 = "";
                     foreach (GiohangModel g in (List<GiohangModel>)Session["giohang"])
                     {
                         a2 += "<tr class='remove'>";
                         a2 += String.Format("<td class='id'>{0}</td>", g.Productid);
                         a2 += String.Format("<td>{0}</td>", g.ProductName);
                        
                         a2 += String.Format("<td>{0}</td>", g.Quality);
                         a2 += String.Format("<td>{0}</td>", g.Descript);
                         a2 += String.Format("<td><input type='type' class='sl' value='{0}' /></td>", g.Soluong);
                         a2 += String.Format("<td><button class='remove1'>Remove</button><input type='hidden' class='giatri1' value='{0}'></td></td>", g.Productid);
                         a2 += "</tr>";
                     }
                     Response.Write(a2);
                 }
             }
            return null;


        }


        private bool TestProduct(int id)
        {
            bool kq = true;
            List< GiohangModel> ls = ( List<GiohangModel>)Session["giohang"];
            foreach( GiohangModel s in ls  )
            {
                if (s.Productid == id)
                {
                    kq = true;
                    break;
                }
                else
                {
                    kq = false;
                }
            }
            return kq;

        }

        private void updatequality(int id)
        {
            List<GiohangModel> ls = (List<GiohangModel>)Session["giohang"];
            GiohangModel gm = new GiohangModel();
            gm = ls.Where(g => g.Productid == id).FirstOrDefault();
            GiohangModel gm1 = new GiohangModel();
            gm1.Productid = id;
            gm1.ProductName = gm.ProductName;
            gm1.Quality = gm.Quality;
            gm1.Soluong = gm.Soluong + 1;
            ls.RemoveAll(x => x.Productid == id);
            //ls.Add(gm1);
            ls.Insert(0,gm1);
            Session["giohang"] = ls;
        }

        public ActionResult removegiohang(string id)
        {
            
            List<GiohangModel> lg = (List<GiohangModel>) Session["giohang"];
            if (lg.Count == 1)
            {
                Session.Remove("giohang");
            }
            else
            {
                lg.RemoveAll(x => x.Productid == Convert.ToInt32(id));
                
                Session["giohang"] = lg;
                Response.Write("daxoa");
            }
            return null;
        }
    }
}
