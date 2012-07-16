using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcStationeryManagementSystem.Models
{
    public class CatalogeModel
    {
        private DataClassesStationeryDataContext dct = new DataClassesStationeryDataContext();
        private Cataloge ct = new Cataloge();
        public List<Cataloge> Listcataloge()
        {
            return dct.Cataloges.OrderByDescending(c => c.CatalogeId).ToList();
        }
        public Cataloge infomation(int id)
        {
            return dct.Cataloges.Where(c => c.CatalogeId == id).First();
        }
        public void add(string CatalogeName)
        {
            ct.CatalogeName = CatalogeName;
            dct.Cataloges.InsertOnSubmit(ct);
            dct.SubmitChanges();
        }
        public void Edit(int id,string CatalogeName)
        {
            Cataloge ca = dct.Cataloges.Where(c => c.CatalogeId == id).First();
            ca.CatalogeId = Convert.ToInt32(id);
            ca.CatalogeName = CatalogeName;
            dct.SubmitChanges();
        }
        public void delete(int id)
        {
            Cataloge ca = dct.Cataloges.Where(c => c.CatalogeId == id).First();
            dct.Cataloges.DeleteOnSubmit(ca);
            dct.SubmitChanges();
        
        }
        public bool KT(string CatalogeNAme)
        {
            var k = dct.Cataloges.Where(s => s.CatalogeName == CatalogeNAme).ToList();
            if (k.Count == 1)
                return true;
            return false;
        }
        public int count1()
        {
            int a= dct.Cataloges.Count();
            return a;
        }
        public List<Cataloge> search(string CatalogeName)
        {
            List<Cataloge> ls = null;
            try
            {
                ls = dct.Cataloges.Where(n => n.CatalogeName.Trim().ToLower().Contains(CatalogeName.Trim().ToLower())).ToList();
            }
            catch
            {
            }
            return ls;
        }


    }
}
