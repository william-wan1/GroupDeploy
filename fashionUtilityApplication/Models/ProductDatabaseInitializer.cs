using System.Collections.Generic;
using System.Data.Entity;

namespace fashionUtilityApplication.Models
{
    public class ProductDatabaseInitializer: DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(ca => context.Categories.Add(ca));
            GetGenders().ForEach(g => context.Genders.Add(g));
            GetProducts().ForEach(p => context.Products.Add(p));
            GetCustoms().ForEach(cu => context.Customs.Add(cu));
            GetSizes().ForEach(s => context.Sizes.Add(s));
            GetCompanies().ForEach(com => context.Compaines.Add(com));
            GetColors().ForEach(col => context.Colors.Add(col));


        }

        private static List<Custom> GetCustoms()
        {
            var customs = new List<Custom> {
                new Custom
                {
                    CustomID = 1,
                    CustomName = "Shirts"
                },
                new Custom
                {
                    CustomID = 1,
                    CustomName = "Shorts"
                },
              new Custom
                {
                    CustomID = 1,
                    CustomName = "Trousers"
                },
              new Custom
                {
                    CustomID = 1,
                    CustomName = "Hats"
                }
            };
            return customs;

        }

        private static List<Gender> GetGenders()
        {
            var genders = new List<Gender> {
                new Gender
                {
                    GenderID = 1,
                    GenderName = "Male"
                },
                new Gender
                {
                    GenderID = 2,
                    GenderName = "Female"
                },
               new Gender
                {
                    GenderID = 3,
                    GenderName = "Unisex"
                }
            };
            return genders;

        }
        private static List<Size> GetSizes()
        {
            var sizes = new List<Size> {
                new Size
                {
                    SizeID = 1,
                    SizeName = "Small"
                },
                new Size
                {
                    SizeID = 2,
                    SizeName = "Medium"
                },
                 new Size
                {
                    SizeID = 3,
                    SizeName = "Large"
                }
            };
            return sizes;

        }
        private static List<Company> GetCompanies()
        {
            var compaines = new List<Company> {
                new Company
                {
                    CompanyID = 1,
                    CompanyName = "Nike"
                },
               new Company
                {
                    CompanyID = 2,
                    CompanyName = "COLLUSION"
                },
               new Company
                {
                    CompanyID = 3,
                    CompanyName = "Wrestlemania"
                },
               new Company
                {
                    CompanyID = 4,
                    CompanyName = "Guess"
                },
               new Company
                {
                    CompanyID = 5,
                    CompanyName = "The Beatles"
                },
               new Company
                {
                    CompanyID = 6,
                    CompanyName = "Hot Topic"
                }
            };
            return compaines;

        }
        private static List<Color> GetColors()
        {
            var colors = new List<Color> {
                new Color
                {
                    ColorID = 1,
                    ColorName = "Red"
                },
                new Color
                {
                    ColorID = 2,
                    ColorName = "Blue"
                },
                new Color
                {
                    ColorID = 3,
                    ColorName = "Green"
                },
                new Color
                {
                    ColorID = 4,
                    ColorName = "White"
                },
                new Color
                {
                    ColorID = 5,
                    ColorName = "Black"
                },
                new Color
                {
                    ColorID = 6,
                    ColorName = "Yelllow"
                },
                new Color
                {
                    ColorID = 7,
                    ColorName = "Orange"
                },
                new Color
                {
                    ColorID = 8,
                    ColorName = "Pink"
                },
                new Color
                {
                    ColorID = 9,
                    ColorName = "Purple"
                },
                new Color
                {
                    ColorID = 10,
                    ColorName = "Grey"
                }
            };
            return colors;

        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Tees"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Bottoms"
                },
                new Category
                {
                    CategoryID = 3,
                    CategoryName = "Shirts"
                },
                new Category
                {
                    CategoryID = 4,
                    CategoryName = "Skirts"
                },
                new Category
                {
                    CategoryID = 5,
                    CategoryName = "TShirts"
                },
                new Category
                {
                    CategoryID = 6,
                    CategoryName = "Accessories"
                },
                 new Category
                {
                    CategoryID = 7,
                    CategoryName = "Coats"
                },
                new Category
                {
                    CategoryID = 8,
                    CategoryName = "Hoodies"
                },
                new Category
                {
                    CategoryID = 9,
                    CategoryName = "Dresses"
                },
                 new Category
                {
                    CategoryID = 10,
                    CategoryName = "Jeans"
                },
                new Category
                {
                    CategoryID = 11,
                    CategoryName = "Tops"
                },
                new Category
                {
                    CategoryID = 12,
                    CategoryName = "Trousers"
                },

            };

            return categories;
        }
        private static List<Product> GetProducts()
        {
            var products = new List<Product> {
                new Product
                {
                    ProductID = 1,
                    ProductName = "Almost White Tee",
                    CompanyID = 2,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 4,
                    SizeID = 2,
                    Description = "White Tee with 100% cotton, Short Sleeve",
                    ImagePath="akin.png",
                    UnitPrice = 22.50,
                    
               },
                new Product
                {
                    ProductID = 2,
                    ProductName = "Almost White Tee",
                    CompanyID = 2,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 4,
                    SizeID = 3,
                    Description = "White Tee with 100% cotton, Short Sleeve",
                    ImagePath="akin.png",
                    UnitPrice = 25,

               },
               new Product
                {
                    ProductID = 3,
                    ProductName = "Plain White Tee",
                    CompanyID = 1,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 4,
                    SizeID = 2,
                    Description = "Long sleeve white tee 100& cotton",
                    ImagePath="plainlong.png",
                    UnitPrice = 24.5,

               },
                   new Product
                {
                    ProductID = 4,
                    ProductName = "Plain White Tee",
                    CompanyID = 1,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 4,
                    SizeID = 3,
                    Description = "Long sleeve white tee 100& cotton",
                    ImagePath="plainlong.png",
                    UnitPrice = 26,

               },
                  new Product
                {
                    ProductID = 5,
                    ProductName = "Plain White Tee",
                    CompanyID = 1,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 4,
                    SizeID = 1,
                    Description = "Long sleeve white tee 100& cotton",
                    ImagePath="plainlong.png",
                    UnitPrice = 20,

               },
                new Product
                {
                    ProductID = 6,
                    ProductName = "WWE Shirt",
                    CompanyID = 3,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 5,
                    SizeID = 2,
                    Description = "Long Sleeve Black WWE Shirt Wrestlemania, small",
                    ImagePath="wrestle.png",
                    UnitPrice = 26.5,

               },
                new Product
                {
                    ProductID = 7,
                    ProductName = "WWE Shirt",
                    CompanyID = 3,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 5,
                    SizeID = 1,
                    Description = "Long Sleeve Black WWE Shirt Wrestlemania, medium",
                    ImagePath="wrestle.png",
                    UnitPrice = 24,

               },
                new Product
                {
                    ProductID = 8,
                    ProductName = "WWE Shirt",
                    CompanyID = 3,
                    GenderID = 3,
                    CategoryID = 1,
                    ColorID = 5,
                    SizeID = 3,
                    Description = "Long Sleeve Black WWE Shirt Wrestlemania, large",
                    ImagePath="wrestle.png",
                    UnitPrice = 30,

               },
                new Product
                {
                    ProductID = 9,
                    ProductName = "Bloody Jeans",
                    CompanyID = 4,
                    GenderID = 1,
                    CategoryID = 10,
                    ColorID = 1,
                    SizeID = 2,
                    Description = "Guess Trouser Red Faded",
                    ImagePath="redpant.png",
                    UnitPrice = 60,

               },
                new Product
                {
                    ProductID = 10,
                    ProductName = "Bloody Jeans",
                    CompanyID = 4,
                    GenderID = 1,
                    CategoryID = 10,
                    ColorID = 1,
                    SizeID = 1,
                    Description = "Guess Trouser Red Faded",
                    ImagePath="redpant.png",
                    UnitPrice = 45,

               },
             new Product
                {
                    ProductID = 11,
                    ProductName = "Bloody Jeans",
                    CompanyID = 4,
                    GenderID = 1,
                    CategoryID = 10,
                    ColorID = 1,
                    SizeID = 3,
                    Description = "Guess Trouser Red Faded",
                    ImagePath="redpant.png",
                    UnitPrice = 80,

               },
                 new Product
                {
                    ProductID = 12,
                    ProductName = "The Beatles",
                    CompanyID = 5,
                    CategoryID = 1,
                    GenderID = 3,
                    ColorID = 5,
                    Description = "Graphic Tee with the beatles ",
                    SizeID = 1,
                    ImagePath="beatles.png",
                    UnitPrice = 22.50,

               },
              new Product
                {
                    ProductID = 13,
                    ProductName = "The Beatles",
                    CompanyID = 5,
                    CategoryID = 1,
                    GenderID = 3,
                    ColorID = 5,
                    Description = "Graphic Tee with the beatles ",
                    SizeID = 2,
                    ImagePath="beatles.png",
                    UnitPrice = 24,

               },
                new Product
                {
                    ProductID = 14,
                    ProductName = "The Beatles",
                    CompanyID = 5,
                    CategoryID = 1,
                    GenderID = 3,
                    ColorID = 5,
                    Description = "Graphic Tee with the beatles ",
                    SizeID = 1,
                    ImagePath="beatles.png",
                    UnitPrice = 25,

               },
                 new Product
                {
                    ProductID = 15,
                    ProductName = "Todoroki HA",
                    CompanyID = 6,
                    CategoryID = 1,
                    GenderID = 3,
                    ColorID = 4,
                    Description = "Hot Topic Boku hero academica shirt featuring todoroki",
                    SizeID = 2,
                    ImagePath="todoroki.png",
                    UnitPrice = 22.5,

               },
                 new Product
                {
                    ProductID = 16,
                    ProductName = "Todoroki HA",
                    CompanyID = 6,
                    CategoryID = 1,
                    GenderID = 3,
                    ColorID = 4,
                    Description = "Hot Topic Boku hero academica shirt featuring todoroki",
                    SizeID = 1,
                    ImagePath ="todoroki.png",
                    UnitPrice = 12.5,

               }
            };

            return products;
        }
    }
}