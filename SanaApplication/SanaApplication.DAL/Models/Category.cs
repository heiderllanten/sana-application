using System;
using System.Collections.Generic;

namespace SanaApplication.DAL.Models;

public partial class Category
{
    public int Id { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();
}
