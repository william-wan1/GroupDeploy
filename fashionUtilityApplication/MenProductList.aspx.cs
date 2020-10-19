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
    public partial class MenProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            query = query.Where(p => p.CategoryID != 12 && p.CategoryID != 4 && p.CategoryID != 9 && p.CategoryID != 11);
            return query;
        }
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CategoryID == categoryId && (p.GenderID == 1 || p.GenderID == 3));
            }
            query = query.Where(p => p.GenderID == 1 || p.GenderID == 3);
            return query;
        }
    }
}