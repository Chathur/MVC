using Project_MVC5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class Sales_ReturnsController : Controller
    {
        WICKRAMA_STORESEntities db = new WICKRAMA_STORESEntities();
        // GET: Sales_Return
        public ActionResult Index()
        {
            ViewBag.products = new SelectList(db.ITEMS, "Name_Item", "Name_Item");
            return View();
        }
        public ActionResult AddorEdit(tb_SalesReturns model)
        {
            tb_SalesReturns toDB = new tb_SalesReturns();
            toDB.Bill_No = model.Bill_No;
            toDB.Name_Item = model.Name_Item;
            toDB.Quantity = model.Quantity;

            db.tb_SalesReturns.Add(toDB);

            return RedirectToAction("Index", "Sales_Returns");
        }

    }
}