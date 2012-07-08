using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class EmployeeModel
    {
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
        //private string employeeNumber;

        //public string EmployeeNumber
        //{
        //    get { return employeeNumber; }
        //    set { employeeNumber = value; }
        //}
        //private string fullname;

        //public string Fullname
        //{
        //    get { return fullname; }
        //    set { fullname = value; }
        //}
        //private DateTime datebuild;

        //public DateTime Datebuild
        //{
        //    get { return datebuild; }
        //    set { datebuild = value; }
        //}
        //private DateTime dateBirth;

        //public DateTime DateBirth
        //{
        //    get { return dateBirth; }
        //    set { dateBirth = value; }
        //}
        //private string email;

        //public string Email
        //{
        //    get { return email; }
        //    set { email = value; }
        //}
        //private string address;

        //public string Address
        //{
        //    get { return address; }
        //    set { address = value; }
        //}
        //private string phone;

        //public string Phone
        //{
        //    get { return phone; }
        //    set { phone = value; }
        //}
        //private string images;

        //public string Images
        //{
        //    get { return images; }
        //    set { images = value; }
        //}
        //private int roleId;

        //public int RoleId
        //{
        //    get { return roleId; }
        //    set { roleId = value; }
        //}
        //private string password;

        //public string Password
        //{
        //    get { return password; }
        //    set { password = value; }
        //}
        //private string registrationNumber;

        //public string RegistrationNumber
        //{
        //    get { return registrationNumber; }
        //    set { registrationNumber = value; }
        //}

        public List<Employee> ListEmployee()
        {
            return dcs.Employees.OrderByDescending(e => e.DateBuild).ToList();
        }

        public List<Role> ListRole()
        {
            return dcs.Roles.ToList();
        }


        public void role_em(string employ,int idrole)
        {
            dcs.Employees.Single(e => e.EmployeeNumber == employ);
            dcs.Roles.Where(r => r.RoleId == idrole).First();
        }
        public Employee info(string id)
        {
            return dcs.Employees.Where(en => en.EmployeeNumber==id).FirstOrDefault();
        }

        public Employee ttct(string id)
        {
            return dcs.Employees.Single(e => e.EmployeeNumber == id);
        }

        public void ThemTK(string EmployeeNumber, string fullname, DateTime datebuild, DateTime dateBirth, string email, string address, string phone, string images, int roleid, string password, string RegistrationNumber)
        {
                Employee e = new Employee();
                e.EmployeeNumber = EmployeeNumber;
                e.FullName = fullname;
                e.DateBuild = datebuild;
                e.DateBirth = dateBirth;
                e.Email = email;
                e.Address = address;
                e.Phone = phone;
                e.Images = images;
                e.RoleId = roleid;
                e.Password = password;
                e.RegistrationNumber = RegistrationNumber;
                dcs.Employees.InsertOnSubmit(e);
                dcs.SubmitChanges();
        }

        public void EditEm(string employeeNumber, string fullname, string email, string address, DateTime dateBirth, string phone, string images, string registrationNumber)
        {
            Employee e = dcs.Employees.Where(em => em.EmployeeNumber == employeeNumber).SingleOrDefault();
            e.FullName = fullname;
            e.DateBirth = dateBirth;
            e.Email = email;
            e.Address = address;
            e.Phone = phone;
            e.Images = images;
            e.RegistrationNumber = registrationNumber;
            dcs.SubmitChanges();
        }

        public void EditEmployee(string EmployeeNumber, string FullName, string Email, string Address, DateTime DateBirth, string Phone, string Images, string RegistrationNumber)
        {
            Employee em = dcs.Employees.Where(eml => eml.RegistrationNumber == EmployeeNumber).FirstOrDefault();
            em.FullName = FullName;
            em.Email = Email;
            em.Address = Address;
            em.DateBirth = DateBirth;
            em.Phone = Phone;
            em.Images = Images;
            em.RegistrationNumber = RegistrationNumber;
            dcs.SubmitChanges();
        }

        public void DeleteEmployee(string id)
        {
            Employee el = dcs.Employees.Where(e => e.EmployeeNumber==id).First();
            dcs.Employees.DeleteOnSubmit(el);
            dcs.SubmitChanges();
        }

        public List<Employee> SearchEmloyee(string employee)
        {
            return dcs.Employees.Where(e => e.EmployeeNumber.Trim().ToLower().Contains(employee.Trim().ToLower())).ToList();
        }

    }
}
