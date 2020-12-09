using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace fashionUtilityApplication.Models
{
    public class Color
    {
        [ScaffoldColumn(false)]
        public int ColorID { get; set; }

        [Required, StringLength(100), Display(Name = "Name")]
        public string ColorName { get; set; }

        [Display(Name = "Product Description")]
        public string Description { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}