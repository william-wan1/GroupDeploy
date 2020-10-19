using System.Collections.Generic;
using System.Data.Entity;

namespace fashionUtilityApplication.Models
{
    public class ProductDatabaseInitializer: DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetGenders().ForEach(g => context.Genders.Add(g));
            GetProducts().ForEach(p => context.Products.Add(p));
            GetCustoms().ForEach(cu => context.Customs.Add(cu));
     


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
                    ProductName = "Back sack",
                    Company = "Nike",
                    GenderID = 1,
                    CategoryID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="akin.png",
                    UnitPrice = 22.50,
                    
               },
                new Product
                {
                    ProductID = 2,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "COLLUSION",
                    CategoryID = 2,
                    GenderID = 1,
                    Color = "Gold",
                    Description = "Smooth 24K-Gold chain",
                    Size = "Large",
                    ImagePath="beatles.png",
                    UnitPrice = 17.00,

               },
                 new Product
                {
                    ProductID = 3,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 5,
                    GenderID = 1,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="plainlong.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 4,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 3,
                    GenderID = 1,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="redpant.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 5,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 11,
                    GenderID = 3,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="todoroki.png",
                    UnitPrice = 22.50,

               },
                new Product
                {
                    ProductID = 6,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 10,
                    GenderID = 1,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="wrestle.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 7,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 4,
                    GenderID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 8,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 4,
                    GenderID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 9,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 4,
                    GenderID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 10,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 8,
                    GenderID = 1,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 11,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 9,
                    GenderID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 12,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 8,
                    GenderID = 3,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 13,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 5,
                    GenderID = 3,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 14,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 6,
                    GenderID = 2,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 15,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Nike",
                    CategoryID = 5,
                    GenderID = 1,
                    Color = "Grey",
                    Description = "Smooth stretchy fabric Uses Nike Dri-FIT technology"+
                    "Moves sweat away from the skin, then draws it out of the fabric to help speed up evaporation"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 22.50,

               },
                 new Product
                {
                    ProductID = 16,
                    ProductName = "Nike Pro Training tights in grey",
                    Company = "Addidas",
                    CategoryID = 2,
                    GenderID = 3,
                    Color = "White",
                    Description = "White sexy sleevless shirt"+
                    "Main: 90 % Polyester, 10 % Elastane, Mesh: 92 % Polyester, 8 % Elastane",
                    Size = "Medium",
                    ImagePath="carconvert.png",
                    UnitPrice = 12.50,

               },
            };

            return products;
        }
    }
}