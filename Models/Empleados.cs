using System;
using System.ComponentModel.DataAnnotations;

namespace Proyecto_POO.Models
{
	public class Empleados
	{
		[Key]
		public int id { get; set; }

		public string nombre { get; set; }

		public string apellidoPa { get; set; }

		public string apellidoMa { get; set; }

		public string direccion { get; set; }

		public string email { get; set; }

		public string telefono { get; set; }

		public string rfc { get; set; }

		public string numeroTrabajador { get; set; }

		public string gerente { get; set; }


		public Empleados()
		{

		}
	}
}

