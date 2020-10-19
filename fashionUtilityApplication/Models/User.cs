using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace fashionUtilityApplication.Models
{
    public class User
    {
       
        [ScaffoldColumn(false)]
        [Required]
        public String ID { get; set; }

        [Required, StringLength(100), Display(Name = "Username")]
        public string Username { get; set; }

        [Required, Display(Name = "Email Address")]
        public string EmailAddress { get; set; }

        [Required, Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }

        public User(String Id, String Username, String EmailAddress, String PhoneNumber)
        {
            this.ID = Id;
            this.Username = Username;
            this.EmailAddress = EmailAddress;
            this.PhoneNumber = PhoneNumber;
        }
    }
}