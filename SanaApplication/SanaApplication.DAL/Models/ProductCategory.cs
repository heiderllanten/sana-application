using System;
using System.Collections.Generic;

namespace SanaApplication.DAL.Models;

public partial class ProductCategory
{
    public int Id { get; set; }

    public int? ProductId { get; set; }

    public int? CategoryId { get; set; }

    public virtual Category? Category { get; set; }

    public virtual Product? Product { get; set; }
}
