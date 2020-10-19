using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace fashionUtilityApplication.Models
{
    public class Custom
    {
        [ScaffoldColumn(false)]
        public int CustomID { get; set; }

        [Required, StringLength(100), Display(Name = "Gender")]
        public string CustomName { get; set; }
    }
}