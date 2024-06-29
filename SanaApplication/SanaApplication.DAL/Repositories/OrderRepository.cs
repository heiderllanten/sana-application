using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly SanaDbContext _context;

        public OrderRepository(SanaDbContext context)
        {
            this._context = context;
        }

        public async ValueTask<EntityEntry<Order>> AddAsync(Order order)
        {
            return await this._context.Orders.AddAsync(order);
        }
    }
}
