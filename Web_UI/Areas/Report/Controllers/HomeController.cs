using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_UI.Areas.report.Controllers
{
    public class HomeController : Controller
    {
        //// GET: report/Home
        //public ActionResult Index()
        //{
        //    return View();
        //}

        // Отчет по движению топлива в емкостях АЗС
        public ActionResult FuelFlowTanks()
        {
            return View();
        }

        // Остатки
        public ActionResult RemainsTanks()
        {
            return View();
        }

        // График
        public ActionResult Grafik()
        {
            return View();
        }
    }
}