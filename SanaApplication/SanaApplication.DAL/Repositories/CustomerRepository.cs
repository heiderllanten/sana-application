using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Repositories
{
    public class CustomerRepository : ICustomerRepository
    {
        private readonly SanaDbContext _context;

        public CustomerRepository(SanaDbContext context)
        {
            _context = context;
        }
        public async Task<Customer?> FindById(int id)
        {
            return await _context.Customers.FindAsync(id);
        }
    }
}
