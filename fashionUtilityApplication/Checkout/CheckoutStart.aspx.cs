using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Stripe;
using fashionUtilityApplication.Models;
using System.Web.Mvc;
using fashionUtilityApplication.Services;
using Braintree;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Web.Script.Services;
using Stripe.Checkout;

namespace fashionUtilityApplication.Checkout
{
    [ScriptService]
    public partial class CheckoutStart : System.Web.UI.Page
    {
        public static string sessionId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {

            }
            else
            {
                //Ask to checkout as a guest or sign or create account
            }
            if (Session["payment_method"].ToString() == "PayPal")
            {
                Paypal();
            }
            else if (Session["payment_method"].ToString() == "Braintree")
            {
                
                Purchase();
            }
            else
            {
                Response.Redirect("CheckoutError.aspx?");
            }
            

        }
        public void Paypal()
        {

            NVPAPICaller payPalCaller = new NVPAPICaller();
            string retMsg = "";
            string token = "";

            if (Session["payment_amt"] != null)
            {
                string amt = Session["payment_amt"].ToString();

                bool ret = payPalCaller.ShortcutExpressCheckout(amt, ref token, ref retMsg);
                if (ret)
                {
                    Session["token"] = token;
                    Response.Redirect(retMsg);
                }
                else
                {
                    Response.Redirect("CheckoutError.aspx?" + retMsg);
                }
            }
            else
            {
                Response.Redirect("CheckoutError.aspx?ErrorCode=AmtMissing");
            }
        }
        public void Purchase()
        {
            if (Session["payment_amt"] != null)
            {
                try
                {
                    List<SessionLineItemOptions> cartList = new List<SessionLineItemOptions>();
                    using (fashionUtilityApplication.Logic.ShoppingCartActions usersShoppingCart = new fashionUtilityApplication.Logic.ShoppingCartActions())
                    {
                        List<CartItem> myOrderList = usersShoppingCart.GetCartItems();

                        // Add OrderDetail information to the DB for each product purchased.
                        for (int i = 0; i < myOrderList.Count; i++)
                        {
                            long convertValue = 100;
                            var item = new SessionLineItemOptions();
                            item.Name = myOrderList[i].Product.ProductName;
                            item.Amount = (long)myOrderList[i].Product.UnitPrice * convertValue;
                            item.Currency = "cad";
                            item.Quantity = myOrderList[i].Quantity;
                            item.Description = myOrderList[i].Product.Description;
                            cartList.Add(item);
                        }

                    }

                    string amt = Session["payment_amt"].ToString();
                    StripeConfiguration.ApiKey = System.Configuration.ConfigurationManager.AppSettings["stripeSecretKeyTest"];
                    var options = new SessionCreateOptions
                    {
                        SuccessUrl = "https://fashionutilityapplication.azurewebsites.net/Checkout/CheckoutComplete.aspx",
                        CancelUrl = "https://fashionutilityapplication.azurewebsites.net/Checkout/CheckoutCancel.aspx",

                        PaymentMethodTypes = new List<string> {
                            "card",
                        },
                        LineItems = cartList

                    };
                  
                    var service = new SessionService();
                    Session session = service.Create(options);
                    sessionId = session.Id;
                    Session["token"] = sessionId;
                    Session["userCheckoutCompleted"] = "true";
                }
                catch (Exception e)
                {
                    Response.Redirect("CheckoutError.aspx?");
                }

            }
            else
            {
                Response.Redirect("CheckoutError.aspx?ErrorCode=AmtMissing");
            }


        }
    
        [WebMethod]
        public static void CreatePurchase(string streetNumberValue, string routeValue, string cityValue, 
            string stateValue, string postalCodeValue, string countryValue)
        {
            HttpContext.Current.Session["streetNumberValue"] = streetNumberValue;
            HttpContext.Current.Session["routeValue"] = routeValue;
            HttpContext.Current.Session["cityValue"] = cityValue;
            HttpContext.Current.Session["stateValue"] = stateValue;
            HttpContext.Current.Session["postalCodeValue"] = postalCodeValue;
            HttpContext.Current.Session["countryValue"] = countryValue;
        }
        protected void CheckoutBtn_Click(object sender, EventArgs e)
        {
           // Response.Redirect("/CheckoutReview.aspx");
        }
    }
}