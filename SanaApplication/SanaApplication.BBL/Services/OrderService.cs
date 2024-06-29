using SanaApplication.BBL.DTOs;
using SanaApplication.BBL.Interfaces;
using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Models;

namespace SanaApplication.BBL.Services
{
    public class OrderService : IOrderService
    {
        private readonly IUnitOfWork _unitOfWork;

        public OrderService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<(bool IsSuccessfull, string Message, Order? order)> CreateOrder(OrderRequestDTO orderRequest)
        {
            var customer = await _unitOfWork.Customer.FindById(orderRequest.CustomerId);

            if(customer == null)
            {
                return (false, "Customer does not exist", null);
            }

            var order = new Order();
            order.Customer = customer;

            List<OrderDetail> orderDetails = new List<OrderDetail>();
            foreach (var orderDetailRequest in orderRequest.OrderDetails)
            {
                var existingProduct = await _unitOfWork.Product.FindAsync(orderDetailRequest.ProductId);
                if (existingProduct != null)
                {
                    existingProduct.Quantity -= orderDetailRequest.Quantity;
                    await _unitOfWork.Product.UpdateAsync(orderDetailRequest.ProductId, existingProduct);
                }

                orderDetails.Add(
                    new OrderDetail
                    {
                        Order = order,
                        ProductId = orderDetailRequest.ProductId,
                        Price = orderDetailRequest.Price,
                        Quantity = orderDetailRequest.Quantity
                    });
            }

            order.OrderDetails = orderDetails;
            order.Date = DateTime.UtcNow;
            order.Total = orderDetails.Sum(o => o.Price * o.Quantity);

            await _unitOfWork.Order.AddAsync(order);
            await _unitOfWork.SaveChanges();

            return (true, "", order);

        }
    }
}
