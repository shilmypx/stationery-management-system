using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Common;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
namespace MvcStationeryManagementSystem.Models
{
    public class StationeryModel
    {
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private Stationery sta = new Stationery();
        public List<Stationery> ListStationery()
        {
            return dct.Stationeries.OrderByDescending(s=>s.ProductId).ToList();
        }
        public List<Cataloge> ListCataloge()
        {
            return dct.Cataloges.ToList();
        }
        public Stationery staInfomation(int id)
        {
            return dct.Stationeries.Where(st => st.ProductId == id).First();
        }
        public void insert(string ProductName, double Rate, int Quantity, double Arise, int CatalogeId, string Description)
        {
            sta.ProductName = ProductName;
            sta.Rate =Convert.ToDecimal( Rate);
            sta.Quantity = Convert.ToInt32(Quantity);
            sta.CatalogeId = Convert.ToInt32(CatalogeId);
            sta.Arise = Convert.ToDecimal(Arise);
            sta.Description = Description;
            dct.Stationeries.InsertOnSubmit(sta);
            dct.SubmitChanges();
        }
        //public void Delete(int id)
        //{
           
        //        Stationery sta = dct.Stationeries.Where(st => st.ProductId.Equals(id)).First();
        //        dct.Stationeries.DeleteOnSubmit(sta);
        //        dct.SubmitChanges();
          
         

        //}

        public void Edit(int id, string ProductName, double Rate, int Quantity, double Arise, int CatalogeId, string Description)
        {
            Stationery sta = dct.Stationeries.Where(st => st.ProductId == id).ToList().First();
            sta.ProductName = ProductName;
            sta.Rate = Convert.ToDecimal(Rate);
            sta.Quantity = Convert.ToInt32(Quantity);
            sta.Arise=Convert.ToDecimal(Arise);
            sta.CatalogeId = Convert.ToInt32(CatalogeId);
            sta.Description = Description;
            dct.SubmitChanges();

        }
        public int count()
        {
            int tas = dct.Stationeries.Count();

            return tas;
            
        }
        public List<Stationery> search(string ProductName)
        {
            List<Stationery> ls = null; 
            try
            {
            ls =  dct.Stationeries.Where(n => n.ProductName.Trim().ToLower().Contains(ProductName.Trim().ToLower())).ToList();
            
            }
            catch
            {
            }
            return ls;
        }
       
        public decimal count3()
        {
            decimal sumLineTotal = (from od in dct.Stationeries
                                    select od.Rate).Sum() ?? 0;
            return sumLineTotal;
        }

        public decimal thue()
        {
            decimal kq = 0;
           
            decimal a = Convert.ToDecimal(sta.Rate);
            decimal b = Convert.ToDecimal(sta.Arise);
            kq=Math.Round((b*a)/100,2);
            return kq;
        }
    }
}
