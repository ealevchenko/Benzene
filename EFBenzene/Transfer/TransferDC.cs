using EFBenzene.Concrete;
using EFBenzene.Concrete.DC;
using EFBenzene.Entities;
using MessageLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFBenzene.Transfer
{
    public class TransferDC
    {

        public TransferDC()
        {

        }

        /// <summary>
        /// Перенос остатков
        /// </summary>
        /// <returns></returns>
        public int TransferRemainsToDC()
        {
            try
            {
                EFTanksDbContext ef_tanks = new EFTanksDbContext();
                EFRemains_Benzene ef_remains = new EFRemains_Benzene(new EFDCDbContext());
                DateTime? start = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1, 0, 0, 0);
                DateTime stop = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, 0, 0);
                int result = 0;

                Remains_Benzene remains_dc = ef_remains.Context.Where(r => r.dt != null).OrderByDescending(r => r.id).FirstOrDefault();
                if (remains_dc != null)
                {
                    start = new DateTime(((DateTime)remains_dc.dt).AddHours(1).Year, ((DateTime)remains_dc.dt).AddHours(1).Month, ((DateTime)remains_dc.dt).AddHours(1).Day, ((DateTime)remains_dc.dt).AddHours(1).Hour, 0, 0);
                }

                //Console.WriteLine("start {0}, stop {1}", start, stop);
                while (start <= stop)
                {

                    string sql = "select * from [dbo].[get_remains_tanks](CONVERT(datetime, '" + ((DateTime)start).AddMinutes(1).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120)) ORDER BY tank";
                    List<Remains_Benzene> list = ef_tanks.Database.SqlQuery<Remains_Benzene>(sql).ToList();
                    ef_remains.Add(list);
                    int result_add = ef_remains.Save();
                    if (result_add < 0)
                    {
                        result = result_add;
                    }
                    else
                    {
                        if (result >= 0)
                        {
                            result += result_add;
                        }
                    }
                    //Console.WriteLine("Выполнил перенос на {0}, res = {1}",start, result_add);
                    start = ((DateTime)start).AddHours(1);

                }
                return result;
            }
            catch (Exception e)
            {
                String.Format("Ошибка выполнения метода TransferRemainsToDC()").SaveError(e);
                return -1;
            }
        }
        /// <summary>
        /// Перенос среднесуточных
        /// </summary>
        /// <returns></returns>
        public int TransferDailyReportToDC()
        {
            try
            {
                EFWEBDbContext ef_web = new EFWEBDbContext();
                EFDaily_Report_Benzene ef_deily = new EFDaily_Report_Benzene(new EFDCDbContext());
                DateTime? start = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1, 0, 0, 0);
                DateTime stop = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                int result = 0;

                Daily_Report_Benzene daily = ef_deily.Context.Where(d => d.start_dt != null).OrderByDescending(d => d.start_dt).FirstOrDefault();
                if (daily != null)
                {
                    start = new DateTime(((DateTime)daily.start_dt).AddDays(1).Year, ((DateTime)daily.start_dt).AddDays(1).Month, ((DateTime)daily.start_dt).AddDays(1).Day, 0, 0, 0);
                }

                Console.WriteLine("start {0}, stop {1}", start, stop);

                while (start < stop)
                {
                    DateTime start_select = (DateTime)start;
                    DateTime stop_select = new DateTime((start_select).Year, (start_select).Month, (start_select).Day, 23, 59, 59); ;

                    string sql = "select * from [dbo].[get_daily_tank1_of_interval](CONVERT(datetime, '" + (start_select).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + (stop_select).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                    List<Daily_Report_Benzene> list = ef_web.Database.SqlQuery<Daily_Report_Benzene>(sql).ToList();
                    ef_deily.Add(list);
                    sql = "select * from [dbo].[get_daily_tank2_of_interval](CONVERT(datetime, '" + (start_select).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + (stop_select).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                    list = ef_web.Database.SqlQuery<Daily_Report_Benzene>(sql).ToList();
                    ef_deily.Add(list);
                    int result_add = ef_deily.Save();
                    if (result_add < 0)
                    {
                        result = result_add;
                    }
                    else
                    {
                        if (result >= 0)
                        {
                            result += result_add;
                        }
                    }
                    Console.WriteLine("Выполнил перенос c {0} по {1}, res = {2}", start_select, stop_select, result_add);
                    start = (start_select).AddDays(1);

                }
                return result;
            }
            catch (Exception e)
            {
                String.Format("Ошибка выполнения метода TransferDailyReportToDC()").SaveError(e);
                return -1;
            }
        }
        /// <summary>
        /// Перенос выдач
        /// </summary>
        /// <returns></returns>
        public int TransferSalesBenzineToDC()
        {
            try
            {
                EFWEBDbContext ef_web = new EFWEBDbContext();
                EFSales_Benzine ef_sales = new EFSales_Benzine(new EFDCDbContext());
                DateTime start = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1, 0, 0, 0);
                DateTime stop = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);

                Sales_Benzine sales = ef_sales.Context.Where(d => d.start != null).OrderByDescending(d => d.start).FirstOrDefault();
                if (sales != null)
                {
                    start = sales.start.AddMinutes(1);
                }

                Console.WriteLine("start {0}, stop {1}", start, stop);

                string sql = "select * from [dbo].[get_sales_of_interval](CONVERT(datetime, '" + (start).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + (stop).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120))";
                List<Sales_Benzine> list = ef_web.Database.SqlQuery<Sales_Benzine>(sql).ToList();
                ef_sales.Add(list);
                int result_add = ef_sales.Save();
                Console.WriteLine("Выполнил перенос c {0} по {1}, res = {2}", start, stop, result_add);
                return result_add;
            }
            catch (Exception e)
            {
                String.Format("Ошибка выполнения метода TransferSalesBenzineToDC()").SaveError(e);
                return -1;
            }
        }
    }
}
