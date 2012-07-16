using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class CatalogeRQModel
    {
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private CatalogeRQ rq = new CatalogeRQ();
        public List<CatalogeRQ> list()
        {
            return dct.CatalogeRQs.OrderByDescending(s => s.CatalogRQId).ToList();
        
        }
        public CatalogeRQ infomation(int id)
        {
            return dct.CatalogeRQs.Where(s => s.CatalogRQId == id).First();
        }
        public void add(string CatalogRQName)
        {
            rq.CatalogRQName = CatalogRQName;
            dct.CatalogeRQs.InsertOnSubmit(rq);
            dct.SubmitChanges();
        }
        public void Edit(int CatalogRQId, string CatalogRQName)
        {
            CatalogeRQ ca = dct.CatalogeRQs.Where(c => c.CatalogRQId == CatalogRQId).FirstOrDefault();
            //ca.CatalogRQId = CatalogRQId;
            ca.CatalogRQName = CatalogRQName;
            dct.SubmitChanges();
        }
        public void delete(int id)
        {
            CatalogeRQ r = dct.CatalogeRQs.Where(l => l.CatalogRQId == id).First();
            dct.CatalogeRQs.DeleteOnSubmit(r);
            dct.SubmitChanges();
        }
        public bool KT(string CatalogeName)
        {
            var k = dct.CatalogeRQs.Where(s => s.CatalogRQName.Equals(CatalogeName)).ToList();
            if (k.Count() == 1)
                return true;
            return false;
        }
        public int count()
        {
            int k = dct.CatalogeRQs.Count();
            return k;

        }
        public List<CatalogeRQ> search(string CatalogRQName)
        {
            List<CatalogeRQ> ls = null;
            try
            {
                ls = dct.CatalogeRQs.Where(n => n.CatalogRQName.Trim().ToLower().Contains(CatalogRQName.Trim().ToLower())).ToList();
            }
            catch
            {
            }
            return ls;
        }

    }
}
