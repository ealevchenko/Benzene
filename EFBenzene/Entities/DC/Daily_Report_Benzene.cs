namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Daily_Report_Benzene
    {
        public int id { get; set; }

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
}
