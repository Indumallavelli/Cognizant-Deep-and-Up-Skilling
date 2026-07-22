using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

using var context = new AppDbContext();

try
{
    await context.SaveChangesAsync();
}
catch (DbUpdateConcurrencyException)
{
    Console.WriteLine("Concurrency conflict detected.");
}