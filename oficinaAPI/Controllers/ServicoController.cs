using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using oficinaAPIModels;
using oficinaService;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace oficinaAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ServicoController : ControllerBase
    {
        private readonly ILogger<ServicoController> _logger;

        private readonly IConfiguration _configuration;

        private readonly IServicoService _servicoService;

        public ServicoController(ILogger<ServicoController> logger, IConfiguration configuration, IServicoService servicoService)
        {
            this._logger = logger;
            this._configuration = configuration;
            this._servicoService = servicoService;
        }


        // GET: api/values
        [HttpGet]
        public IEnumerable<Servico> Get(int UsuarioId)
        {
            return _servicoService.List(UsuarioId);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int UsuarioId, int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]Servico servico)
        {
            _servicoService.Create(servico);
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}

