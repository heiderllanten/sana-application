using SanaApplication.DAL.Models;

namespace SanaApplication.DAL.Interfaces
{
    public interface ICustomerRepository
    {
        Task<Customer?> FindById(int id);
    }
}
