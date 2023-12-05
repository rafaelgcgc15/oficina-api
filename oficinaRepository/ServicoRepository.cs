using System;
using oficinaAPIModels;
using Npgsql;
using System.Data;
using Microsoft.Extensions.Configuration;

namespace oficinaRepository
{
	public class ServicoRepository : IServicoRepository
	{
        private readonly IConfiguration _config;
        private readonly string? _connectionString;
        
        public ServicoRepository(IConfiguration config)
		{
			this._config = config;           
            _connectionString = _config.GetConnectionString("OficinaServicoConn");
        }

        public void Create(Servico servico)
        {
            string queryServico = @"INSERT INTO servico(
	                                    usuario_id, 
	                                    cliente_id,
                                        veiculo_id, 
	                                    servico_valor,
                                        servico_descricao, 
	                                    data_inicio,
                                        data_fim)
                                    VALUES (@UsuarioId,
                                            @ClienteId, @VeiculoId,
                                            @ServicoValor, @ServicoDescricao,
                                            @DataInicio, @DataFim)";
                        
            using (NpgsqlConnection npgsqlConnection = new NpgsqlConnection(this._connectionString))
            {
                npgsqlConnection.Open();
                using (NpgsqlCommand npgsqlCommand = new NpgsqlCommand(queryServico, npgsqlConnection))
                {
                    npgsqlCommand.Parameters.AddWithValue("@UsuarioId", servico.UsuarioId);
                    npgsqlCommand.Parameters.AddWithValue("@ClienteId", servico.ClienteId);
                    npgsqlCommand.Parameters.AddWithValue("@VeiculoId", servico.VeiculoId);
                    npgsqlCommand.Parameters.AddWithValue("@ServicoValor", servico.ServicoValor.HasValue ? servico.ServicoValor.Value : DBNull.Value );
                    npgsqlCommand.Parameters.AddWithValue("@ServicoDescricao", string.IsNullOrEmpty(servico.ServicoDescricao) ? DBNull.Value : servico.ServicoDescricao);
                    npgsqlCommand.Parameters.AddWithValue("@DataInicio", servico.DataInicio.GetValueOrDefault());
                    npgsqlCommand.Parameters.AddWithValue("@DataFim", servico.DataFim.GetValueOrDefault());

                    npgsqlCommand.ExecuteNonQuery();
                    
                    npgsqlConnection.Close();
                }
            }
        }

        public bool Delete(Servico servico)
        {
            throw new NotImplementedException();
        }

        public Servico Get(int ServicoId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Servico> List(int ClienteId)
        {
            List<Servico> listServicos = new List<Servico>();

            string queryServico = @"SELECT s1.servico_id as ""ServicoId"",
	                                       s1.usuario_id as ""UsuarioId"", 
	                                       s1.cliente_id as ""ClienteId"", 
	                                       s1.veiculo_id as ""VeiculoId"", 
	                                       s1.servico_valor as ""ServicoValor"", 
	                                       s1.servico_descricao as ""ServicoDescricao"", 
	                                       s1.data_inicio as ""DataInicio"", 
	                                       s1.data_fim as ""DataFim""
                                    FROM servico s1
                                    WHERE s1.cliente_id = @ClienteId";

            NpgsqlDataReader npgsqlDataReader;
            DataTable dataTableServico = new DataTable();

            using (NpgsqlConnection npgsqlConnection = new NpgsqlConnection(this._connectionString))
            {
                npgsqlConnection.Open();
                using(NpgsqlCommand npgsqlCommand = new NpgsqlCommand(queryServico, npgsqlConnection))
                {
                    npgsqlCommand.Parameters.AddWithValue("@ClienteId", ClienteId);
                    npgsqlDataReader = npgsqlCommand.ExecuteReader();
                    dataTableServico.Load(npgsqlDataReader);

                    npgsqlDataReader.Close();
                    npgsqlConnection.Close();
                }
            }

            foreach (DataRow rowServico in dataTableServico.Rows)
            {
                Servico servico = new Servico();
                servico.ClienteId = (int)rowServico["ClienteId"];
                servico.DataFim = (DateTime?)rowServico["DataFim"];
                servico.DataInicio = (DateTime?)rowServico["DataInicio"];
                servico.ServicoValor = (decimal?)rowServico["ServicoValor"];
                servico.UsuarioId = (int)rowServico["UsuarioId"];
                servico.VeiculoId = (int)rowServico["VeiculoId"];
                servico.ServicoId = (int)rowServico["ServicoId"];
                servico.ServicoDescricao = (string?)rowServico["ServicoDescricao"];
                listServicos.Add(servico);
            }

            return listServicos;
        }

        public bool Update(Servico servico)
        {
            throw new NotImplementedException();
        }
    }
}

