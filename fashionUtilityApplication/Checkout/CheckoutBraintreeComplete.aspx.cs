using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fashionUtilityApplication.Checkout
{
    public partial class CheckoutBraintreeReview : System.Web.UI.Page
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
                using (fashionUtilityApplication.Logic.ShoppingCartActions usersShoppingCart =
                      new fashionUtilityApplication.Logic.ShoppingCartActions())
                {
                    usersShoppingCart.EmptyCart();
                }
            }
        }
        protected void Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}