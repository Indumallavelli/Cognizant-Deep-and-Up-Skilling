using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

using var context = new AppDbContext();

// Eager Loading
var products = await context.Products
    .Include(p => p.Category)
    .ToListAsync();

Console.WriteLine("Eager Loading:");

foreach (var product in products)
{
    Console.WriteLine($"{product.Name} - {product.Category?.Name}");
}

Console.WriteLine();

// Explicit Loading
var firstProduct = await context.Products.FirstAsync();

await context.Entry(firstProduct)
    .Reference(p => p.Category)
    .LoadAsync();

Console.WriteLine("Explicit Loading:");
Console.WriteLine($"{firstProduct.Name} - {firstProduct.Category?.Name}");