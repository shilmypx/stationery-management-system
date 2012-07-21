using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class RoleModel
    {
        DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        //private
        public List<Role> ListRole()
        {
            return dct.Roles.OrderByDescending(s=>s.RoleId).ToList();
        }
        public Role ClickRole(int id)
        {
            return dct.Roles.Where(i => i.RoleId.Equals(id
)).First();
        }
        public void UDate(int role,string rname, double Amount)
        {
            Role r = dct.Roles.Where(r2=>r2.RoleId==role).ToList().First();
            r.Amount = Convert.ToDecimal(Amount);
            r.RoleName = rname;
            dct.SubmitChanges();
        }
       

    }
}
