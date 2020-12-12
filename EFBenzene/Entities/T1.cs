namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class T1
    {
        public int id { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductDensity_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS15_T1Density_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS15_T1Density_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS15_T1Density_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS15_T1Density_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductLevel_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductMass_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1ProductVolume_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS15_T1Volume_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1Temperature_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1TotalLevel_QUALITY { get; set; }

        [StringLength(64)]
        public string SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_NUMERICID { get; set; }

        public double? SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_VALUE { get; set; }

        public DateTime? SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_TIMESTAMP { get; set; }

        public short? SIEMENS1200_PLC1_DATA_TANKS_Tank1WaterLevel_QUALITY { get; set; }
    }
}
