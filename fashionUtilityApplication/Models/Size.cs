using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace fashionUtilityApplication.Models
{
    public class Size
    {
        [ScaffoldColumn(false)]
        public int SizeID { get; set; }

        [Required, StringLength(100), Display(Name = "Gender")]
        public string SizeName { get; set; }

        [Display(Name = "Product Description")]
        public string Description { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}