using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class ViewModel
    {
        //public List<Stationery> Statio { get; set; }
        //public List<Request_Stationery> RS { get; set; }
        //public List<Request> rq { get; set; }
        private DataClassesStationeryDataContext dtds = new DataClassesStationeryDataContext();
        private Stationery st;

        public Stationery St
        {
            get { return st; }
            set { st = value; }
        }
        public Request_Stationery rs { get; set; }
        public Request rq { get; set; }


        private List<Stationery> Listds;

        public List<Stationery> Listds1
        {
            get { return dtds.Stationeries.ToList(); }
            set { Listds = value; }
        }

      
        

    }
}
