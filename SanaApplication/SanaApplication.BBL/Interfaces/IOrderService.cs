using SanaApplication.BBL.DTOs;
using SanaApplication.DAL.Models;

namespace SanaApplication.BBL.Interfaces
{
    public interface IOrderService
    {
        public Task<(bool IsSuccessfull, string Message, Order? order)> CreateOrder(OrderRequestDTO orderRequest);
    }
}
