using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppAM.Models
{
    public class AgreementContext : DbContext
    {
        public AgreementContext(DbContextOptions<AgreementContext> options):base(options)
        {

        }

        public DbSet<Agreement> AgreementMaster { get; set; }
        public DbSet<ProductGroup> ProductGroupMaster { get; set; }
        public DbSet<Product> ProductMaster { get; set; }

        public DbSet<Users> UserMaster { get; set; }

    }
}
