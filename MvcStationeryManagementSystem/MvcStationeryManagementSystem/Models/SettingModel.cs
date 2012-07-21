using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcStationeryManagementSystem.Models;

namespace MvcStationeryManagementSystem.Models
{
    public class ConfigModel
    {
        private DataClassesStationeryDataContext dcs = new DataClassesStationeryDataContext();
        

        public void AddConfig(string mailname, string mailnetwork, string password, string ports, string type, DateTime builddate, string description)
        {
            Config c = new Config();
            c.MailName = mailname;
            c.MailNetwork = mailnetwork;
            c.Password = password;
            c.Ports = ports;
            c.Type = type;
            c.BuildDate = builddate;
            c.Description = description;
            dcs.Configs.InsertOnSubmit(c);
            dcs.SubmitChanges();
        }

        public void Edit(int id, string mailname, string mailnetwork, string ports, string type, DateTime builddate, string description)
        {
            Config c = dcs.Configs.Where(eml => eml.Id == id).FirstOrDefault();
            c.MailName = mailname;
            c.MailNetwork = mailnetwork;
            c.Ports = ports;
            c.Type = type;
            c.BuildDate = builddate;
            c.Description = description;
            dcs.SubmitChanges();
        }

        public Config InfoSet(int id)
        {
            return dcs.Configs.Where(e => e.Id==id).FirstOrDefault();
        }

        public void Delete(int id)
        {
            Config set = dcs.Configs.Where(i => i.Id == id).FirstOrDefault();
            dcs.Configs.DeleteOnSubmit(set);
            dcs.SubmitChanges();
        }

    }
}
