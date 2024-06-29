using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SanaApplication.BBL.DTOs;
using SanaApplication.BBL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductsController(IProductService productService)
        {
            _productService = productService;
        }   

        [HttpGet("paginatedproducts")]
        public async Task<ActionResult<PagedResponseDto<Product>>> GetPaginatedProducts([FromQuery] int pageNumber, [FromQuery] int pageSize) 
        {
            if(pageNumber <= 0 || pageSize <= 0)
            {
                return BadRequest("pageNumber or pageSize has invalid values");
            }

            return await _productService.GetPagedProductsAsync(pageNumber, pageSize);
        }

    }
}
