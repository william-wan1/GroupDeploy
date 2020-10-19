using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fashionUtilityApplication.Models;
using System.Web.ModelBinding;


namespace fashionUtilityApplication
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {

            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CategoryID == categoryId);
            }
            return query;
        }
        public IQueryable<Product> GetTeesProduct()
        {
           return GetProducts(1);
        }
        

        public IQueryable<Product> tees_clicked(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);

            return GetProducts(1);
        }
    } 
}