namespace SanaApplication.DAL.Interfaces
{
    public interface IUnitOfWork
    {
        IOrderRepository Order { get; }

        IProductRepository Product { get; }

        ICustomerRepository Customer { get; }

        Task<int> SaveChanges();
    }
}
