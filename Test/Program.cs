using EFBenzene.Concrete;
using EFBenzene.Transfer;
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
            //EFTanksDbContext ef_web = new EFTanksDbContext();
            //try
            //{
            //    string sql = "EXEC [dbo].[Transfer_Remains_Benzene]";
            //    int res = ef_web.Database.ExecuteSqlCommand(sql);
            //    Console.WriteLine("Ок ? res {0}", res);
            //}
            //catch (Exception e)
            //{
            //    //String.Format("Ошибка выполнения метода Transfer_Daily_Report_Benzene()").SaveError(e);
            //    Console.WriteLine(e);
            //}

            TransferDC tr = new TransferDC();
            int result = tr.TransferRemainsToDC();

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
