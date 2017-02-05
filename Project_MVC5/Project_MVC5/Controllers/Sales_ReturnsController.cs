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

    }
}