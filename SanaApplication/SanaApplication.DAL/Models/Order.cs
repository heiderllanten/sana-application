using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace SanaApplication.DAL.Models;

public partial class Order
{
    public int Id { get; set; }

    public string? Description { get; set; }

    public DateTime? Date { get; set; }

    public double? Total { get; set; }

    public int? CustomerId { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
