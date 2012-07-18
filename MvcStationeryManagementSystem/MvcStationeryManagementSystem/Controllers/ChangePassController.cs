using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Controllers
{
    public class ChangePassController : Controller
    {

        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private ChangePassModel em = new ChangePassModel();
        private DescyptandEnscryt dd = new DescyptandEnscryt();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChangePass()
        {
            return View("ChangePass");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change(string user, string password)
        {
            var kq = dct.Employees.Where(l => l.EmployeeNumber.Equals(user)).ToList();
            if (kq.Count == 1)
            {
                em.changepass(user, mahoa_giaima.maHoa(password));
            }
            return View("ChangePass");

        }


        public ActionResult Doipw(string id)
        {
            Employee el = (Employee)Session["Employee"];

            em.changepass(el.EmployeeNumber,mahoa_giaima.maHoa(id));
            Response.Write("Da change Password thanh cong");
            return null;
        }

        public JsonResult Check2(FormCollection Formvalue)
        {
            mahoa_giaima mg = new mahoa_giaima();
            System.Threading.Thread.Sleep(1000);
            Employee el = (Employee)Session["Employee"];
            string chuoi = "";
            if (Formvalue["Pass"].Equals( mahoa_giaima.giaiMa(el.Password)))
            {
                chuoi += 1;
            }
            else
            {
                chuoi += 0;
            }

            Response.Write(chuoi);
            return null;
           


        }

        public JsonResult Checkxl(FormCollection Formvalue)
        {
           
            System.Threading.Thread.Sleep(1000);
            string chuoi = "";
            if (Formvalue["Pw"] == Formvalue["password"])
            {
                chuoi += 1;
            }
            else
            {
                chuoi += 0;
            }

            Response.Write(chuoi);
            return null;



        }

    }
}
