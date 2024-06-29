using SanaApplication.BBL.DTOs;
using SanaApplication.BBL.Interfaces;
using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.BBL.Services
{
    public class ProductService : IProductService
    {
        private protected IUnitOfWork unitOfWork;

        public ProductService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public async Task<PagedResponseDto<Product>> GetPagedProductsAsync(int pageNumber, int pageSize)
        {
            var (products, totalItems) = await unitOfWork.Product.GetProducts(pageNumber, pageSize);
            return new PagedResponseDto<Product>(products, totalItems, pageNumber, pageSize);
        }
    }
}
