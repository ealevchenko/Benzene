namespace EFBenzene.Concrete
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using EFBenzene.Entities;

    public partial class EFWEBDbContext : DbContext
    {
        public EFWEBDbContext()
            : base("name=WEB")
        {
        }


        public virtual DbSet<BenzineSales> BenzineSales { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
