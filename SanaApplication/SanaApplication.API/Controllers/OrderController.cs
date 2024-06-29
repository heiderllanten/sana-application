using Microsoft.AspNetCore.Mvc;
using SanaApplication.BBL.DTOs;
using SanaApplication.BBL.Interfaces;

namespace SanaApplication.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService _orderService;

        public OrderController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpPost]
        public async Task<ActionResult> CreateOrder(OrderRequestDTO orderRequest)
        {
            try
            {
                var response = await _orderService.CreateOrder(orderRequest);

                if (!response.IsSuccessfull)
                {
                    return BadRequest(response.Message);
                }

                return CreatedAtAction(nameof(CreateOrder), new { Id = response.order?.Id }, response.order);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in {nameof(OrderController)}: {ex.Message} {ex.StackTrace}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
