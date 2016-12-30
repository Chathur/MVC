using Project_MVC5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class PurchaseGRNController : Controller
    {
        WICKRAMA_STORESEntities db = new WICKRAMA_STORESEntities();
        // GET: PurchaseGRN
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewPurchaseGRN()
        {
            ViewBag.items = new SelectList(db.ITEMS, "Name_Item", "Name_Item");
            return View(db.ITEMS.OrderByDescending(p => p.StockId).ToList());
        }
        public ActionResult AddorEdit(ITEMS pr)
        {
            var update = db.ITEMS.Find(pr.StockId);

            update.Add_Quantity = pr.Add_Quantity;
                update.STOCK_LEVEL = (update.STOCK_LEVEL+(int)pr.Add_Quantity);

                
   
            db.SaveChanges();

            return RedirectToAction("ViewPurchaseGRN", "PurchaseGRN");
        }

        public ActionResult Delete(int id)
        {
            var delete = db.ITEMS.Where(p => p.StockId == id).First();
            db.ITEMS.Remove(delete);
            db.SaveChanges();
            return RedirectToAction("ViewPurchaseGRN", "PurchaseGRN");
        }
    }
}