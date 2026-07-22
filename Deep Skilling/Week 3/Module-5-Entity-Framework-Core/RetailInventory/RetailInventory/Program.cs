using EFCore.BulkExtensions;
using RetailInventory.Data;

using var context = new AppDbContext();

var productList = context.Products.ToList();

foreach (var product in productList)
{
    product.StockQuantity += 10;
}

await context.BulkUpdateAsync(productList);

Console.WriteLine("Bulk update completed successfully.");