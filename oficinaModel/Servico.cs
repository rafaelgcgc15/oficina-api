using System;
namespace oficinaAPIModels
{
	public class Servico
	{
        public int ServicoId { get; set; }

        public int ClienteId { get; set; }

		public int UsuarioId { get; set; }

		public int VeiculoId { get; set; }

		public string? ServicoDescricao { get; set; }

		public decimal? ServicoValor { get; set; }

		public DateTime? DataInicio { get; set; }

		public DateTime? DataFim { get; set; }

		public IEnumerable<Peca>? Pecas { get; set; }
	}
}

