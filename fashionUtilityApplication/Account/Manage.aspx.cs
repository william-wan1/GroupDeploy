using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using fashionUtilityApplication.Models;
using System.Web.UI.WebControls;

namespace fashionUtilityApplication.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        private  UserManager<ApplicationUser> _userManager;
     //   private System.Security.Claims.ClaimsPrincipal userId;
        private TextBox usernameTextbox;
        private TextBox phoneNumberTextbox;
        private ProductContext _db = new ProductContext();

        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    ChangePassword.Visible = true;
                }
                else
                {
                    CreatePassword.Visible = true;
                    ChangePassword.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        public User GetAccountInfomation()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            if (user == null)
            {
                Response.Redirect("/Account/Login");
                var account = new User("", "", "", "");
                return account;
            }
            else
            {
                var account = new User(user.Id, user.UserName, user.Email, user.PhoneNumber);
                return account;
            }
        }
        public List<Address> GetAddressInformation()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            if (user == null)
            {
                Response.Redirect("/Account/Login");
                var address = new Address(0,"","","","","","");
                List<Address> emptyList = new List<Address>();
                emptyList.Add(address);
                return emptyList.ToList();
            }
            else
            {
                return _db.Addresses.Where(
                ad => ad.UserName == user.Email).ToList();
            }
        }
        public void AddAddressFunction(Object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            if (user == null)
            {
                Response.Redirect("/Account/Login");
                var account = new User("", "", "", "");
               // return account;
            }
            else
            {
                var account = new User(user.Id, user.UserName, user.Email, user.PhoneNumber);
              //  return account;
            }
        }

        public List<Order> GetOrderInformation()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            if (user == null)
            {
                Response.Redirect("/Account/Login");
                var order = new Order();
                List<Order> emptyList = new List<Order>();
                emptyList.Add(order);
                return emptyList.ToList();
            }
            else
            {
                return _db.Orders.Where(
                o => o.Email == user.Email).ToList();
            }
        }


        public void UpdateAccountInformation(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            // Update it with the values from the view model
            foreach (GridViewRow row in accountGridView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    usernameTextbox = ((TextBox)row.FindControl("UsernameTextbox"));
                    phoneNumberTextbox = ((TextBox)row.FindControl("PhoneTextbox"));
                }
            }
            user.UserName = usernameTextbox.Text;
            user.PhoneNumber = phoneNumberTextbox.Text;

            // Apply the changes if any to the db
            _userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _userManager.Update(user);

        }
        public void UpdateAddressInformation(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            // Update it with the values from the view model
            foreach (GridViewRow row in accountGridView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    usernameTextbox = ((TextBox)row.FindControl("UsernameTextbox"));
                    phoneNumberTextbox = ((TextBox)row.FindControl("PhoneTextbox"));
                }
            }
            user.UserName = usernameTextbox.Text;
            user.PhoneNumber = phoneNumberTextbox.Text;

            // Apply the changes if any to the db
            _userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _userManager.Update(user);

        }
    }
}