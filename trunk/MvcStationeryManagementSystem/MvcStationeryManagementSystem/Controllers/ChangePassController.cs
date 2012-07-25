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

            Session.Remove("Employee");
            return View("ChangePass");

        }


        public ActionResult Doipw(string id)
        {
            Config cf = dct.Configs.OrderByDescending(c => c.BuildDate).ToList().First();
            Employee el = (Employee)Session["Employee"];
            Employee el2 = dct.Employees.Where(e => e.EmployeeNumber == el.RegistrationNumber).First();
            RequestModel rq = new RequestModel();
           
            string From = cf.MailName;
            string To = el2.Email;
            //string cc = e2.Email;
            string type = cf.Type;
            int post = Convert.ToInt32(cf.Ports);
            string mailnetword = cf.MailNetwork;
            string pass = cf.Password;
            string Subject = el.FullName + "Change Password";
            string Message = "<span><b>From:</b> " + el.FullName + "</span><br/>" + "<b>Date Dispatch:</b> " + DateTime.Now + "<br/>";
            em.changepass(el.EmployeeNumber, mahoa_giaima.maHoa(id));
            rq.Send(From, To, Subject, Message, type, post, mailnetword, pass);
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
