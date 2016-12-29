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
        WICKRAMA_STORESEntities db = new WICKRAMA_STORESEntities();

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

            if (ca.ITEM_ID == 0) // Add new
            {
               tb_Cart cart = new tb_Cart();
               //prox to reduce the quantity from stores
               var prox = db.ITEMS.Where(p => p.Name_Item== ca.Name_Item).First();
              prox.STOCK_LEVEL = prox.STOCK_LEVEL -(int) ca.QUANTITY;
               int ? newValue = (int)prox.STOCK_LEVEL;
               db.Entry(prox).State = EntityState.Modified;

                if (newValue <= prox.MIN_MIN_STOCK_LEVEL) // minimum stock level
                {
                    Email(prox);
                }

               cart.Name_Item = ca.Name_Item;
               cart.UNIT_PRICE = ca.UNIT_PRICE;
               cart.QUANTITY = ca.QUANTITY;

               db.tb_Cart.Add(cart);
               
            }
            else
            {
                var update = db.tb_Cart.Find(ca.ITEM_ID);
                
                update.Name_Item = ca.Name_Item;
                update.UNIT_PRICE = ca.UNIT_PRICE;
                update.QUANTITY = ca.QUANTITY;
                update.Total = ca.Total;
            }

            db.SaveChanges();
            return RedirectToAction("ShowCart", "Sales_DirectSales");

        }
        public ActionResult Delete(int id)
        {
            var delete = db.tb_Cart.Where(p => p.ITEM_ID == id).First();
            //newValue to add the items back to stores
            var newValue = db.ITEMS.Where(p => p.Name_Item == delete.Name_Item).First();
            newValue.STOCK_LEVEL = newValue.STOCK_LEVEL + (int)delete.QUANTITY;

            db.tb_Cart.Remove(delete);
            
            db.SaveChanges();
            return RedirectToAction("ShowCart", "Sales_DirectSales");
        }

        public ActionResult Clear()
        {
            db.Database.ExecuteSqlCommand("TRUNCATE TABLE [tb_Cart]");
            
            db.SaveChanges();
            return RedirectToAction("ShowCart", "Sales_DirectSales");
        }

        // new Email Sending method

        public void Email(ITEMS prox)
        {

                string smtpUserName = "creedsadun94@gmail.com";
                string smtpPassword = ""; //enter Email Password
                string smtpHost = "smtp.gmail.com";
                int smtpPort = 25;
                
                string emailTo = "thamasha@northshore.edu.lk";
                string subject = "Stores Notification";
                string body = "This is an ERP test <br/> "+prox.Name_Item+" sold out";

                Project_MVC5.Models.EmailService newService = new Models.EmailService();

                bool kq = newService.Send(smtpUserName, smtpPassword, smtpHost, smtpPort, emailTo, subject, body);

            
        }
    }
}