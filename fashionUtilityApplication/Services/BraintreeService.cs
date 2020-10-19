using Braintree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace fashionUtilityApplication.Services
{
    public class BraintreeService: IBraintreeService
    {
        
        public BraintreeService()
        {
        }
        public IBraintreeGateway CreateGateway()
        {
            var newGateway = new BraintreeGateway()
            {
                Environment = Braintree.Environment.SANDBOX,
                MerchantId = ConfigurationManager.AppSettings["braintreeMerchantID"],
                PrivateKey = ConfigurationManager.AppSettings["braintreePublicID"],
                PublicKey = ConfigurationManager.AppSettings["braintreePrivateID"],
               
                
                

            };
            return newGateway;
        }

        public IBraintreeGateway GetGateway()
        {
            return CreateGateway();        
        }
    }
}