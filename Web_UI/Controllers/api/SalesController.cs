using EFBenzene.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace Web_UI.Controllers.api
{
    public class sales_value
    {
        public int id { get; set; }
        public string user { get; set; }
        public string tara_number { get; set; }
        public string sap_supply { get; set; }
        public DateTime start { get; set; }
        public DateTime? stop { get; set; }
        public double? start_temp_1 { get; set; }
        public double? start_temp_2 { get; set; }
        public int? start_level_1 { get; set; }
        public int? start_level_2 { get; set; }
        public double? start_volume_1 { get; set; }
        public double? start_volume_2 { get; set; }
        public double? start_volume15_1 { get; set; }
        public double? start_volume15_2 { get; set; }
        public double? start_mass_1 { get; set; }
        public double? start_mass_2 { get; set; }
        public double? stop_temp_1 { get; set; }
        public double? stop_temp_2 { get; set; }
        public int? stop_level_1 { get; set; }
        public int? stop_level_2 { get; set; }
        public double? stop_volume_1 { get; set; }
        public double? stop_volume_2 { get; set; }
        public double? stop_volume15_1 { get; set; }
        public double? stop_volume15_2 { get; set; }
        public double? stop_mass_1 { get; set; }
        public double? stop_mass_2 { get; set; }
        public bool? stoped { get; set; }
        public double? outed_volume { get; set; }
        public double? outed_volume15 { get; set; }
        public double? outed_mass { get; set; }
        public double? outed_temp { get; set; }
        public double? outed_dens { get; set; }
        public double? outed_dens15 { get; set; }
        public int? outed_level_1 { get; set; }
        public int? outed_level_2 { get; set; }
        public string outed_tank { get; set; }
        public DateTime? close { get; set; }
        public DateTime? send { get; set; }
    }

    [RoutePrefix("api/web")]
    public class SalesController : ApiController
    {
        EFWEBDbContext ef_contex;
        public SalesController()
        {
            ef_contex = new EFWEBDbContext();
        }

        // GET: api/web/report/fuel_sales/start/2020-11-24T00:00:00/stop/2020-11-24T23:59:59
        /// <summary>
        /// Отчет движение бензола в емкостях
        /// </summary>
        /// <param name="start"></param>
        /// <param name="stop"></param>
        /// <returns></returns>
        [Route("report/fuel_sales/start/{start:datetime}/stop/{stop:datetime}")]
        [ResponseType(typeof(sales_value))]
        public IHttpActionResult GetFuelSalesOfInterval(DateTime start, DateTime stop)
        {
            try
            {
                //this.ef_contex.Database.CommandTimeout = 300;
                string sql = "select * from [dbo].[get_sales_of_interval](CONVERT(datetime, '" + start.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120)) ORDER BY id";
                List<sales_value> list = this.ef_contex.Database.SqlQuery<sales_value>(sql).ToList();
                //this.ef_contex.Database.CommandTimeout = null;
                return Ok(list);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
