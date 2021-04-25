namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Remains_Benzene
    {
        public int id { get; set; }

        public int tank { get; set; }

        public DateTime? dt { get; set; }

        public double? dens { get; set; }

        public double? dens15 { get; set; }

        public double? level { get; set; }

        public double? mass { get; set; }

        public double? volume { get; set; }

        public double? volume15 { get; set; }

        public double? temp { get; set; }

        public double? total_level { get; set; }

        public double? water_level { get; set; }
    }
}
