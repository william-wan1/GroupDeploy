using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fashionUtilityApplication.Models;

namespace fashionUtilityApplication
{
    public partial class Women : System.Web.UI.Page
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
    }
}