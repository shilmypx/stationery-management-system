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
using System.Web.UI.MobileControls;
using System.Collections.Generic;

namespace MvcStationeryManagementSystem.Models
{
    public class RequestModel22
    {
        private DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();
        private string ENumber;

        public string ENumber1
        {
            get { return ENumber; }
            set { ENumber = value; }
        }
        private string Rname;

        public string Rname1
        {
            get { return Rname; }
            set { Rname = value; }
        }
        private string CRQName;

        public string CRQName1
        {
            get { return CRQName; }
            set { CRQName = value; }
        }
        private DateTime DDispatch;

        public DateTime DDispatch1
        {
            get { return DDispatch; }
            set { DDispatch = value; }
        }
        private DateTime DApprove;

        public DateTime DApprove1
        {
            get { return DApprove; }
            set { DApprove = value; }
        }
        private string RContent;

        public string RContent1
        {
            get { return RContent; }
            set { RContent = value; }
        }
        private string Dtion;

        public string Dtion1
        {
            get { return Dtion; }
            set { Dtion = value; }
        }
        private string Stte;

        public string Stte1
        {
            get { return Stte; }
            set { Stte = value; }
        }
        private bool Acc;

        public bool Acc1
        {
            get { return Acc; }
            set { Acc = value; }
        }
        private string RNumber;

        public string RNumber1
        {
            get { return RNumber; }
            set { RNumber = value; }
        }
        private int RId;

        public int RId1
        {
            get { return RId; }
            set { RId = value; }
        }
        public RequestModel22()
        {}
        public List<RequestModel22> Listrq2()
        {
            List<RequestModel22> listrq = new List<RequestModel22>();
            var request = from r in dc.Requests
                          join ca in dc.CatalogeRQs on r.CatalogRQId equals ca.CatalogRQId
                           join el in dc.Employees on r.EmployeeNumber equals el.EmployeeNumber

                          select new
                          {
                              RequestId=r.RequestId,
                              EmployeeNumber = r.EmployeeNumber,
                              RequestName = r.RequestName,
                              CatalogRQName = ca.CatalogRQName,
                              DateDispatch = r.DateDispatch,
                              DateApprove = r.DateApprove,
                              RequestContent = r.RequestContent,
                              Description = r.Description,
                              State = r.State,
                              Accept = r.Accept,
                              RegistrationNumber = el.RegistrationNumber
                          };
            foreach (var rr in request)
            {
                RequestModel22 obrq = new RequestModel22();
                obrq.RId = rr.RequestId;
                obrq.ENumber = rr.EmployeeNumber;
                obrq.Rname = rr.RequestName;
                obrq.CRQName = rr.CatalogRQName;
                obrq.DDispatch = Convert.ToDateTime(rr.DateDispatch);
                obrq.DApprove = Convert.ToDateTime(rr.DateApprove);
                obrq.RContent = rr.RequestContent;
                obrq.Dtion = rr.Description;
                obrq.Stte = rr.State;
                obrq.Acc = Convert.ToBoolean(rr.Accept);
                obrq.RNumber = rr.RegistrationNumber;
                listrq.Add(obrq);
            }
            return listrq;
        }

        //
        public List<RequestModel22> search(string RequestName)
        {
            List<RequestModel22> ls = null;
            try
            {
                ls = Listrq2().Where(n => n.Rname.Trim().ToLower().Contains(RequestName.Trim().ToLower())).ToList();

            }
            catch
            {
            }
            return ls;
        }
    }
}
