using System;
using System.Collections.Generic;

namespace SanaApplication.DAL.Models;

public partial class Product
{
    public int Id { get; set; }

    public string? Code { get; set; }

    public string? Name { get; set; }

    public double? Price { get; set; }

    public int? Quantity { get; set; }

    public string? Description { get; set; }

    public int? CategoryId { get; set; }

    public virtual ICollection<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();
}
