using RetailInventory.Data;
using RetailInventory.Models;

using var context = new AppDbContext();

// Add a category
var category = new Category
{
    Name = "Electronics"
};

context.Categories.Add(category);
context.SaveChanges();

// Add a product
var product = new Product
{
    Name = "Laptop",
    Price = 65000,
    CategoryId = category.Id
};

context.Products.Add(product);
context.SaveChanges();

Console.WriteLine("Data inserted successfully!");

// Display all products
var products = context.Products.ToList();

Console.WriteLine("\nProducts:");

foreach (var p in products)
{
    Console.WriteLine($"{p.Id}  {p.Name}  ₹{p.Price}");
}