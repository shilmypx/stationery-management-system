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
        private SettingModel cm = new SettingModel();

        public void AddConfig(int id, string mailname, string mailnetwork, string password, string ports, string type, DateTime builddate, string description)
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

    }
}
