using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fashionUtilityApplication.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace fashionUtilityApplication.Checkout
{
    public partial class CheckoutComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verify user has completed the checkout process.
                if ((string)Session["userCheckoutCompleted"] != "true")
                {
                    Session["userCheckoutCompleted"] = string.Empty;
                    Response.Redirect("CheckoutError.aspx?" + "Desc=Unvalidated%20Checkout.");
                }
                if (Session["payment_method"].ToString() == "PayPal")
                {

                    NVPAPICaller payPalCaller = new NVPAPICaller();

                    string retMsg = "";
                    string token = "";
                    string finalPaymentAmount = "";
                    string PayerID = "";
                    NVPCodec decoder = new NVPCodec();

                    token = Session["token"].ToString();
                    PayerID = Session["payerId"].ToString();
                    finalPaymentAmount = Session["payment_amt"].ToString();

                    bool ret = payPalCaller.DoCheckoutPayment(finalPaymentAmount, token, PayerID, ref decoder, ref retMsg);
                    if (ret)
                    {
                        // Retrieve PayPal confirmation value.
                        string PaymentConfirmation = decoder["PAYMENTINFO_0_TRANSACTIONID"].ToString();
                        TransactionId.Text = PaymentConfirmation;

                        ProductContext _db = new ProductContext();
                        // Get the current order id.
                        int currentOrderId = -1;
                        if (Session["currentOrderId"].ToString() != string.Empty)
                        {
                            currentOrderId = Convert.ToInt32(Session["currentOrderID"]);
                        }
                        Order myCurrentOrder;
                        if (currentOrderId >= 0)
                        {
                            // Get the order based on order id.
                            myCurrentOrder = _db.Orders.Single(o => o.OrderId == currentOrderId);
                            // Update the order to reflect payment has been completed.
                            myCurrentOrder.PaymentTransactionId = PaymentConfirmation;
                            // Save to DB.
                            _db.SaveChanges();
                        }

                      
                        // Clear order id.
                        Session["currentOrderId"] = string.Empty;
                    }

                    else
                    {
                        Response.Redirect("CheckoutError.aspx?" + retMsg);
                    }
                }
                else if (Session["payment_method"].ToString() == "Braintree")
                {

                    var myOrder = new Models.Order();
                    var myAddress = new Models.Address();
                    var manager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var user = manager.FindByName(HttpContext.Current.User.Identity.Name);
                    myOrder.OrderDate = DateTime.Now;
                    myOrder.Email = user.Email;
                    myAddress.UserName = user.Email;
                    myAddress.AddressLine1 = Session["streetNumberValue"].ToString() + " " + Session["routeValue"].ToString();
                    myAddress.City = Session["cityValue"].ToString();
                    myAddress.State = Session["stateValue"].ToString(); 
                    myAddress.PostalCode = Session["postalCodeValue"].ToString();
                    myAddress.Country = Session["countryValue"].ToString();
                    myOrder.Email = user.Email;
                    myOrder.PaymentTransactionId = "Stripe" + Session["token"].ToString();
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

                }
                else
                {
                    Response.Redirect("CheckoutError.aspx?");
                }
                // Clear shopping cart.
                using (fashionUtilityApplication.Logic.ShoppingCartActions usersShoppingCart =
                    new fashionUtilityApplication.Logic.ShoppingCartActions())
                {
                    usersShoppingCart.EmptyCart();
                }



            }
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductList.aspx");
        }
    
    }
}