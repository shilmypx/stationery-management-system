using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class GiohangModel
    {
        public int Productid {get;set; }
        public string ProductName{get;set;}
        public int Quality { get; set; }
        public string Descript { get; set; }
        public int Soluong {get;set; }

    }
}
