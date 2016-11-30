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
        int bill_no=1;

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Sales(tb_SalesOrder pr)
        {
            var result = from p in db.tb_SalesOrder select p;
            result = result.Where(p => p.Bill_No == pr.Bill_No);
            return View(result);

        }
      /*  public ActionResult Salesnew()
        {

            return View(db.tb_SalesOrder.Where(p => p.Bill_No == bill_no).OrderByDescending(p => p.ID_Product).ToList());

        }
        */


        public ActionResult AddorEdit( tb_SalesOrder pr)
        {
            
            
            // Add new
            if (pr.ID_Product == 0)
            {
                tb_SalesOrder pro = new tb_SalesOrder();
                pro.Name_Product = pr.Name_Product;
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
                var update = db.tb_SalesOrder.Find(pr.ID_Product);

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

            return RedirectToAction("Sales", "Sales_Sales");
        }

        public ActionResult Delete(int id)
        {
            var delete = db.tb_SalesOrder.Where(p => p.ID_Product == id).First();
            db.tb_SalesOrder.Remove(delete);
            db.SaveChanges();

            return RedirectToAction("Sales", "Sales_Sales");
        }

        public ActionResult Add(int id)
        {
            tb_Sales pro = new tb_Sales();
            List<tb_SalesOrder> list = new List<tb_SalesOrder>();
            list = db.tb_SalesOrder.ToList();
            List<tb_SalesOrder>.Enumerator e  = list.GetEnumerator();

            
            foreach (var items in list)
            {
                if (items.Bill_No == id) {
                    pro.Bill_No = items.Bill_No;
                    pro.Code_Product = items.Code_Product;
                    pro.Customer = items.Customer;
                    pro.Date = items.Date;
                    pro.Employee = items.Employee;
                    //pro.ID_Product = item.ID_Product;
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