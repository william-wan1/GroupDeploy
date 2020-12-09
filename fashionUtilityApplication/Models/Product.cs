using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace fashionUtilityApplication.Models
{
    public class Product
    {
        [ScaffoldColumn(false)]
        public int ProductID { get; set; }

        [Required, StringLength(60), Display(Name = "Name")]
        public string ProductName { get; set; }

        [Required, StringLength(260), Display(Name = "Product Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Required]
        public string ImagePath { get; set; }

        [Required, Display(Name = "Price")]
        public double? UnitPrice { get; set; }

        public int? CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public int? GenderID { get; set; }

        public virtual Gender Gender { get; set; }
        public int? SizeID { get; set; }

        public virtual Size Size { get; set; }
        public int? ColorID { get; set; }

        public virtual Color Color { get; set; }
        public int? CompanyID { get; set; }

        public virtual Company Company { get; set; }
    }
}