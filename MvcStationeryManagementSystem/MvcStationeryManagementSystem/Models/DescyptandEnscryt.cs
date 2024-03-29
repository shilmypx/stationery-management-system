﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace MvcStationeryManagementSystem.Models
{
    

    public class DescyptandEnscryt
    {
        DataClassesStationeryDataContext dcsd = new DataClassesStationeryDataContext();
        public static string Encrypt(string stringToEncrypt)
        {
            //Encrypt Method
            FormsAuthenticationTicket tk = new FormsAuthenticationTicket(stringToEncrypt, false, 600);
            // returns encrypted string
            return FormsAuthentication.Encrypt(tk);
        }
        //Decrypt Method 
        private static string Decrypt1(string encryptedString)
        {
            //string a = "";
            //FormsAuthenticationTicket tk = FormsAuthentication.Decrypt(encryptedString);
            FormsAuthenticationTicket tk = FormsAuthentication.Decrypt(encryptedString);
            return tk.Name;
        }

        public Employee Login(string employnumber , string pass)
        {
            Employee el = new Employee();
            
            List<Employee> le = dcsd.Employees.Where(e => e.EmployeeNumber.Equals(employnumber)).ToList();
            if (le.Count == 1)
            {

                if (le.FirstOrDefault().EmployeeNumber.Equals(employnumber) && pass.Equals(mahoa_giaima.giaiMa(le.FirstOrDefault().Password)))

                {
                    el = le.FirstOrDefault();
                    HttpContext.Current.Session["username"] = employnumber;
                }
                else
                {
                    el = null;
                }
            }
            else
            {
                el = null;
            }
            return el;
        }
    }
}
