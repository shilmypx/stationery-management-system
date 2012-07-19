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
    public class Request_StationeryModel
    {
        private DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();
        private int RqId;

        public int RqId1
        {
            get { return RqId; }
            set { RqId = value; }
        }
        private int PdId;

        public int PdId1
        {
            get { return PdId; }
            set { PdId = value; }
        }
        private int Qty;

        public int Qty1
        {
            get { return Qty; }
            set { Qty = value; }
        }
        private double Ar;

        public double Ar1
        {
            get { return Ar; }
            set { Ar = value; }
        }
        private string Dtion;

        public string Dtion1
        {
            get { return Dtion; }
            set { Dtion = value; }
        }
        private string PName;

        public string PName1
        {
            get { return PName; }
            set { PName = value; }
        }
        private int CtalogId;

        public int CtalogId1
        {
            get { return CtalogId; }
            set { CtalogId = value; }
        }
        private string CtalogeName;

        public string CtalogeName1
        {
            get { return CtalogeName; }
            set { CtalogeName = value; }
        }
        private double Rte;

        public double Rte1
        {
            get { return Rte; }
            set { Rte = value; }
        }
        public Request_StationeryModel()
        {}
        
        public List<Request_StationeryModel> ListR_S(int rqid)
        {
            List<Request_StationeryModel> l = new List<Request_StationeryModel>();
            var r_ss = from rs in dc.Request_Stationeries
                       join st in dc.Stationeries on rs.ProductId equals st.ProductId
                       join cl in dc.Cataloges on st.CatalogeId equals cl.CatalogeId
                       where rs.RequestId==rqid
                       select new { 
                                    RequestId=rs.RequestId,
                                    ProductId=rs.ProductId,
                                    Quantity=rs.Quantity,
                                    Rate = rs.Rate,


                                    //Arise=rs.Arise,

                                    Description=rs.Description,
                                    CatalogeId=cl.CatalogeId,
                                    CatalogeName=cl.CatalogeName,
                                    ProductName=st.ProductName
                       };
            foreach (var r in r_ss)
            {
                Request_StationeryModel obrq = new Request_StationeryModel();
                obrq.RqId = r.RequestId;
                obrq.PdId = r.ProductId;
                obrq.Qty = r.Quantity;
                obrq.Rte = Convert.ToDouble(r.Rate);

                //obrq.Ar = Convert.ToDouble(r.Arise);

                obrq.Dtion = r.Description;
                obrq.CtalogId = r.CatalogeId;
                obrq.CtalogeName = r.CatalogeName;
                obrq.PName= r.ProductName;
                
                l.Add(obrq);
            }
            return l;
            
        }


       //them  gio hang 
        public void inserdata(Request rs)
        {
            dc.Requests.InsertOnSubmit(rs);
            dc.SubmitChanges();
        }
        //them vao bang thu 2
        public void insert2(Request_Stationery rs1)
        {
            dc.Request_Stationeries.InsertOnSubmit(rs1);
            dc.SubmitChanges();

        }
        //delete request_stationery
        public bool DeleteRQ_st(int id)
        {
            bool rs = false;
            try
            {
                Request_Stationery rsr = dc.Request_Stationeries.Where(r => r.RequestId == id).First();
                dc.Request_Stationeries.DeleteOnSubmit(rsr);
                dc.SubmitChanges();
                rs = true;
            }
            catch
            {
                rs = false;
            }
            return rs;
        }
    }

}
