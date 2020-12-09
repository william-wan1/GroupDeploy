using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fashionUtilityApplication.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace fashionUtilityApplication
{

    public partial class ShirtsCustom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Custom> GetCustoms()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Custom> query = _db.Customs;
            return query;
        }
        

        protected void sendRequest_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Clicked");
            Boolean fileOK = false;
            String path = Server.MapPath("~/Catalog/Images/Custom/Orders");
            if (imageUpload.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(imageUpload.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (fileOK)
                {
                    try
                    {
                        // Save to Images folder.
                        imageUpload.PostedFile.SaveAs(path + imageUpload.FileName);
                        // Save to Images/Thumbs folder.
                        imageUpload.PostedFile.SaveAs(path + "Thumbs/" + imageUpload.FileName);
                        LabelStatus.Text = "File updload sucess";
                    }
                    catch (Exception ex)
                    {
                        LabelStatus.Text = ex.Message;
                    }
                    var newRequest = new Models.CustomRequest();
                    var manager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var user = manager.FindByName(HttpContext.Current.User.Identity.Name);
                    newRequest.OrderDate = DateTime.Now;
                    newRequest.Email = user.Email;
                    newRequest.Username = user.Email;
                    newRequest.ImageDesignPath = imageUpload.FileName;
                    newRequest.Quantity = Int16.Parse(qty.Value);
                    newRequest.SizeID = Int16.Parse(size.Value);
                    newRequest.CustomID = 1;
                   
                    ProductContext _db = new ProductContext();

                    // Add order to DB.
                    _db.CustomRequests.Add(newRequest);
                     _db.SaveChanges();
                    LabelStatus.Text = "File updload sucess, Order Request sent. Due to the rate of orders we would get back to you tomorrow";
                }
            }
            else if (tweetUrl.Value != "")
            {
                var uriName = tweetUrl.Value;
                Boolean result = false;
                Uri uriResult;
                result = Uri.TryCreate(uriName, UriKind.Absolute, out uriResult)
                        && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);
                
                if (result)
                {
                    LabelStatus.Text = "URL Accepted";
                    var newRequest = new Models.CustomRequest();
                    var manager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var user = manager.FindByName(HttpContext.Current.User.Identity.Name);
                    newRequest.OrderDate = DateTime.Now;
                    newRequest.Email = user.Email;
                    newRequest.Username = user.Email;
                    newRequest.UrlName = uriName;
                    newRequest.Quantity = Int16.Parse(qty.Value);
                    newRequest.SizeID = Int16.Parse(size.Value);
                    newRequest.CustomID = 1;

                    ProductContext _db = new ProductContext();

                    // Add order to DB.
                    _db.CustomRequests.Add(newRequest);
                    _db.SaveChanges();
                    LabelStatus.Text = "URL Accepted, Order Request sent. Due to the rate of orders we would get back to you tomorrow";

                }
                else
                {
                    LabelStatus.Text = "Unable to accept url.";
                }
            }
            else
            {
                LabelStatus.Text = "Unable to Send Request, No design method selected.";
              
            }
        }
    }
}
