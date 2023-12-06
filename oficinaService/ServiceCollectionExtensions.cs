using System;
using Microsoft.Extensions.DependencyInjection;
using oficinaModel;
using oficinaRepository;

namespace oficinaService
{
	public static class ServiceCollectionExtensions
	{
        public static void AddOficinaService(this IServiceCollection services)
        {
            services.AddScoped<IServicoRepository, ServicoRepository>();         
        }
    }
}

