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
    /// <summary>
    /// Класс данных разнецы параметров емкостей
    /// </summary>
    public class view_difference_value_tanks
    {
        public int tank { get; set; }
        public DateTime? start_dt { get; set; }
        public DateTime? stop_dt { get; set; }
        public double? start_dens { get; set; }
        public double? stop_dens { get; set; }
        public double? start_dens15 { get; set; }
        public double? stop_dens15 { get; set; }
        public double? start_level { get; set; }
        public double? stop_level { get; set; }
        public double? start_mass { get; set; }
        public double? stop_mass { get; set; }
        public double? start_volume { get; set; }
        public double? stop_volume { get; set; }
        public double? start_volume15 { get; set; }
        public double? stop_volume15 { get; set; }
        public double? start_temp { get; set; }
        public double? stop_temp { get; set; }
        public double? start_water_level { get; set; }
        public double? stop_water_level { get; set; }
    }


    [RoutePrefix("api/tanks")]
    public class TanksController : ApiController
    {
        EFTanksDbContext ef_contex;
        public TanksController()
        {
            ef_contex = new EFTanksDbContext();
        }

        // GET: api/tanks/report/difference_value_tanks/start/2020-11-26T14:30:19/stop/2020-11-26T14:30:40
        /// <summary>
        /// Отчет движение бензола в емкостях
        /// </summary>
        /// <param name="start"></param>
        /// <param name="stop"></param>
        /// <returns></returns>
        [Route("report/difference_value_tanks/start/{start:datetime}/stop/{stop:datetime}")]
        [ResponseType(typeof(view_difference_value_tanks))]
        public IHttpActionResult GetDifferenceValueTanksOfInterval(DateTime start, DateTime stop)
        {
            try
            {
                //this.ef_contex.Database.CommandTimeout = 300;
                string sql = "select * from [dbo].[get_difference_value_tanks_of_interval](CONVERT(datetime, '" + start.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120)) ORDER BY tank";
                List<view_difference_value_tanks> list = this.ef_contex.Database.SqlQuery<view_difference_value_tanks>(sql).ToList();
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
