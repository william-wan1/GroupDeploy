using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace fashionUtilityApplication.Models
{
    public class Company
    {
        [ScaffoldColumn(false)]
        public int CompanyID { get; set; }

        [Required, StringLength(100), Display(Name = "Name")]
        public string CompanyName { get; set; }

        [Display(Name = "Product Description")]
        public string Description { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}