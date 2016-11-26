using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_MVC5.Models;
using System.Data.Entity;
using System.Data;

namespace Project_MVC5.Controllers
{
    public class Sales_DirectSalesController : Controller
    {
        Demo_onlineEntities db = new Demo_onlineEntities();

        // GET: Sales_DirectSales
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShowCart()
        {
            return View(db.tb_Cart.ToList());
        }
        public ActionResult AddorEdit(tb_Cart ca)
        {
            tb_Cart cart = new tb_Cart();
            tb_Product pro = new tb_Product();
            // prox to reduce the quantity from stores
            var prox = db.tb_Product.Where(p => p.Name_Product == ca.Name_Product).First();



            prox.Quantity = (prox.Quantity - ca.Quantity);
            db.Entry(prox).State = EntityState.Modified;

            cart.Name_Product = ca.Name_Product;
            cart.Price = ca.Price;
            cart.Quantity = ca.Quantity;
            
            db.tb_Cart.Add(cart);
            db.SaveChanges();
            

            return RedirectToAction("ShowCart", "Sales_DirectSales");

        }
        public ActionResult Delete(int id)
        {
            var delete = db.tb_Cart.Where(p => p.ID_Product == id).First();
            //newValue to add the items back to stores
            var newValue = db.tb_Product.Where(p => p.Name_Product == delete.Name_Product).First();
            newValue.Quantity = (newValue.Quantity + delete.Quantity);

            db.tb_Cart.Remove(delete);
            
            db.SaveChanges();
            return RedirectToAction("ShowCart", "Sales_DirectSales");
        }
    }
}