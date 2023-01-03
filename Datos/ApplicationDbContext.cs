using System;
using Microsoft.EntityFrameworkCore;
using Proyecto_POO.Models;

namespace Proyecto_POO.Datos
{
	public class ApplicationDbContext : DbContext
	{
		public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
		{

		}

		public DbSet<Empleados> Empleados { get; set; }
	}
}

