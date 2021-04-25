using EFBenzene.Entities;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EFBenzene.Concrete
{
    public partial class EFDCDbContext : DbContext
    {
        public EFDCDbContext()
            : base("name=DC")
        {

        }

        public virtual DbSet<Daily_Report_Benzene> Daily_Report_Benzene { get; set; }
        public virtual DbSet<Remains_Benzene> Remains_Benzene { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

        }
    }
}
