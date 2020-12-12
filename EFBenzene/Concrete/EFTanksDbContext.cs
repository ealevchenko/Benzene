namespace EFBenzene.Concrete
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using EFBenzene.Entities;

    public partial class EFTanksDbContext : DbContext
    {
        public EFTanksDbContext()
            : base("name=TANKS")
        {
        }

        public virtual DbSet<T1> T1 { get; set; }
        public virtual DbSet<T2> T2 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS15_T1Density_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T1>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductDensity_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS15_T2Density_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductLevel_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductMass_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductVolume_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS15_T2Volume_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2Temperature_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2TotalLevel_NUMERICID)
                .IsUnicode(false);

            modelBuilder.Entity<T2>()
                .Property(e => e.SIEMENS1200_PLC1_DATA_TANKS_Tank2WaterLevel_NUMERICID)
                .IsUnicode(false);
        }
    }
}