using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStationeryManagementSystem.Models;

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

        [HttpGet]
        public ActionResult AddEmployee()
        {
            ViewData["dsrole"] = em.ListRole();
            return View("AddEmployee");
        }


        [HttpPost]
        public ActionResult AddEmployee(string EmployeeNumber, string fullname, DateTime datebuild, DateTime dateBirth, string email, string address, string phone, int roleid, string password, string RegistrationNumber)
        {
            em.ThemTK(EmployeeNumber, fullname, datebuild, dateBirth, email, address, phone, roleid, password, RegistrationNumber);
            return RedirectToAction("ManageEmployee", "Employee");

        }


        //Ket thuc Tao employee
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ManageEmployee()
        {
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
            ViewData["dsrole"] = em.ListRole();
            //ViewData["new"] = am.ro();
            //ViewData["employe"] = id;
            return View("EditEmployee");
        }

        public ActionResult ProcessingEmployee(string employeeNumber)
        {
            em.EditEm(employeeNumber);
            //ViewData["ListAccount"] = em.ListEmployee();
            return RedirectToAction("ManageEmployee", "Employee");
        }

        public ActionResult RemoveEmployee(string id)
        {
            //em.DeleteEmployee(id);
            ViewData["re"] = em.info(id);
            return View("RemoveEmployee");
        }

        public ActionResult Delete(string employ)
        {
            em.DeleteEmployee(employ);
            return View("ManageEmployee");
        }

        public ActionResult Detail(string id)
        {
            ViewData["ct"] = em.ttct(id);
            return View("Detail");
        }


    }
}
