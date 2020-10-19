using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace fashionUtilityApplication.Models
{
    public class Address
    {
        [ScaffoldColumn(false)]

        public int AddressId { get; set; }

        [Required(ErrorMessage = "User Name is required")]
        [DisplayName("User Name")]
        [StringLength(160)]
        public string UserName { get; set; }


        [Required(ErrorMessage = "Address is required")]
        [DisplayName("Address Line 1")]
        [StringLength(70)]
        public string AddressLine1 { get; set; }

        [Required(ErrorMessage = "City is required")]
        [StringLength(40)]
        public string City { get; set; }

        [Required(ErrorMessage = "State is required")]
        [StringLength(40)]
        public string State { get; set; }

        [Required(ErrorMessage = "Postal Code is required")]
        [DisplayName("Postal Code")]
        [StringLength(10)]
        public string PostalCode { get; set; }

        [Required(ErrorMessage = "Country is required")]
        [StringLength(40)]
        public string Country { get; set; }

      
        public Address(int addressId, string userName, string addressLine1, string city, string state, string postalCode, string country)
        {
            AddressId = addressId;
            UserName = userName;
            AddressLine1 = addressLine1;
            City = city;
            State = state;
            PostalCode = postalCode;
            Country = country;
        }

        public Address()
        {
        }
    }

}