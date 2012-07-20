using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;
using System.IO;

namespace MvcStationeryManagementSystem.Controllers
{
    public class EmployeeController : Controller
    {
        //
        // GET: /Employee/
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
        private EmployeeModel em = new EmployeeModel();
        public ActionResult Index()
        {
            return View();
        }

        //Upload imeges
        [HttpPost]
        public ActionResult ProcessUpload(HttpPostedFileBase fileUpload)
        {
            if (fileUpload.ContentLength > 0)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/Upload"), fileName);
                fileUpload.SaveAs(path);
            }
            return View();
        }

        [HttpGet]
        public ActionResult AddEmployee()
        {
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewData["dsrole"] = em.ListRole();
            return View("AddEmployee");
        }
        public ActionResult IdenEmail(string id)
        {
            string email = "";
            var rs2 = dcs.Employees.Where(dd => dd.Email == id).ToList();
            if (rs2.Count > 0)
            {
                email += "Email " + "<b>" + id + "</b>" + " has been used!";
            }
            else {
                email += "";
            }
            Response.Write(email);
            return null;
        }

        public ActionResult Identical(string id)
        {
            string str = "";
            var rs = dcs.Employees.Where(ee=>ee.EmployeeNumber==id).ToList();
            if (rs.Count > 0)
            {
                str += "<b>" + id + "</b>" + " already exists! Please choose another name";
            }
            else if (!em.CheckAlphaNumeric(id)==true)
            {
                str += "Character invalid !";
            }
            else
            {
                str += "";
            }
            Response.Write(str);
            return null;
        }

        [HttpPost]
        public ActionResult AddEmployee(string EmployeeNumber, string fullname, DateTime dateBirth, string email, string address, string phone, string images, int roleid, string password, string RegistrationNumber, HttpPostedFileBase fileUpload)
        {
                if (fileUpload.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/Upload"), fileName);
                    fileUpload.SaveAs(path);
                }
                em.ThemTK(EmployeeNumber, fullname, DateTime.Now, dateBirth, email, address, phone, fileUpload.FileName, roleid, mahoa_giaima.maHoa(password), RegistrationNumber);
                Response.Write("<script type='text/javascript'>alert('Add Account successfull')</script>");    
                Response.Write("<script type='text/javascript'>window.location.href = '/Employee/ManageEmployee';</script>");
                return null;
            //return RedirectToAction("ManageEmployee");
        }



        //Ket thuc Tao employee
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ManageEmployee(string employee)
        {
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login", "Default1");
            }
           
            //ViewData["ListAccount"] = em.ListEmployee().Where(e=>e.RegistrationNumber.Equals(eml.EmployeeNumber));
           
