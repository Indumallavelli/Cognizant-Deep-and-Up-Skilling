using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

using var context = new AppDbContext();

// Update Laptop price
var laptop = await context.Products
    .FirstOrDefaultAsync(p => p.Name == "Laptop");

if (laptop != null)
{
    laptop.Price = 70000;
}

// Delete Rice Bag
var riceBag = await context.Products
    .FirstOrDefaultAsync(p => p.Name == "Rice Bag");

if (riceBag != null)
{
    context.Products.Remove(riceBag);
}

await context.SaveChangesAsync();

Console.WriteLine("Update and Delete completed successfully.");