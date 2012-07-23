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
using System.Collections.Generic;

namespace MvcStationeryManagementSystem.Models
{
    public class Mystationerymodel
    {
        private int productid;

        public int Productid
        {
            get { return productid; }
            set { productid = value; }
        }
        private string productname;

        public string Productname
        {
            get { return productname; }
            set { productname = value; }
        }
        private double rate;

        public double Rate
        {
            get { return rate; }
            set { rate = value; }
        }
        private int quantity;

        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
        private double arise;

        public double Arise
        {
            get { return arise; }
            set { arise = value; }
        }
       
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public Mystationerymodel(int productid, string productname, double rate, int quantity, double arise, string description)
        {
            this.productid = productid;
            this.productname = productname;
            this.rate = rate;
            this.quantity = quantity;
            this.arise = arise;
           
            this.description = description;
        }

       
    }
}
