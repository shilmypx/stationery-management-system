using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class StationeryModelcs
    {
        private DataClassesStationeryDataContext dcsd = new DataClassesStationeryDataContext();
        //list of Stationery
        public List<Stationery> ListStationery()
        {
            return dcsd.Stationeries.ToList(); 
        }

        //tra ve 1 doi tuong stationery

        public Stationery stati(int id)
        {
            return dcsd.Stationeries.Where(st => st.ProductId == id).FirstOrDefault();
        }
    }
}
