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

namespace fashionUtilityApplication.Checkout
{
    [ScriptService]
    public partial class CheckoutStart : System.Web.UI.Page
    {
       // private IBraintreeService _braintreeService;
        private readonly CartItem cartItem;
        private static string clients;

        public string Clients { get { return clients; } }

        private static IBraintreeService _braintreeService = new fashionUtilityApplication.Services.BraintreeService();
        private readonly UserManager<ApplicationUser> _userManager;
        



        protected string client_Token { get; set; }

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
            Console.WriteLine( "Bwaintwee");
            btCont.Visible = true;

            var gateway = _braintreeService.GetGateway();
            var clientToken = gateway.ClientToken.Generate();
            clients = clientToken;

            //CreditCardOptionsRequest optionsRequest = new CreditCardOptionsRequest();
           // optionsRequest.VerifyCard = true;

            //client_Token = gateway.ClientId;

            
        }
    
        [WebMethod]
        public static void CreatePurchase(string nonceValue, string streetNumberValue, string routeValue, string cityValue, 
            string stateValue, string postalCodeValue, string countryValue)
        {
            Console.WriteLine("Starered");
            var gateway = _braintreeService.GetGateway();

            var request = new TransactionRequest
            {
                Amount = Convert.ToDecimal(HttpContext.Current.Session["payment_amt"].ToString()),
                PaymentMethodNonce = nonceValue,
                Options = new TransactionOptionsRequest
                {
                    
                    SubmitForSettlement = true
                }
            };
            Result<Transaction> result = gateway.Transaction.Sale(request);
            if (result.IsSuccess())
            {
                Console.WriteLine("continued");

                var myOrder = new Models.Order();
                var myAddress = new Models.Address();
                var manager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = manager.FindByName(HttpContext.Current.User.Identity.Name);
                myOrder.OrderDate = DateTime.Now;
                myOrder.Username = user.UserName;
                myAddress.AddressLine1 = streetNumberValue + " " + routeValue;
                myAddress.City = cityValue;
                myAddress.State = stateValue;
                myAddress.PostalCode = postalCodeValue;
                myAddress.Country = countryValue;
                myOrder.Email =user.Email;
                myOrder.Total = Convert.ToDecimal(HttpContext.Current.Session["payment_amt"].ToString());
               

                ProductContext _db = new ProductContext();

                // Add order to DB.
                _db.Orders.Add(myOrder);
                _db.Addresses.Add(myAddress);
                _db.SaveChanges();

                using (fashionUtilityApplication.Logic.ShoppingCartActions usersShoppingCart = new fashionUtilityApplication.Logic.ShoppingCartActions())
                {
                    List<CartItem> myOrderList = usersShoppingCart.GetCartItems();

                    // Add OrderDetail information to the DB for each product purchased.
                    for (int i = 0; i < myOrderList.Count; i++)
                    {
                        // Create a new OrderDetail object.
                        var myOrderDetail = new OrderDetail();
                        myOrderDetail.OrderId = myOrder.OrderId;
                        myOrderDetail.Username = HttpContext.Current.User.Identity.Name;
                        myOrderDetail.ProductId = myOrderList[i].ProductId;
                        myOrderDetail.Quantity = myOrderList[i].Quantity;
                        myOrderDetail.ImagePath = myOrderList[i].ImagePath;
                        myOrderDetail.UnitPrice = myOrderList[i].Product.UnitPrice;

                        // Add OrderDetail to DB.
                        _db.OrderDetails.Add(myOrderDetail);
                        _db.SaveChanges();
                    }

                    // Set OrderId.
                    HttpContext.Current.Session["currentOrderId"] = myOrder.OrderId;

                    // Display Order information.
                    List<fashionUtilityApplication.Models.Order> orderList = new List<fashionUtilityApplication.Models.Order>();
                    orderList.Add(myOrder);
                  
                }
                HttpContext.Current.Session["userCheckoutCompleted"] = "true";
                HttpContext.Current.Response.Redirect("Checkout/CheckoutBraintreeComplete.aspx");

            }
            else
            {
                HttpContext.Current.Response.Redirect("Checkout/CheckoutError.aspx");

            }
            Console.WriteLine("suceeded");


        }
        protected void CheckoutBtn_Click(object sender, EventArgs e)
        {
          
           // Response.Redirect("/CheckoutReview.aspx");
        }
    }
}