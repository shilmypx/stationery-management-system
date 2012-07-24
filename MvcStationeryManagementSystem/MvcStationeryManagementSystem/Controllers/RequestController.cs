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
        private StationeryModel s1 = new StationeryModel();
        private Request_StationeryModel rsm = new Request_StationeryModel();


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
            CatalogeModel clm = new CatalogeModel();
            ViewData["dsachcata"] = clm.Listcataloge();

            ViewData["count"] = s1.count();
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
            System.Threading.Thread.Sleep(2000);
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
                 a += String.Format("<td><input type='type' name='sl' class='sl' value='{0}'  /></td>", gl.Soluong);
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
                         a1 += String.Format("<td><input type='type' name='sl' class='sl' value='{0}' /></td>", g.Soluong);
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
                         a2 += String.Format("<td><input type='type' name='sl' class='sl' value='{0}' /></td>", g.Soluong);
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


        public bool TestSo(string id)
        {
            bool kq = true;
            try
            {
                Convert.ToInt32(id);
            }
            catch
            {
                kq = false;
            }
            kq = true;
            return kq;
        }
        
        public ActionResult Capnhapsoluong(string a , string a1)
        {
            List<GiohangModel> lg = (List<GiohangModel>)Session["giohang"];
            GiohangModel obj = new GiohangModel();
            if(!TestSo(a))
            {

            }
            else
            {
                obj = lg.Where(e => e.Productid == Convert.ToInt32(a1)).FirstOrDefault();
              GiohangModel g = new GiohangModel();
              g.Productid = Convert.ToInt32(a1);
              g.ProductName = obj.ProductName;
              g.Quality = obj.Quality;
              g.Descript = obj.Descript;
              g.Soluong = Convert.ToInt32(a);
              lg.RemoveAll(x=>x.Productid==Convert.ToInt32(a1));
            
            lg.Insert(0, g);
            Session["giohang"] = lg;
            Response.Write("ok");
  
            }
            return null;
        }

        public ActionResult AddRequest()
        {
            Response.Write("aaa");
            return null;
        }

        [ValidateInput(false)]
        public ActionResult Addrq()
        {
            ValidateRequest = false;
          string a = Request.QueryString["a"];
        
           if (Session["giohang"]== null)
           {
               Response.Write("Ban chua lua chon san pham !");
           }
           else
           {
               List<Request_Stationery> ls = new List<Request_Stationery>();
               foreach( GiohangModel gm in (List<GiohangModel>)Session["giohang"] )
               {
                   Request_Stationery s = new Request_Stationery();
                   s.ProductId = gm.Productid;
                   s.Quantity = gm.Soluong;
                   ls.Add(s);
               }
               string chuoi = "";
               Employee el = (Employee)Session["Employee"];//form
               Request_StationeryModel rsm = new Request_StationeryModel();
               Request r = new Request();
               string[] kq = a.Split('|');
               chuoi +=  kq[0] + kq[1] + kq[2];
               r.RequestName = kq[0];
               r.RequestContent = kq[1];
               r.Description = kq[2];
               r.DateDispatch = DateTime.Now;
               r.Accept = true;
               r.State = "1";
               r.CatalogRQId = Convert.ToInt32(kq[3]);
               r.EmployeeNumber = el.EmployeeNumber;
               rsm.inserdata(r);
               int a1 = r.RequestId;
               foreach( Request_Stationery r1 in ls )
               {
                   r1.RequestId = a1;
                   rsm.insert2(r1);
               }
               Response.Write(ls.Count);
              RequestModel rm = new RequestModel();
            
              string ixep = el.RegistrationNumber;
              Employee xep = rsm.informationxep(ixep);
              DataClassesStationeryDataContext dtdc = new DataClassesStationeryDataContext();
               Config c1 = dtdc.Configs.First();
               if (rm.Send(el.Email, xep.Email, kq[0], kq[1], c1.Type,Convert.ToInt32(c1.Ports), c1.MailNetwork, c1.Password))
               {
                   Redirect("Default1/MyRequest10");
               }




           }
            return null;
        }

    }
}
