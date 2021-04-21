using EFBenzene.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    class Program
    {
        static void Main(string[] args)
        {
            EFWEBDbContext ef_web = new EFWEBDbContext();
            try
            {
                string sql = "EXEC [dbo].[Transfer_Daily_Report_Benzene]";
                int res = ef_web.Database.ExecuteSqlCommand(sql);
            }
            catch (Exception e)
            {
                //String.Format("Ошибка выполнения метода Transfer_Daily_Report_Benzene()").SaveError(e);
            }
        }
    }
}
