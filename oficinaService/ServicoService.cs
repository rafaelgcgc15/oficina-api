using System;
using oficinaAPIModels;
using oficinaRepository;

namespace oficinaService
{
	public class ServicoService : IServicoService
	{


        private readonly IServicoRepository _servicoRepository;

		public ServicoService(IServicoRepository servicoRepository)
		{
            this._servicoRepository = servicoRepository;
		}

        public void Create(Servico servico)
        {
            this._servicoRepository.Create(servico);
        }

        public bool Delete(Servico servico)
        {
            throw new NotImplementedException();
        }

        public Servico Get(int ServicoId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Servico> List(int UsuarioId)
        {
            return this._servicoRepository.List(UsuarioId);
        }

        public bool Update(Servico servico)
        {
            throw new NotImplementedException();
        }
    }
}

