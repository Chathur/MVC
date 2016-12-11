using Project_MVC5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class HR_CustomersController : Controller
    {
        Demo_onlineEntities db = new Demo_onlineEntities();
        // GET: HR_Customers
        public ActionResult Index()
        {
            return View();
        }

    }
}