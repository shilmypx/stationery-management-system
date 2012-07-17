using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace MvcStationeryManagementSystem.Models
{
    public class EmployeeModel
    {
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();

        public List<Employee> ListEmployee()
        {
            return dcs.Employees.OrderByDescending(e => e.DateBuild.Value).ToList();
        }

        public List<Employee>Total()
        {
            return dcs.Employees.ToList();
        }

        public List<Role> ListRole()
        {
            return dcs.Roles.Where(e=>e.RoleId>1).ToList();
        }

       
       public List<Employee> ListRegistr(string id)
        {
            return dcs.Employees.Where(eml=>eml.EmployeeNumber==id).ToList();
        }
       public List<Employee> ListRegistr2()
       {
           return dcs.Employees.Where(e=>e.RoleId==2).ToList();
       }
       public Employee ListRegistr1(string id)
       {
           return dcs.Employees.Where(eml => eml.EmployeeNumber == id).ToList().First();
       }

        public List<Employee> chonquyen(string id)
        {
            return dcs.Employees.Where(e => e.RoleId == 2 || e.RoleId == 3).ToList();
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
            try
            {
                Employee el = dcs.Employees.Where(e => e.EmployeeNumber == id).First();
                dcs.Employees.DeleteOnSubmit(el);
                dcs.SubmitChanges();
            }
            catch
            { 
            
            }
        }

        public List<Employee> SearchEmloyee(string employee)
        {
             return dcs.Employees.Where(e => e.EmployeeNumber.Trim().ToLower().Contains(employee.Trim().ToLower())).ToList();
        }

        public List<Employee> ListEmployeeSearch(string keysearch)
        {
            return this.dcs.Employees.Where(b => b.EmployeeNumber.ToLower().Contains(keysearch.Trim().ToLower())).ToList();
        }

        public int idemployee(int id)
        {
            int a = 0;
            if(id == 3 )
            {
                a = 2;
            }
            if(id == 2)
            {
                a = 1;
            }
            return a;
        }
        
        public string Dsach(int id)
        {
            List<Employee> ls = new List<Employee>();
            string chuoi = " ";

            ls = dcs.Employees.Where(el =>el.RoleId==idemployee(id)).ToList();
            foreach(Employee e in ls )
            {
                chuoi += "<option value='"+e.EmployeeNumber+"'>"+e.EmployeeNumber+"</option>";
            }
            return chuoi;
        }

        public bool CheckAlphaNumeric(string id)
        {
            try
            {
                return Regex.Match(id.Trim(), @"^[a-zA-Z0-9]*$").Success;
            }
            catch
            {
                
            }
            return true;
        }


    }
}