            Employee eml = (Employee)Session["Employee"];
            if (eml.RoleId != 1)
            {
                ViewData["ListAccount"] = dcs.Employees.OrderByDescending(e => e.DateBuild).Where(e => e.RegistrationNumber.Equals(eml.EmployeeNumber)).ToList();
            }
            else
            {
                ViewData["ListAccount"] = dcs.Employees.OrderByDescending(e => e.DateBuild).ToList();
            }
            string str = "";
            var ds = em.Total().Count;
            str += ds;
            ViewData["countrs"] = str;
            return View("ManageEmployee");
        }

        public ActionResult Role(int id)
        {
            ViewData["dsrole"] = em.ListRole();
            return View();
        }
        public ActionResult EditEmployee(string id)
        {
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewData["info"] = em.info(id);
            ViewData["dsreg"] = em.ListRegistr(id);
            Session["em"] = em.ListRegistr1(id);
            Employee ll = (Employee)Session["em"];
            ViewData["dsreg1"] = em.ListRegistr2().ToList();

           
            return View("EditEmployee");
        }

        public ActionResult ProcessingEmployee(string EmployeeNumber, string FullName, string Email, string Address, DateTime DateBirth, string Phone, string Images, string RegistrationNumber, HttpPostedFileBase fileUpload)
        {
            HttpPostedFileBase uploadedFile = Request.Files["fileUpload"];
            if (uploadedFile.ContentLength == 0)
            {
                em.EditEm(EmployeeNumber, FullName, DateTime.Now, Email, Address, DateBirth, Phone, uploadedFile.FileName, RegistrationNumber);
                return RedirectToAction("ManageEmployee");
            }
            if (uploadedFile.ContentLength > 0)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/Upload"), fileName);
                fileUpload.SaveAs(path);
                em.EditEm(EmployeeNumber, FullName, DateTime.Now, Email, Address, DateBirth, Phone, uploadedFile.FileName, RegistrationNumber);
            }
            //em.EditEm(EmployeeNumber, FullName, Email, Address, DateBirth, Phone, fileUpload.FileName, RegistrationNumber);
            return RedirectToAction("ManageEmployee");
        }

        public ActionResult RemoveEmployee(string id)
        {
            ViewData["re"] = em.info(id);
            return View("RemoveEmployee");
        }

        public ActionResult Delete(string id)
        {
            Employee el = (Employee)Session["Employee"];
            if (el.EmployeeNumber.Equals(id))
            {
                Response.Write("<script type='text/javascript'>alert('Can not delete this account')</script>");
                Response.Write("<script type='text/javascript'>window.location.href = '/Employee/ManageEmployee';</script>");
                return null;
            }
            em.DeleteEmployee(id);
            return RedirectToAction("ManageEmployee");
        }


        public ActionResult Detail(string id)
        {
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewData["ct"] = em.ttct(id);
            //return View("Detail");
            return View();
        }

        public ActionResult BackSubmit()
        {
            string str = "";
            var rs = em.Total().Count();
            str += rs;
            ViewData["countrs"] = str;
            ViewData["ListAccount"] = em.ListEmployee();
            return View("ManageEmployee");
        }

        public ActionResult Search(string employee)
        {
            if (Session["Employee"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                ViewData["ListAccount"] = em.SearchEmloyee(employee).ToList();
                //dem ket qua tim thay
                string str = "";
                string strs = "";
                var rs = em.SearchEmloyee(employee).Count();
                var ds = em.Total().Count;
                if (ds == rs)
                {
                    ViewData["total"] = "Enter the username to search...";
                    strs+= ds;
                    ViewData["countrs"] = strs;
                    return View("ManageEmployee");
                }
                str += "with " + rs + " results for keywords " + "<b>" + employee + "</b>";
                ViewData["total"] = str;
                //dem tong tai khoan

                strs += ds;
                ViewData["countrs"] = strs;
                return View("ManageEmployee");
            }
        }

        
        public ActionResult CountRS(string id)
        {
            string str = "";
            var rs = em.SearchEmloyee(id).Count();
            str += "Co " +rs+ "ket qua cho tu khoa" + id;
            Response.Write(str);
            return null;
        }
        public ActionResult Search2(string id)
        {

            if (id == null)
            {
                Response.Write("");
                return null;
            }
            List<Employee> ds = new List<Employee>();
            EmployeeModel bm = new EmployeeModel();
            ds = bm.ListEmployeeSearch(id);
            string result = "";
            foreach (Employee b in ds)
            {
                 result = "<tr>";
                result += "<td>" + b.EmployeeNumber + "</td>";
                result += "<td>" + b.FullName + "</td>";
                result += "<td>" + b.Address + "</td>";
                result += "<td>" + b.Phone + "</td>";
                result += "<td><a href='/Employee/ProcessingEmployee/" + b.EmployeeNumber + "'>Edit</a> | <a href='/Employee/Delete/" + b.EmployeeNumber + "'>Delete</a> | <a href='Employee/Detail/" + b.EmployeeNumber + "'>Detail</a></td>";
                //"<td><a href='/Stationery/ProcessUpdate/" + s.ProductId + "'>Edit</a>|<a href='/Stationery/DeleteStationery/" + s.ProductId + "'>Delete</a></td>";

                result += "</tr>";
            }
           
            Response.Write(result);
            return null;
        }

        public ActionResult HienThiDanhSach(int id)
        {
            Response.Write(em.Dsach(id));
            return null;
        }


    }
}
