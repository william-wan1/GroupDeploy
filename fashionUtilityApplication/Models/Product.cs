using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace fashionUtilityApplication.Models
{
    public class Product
    {
        [ScaffoldColumn(false)]
        public int ProductID { get; set; }

        [Required, StringLength(80), Display(Name = "Name")]
        public string ProductName { get; set; }

        [Required, StringLength(360), Display(Name = "Product Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [StringLength(100), Display(Name = "Company")]
        public string Company { get; set; }

        [StringLength(256), Display(Name = "Product Size")]
        public string Size { get; set; }

        [StringLength(160), Display(Name = "Product Color")]
        public string Color { get; set; }

        [Required]
        public string ImagePath { get; set; }

        [Required, Display(Name = "Price")]
        public double? UnitPrice { get; set; }

        public int? CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public int? GenderID { get; set; }

        public virtual Gender Gender { get; set; }
    }
}