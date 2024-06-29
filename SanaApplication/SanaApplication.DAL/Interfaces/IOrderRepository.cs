using Microsoft.EntityFrameworkCore.ChangeTracking;
using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Interfaces
{
    public interface IOrderRepository
    {
        public ValueTask<EntityEntry<Order>> AddAsync(Order order);
    }
}
