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
using System.Net.Mail;

namespace MvcStationeryManagementSystem.Models
{
    public class RequestModel
    {
        private DataClassesStationeryDataContext dc = new DataClassesStationeryDataContext();
        private int CRQId;

        public int CRQId1
        {
            get { return CRQId; }
            set { CRQId = value; }
        }
        private int RId;
        public int RId1
        {
            get { return RId; }
            set { RId = value; }
        }

        private string FName;

        public string FName1
        {
            get { return FName; }
            set { FName = value; }
        }
        
        private string ENumber;

        public string ENumber1
        {
            get { return ENumber; }
            set { ENumber = value; }
        }
        private string RName;

        public string RName1
        {
            get { return RName; }
            set { RName = value; }
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

       
        public RequestModel()
        { }
        //chi duoc anh xa co so du lieu len thoi 
        public List<RequestModel> ListRQ()
        {
            List<RequestModel> Listr = new List<RequestModel>();
            var requests = from r in dc.Requests
                           join ca in dc.CatalogeRQs on r.CatalogRQId equals ca.CatalogRQId
                           join el in dc.Employees on r.EmployeeNumber equals el.EmployeeNumber
                          select new
                          {
                              CatalogRQId=ca.CatalogRQId,
                              RequestId=r.RequestId,
                              EmployeeNumber=r.EmployeeNumber,
                              FullName=el.FullName,
                              RequestName = r.RequestName,
                              CatalogRQName = ca.CatalogRQName,
                              DateDispatch = r.DateDispatch,
                              DateApprove = r.DateApprove,
                              RequestContent=r.RequestContent,
                              Description=r.Description,
                              State=r.State,
                              Accept=r.Accept
                          };
            foreach (var rr in requests)
            {
                RequestModel obrq = new RequestModel();
                obrq.CRQId1 = rr.CatalogRQId;
                obrq.RId = rr.RequestId;
                obrq.ENumber = rr.EmployeeNumber;
                obrq.FName = rr.FullName;
                obrq.RName = rr.RequestName;
                obrq.CRQName = rr.CatalogRQName;
                obrq.DDispatch = Convert.ToDateTime(rr.DateDispatch);
                obrq.DApprove = Convert.ToDateTime(rr.DateApprove);
                obrq.RContent = rr.RequestContent;
                obrq.Dtion = rr.Description;
                obrq.Stte = rr.State;
                obrq.Acc = Convert.ToBoolean(rr.Accept);
                Listr.Add(obrq);
            }
            return Listr;
        }
        public RequestModel Infomation(int rqid)
        {
         //   Request_StationeryModel rs = new Request_StationeryModel();
            RequestModel r = new RequestModel();
            return r.ListRQ().Where(l => l.RId == rqid).ToList().First(); 
            
        }
        public void update(int requestid,string rname,string st,DateTime dd, DateTime da,bool acc, string rc, string en, string dt, int ctid)
        {
            Request rq = dc.Requests.Where(r => r.RequestId == requestid).ToList().First();
            rq.RequestName = rname;
            rq.State = st;
            rq.DateDispatch = dd;
            rq.DateApprove = da;
            rq.Accept = acc;
            rq.RequestContent = rc;
            rq.EmployeeNumber = en;
            rq.Description = dt;
            rq.CatalogRQId = ctid;
            dc.SubmitChanges();
        }
        public bool Send(string from, string to, string cc, string subject, string messeage, string smtp, int post, string netw, string pass)
        {
            bool bl;
            try
            {
                MailMessage nmsg = new MailMessage();
                nmsg.From = new MailAddress(from);
                nmsg.To.Add(to);
                nmsg.CC.Add(cc);
                nmsg.Subject = subject;
               // nmsg.Body = messeage;
                nmsg.Body = "<html><body>"+messeage;
                nmsg.Body += "</body></html>";
                nmsg.IsBodyHtml = true;
                nmsg.Priority = MailPriority.High;
               // nmsg.BodyEncoding = Encoding.UTF8;//Nội dung có dấu
                //newMail.SubjectEncoding = Encoding.UTF8;//Tiêu đề có dấu
               
                //newMail.IsBodyHtml = true;//Chấp nhận code HTML/
                SmtpClient smtpc = new SmtpClient(smtp, post);
                smtpc.Credentials = new System.Net.NetworkCredential(netw, pass);
                smtpc.EnableSsl = true;
                smtpc.SendAsync(nmsg, null);
                bl = true;
            }
            catch
            {
                bl = false;
            }
            return bl;
        }
    }
}
