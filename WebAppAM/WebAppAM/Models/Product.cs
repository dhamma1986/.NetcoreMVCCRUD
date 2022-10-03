using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppAM.Models
{
    public class Product
    {
        [Key]
        public long ID { get; set; }

        public long ProdGroupID { get; set; }

        public String ProductDescription { get; set; }

        public String ProductNumber { get; set; }

        public Decimal Price { get; set; }

        public Boolean IsActive { get; set; }

    }
}
