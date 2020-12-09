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
        protected void Page_Init(object sender, EventArgs e)
        {
            var master = (SiteMaster)Page.Master;
            master.OnTextChanged += MasterTextSelected;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IQueryable itemList = GetProducts();
               productList.DataSource = (from row in GetProducts()
                                          select row).ToList(); ;
                productList.DataBind();
                sortList.DataBind();

            }
            

        }
     
        private void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server.
            Exception exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is InvalidOperationException)
            {
                // Pass the error on to the error page.
                Server.Transfer("ErrorPage.aspx?handler=Page_Error%20-%20ProductList.aspx",
                    true);
            }
        }
     
        public void sortList_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(sortList.SelectedValue);
            System.Diagnostics.Debug.WriteLine("monster");
            productList.Items.Clear();
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            switch (sortList.SelectedValue)
            {
                case "plth":
                    System.Diagnostics.Debug.WriteLine(sortList.SelectedValue);
                    query = query.OrderBy(o => o.UnitPrice);
                    break;
                case "phtl":
                    query = query.OrderByDescending(o => o.UnitPrice);
                    break;
                case "Name Asc":
                    query = query.OrderBy(o => o.ProductName);
                    break;
                case "Name Des":
                    query = query.OrderByDescending(o => o.ProductName);
                    break;
                case "Product ID Asc":
                    query = query.OrderBy(o => o.ProductID);
                    break;
                case "Product ID Des":
                    query = query.OrderByDescending(o => o.ProductID);
                    break;
            }
            productList.DataSource = query.ToList();
            productList.DataBind();
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
                query = query.Where(p => p.CategoryID == categoryID);
                Session["categoryid"] = categoryID;
            }
            return query;
            
        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }
        public IQueryable<Color> GetColors()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Color> query = _db.Colors;
            return query;
        }
        public IQueryable<Gender> GetGenders()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Gender> query = _db.Genders;
            return query;
        }
        public IQueryable<Size> GetSizes()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Size> query = _db.Sizes;
            return query;
        }
        public IQueryable<Company> GetCompanies()
        {
            var _db = new fashionUtilityApplication.Models.ProductContext();
            IQueryable<Company> query = _db.Compaines;
            return query;
        }
        private void MasterTextSelected(object sender, string selectedValue)
        {
            if (selectedValue != "") {
                productList.Items.Clear();
                List<Product> queryResult = new List<Product>();
                var _db = new fashionUtilityApplication.Models.ProductContext();
                IQueryable<Product> query = _db.Products;

                //List listView1..Clear(); // clear list items before adding 
                // filter the items match with search key and add result to list view
                System.Diagnostics.Debug.WriteLine(selectedValue);
                queryResult.AddRange(query.Where(i => i.ProductName.Contains(selectedValue)
                || i.Category.CategoryName.Contains(selectedValue) || i.Company.CompanyName.Contains(selectedValue) 
                || i.Description.Contains(selectedValue) || i.Gender.GenderName.Contains(selectedValue)
                || i.Size.SizeName.Contains(selectedValue) || i.Color.ColorName.Contains(selectedValue) || i.UnitPrice.ToString().Contains(selectedValue)).
                    ToArray());

                productList.DataSource = (from row in queryResult
                                          select row).ToList();
                productList.DataBind();
            }
            else {
                productList.Items.Clear();

                IQueryable itemList = GetProducts();
                productList.DataSource = (from row in GetProducts()
                                          select row).ToList(); 
                productList.DataBind();
            }
        }

        List<Product> filteredQuery = new List<Product>();
       static ProductContext _db = new fashionUtilityApplication.Models.ProductContext();
        List<Product> query = _db.Products.ToList();

        protected void categoryList_CheckedChanged(object sender, EventArgs e) {
            CheckBox itemSelected = sender as CheckBox;
            

            if (itemSelected.Checked) {
               
                if (itemSelected.ID == "categoryList")
                {   
                    filteredQuery.AddRange(from row in query
                                           where row.Category.CategoryName == itemSelected.Text
                                      select row);
                }
                else if( itemSelected.ID == "colorList")
                {
                    filteredQuery.AddRange(from row in query
                                           where row.Color.ColorName == itemSelected.Text
                                           select row);
                }
                else if (itemSelected.ID == "sizeList")
                {
                    filteredQuery.AddRange(from row in query
                                           where row.Size.SizeName == itemSelected.Text
                                           select row);
                }
                else if (itemSelected.ID == "brandList")
                {
                    filteredQuery.AddRange(from row in query
                                           where row.Company.CompanyName == itemSelected.Text
                                           select row);
                }
                else if (itemSelected.ID == "genderList")
                {
                    filteredQuery.AddRange(from row in query
                                           where row.Gender.GenderName == itemSelected.Text
                                           select row);
                }
                productList.DataSource = filteredQuery;
                productList.DataBind();
            }
            else
            {
                productList.Items.Clear();

                IQueryable itemList = GetProducts();
                productList.DataSource = (from row in GetProducts()
                                          select row).ToList();
                productList.DataBind();
            }
           
        }


    } 
}