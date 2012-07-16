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
            ViewData["dsrole"] = em.ListRole();
            return View("AddEmployee");
        }

        [HttpPost]
        public ActionResult AddEmployee(string EmployeeNumber, string fullname, DateTime datebuild, DateTime dateBirth, string email, string address, string phone, string images, int roleid, string password, string RegistrationNumber, HttpPostedFileBase fileUpload)
        {
            DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
            var rs = dcs.Employees.Where(e => e.EmployeeNumber == EmployeeNumber).ToList();
            if (rs.Count > 0)
            {
                ViewData["id"] = rs.Equals(EmployeeNumber);
                return View("Identical");
            }
            else
            {
                if (fileUpload.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/Upload"), fileName);
                    fileUpload.SaveAs(path);
                }
                em.ThemTK(EmployeeNumber, fullname, datebuild, dateBirth, email, address, phone, fileUpload.FileName, roleid, mahoa_giaima.maHoa(password), RegistrationNumber);
                return RedirectToAction("ManageEmployee");
            }
        }



        //Ket thuc Tao employee
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ManageEmployee(string employee)
        {
            //ViewData["rss"] = em.SearchEmloyee(employee).ToList();
            ViewData["ListAccount"] = em.ListEmployee();
            
            return View("ManageEmployee");
        }

        public ActionResult Role(int id)
        {
            ViewData["dsrole"] = em.ListRole();
            // ViewData["new"] = am.ro();
            return View();
        }
        public ActionResult Role1()
        {
            //AccountModel am = new AccountModel();
            return View();
        }
        public ActionResult EditEmployee(string id)
        {
            ViewData["info"] = em.info(id);
            //ViewData["dsrole"] = em.ListRole();
            return View("EditEmployee");
        }

        public ActionResult ProcessingEmployee(string EmployeeNumber, string FullName, string Email, string Address, DateTime DateBirth, string Phone, string Images, string RegistrationNumber)
        {
            em.EditEm(EmployeeNumber, FullName, Email, Address, DateBirth, Phone, Images, RegistrationNumber);
            //ViewData["proc"] = em.ListEmployee();
            return RedirectToAction("ManageEmployee");
        }

        public ActionResult RemoveEmployee(string id)
        {
            //em.DeleteEmployee(id);
            ViewData["re"] = em.info(id);
            return View("RemoveEmployee");
        }

        public ActionResult Delete(string id)
        {
            em.DeleteEmployee(id);
            return RedirectToAction("ManageEmployee");
            //View("ManageEmployee");
        }


        public ActionResult Detail(string id)
        {
            ViewData["ct"] = em.ttct(id);
            //return View("Detail");
            return View();
        }

        public ActionResult Search(string employee)
        {
            ViewData["ListAccount"] = em.SearchEmloyee(employee).ToList();
            return View("ManageEmployee");
        }

    }
}
