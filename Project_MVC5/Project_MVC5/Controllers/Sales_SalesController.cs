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
        WICKRAMA_STORESEntities db = new WICKRAMA_STORESEntities();
       
        int page_index = 1;

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Sales(tb_SalesOrder model)
        {
            
            if (!string.IsNullOrEmpty(model.SearchButton) || model.Page.HasValue)
            {
                int RecordsPerPage = 500;
                
                var results = db.tb_SalesOrder
                    .Where(p => (p.Bill_No.Equals(model.Bill_No)
                                ))
                     .OrderBy(p => p.Sales_order_id);

                var pageIndex = model.Page ?? 1;
               

                model.SearchResults = results.ToPagedList(pageIndex, RecordsPerPage);
            }
            return View(model);

        }
       public ActionResult Salesnew(int ? id)
        {
            tb_SalesOrder pro = new tb_SalesOrder();
            var results = db.tb_SalesOrder.Where(p => p.Bill_No == id).OrderBy(p => p.Sales_order_id);
            pro.SearchResults = results.ToPagedList(page_index, 500);
            return View(pro);

        }
        


        public ActionResult AddorEdit(int id, tb_SalesOrder pr)
        {

                // Add new
                if (pr.Sales_order_id == 0)
                {
                    tb_SalesOrder pro = new tb_SalesOrder();
                    pro.Name_Product = pr.Name_Product;
                    pro.Code_Product = pr.Name_Product;
                    pro.Price = (double)pr.Price;
                    pro.Quantity = pr.Quantity;
                    pro.Bill_No = pr.Bill_No;
                    // pro.Code_Product = pr.Code_Product;
                    pro.Customer = pr.Customer;
                    pro.Date = pr.Date;
                    pro.Employee = pr.Employee;
                    db.tb_SalesOrder.Add(pro);
                }
                else
                {
                    var update = db.tb_SalesOrder.Find(pr.Sales_order_id);

                    update.Name_Product = pr.Name_Product;
                    update.Price = (double)pr.Price;
                    update.Quantity = pr.Quantity;
                    update.Bill_No = pr.Bill_No;
                    // pro.Code_Product = pr.Code_Product;
                    update.Customer = pr.Customer;
                    update.Date = pr.Date;
                    update.Employee = pr.Employee;
                }
                db.SaveChanges();

               

                return RedirectToAction("Salesnew","Sales_Sales", new { id = id });
        }

        public ActionResult Delete(int id)
        {
            var delete = db.tb_SalesOrder.Where(p => p.Sales_order_id == id).First();
            var re = delete.Bill_No;
            db.tb_SalesOrder.Remove(delete);
            db.SaveChanges();

            return RedirectToAction("Salesnew", "Sales_Sales", new { id = re});
        }

        public ActionResult Add(int id)
        {
            tb_Sales pro = new tb_Sales();
            List<tb_SalesOrder> list = new List<tb_SalesOrder>();
            list = db.tb_SalesOrder.ToList();
            

            
            foreach (var items in list)
            {
                if (items.Bill_No == id) {
                    pro.Bill_No = items.Bill_No;
                    pro.Code_Product = items.Code_Product;
                    pro.Customer = items.Customer;
                    pro.Date = items.Date;
                    pro.Employee = items.Employee;
                    pro.item_id = items.item_id;
                    pro.Name_Product = items.Name_Product;
                    pro.Price =(double)items.Price;
                    pro.Quantity = items.Quantity;
                    
                   db.tb_Sales.Add(pro);
                   db.SaveChanges();
                }

            }
            db.SaveChanges();


            return RedirectToAction("Sales", "Sales_Sales");
        }
    }
}