using SanaApplication.BBL.DTOs;
using SanaApplication.DAL.Models;

namespace SanaApplication.BBL.Interfaces
{
    public interface IProductService
    {
        Task<PagedResponseDto<Product>> GetPagedProductsAsync(int pageNumber, int pageSize);
    }
}
