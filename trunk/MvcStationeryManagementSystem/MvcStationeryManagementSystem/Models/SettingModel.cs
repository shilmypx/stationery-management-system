using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Models
{
    public class SettingModel
    {
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
        

        public void AddConfig(string mailname, string mailnetwork, string password, string ports, string type, DateTime builddate, string description)
        {
            Setting c = new Setting();
            c.MailName = mailname;
            c.MailNetwork = mailnetwork;
            c.Password = password;
            c.Ports = ports;
            c.Type = type;
            c.BuildDate = builddate;
            c.Description = description;
            dcs.Settings.InsertOnSubmit(c);
            dcs.SubmitChanges();
        }

        public void Edit(int id, string mailname, string mailnetwork, string ports, string type, DateTime builddate, string description)
        {
            Setting c = dcs.Settings.Where(eml => eml.Id == id).FirstOrDefault();
            c.MailName = mailname;
            c.MailNetwork = mailnetwork;
            c.Ports = ports;
            c.Type = type;
            c.BuildDate = builddate;
            c.Description = description;
            dcs.SubmitChanges();
        }

        public Setting InfoSet(int id)
        {
            return dcs.Settings.Where(e => e.Id==id).FirstOrDefault();
        }

        public void Delete(int id)
        {
            Setting set = dcs.Settings.Where(i => i.Id == id).FirstOrDefault();
            dcs.Settings.DeleteOnSubmit(set);
            dcs.SubmitChanges();
        }

    }
}
