using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Interfaces
{
    public interface IProductRepository
    {
        public Task<Product?> FindAsync(int id);

        public Task UpdateAsync(int id, Product product);

        public Task<(IEnumerable<Product>, int)> GetProducts(int pageNumber = 1, int pageSize = 10);
    }
}
