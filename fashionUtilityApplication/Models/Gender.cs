using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace fashionUtilityApplication.Models
{
    public class Gender
    {
        [ScaffoldColumn(false)]
        public int GenderID { get; set; }

        [Required, StringLength(100), Display(Name = "Gender")]
        public string GenderName { get; set; }

        [Display(Name = "Product Description")]
        public string Description { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}