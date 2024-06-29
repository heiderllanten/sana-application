using SanaApplication.DAL.Interfaces;

namespace SanaApplication.DAL.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly SanaDbContext _context;
        private readonly IProductRepository _productRepository;
        private readonly IOrderRepository _orderRepository;
        private readonly ICustomerRepository _customerRepository;

        public UnitOfWork(SanaDbContext context, IProductRepository productRepository, IOrderRepository orderRepository, ICustomerRepository customerRepository)
        {
            _context = context;
            _productRepository = productRepository;
            _orderRepository = orderRepository;
            _customerRepository = customerRepository;
        }

        public IOrderRepository Order => _orderRepository;

        public IProductRepository Product => _productRepository;

        public ICustomerRepository Customer => _customerRepository;

        public async Task<int> SaveChanges()
        {
            return await _context.SaveChangesAsync();
        }
    }
}
