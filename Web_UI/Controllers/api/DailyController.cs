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
    public class daily
    {
        //public int tank { get; set; }

        public DateTime? start_dt { get; set; }

        public DateTime? stop_dt { get; set; }

        public double? start_volume { get; set; }

        public double? start_volume15 { get; set; }

        public double? start_mass { get; set; }

        public double? start_dens { get; set; }

        public double? start_dens15 { get; set; }

        public double? stop_volume { get; set; }

        public double? stop_volume15 { get; set; }

        public double? stop_mass { get; set; }

        public double? stop_dens { get; set; }

        public double? stop_dens15 { get; set; }

        public double? dispensing_volume { get; set; }

        public double? dispensing_volume15 { get; set; }

        public double? dispensing_mass { get; set; }

        public double? dispensing_dens { get; set; }

        public double? dispensing_dens15 { get; set; }

        public double? deliverys_volume { get; set; }

        public double? deliverys_volume15 { get; set; }

        public double? deliverys_mass { get; set; }

        public double? deliverys_dens { get; set; }

        public double? deliverys_dens15 { get; set; }
    }

    public class daily_detali
    {
        public int tank { get; set; }

        public DateTime? start_dt { get; set; }

        public DateTime? stop_dt { get; set; }

        public double? start_volume { get; set; }

        public double? start_volume15 { get; set; }

        public double? start_mass { get; set; }

        public double? start_dens { get; set; }

        public double? start_dens15 { get; set; }

        public double? stop_volume { get; set; }

        public double? stop_volume15 { get; set; }

        public double? stop_mass { get; set; }

        public double? stop_dens { get; set; }

        public double? stop_dens15 { get; set; }

        public double? dispensing_volume { get; set; }

        public double? dispensing_volume15 { get; set; }

        public double? dispensing_mass { get; set; }

        public double? dispensing_dens { get; set; }

        public double? dispensing_dens15 { get; set; }

        public double? deliverys_volume { get; set; }

        public double? deliverys_volume15 { get; set; }

        public double? deliverys_mass { get; set; }

        public double? deliverys_dens { get; set; }

        public double? deliverys_dens15 { get; set; }
    }

    [RoutePrefix("api/web")]
    public class DailyController : ApiController
    {
        EFWEBDbContext ef_contex;

        public DailyController()
        {
            ef_contex = new EFWEBDbContext();
        }

        // GET: api/web/report/daily/all/start/2021-04-16T00:00:00/stop/2021-04-16T23:59:59
        /// <summary>
        /// Суточный отчет общий
        /// </summary>
        /// <param name="start"></param>
        /// <param name="stop"></param>
        /// <returns></returns>
        [Route("report/daily/all/start/{start:datetime}/stop/{stop:datetime}")]
        [ResponseType(typeof(daily))]
        public IHttpActionResult GetDailyOfInterval(DateTime start, DateTime stop)
        {
            try
            {
                //this.ef_contex.Database.CommandTimeout = 300;
                string sql = "select * from [dbo].[get_daily_tanks_of_interval](CONVERT(datetime, '" + start.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                List<daily> list = this.ef_contex.Database.SqlQuery<daily>(sql).ToList();
                //this.ef_contex.Database.CommandTimeout = null;
                return Ok(list);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        // GET: api/web/report/daily/detali/start/2021-04-16T00:00:00/stop/2021-04-16T23:59:59
        /// <summary>
        /// Суточный отчет общий
        /// </summary>
        /// <param name="start"></param>
        /// <param name="stop"></param>
        /// <returns></returns>
        [Route("report/daily/detali/start/{start:datetime}/stop/{stop:datetime}")]
        [ResponseType(typeof(daily_detali))]
        public IHttpActionResult GetDailyDetaliOfInterval(DateTime start, DateTime stop)
        {
            try
            {
                //this.ef_contex.Database.CommandTimeout = 300;
                string sql = "select * from [dbo].[get_daily_tank1_of_interval](CONVERT(datetime, '" + start.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                sql = sql + " UNION ";      
                sql = sql + "select * from [dbo].[get_daily_tank2_of_interval](CONVERT(datetime, '" + start.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                List<daily_detali> list = this.ef_contex.Database.SqlQuery<daily_detali>(sql).ToList();
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
