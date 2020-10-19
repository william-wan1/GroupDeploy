using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fashionUtilityApplication.Models;


namespace fashionUtilityApplication
{
    public partial class FuCustomize : System.Web.UI.Page
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
    }
}