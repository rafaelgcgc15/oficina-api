using System;
using oficinaAPIModels;

namespace oficinaRepository
{
	public interface IServicoRepository
	{
		void Create(Servico servico);
		bool Update(Servico servico);
		IEnumerable<Servico> List(int UsuarioId);
		bool Delete(Servico servico);
		Servico Get(int ServicoId);
	}
}

