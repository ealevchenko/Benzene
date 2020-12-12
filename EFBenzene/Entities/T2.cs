namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class T2
    {
        public int id { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductDensity_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductDensity_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductDensity_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductDensity_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS15_T2Density_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS15_T2Density_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS15_T2Density_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS15_T2Density_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductLevel_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductMass_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductMass_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductMass_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductMass_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductVolume_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductVolume_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductVolume_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2ProductVolume_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS15_T2Volume_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS15_T2Volume_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS15_T2Volume_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS15_T2Volume_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2Temperature_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2Temperature_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2Temperature_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2Temperature_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2TotalLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2TotalLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2TotalLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2TotalLevel_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank2WaterLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank2WaterLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank2WaterLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank2WaterLevel_QUALITY { get; set; }
    }
}
