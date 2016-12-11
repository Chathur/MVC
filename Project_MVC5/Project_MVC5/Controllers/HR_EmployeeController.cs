using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_MVC5.Controllers
{
    public class HR_EmployeeController : Controller
    {
        // GET: HR_Employee
        public ActionResult Employee()
        {
            return View();
        }
    }
}