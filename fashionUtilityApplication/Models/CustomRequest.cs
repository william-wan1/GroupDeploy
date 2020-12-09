using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.ComponentModel;


namespace fashionUtilityApplication.Models
{
    public class CustomRequest
    {
        [ScaffoldColumn(false)]
        public int CustomRequestID { get; set; }

        public System.DateTime OrderDate { get; set; }

        public string Username { get; set; }

        [Required(ErrorMessage = "Email Address is required")]
        [DisplayName("Email Address")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",
            ErrorMessage = "Email is not valid.")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        public string ImageDesignPath { get; set; }

        public string UrlName { get; set; }

        public int? CustomID { get; set; }

        public virtual Custom Custom { get; set; }
        public int? SizeID { get; set; }

        public virtual Size Size { get; set; }

        public int Quantity { get; set; }


    }
}