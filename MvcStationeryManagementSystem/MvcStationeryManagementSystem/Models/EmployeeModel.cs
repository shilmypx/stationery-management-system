using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class EmployeeModel
    {
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
        private string EmployeeNumber;

        public string EmployeeNumber1
        {
            get { return EmployeeNumber; }
            set { EmployeeNumber = value; }
        }
        private string fullname;

        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }

        private DateTime datebuild;

        public DateTime Datebuild
        {
            get { return datebuild; }
            set { datebuild = value; }
        }

        private DateTime dateBirth;

        public DateTime DateBirth
        {
            get { return dateBirth; }
            set { dateBirth = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private int roleid;

        public int Roleid
        {
            get { return roleid; }
            set { roleid = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string RegistrationNumber;

        public string RegistrationNumber1
        {
            get { return RegistrationNumber; }
            set { RegistrationNumber = value; }
        }

        public List<Employee> ListEmployee()
        {
            return dcs.Employees.OrderByDescending(e => e.DateBuild).ToList();
        }

        public List<Role> ListRole()
        {
            return dcs.Roles.ToList();
        }

        public void ComboRole(string employee, int roleid)
        {
            dcs.Employees.Where(em => em.RoleId == roleid).First();
            dcs.Employees.Where(r => r.EmployeeNumber == employee).First();
        }

        public Role ro(int idrole)
        {
            return dcs.Roles.Where(r => r.RoleId == idrole).ToList().First();
        }
        public Employee info(string id)
        {
            return dcs.Employees.Where(en => en.EmployeeNumber.Equals(id)).First();
        }

        public Employee ttct(string id)
        {
            return dcs.Employees.Single(e => e.EmployeeNumber == id);
        }

        public void ThemTK(string EmployeeNumber, string fullname, DateTime datebuild, DateTime dateBirth, string email, string address, string phone, int roleid, string password, string RegistrationNumber)
        {
            Employee e = new Employee();
            e.EmployeeNumber = EmployeeNumber;
            e.FullName = fullname;
            e.DateBuild = datebuild;
            e.DateBirth = dateBirth;
            e.Email = email;
            e.Address = address;
            e.Phone = phone;
            e.RoleId = roleid;
            e.Password = password;
            e.RegistrationNumber = RegistrationNumber;
            dcs.Employees.InsertOnSubmit(e);
            dcs.SubmitChanges();
        }

        public void EditEm(string employeeNumber)
        {
            Employee e = dcs.Employees.Single(em => em.EmployeeNumber.Equals(employeeNumber));
            e.FullName = fullname;
            e.DateBirth = Convert.ToDateTime(dateBirth);
            e.Email = email;
            e.Address = address;
            e.Phone = phone;
            e.RoleId = roleid;
            e.Password = password;
            e.RegistrationNumber = RegistrationNumber;
            dcs.SubmitChanges();
        }

        public void DeleteEmployee(string id)
        {
            Employee el = dcs.Employees.Where(e => e.EmployeeNumber == id).First();
            dcs.Employees.DeleteOnSubmit(el);
            dcs.SubmitChanges();

        }
    }
}
