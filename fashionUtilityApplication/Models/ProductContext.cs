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
        public DbSet<Custom> Customs { get; set; }
        public DbSet<CartItem> ShoppingCartItems { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Address> Addresses { get; set; }


    }
}