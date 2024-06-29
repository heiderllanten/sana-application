namespace SanaApplication.BBL.DTOs
{
    public class OrderRequestDTO
    {
        public int CustomerId { get; set; }

        public IEnumerable<OrderDetailRequestDTO> OrderDetails { get; set; }
    }
}
