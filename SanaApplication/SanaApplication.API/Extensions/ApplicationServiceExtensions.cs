using Microsoft.EntityFrameworkCore;
using SanaApplication.BBL.Interfaces;
using SanaApplication.BBL.Services;
using SanaApplication.DAL;
using SanaApplication.DAL.Interfaces;
using SanaApplication.DAL.Repositories;

namespace SanaApplication.API.Extensions
{
    public static class ApplicationServiceExtensions
    {
        public static void ConfigureServices(this IServiceCollection services)
        {
            services.AddControllers().AddNewtonsoftJson(
                options => options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
            ); ;

            services.AddDbContext<SanaDbContext>(
                options => options.UseSqlServer("name=ConnectionStrings:DefaultConnection"));
        }

        public static void AddApplicationServices(this IServiceCollection services)
        {
            services.AddScoped<ICustomerRepository, CustomerRepository>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IProductService, ProductService>();
            services.AddScoped<IOrderService, OrderService>();
        }

        public static void AddApplicationCors(this IServiceCollection services, string specificOrigins)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(name: specificOrigins,
                                  policy =>
                                  {
                                      policy.WithOrigins("http://localhost:3000")
                                        .AllowAnyHeader()
                                        .AllowAnyMethod();
                                  });
            });
        }
    }
}
