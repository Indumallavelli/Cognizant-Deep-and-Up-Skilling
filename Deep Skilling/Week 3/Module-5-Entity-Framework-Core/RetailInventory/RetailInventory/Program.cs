using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

using var context = new AppDbContext();

// AsNoTracking
var products = await context.Products
    .AsNoTracking()
    .ToListAsync();

Console.WriteLine("Products (AsNoTracking):");

foreach (var product in products)
{
    Console.WriteLine($"{product.Name} - ₹{product.Price}");
}