using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppAM.Models
{
    public class ProductGroup
    {
        [Key]
        public long ID { get; set; }
        public String GroupDescription { get; set; }
        public String GroupCode { get; set; }
        public Boolean IsActive { get; set; }

    }
}
