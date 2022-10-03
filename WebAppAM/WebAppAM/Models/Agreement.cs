using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppAM.Models
{
    public class Agreement
    {
        [Key]
        public long ID { get; set; }

        public long? UserID { get; set; }

        [Required]
        public long PrdGroupID { get; set; }

        [Required]
        public long ProductID { get; set; }

        [DataType(DataType.DateTime), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayName("Effective Date")]
        public DateTime? EffectiveDate { get; set; }

        [DataType(DataType.DateTime), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayName("Expiry Date")]
        public DateTime? ExpirationDate { get; set; }

        public Decimal? ProductPrice { get; set; }

        public Decimal? NewPrice { get; set; }

        [NotMapped]
        public String GroupDescription { get; set; }

        [NotMapped]
        public String ProductDescription { get; set; }

    }
}
