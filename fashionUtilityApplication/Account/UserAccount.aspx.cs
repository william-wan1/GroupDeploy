using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Web.ModelBinding;
using Owin;
using fashionUtilityApplication.Models;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.UI.WebControls;

namespace fashionUtilityApplication.Account
{
    public partial class UserAccount :Page
    {
        private  UserManager<ApplicationUser> _userManager;
        private System.Security.Claims.ClaimsPrincipal userId;
        private ApplicationUser user;
        private TextBox usernameTextbox;
        private TextBox phoneNumberTextbox;
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
             _userManager = Request.GetOwinContext().GetUserManager<ApplicationUserManager>();
            userId = HttpContext.Current.GetOwinContext().Authentication.User;
            user = _userManager.FindByIdAsync(userId.Identity.GetUserId()).Result;

        }

        public User GetAccountInfomatio()
        {   
            if (userId == null)
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



        public void UpdateAccountInformatio(object sender,  EventArgs e)
        {
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
            _userManager.Update(user);

        }



    }
}