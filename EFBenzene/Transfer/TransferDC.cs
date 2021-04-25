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
        
        public TransferDC() { 
        
        }

        public int TransferRemainsToDC() {
            try
            {
                EFTanksDbContext ef_tanks = new EFTanksDbContext();
                EFRemains_Benzene ef_remains = new EFRemains_Benzene(new EFDCDbContext());
                DateTime? start = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1, 0, 0, 0); 
                DateTime stop = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, 0, 0);

                Remains_Benzene remains_dc = ef_remains.Context.OrderByDescending(r => r.id).FirstOrDefault();
                if (remains_dc != null)
                {
                    start = new DateTime(((DateTime)remains_dc.dt).AddHours(1).Year, ((DateTime)remains_dc.dt).AddHours(1).Month, ((DateTime)remains_dc.dt).AddHours(1).Day, ((DateTime)remains_dc.dt).AddHours(1).Hour, 0, 0);
                }

                while (start <= stop)
                {
                    //Console.WriteLine("start {0}, stop {1}", start, stop);
                    string sql = "select * from [dbo].[get_difference_value_tanks_of_interval](CONVERT(datetime, '" + ((DateTime)start).ToString("yyyy-MM-dd HH:mm:ss") + "' ,120), CONVERT(datetime, '" + stop.ToString("yyyy-MM-dd HH:mm:ss") + "' ,120)) ORDER BY tank";
                    List<Remains_Benzene> list = ef_tanks.Database.SqlQuery<Remains_Benzene>(sql).ToList();
                    ef_remains.Add(list);
                    start = ((DateTime)start).AddHours(1);

                }
                int result_add = ef_remains.Save();
                //Console.WriteLine("Ок ? res {0}", res);
                return result_add;
            }
            catch (Exception e)
            {
                String.Format("Ошибка выполнения метода TransferRemainsToDC()").SaveError(e);
                return -1;
            }
        }
    }
}
