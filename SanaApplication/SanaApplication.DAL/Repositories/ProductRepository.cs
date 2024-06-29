using Microsoft.EntityFrameworkCore;
using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly SanaDbContext _context;

        public ProductRepository(SanaDbContext context)
        {
            _context = context;
        }

        public async Task<Product?> FindAsync(int id)
        {
            return await this._context.Products.FindAsync(id);
        }

        public async Task UpdateAsync(int id, Product product)
        {
            Product? existingProduct = await this._context.Products.FindAsync(id);

            if (existingProduct != null)
            {
                this._context.Products.Update(existingProduct).CurrentValues.SetValues(product);
            }
        }

        public async Task<(IEnumerable<Product>, int)> GetProducts(int pageNumber = 1, int pageSize = 10)
        {
            var totalItems = await _context.Products.CountAsync();
            var products = await _context.Products
                .Where(p => p.Quantity > 0)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            return (products, totalItems);
        }
    }
}
