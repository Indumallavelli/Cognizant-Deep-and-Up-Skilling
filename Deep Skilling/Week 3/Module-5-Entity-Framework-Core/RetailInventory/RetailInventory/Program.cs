using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;
using RetailInventory.Models;

using var context = new AppDbContext();

var productDTOs = await context.Products
    .Select(p => new ProductDTO
    {
        Name = p.Name,
        CategoryName = p.Category.Name
    })
    .ToListAsync();

foreach (var product in productDTOs)
{
    Console.WriteLine($"{product.Name} - {product.CategoryName}");
}