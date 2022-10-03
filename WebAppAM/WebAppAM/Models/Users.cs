using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppAM.Models
{
    public class Users
    {

        [Key]
        public long ID { get; set; }


        [Required(ErrorMessage = "Please Enter FirstName.")]
        [Display(Name = "First Name")]
        public string? FirstName { get; set; }

        [Required(ErrorMessage = "Please Enter Last Name.")]
        [Display(Name = "Last Name")]
        public string? LastName { get; set; }

        [Required(ErrorMessage = "Please Enter Email.")]
        [Display(Name = "Email")]
        public string? email { get; set; }

        [Display(Name = "Mobile No.")]
        public string? mobile { get; set; }

        [Required(ErrorMessage = "Please Enter Password.")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string? Password { get; set; }

        [Required(ErrorMessage = "Please Enter the Confirm Password.")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("Password")]
        [NotMapped]
        public string? Confirmpwd { get; set; }

        public Boolean IsActive { get; set; }
    }
}
