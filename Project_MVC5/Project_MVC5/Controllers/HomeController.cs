using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Sales()
        {
            return View();
        }
        

        public ActionResult Purchase()
        {
            return View();
        }

        public ActionResult Payments()
        {
            return View();
        }
        public ActionResult Reports()
        {
            return View();
        }
        public ActionResult HumanResource()
        {
            return View();
        }
        public ActionResult Stock()
        {
            return View();
        }
    }
}