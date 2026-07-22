using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

using var context = new AppDbContext();

var products = await context.Products
    .Include(p => p.Category)
    .ToListAsync();

Console.WriteLine("Products List:");
Console.WriteLine();

foreach (var product in products)
{
    Console.WriteLine($"Product: {product.Name}");
    Console.WriteLine($"Price: ₹{product.Price}");
    Console.WriteLine($"Category: {product.Category?.Name}");
    Console.WriteLine("-------------------------");
}