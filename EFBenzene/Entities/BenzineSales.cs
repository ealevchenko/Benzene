namespace EFBenzene.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BenzineSales
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string ResponsPerson { get; set; }

        [StringLength(20)]
        public string TaraNumber { get; set; }

        public DateTime OUTStartDT { get; set; }

        public double? StartCounterVolume { get; set; }

        public double? StartCounterMass { get; set; }

        public double? StartT1Temperature { get; set; }

        public double? StartT2Temperature { get; set; }

        public int? StartT1Lvl { get; set; }

        public int? StartT2Lvl { get; set; }

        public double? StartT1Volume { get; set; }

        public double? StartT2Volume { get; set; }

        public double? StartT1Volume15 { get; set; }

        public double? StartT2Volume15 { get; set; }

        public double? StartT1Mass { get; set; }

        public double? StartT2Mass { get; set; }

        public DateTime? OUTEndDT { get; set; }

        public double? EndCounterVolume { get; set; }

        public double? EndCounterMass { get; set; }

        public int? EndT1Lvl { get; set; }

        public int? EndT2Lvl { get; set; }

        public double? EndT1Volume { get; set; }

        public double? EndT2Volume { get; set; }

        public double? EndT1Volume15 { get; set; }

        public double? EndT2Volume15 { get; set; }

        public double? EndT1Mass { get; set; }

        public double? EndT2Mass { get; set; }

        public double? EndT1Temperature { get; set; }

        public double? EndT2Temperature { get; set; }

        public bool? ThisEmergencyStopped { get; set; }

        public double? OutedVolume { get; set; }

        public double? OutedVolume15 { get; set; }

        public double? OutedMass { get; set; }

        public double? OutedTemp { get; set; }

        [StringLength(50)]
        public string SAPsupply { get; set; }

        public DateTime? closeDT { get; set; }

        public DateTime? SAPsend { get; set; }
    }
}
