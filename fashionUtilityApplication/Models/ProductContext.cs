using System.Data.Entity;

namespace fashionUtilityApplication.Models
{
    public class ProductContext: DbContext
    {
        public ProductContext() : base("FashionUtility")
        {
        }
        public DbSet<Category> Categories { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<Gender> Genders { get; set; }
        public DbSet<Size> Sizes { get; set; }

        public DbSet<Color> Colors { get; set; }

        public DbSet<Company> Compaines { get; set; }
        public DbSet<Custom> Customs { get; set; }
        public DbSet<CartItem> ShoppingCartItems { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<CustomRequest> CustomRequests { get; set; }



    }
}