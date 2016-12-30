using Microsoft.Ajax.Utilities;
using Project_MVC5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class Sales_SalesOrderController : Controller
    {
        // GET: Sales_SalesOrder
        WICKRAMA_STORESEntities db = new WICKRAMA_STORESEntities();
        string custo = " ";
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SalesOrder(int ? id)

        {
           
            ViewBag.route = new SelectList(db.Route, "Route_id", "Route_desc");
            ViewBag.customer = new SelectList(db.tb_Customer.Where(p=>p.Route_Customer==id), "Name_Customer", "Name_Customer"+"Route_Customer");
            ViewBag.product = new SelectList(db.ITEMS, "Name_Item", "Name_Item");
            return View(db.tb_SalesOrder.OrderByDescending(p => p.item_id).ToList());
        }

        public IList<tb_Customer> Getcustomer(int id)
        {
            custo = db.tb_Customer.Where(m => m.Route_Customer == id).ToString(); 
            return db.tb_Customer.Where(m =>m.Route_Customer == id).ToList();

        }

        public ActionResult GetCustomers(string id)
        {
            List<SelectListItem> customers = new List<SelectListItem>();
            var customerList = this.Getcustomer(Convert.ToInt32(id));
            
            var customerData = customerList.Select(m => new SelectListItem()
            {
                Text = m.Name_Customer,
                Value = m.Name_Customer.ToString()
            });

            return RedirectToAction("SalesOrder", "Sales_SalesOrder");
        }
        [HttpPost]
        public ActionResult Index(FormCollection formdata)
        {
            // Get Employee information to insert into Data Base
            return RedirectToAction("SalesOrder", "Sales_SalesOrder");
        }

        public ActionResult AddorEdit(tb_SalesOrder pr)
        {

            // Add new
            
                tb_SalesOrder pro = new tb_SalesOrder();
                pro.Name_Product = pr.Name_Product;
                pro.Code_Product = pr.Name_Product;
                pro.Price = pr.Price;
                pro.Quantity = pr.Quantity;
                pro.Bill_No = pr.Bill_No;
                // pro.Code_Product = pr.Code_Product;
                pro.Customer = pr.Customer;
                pro.Date = pr.Date;
                pro.Employee = pr.Employee;
            
                db.tb_SalesOrder.Add(pro);
          
        

            db.SaveChanges();

            return RedirectToAction("SalesOrder", "Sales_SalesOrder");
        }

        public ActionResult Delete(int id)
        {
            var delete = db.tb_SalesOrder.Where(p => p.Sales_order_id == id).First();
            db.tb_SalesOrder.Remove(delete);
            db.SaveChanges();
            
            return RedirectToAction("SalesOrder", "Sales_SalesOrder");
        }
        

    }
}