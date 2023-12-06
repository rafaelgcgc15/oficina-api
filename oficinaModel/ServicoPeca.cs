using System;
namespace oficinaModel
{
	public class ServicoPeca
	{
        public int ServicoId { get; set; }

        public int PecaId { get; set; }

        public int Quantidade { get; set; }

        public Servico? Servico { get; set; }

        public Peca? Peca { get; set; }

    }
}

