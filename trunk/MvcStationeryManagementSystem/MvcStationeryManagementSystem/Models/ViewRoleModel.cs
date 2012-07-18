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
using System.Collections.Generic;

namespace MvcStationeryManagementSystem.Models
{
    public class ViewRoleModel
    {
        private DataClassesStationeryDataContext dcsd = new DataClassesStationeryDataContext();
        public List<Role> dsRole()
        {
            return dcsd.Roles.ToList();
        }

        public Role quyen(int id)
        {
            return dcsd.Roles.Where(r => r.RoleId == id).FirstOrDefault();
        }


        public Role ro(int id)
        {
            return dcsd.Roles.Where(r => r.RoleId.Equals(id)).FirstOrDefault();
        }
        
    }
}
