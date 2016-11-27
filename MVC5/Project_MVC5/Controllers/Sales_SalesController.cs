using Project_MVC5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace Project_MVC5.Controllers
{
    public class Sales_SalesController : Controller
    {
        // GET: Sales_Sales
        Demo_onlineEntities db = new Demo_onlineEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Sales(tb_SalesOrder model)
        {
            const int RecordsperPage = 500;
            if (!string.IsNullOrEmpty(model.SearchButton) || model.Page.HasValue)
            {
                var entities = new Demo_onlineEntities();
                var results = entities.tb_SalesOrder.Where(p => (p.Bill_No == model.Bill_No)).OrderBy(p => p.ID_Product);
                var pageIndex = model.Page ?? 1;

                model.SearchResults = results.ToPagedList(pageIndex, RecordsperPage);

            }
            return View(model);
        }

        public ActionResult AddorEdit(tb_Sales pr)
        {

            // Add new

            tb_Sales pro = new tb_Sales();
            pro.Name_Product = pr.Name_Product;
            pro.Price = pr.Price;
            pro.Quantity = pr.Quantity;
            pro.Bill_No = pr.Bill_No;
            // pro.Code_Product = pr.Code_Product;
            pro.Customer = pr.Customer;
            pro.Date = pr.Date;
            pro.Employee = pr.Employee;
            db.tb_Sales.Add(pro);



            db.SaveChanges();

            return RedirectToAction("Sales", "Sales_Sales");
        }

        public ActionResult Delete(int id)
        {
            var delete = db.tb_SalesOrder.Where(p => p.ID_Product == id).First();
            db.tb_SalesOrder.Remove(delete);
            db.SaveChanges();

            return RedirectToAction("Sales", "Sales_Sales");
        }

        public ActionResult Add(int id,tb_SalesOrder order)
        {
            tb_Sales pro = new tb_Sales();
            
            
            var newValue = db.tb_Sales.Where(p => p.Bill_No == id).GetEnumerator();

            for (var item = newValue.Current; newValue.Current != null; newValue.MoveNext())
            {
                
               
                    pro.Bill_No = order.Bill_No;
                    pro.Code_Product = item.Code_Product;
                    pro.Customer = item.Customer;
                    pro.Date = item.Date;
                    pro.Employee = item.Employee;
                    //pro.ID_Product = item.ID_Product;
                    pro.Name_Product = item.Name_Product;
                    pro.Price = item.Price;
                    pro.Quantity = item.Quantity;
                    db.tb_Sales.Add(pro);


            }

            db.SaveChanges();

            return RedirectToAction("Sales", "Sales_Sales");
        }
    }
}