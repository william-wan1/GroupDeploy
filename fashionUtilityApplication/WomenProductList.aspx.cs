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
    public partial class WomenProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            query = query.Where(p => p.CategoryID != 2 && p.CategoryID != 5 && p.CategoryID != 3 && p.CategoryID != 1);

            return query;
        }
        public IQueryable<Product> GetProducts()
        {
            int categoryID = -1;
            if (Request.QueryString["id"] != null)
            {
                categoryID = Convert.ToInt32(Request.QueryString["id"]);
            }
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryID != -1 && categoryID > 0)
            {

                Session["categoryid"] = categoryID;
                query = query.Where(p => p.CategoryID == categoryID && (p.GenderID == 2 || p.GenderID == 3));
            }
            query = query.Where(p => p.GenderID == 2 || p.GenderID == 3);
            return query;

        }

       
    }
}