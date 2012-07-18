using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Models
{
    public class ChangePassModel
    {
        private DataClassesStationeryDataContext dcsd = new DataClassesStationeryDataContext();
        public void changepass(string user, string pass)
        {
            Employee em = dcsd.Employees.Where(p => p.EmployeeNumber == user).First();
            em.Password = pass;
            dcsd.SubmitChanges();
        }
    }


}
