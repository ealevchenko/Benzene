namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Sales_Benzine
    {
        public int id { get; set; }

        [StringLength(50)]
        public string user { get; set; }

        [StringLength(20)]
        public string tara_number { get; set; }

        [StringLength(50)]
        public string sap_supply { get; set; }

        public DateTime start { get; set; }

        public DateTime? stop { get; set; }

        public double? start_temp_1 { get; set; }

        public double? start_temp_2 { get; set; }

        public int? start_level_1 { get; set; }

        public int? start_level_2 { get; set; }

        public double? start_volume_1 { get; set; }

        public double? start_volume_2 { get; set; }

        public double? start_volume15_1 { get; set; }

        public double? start_volume15_2 { get; set; }

        public double? start_mass_1 { get; set; }

        public double? start_mass_2 { get; set; }

        public double? stop_temp_1 { get; set; }

        public double? stop_temp_2 { get; set; }

        public int? stop_level_1 { get; set; }

        public int? stop_level_2 { get; set; }

        public double? stop_volume_1 { get; set; }

        public double? stop_volume_2 { get; set; }

        public double? stop_volume15_1 { get; set; }

        public double? stop_volume15_2 { get; set; }

        public double? stop_mass_1 { get; set; }

        public double? stop_mass_2 { get; set; }

        public bool? stoped { get; set; }

        public double? outed_volume { get; set; }

        public double? outed_volume15 { get; set; }

        public double? outed_mass { get; set; }

        public double? outed_temp { get; set; }

        public double? outed_dens { get; set; }

        public double? outed_dens15 { get; set; }

        public int? outed_level_1 { get; set; }

        public int? outed_level_2 { get; set; }

        [Required]
        [StringLength(4)]
        public string outed_tank { get; set; }

        public DateTime? close { get; set; }

        public DateTime? send { get; set; }
    }
}
