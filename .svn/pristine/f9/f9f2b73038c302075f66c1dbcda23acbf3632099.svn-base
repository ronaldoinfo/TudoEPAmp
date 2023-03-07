using CMS.CacheSync.Front.BLL;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using FrameworkExtension.CommonBusiness;
using FrameworkExtension.Utils;
using MongoDB.Bson;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using WebApi.SiteNoSQL.Controllers;

namespace WebApi.MidiaCenterNoSQL.Sons.Controllers
{
    [RoutePrefix("api/SonsNoSQL")]
    public class SonsNoSQLController : ApiController
    {
        private static string UrlBaseApi;
        private static int IdSite;
        private static SitesModelsNoSQL.SitesModel sitesModel;
        private static IMongoDatabase mongoDatabase;
        CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL extensoesXslBLL = new CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL();

        /// <summary>
        /// Existem 2 construtores, sendo 1 sem parâmetro, que busca do tbsites do MSSQL. (na verdade sempre que formos publicar devemos pegar direto do MSSQL)
        /// O outro construtor busca dos sites do NoSQL para maior velocidade nas buscas e também quando o MSSQL estiver fora.
        /// </summary>
        public SonsNoSQLController()
        {
            CheckConnectionController checkConnectionController = new CheckConnectionController();
            UrlBaseApi = ConfigurationManager.AppSettings["urlBaseAPI"].ToString();
            IdSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
            var client = CommonMongoClient.Instance;
            mongoDatabase = client.GetDatabase(IdSite.ToString());

            if (checkConnectionController.TestConnectionNoSQL())
            {
                // se tem conexão com o mongo busca dos sites do mongo
                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                sitesModel = sitesNoSQLController.SitesBsonModelToSitesModel(sitesNoSQLController.GetSiteByIdNoSQL(IdSite));
            }
            else
            {
                // caso contrário busca do sqlserver
                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                sitesModel = sitesNoSQLController.GetSite(IdSite);
            }
        }
        public SonsNoSQLController(bool FromNoSQL = false)
        {
            CheckConnectionController checkConnectionController = new CheckConnectionController();
            UrlBaseApi = ConfigurationManager.AppSettings["urlBaseAPI"].ToString();
            IdSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
            var client = CommonMongoClient.Instance;
            mongoDatabase = client.GetDatabase(IdSite.ToString());

            if (checkConnectionController.TestConnectionNoSQL())
            {
                // se tem conexão com o mongo busca dos sites do mongo
                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                sitesModel = sitesNoSQLController.SitesBsonModelToSitesModel(sitesNoSQLController.GetSiteByIdNoSQL(IdSite));
            }
            else
            {
                // caso contrário busca do sqlserver
                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                sitesModel = sitesNoSQLController.GetSite(IdSite);
            }
        }

        #region Publicadores

        /// <summary>
        /// Gera documento no mongo baseado nas árvores de editorias,secoes,subseções e idsom
        /// </summary>
        [HttpGet]
        [Route("PublicarSonsSecoesSites")]
        public string PublicarSonsSecoesSites()
        {
            mongoDatabase.DropCollectionAsync("SonsSecoesSites");
            string inicio = DateTime.Now.ToString();
            var canais = mongoDatabase.GetCollection<SonsModelsNoSQL.SecoesCanaisModel>("SonsSecoesSites");
            List<SonsModelsNoSQL.SecoesCanaisModel> secoesCanaisModels = GetSecoesCanais();

            // canais
            foreach (var canal in secoesCanaisModels)
            {
                List<SonsModelsNoSQL.SecoesModel> editorias = GetListaSecoes(SonsModelsNoSQL.EnumTipoSecao.Editoria);
                canal.Editorias = new List<dynamic>();

                // transfere o valor do campo [canal] para a editoria
                editorias.Select(c => { c.Canal = canal.Canal; return c; }).ToList();

                // editorias
                foreach (var editoria in editorias.Where(a => a.IdCanal == canal.IdCanal))
                {
                    List<SonsModelsNoSQL.SecoesModel> secoes = GetListaSecoes(SonsModelsNoSQL.EnumTipoSecao.Secao, editoria.IdSecao);

                    // seções
                    editoria.ListSecoesModel = new List<dynamic>();
                    foreach (var secao in secoes)
                    {
                        secao.Canal = editoria.Canal;
                        List<SonsModelsNoSQL.SecoesModel> subsecoes = GetListaSecoes(SonsModelsNoSQL.EnumTipoSecao.SubSecao, secao.IdSecao);

                        // subsecoes
                        secao.ListSecoesModel = new List<dynamic>();
                        foreach (var subsecao in subsecoes)
                        {
                            subsecao.Canal = secao.Canal;
                            List<SonsModelsNoSQL.McSonsModel> sons = GetListaSons(subsecao.IdSecao);

                            // sons
                            subsecao.ListSonsModels = new List<dynamic>();
                            foreach (var som in sons)
                            {
                                subsecao.ListSonsModels.Add(new { idsom = som.SOM_ID });
                            }

                            // add somente se tiver conteúdo
                            if (subsecao.ListSonsModels.Any())
                            {
                                secao.ListSecoesModel.Add(new
                                {
                                    idsecao = subsecao.IdSecao,
                                    idsecaopai = subsecao.IdSecaoPai,
                                    nomesecao = subsecao.Secao,
                                    subsecao.Agencia,
                                    sons = subsecao.ListSonsModels
                                });
                            }
                            else
                                continue;
                        }

                        // add somente se tiver conteúdo
                        if (secao.ListSecoesModel.Any())
                        {
                            editoria.ListSecoesModel.Add(new
                            {
                                idsecao = secao.IdSecao,
                                idsecaopai = secao.IdSecaoPai,
                                nomesecao = secao.Secao,
                                secao.Agencia,
                                secao.Diretorio,
                                hotsite = secao.HotSite,
                                subsecoes = secao.ListSecoesModel
                            });
                        }
                        else
                            continue;
                    }

                    canal.Editorias.Add(new
                    {
                        idsecao = editoria.IdSecao,
                        idsecaopai = editoria.IdSecaoPai,
                        editoria.Canal,
                        nomesecao = editoria.Secao,
                        editoria.Diretorio,
                        secoes = editoria.ListSecoesModel
                    });
                }

                canais.InsertOne(canal);
            }

            #region Criação de índices
            IndexKeysDefinition<SonsModelsNoSQL.SecoesCanaisModel> keys = Builders<SonsModelsNoSQL.SecoesCanaisModel>.IndexKeys.Descending("Editorias.secoes.subsecoes.idsecao");
            var options = new CreateIndexOptions { Name = "SonsSecoesSitesIDX" };
            var indexModel = new CreateIndexModel<SonsModelsNoSQL.SecoesCanaisModel>(keys, options);
            canais.Indexes.CreateOneAsync(indexModel);
            #endregion

            Sync(SyncMultimidiaBLL.Chamadas.PublicarSonsSecoesSites, "SonsNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        /// <summary>
        /// Gera documento no mongo baseado nos id's dos sons que estão no documento SonsSecoesSites
        /// </summary>
        [HttpGet]
        [Route("PublicarSons")]
        public string PublicarSons()
        {
            mongoDatabase.DropCollectionAsync("Sons");
            string inicio = DateTime.Now.ToString();
            string idsSom = string.Empty;
            var sonsMongo = mongoDatabase.GetCollection<dynamic>("Sons");

            foreach (var item in GetAllIdsSonsNoSQL<int>())
            {
                idsSom += item + ",";
            }

            if (idsSom.Length > 0)
                idsSom = idsSom.Substring(0, idsSom.Length - 1);

            var sons = GetSonsByIdsSom(new SonsModelsNoSQL.IdsSom { Ids = idsSom });

            foreach (var som in sons)
            {
                string idsites = GeraCampoIdSites(som);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : som.SITEPRINCIPAL_ID;
                som.Imagens = new List<SonsModelsNoSQL.ImagensModel>();

                SonsModelsNoSQL.ImagensModel imagemdestaque, imagemmanchete;

                Fotos(som, out imagemdestaque, out imagemmanchete);

                if (imagemdestaque != null && imagemdestaque.Idmultimidia > 0)
                {
                    som.Imagens.Add(imagemdestaque);
                }

                if (imagemmanchete != null && imagemmanchete.Idmultimidia > 0)
                {
                    som.Imagens.Add(imagemmanchete);
                }

                sonsMongo.InsertOne(
                    new
                    {
                        ativo = som.SOM_ATIVO,
                        idsom = som.SOM_ID,
                        publicacao = som.SOM_DATA_PUBLICACAO.ToString("s"),
                        expiracao = som.SOM_DATA_EXPIRACAO.ToString("s"),
                        assunto = !string.IsNullOrWhiteSpace(som.SOM_CHAPEU) ? RemoveTroublesomeCharacters(som.SOM_CHAPEU.Trim()) : string.Empty,
                        manchete = !string.IsNullOrWhiteSpace(som.SOM_MANCHETE) ? RemoveTroublesomeCharacters(som.SOM_MANCHETE.Trim()) : string.Empty,
                        destaque = !string.IsNullOrWhiteSpace(som.SOM_DESTAQUE) ? RemoveTroublesomeCharacters(som.SOM_DESTAQUE.Trim()) : string.Empty,
                        legenda = !string.IsNullOrWhiteSpace(som.SOM_LEGENDA) ? RemoveTroublesomeCharacters(som.SOM_LEGENDA.Trim()) : string.Empty,
                        arquivo = !string.IsNullOrWhiteSpace(som.SOM_ARQUIVO) ? som.SOM_ARQUIVO.Trim() : string.Empty,
                        url = "SOM,0,1," + som.SOM_ID + "," + GeraURL(som.SOM_URL) + ".aspx",
                        subpasta = !string.IsNullOrWhiteSpace(som.SOM_SUBPASTA) ? RemoveTroublesomeCharacters(som.SOM_SUBPASTA.Trim()) : string.Empty,
                        duracao = som.SOM_DURACAO,
                        view = som.SOM_VIEWS,
                        nivelrestricao = (int)som.SOM_NIVELRESTRICAO,
                        atualizacao = som.SOM_DATA_ATUALIZACAO.HasValue ? som.SOM_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                        idsites,
                        idportal,
                        imagens = som.Imagens,
                        tags = som.SOM_TAG_BUSCA
                    });
            }

            #region Criação de índices

            var options1 = new CreateIndexOptions { Name = "idsomIDX", Unique = true };
            IndexKeysDefinition<dynamic> key1 = Builders<dynamic>.IndexKeys.Descending("idsom");
            var indexModel1 = new CreateIndexModel<dynamic>(key1, options1);
            sonsMongo.Indexes.CreateOneAsync(indexModel1);

            var options2 = new CreateIndexOptions { Name = "mancheteIDX" };
            IndexKeysDefinition<dynamic> key2 = Builders<dynamic>.IndexKeys.Text("manchete");
            var indexModel2 = new CreateIndexModel<dynamic>(key2, options2);
            sonsMongo.Indexes.CreateOneAsync(indexModel2);

            var options3 = new CreateIndexOptions { Name = "destaqueIDX" };
            IndexKeysDefinition<dynamic> key3 = Builders<dynamic>.IndexKeys.Text("destaque");
            var indexModel3 = new CreateIndexModel<dynamic>(key3, options3);
            sonsMongo.Indexes.CreateOneAsync(indexModel3);

            var options5 = new CreateIndexOptions { Name = "publicacaoIDX" };
            IndexKeysDefinition<dynamic> key5 = Builders<dynamic>.IndexKeys.Descending("publicacao");
            var indexModel5 = new CreateIndexModel<dynamic>(key5, options5);
            sonsMongo.Indexes.CreateOneAsync(indexModel5);

            var options6 = new CreateIndexOptions { Name = "expiracaoIDX" };
            IndexKeysDefinition<dynamic> key6 = Builders<dynamic>.IndexKeys.Descending("expiracao");
            var indexModel6 = new CreateIndexModel<dynamic>(key6, options6);
            sonsMongo.Indexes.CreateOneAsync(indexModel6);

            var options7 = new CreateIndexOptions { Name = "idsitesIDX" };
            IndexKeysDefinition<dynamic> key7 = Builders<dynamic>.IndexKeys.Descending("idsites");
            var indexModel7 = new CreateIndexModel<dynamic>(key7, options7);
            sonsMongo.Indexes.CreateOneAsync(indexModel7);

            #endregion

            Sync(SyncMultimidiaBLL.Chamadas.PublicarSons, "SonsNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("RemoverSomSecaoSite")]
        public bool RemoverSomSecaoSite(int IdSom, int IdSecao)
        {
            try
            {
                var collectionSonsSecoesSites = mongoDatabase.GetCollection<SonsModelsNoSQL.SonsSecoesModel>("SonsSecoesSites");
                var filterSonsSecoesSites = Builders<SonsModelsNoSQL.SonsSecoesModel>.Filter.Eq("Editorias.secoes.subsecoes.sons.idsom", IdSom);
                var updateSonsSecoesSites = Builders<SonsModelsNoSQL.SonsSecoesModel>.Update.PullFilter("Editorias.$[].secoes.$[].subsecoes.$[i].sons", Builders<BsonDocument>.Filter.Eq("idsom", IdSom));
                var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<SonsModelsNoSQL.SonsSecoesModel>("{'i.idsecao': " + IdSecao + "}") };
                var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                var resultadoSonsSecoesSites = collectionSonsSecoesSites.UpdateOne(filterSonsSecoesSites, updateSonsSecoesSites, updateOptions);

                object[] param = { "SonsNoSQL", "IdSom", IdSom, "IdSecao", IdSecao };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverSomSecaoSite, param);

                return (resultadoSonsSecoesSites.MatchedCount > 0 && resultadoSonsSecoesSites.ModifiedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverSom")]
        public bool RemoverSom(int IdSom)
        {
            try
            {
                var collectionSons = mongoDatabase.GetCollection<dynamic>("Sons");
                var filterSons = Builders<dynamic>.Filter.Eq("idsom", IdSom);
                var resultadoSons = collectionSons.DeleteOne(filterSons);

                object[] param = { "SonsNoSQL", "IdSom", IdSom,  };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverSom, param);

                return (resultadoSons.DeletedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirSom")]
        public bool InserirSom(int IdSom)
        {
            try
            {
                RemoverSom(IdSom);

                var sonsMongo = mongoDatabase.GetCollection<dynamic>("Sons");
                var som = GetSomByIdSom(IdSom);

                string idsites = GeraCampoIdSites(som);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : som.SITEPRINCIPAL_ID;

                SonsModelsNoSQL.ImagensModel imagemdestaque, imagemmanchete;

                Fotos(som, out imagemdestaque, out imagemmanchete);

                if (som.Imagens == null)
                    som.Imagens = new List<SonsModelsNoSQL.ImagensModel>();

                if (imagemdestaque != null && imagemdestaque.Idmultimidia > 0)
                {
                    som.Imagens.Add(imagemdestaque);
                }

                if (imagemmanchete != null && imagemmanchete.Idmultimidia > 0)
                {
                    som.Imagens.Add(imagemmanchete);
                }

                sonsMongo.InsertOneAsync(new
                {
                    ativo = som.SOM_ATIVO,
                    idsom = som.SOM_ID,
                    publicacao = som.SOM_DATA_PUBLICACAO.ToString("s"),
                    expiracao = som.SOM_DATA_EXPIRACAO.ToString("s"),
                    assunto = !string.IsNullOrWhiteSpace(som.SOM_CHAPEU) ? RemoveTroublesomeCharacters(som.SOM_CHAPEU.Trim()) : string.Empty,
                    manchete = !string.IsNullOrWhiteSpace(som.SOM_MANCHETE) ? RemoveTroublesomeCharacters(som.SOM_MANCHETE.Trim()) : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(som.SOM_DESTAQUE) ? RemoveTroublesomeCharacters(som.SOM_DESTAQUE.Trim()) : string.Empty,
                    legenda = !string.IsNullOrWhiteSpace(som.SOM_LEGENDA) ? RemoveTroublesomeCharacters(som.SOM_LEGENDA.Trim()) : string.Empty,
                    arquivo = !string.IsNullOrWhiteSpace(som.SOM_ARQUIVO) ? som.SOM_ARQUIVO.Trim() : string.Empty,
                    url = "SOM,0,1," + som.SOM_ID + "," + GeraURL(som.SOM_URL) + ".aspx",
                    subpasta = !string.IsNullOrWhiteSpace(som.SOM_SUBPASTA) ? RemoveTroublesomeCharacters(som.SOM_SUBPASTA.Trim()) : string.Empty,
                    duracao = som.SOM_DURACAO,
                    view = som.SOM_VIEWS,
                    nivelrestricao = (int)som.SOM_NIVELRESTRICAO,
                    atualizacao = som.SOM_DATA_ATUALIZACAO.HasValue ? som.SOM_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                    idsites,
                    idportal,
                    imagens = som.Imagens,
                    tags = som.SOM_TAG_BUSCA
                });

                object[] param = { "SonsNoSQL", "IdSom", IdSom, };
                Sync(SyncMultimidiaBLL.Chamadas.InserirSom, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirSomSecaoSite")]
        public bool InserirSomSecaoSite(int IdSom)
        {
            try
            {
                var collectionSonsSecoesSites = mongoDatabase.GetCollection<SonsModelsNoSQL.SonsSecoesModel>("SonsSecoesSites");
                var secoesSom = GetSecoesSom(IdSom);

                foreach (var item in secoesSom)
                {
                    RemoverSomSecaoSite(IdSom, item.IdSecao);

                    // Busca nas SUBSECOES se existe o idsecao do som
                    FieldDefinition<SonsModelsNoSQL.SonsSecoesModel, dynamic> field = "Editorias.secoes.subsecoes";
                    var filter = Builders<SonsModelsNoSQL.SonsSecoesModel>.Filter.Empty;
                    var result = collectionSonsSecoesSites.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult().Where(a => a.idsecao == item.IdSecao);

                    if (result.Any())
                    {
                        // Se encontrar no mongo, insere notícia dentro da SUBSECAO especificada
                        FilterDefinition<SonsModelsNoSQL.SonsSecoesModel> filterSonsSecoesSites = Builders<SonsModelsNoSQL.SonsSecoesModel>.Filter.Empty;
                        var updateSonsSecoesSites = Builders<SonsModelsNoSQL.SonsSecoesModel>.Update.Push("Editorias.$[].secoes.$[].subsecoes.$[i].sons", new { idsom = IdSom });
                        var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<SonsModelsNoSQL.SonsSecoesModel>("{'i.idsecao': " + item.IdSecao + "}") };
                        var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                        var resultadoSonsSecoesSites = collectionSonsSecoesSites.UpdateOne(filterSonsSecoesSites, updateSonsSecoesSites, updateOptions);
                    }
                    else
                    {
                        // Se não encontrar no mongo, refaz o arquivo do zero e sai do foreach
                        PublicarSonsSecoesSites();
                        break;
                    }
                }

                object[] param = { "SonsNoSQL", "IdSom", IdSom, };
                Sync(SyncMultimidiaBLL.Chamadas.InserirSomSecaoSite, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region Métodos Auxiliares
        private static string GeraCampoIdSites(SonsModelsNoSQL.McSonsModel mcSonsModel)
        {
            List<string> sites = new List<string>();
            var sonssecoessites = GetIdsSitesByIdSom(mcSonsModel.SOM_ID);

            foreach (var portal in sonssecoessites.Distinct())
            {
                sites.Add(portal.ToString());
            }

            string idsites = string.Empty;
            int contador = 1;

            foreach (var sitex in sites.Distinct())
            {
                if (contador < sites.Distinct().Count())
                    idsites += sitex + ",";
                else
                    idsites += sitex;

                contador++;
            }

            return idsites;
        }

        private void Sync(SyncMultimidiaBLL.Chamadas metodo, params object[] args)
        {
            SyncMultimidiaBLL syncMultimidiaBLL = new SyncMultimidiaBLL();
            syncMultimidiaBLL.PropagarCacheWebApi(metodo, args);
        }
        private void Fotos(SonsModelsNoSQL.McSonsModel subsecaoNoticia, out SonsModelsNoSQL.ImagensModel imagemdestaque, out SonsModelsNoSQL.ImagensModel imagemmanchete)
        {
            imagemdestaque = GetFotoDestaque(subsecaoNoticia);
            imagemmanchete = GetFotoManchete(subsecaoNoticia);
        }

        #endregion

        #region Buscas NoSQL
        public static List<int> GetAllIdsSonsNoSQL<T>()
        {
            try
            {
                var sons = mongoDatabase.GetCollection<SonsModelsNoSQL.SonsSecoesModel>("SonsSecoesSites");
                FieldDefinition<SonsModelsNoSQL.SonsSecoesModel, int> field = "Editorias.secoes.subsecoes.sons.idsom";
                var filter = Builders<SonsModelsNoSQL.SonsSecoesModel>.Filter.Empty;

                return sons.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsSonsByIdSecaoNoSQL")]
        public async Task<List<int>> GetIdsSonsByIdSecaoNoSQL(int Id)
        {
            try
            {
                IMongoCollection<SonsModelsNoSQL.SecoesCanaisBsonModel> collection = mongoDatabase.GetCollection<SonsModelsNoSQL.SecoesCanaisBsonModel>("SonsSecoesSites");
                List<int> sonsList = new List<int>();

                var filter = Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                           Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                           Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                List<SonsModelsNoSQL.SecoesCanaisBsonModel> canais = await collection.Find(filter).ToListAsync();

                foreach (var canal in canais)
                {
                    var editorias = canal.Editorias;
                    foreach (var editoria in editorias)
                    {
                        var secoes = editoria.secoes;
                        foreach (var secao in secoes)
                        {
                            var subsecoes = secao.subsecoes;
                            foreach (var subsecao in subsecoes)
                            {
                                var sons = subsecao.sons;

                                if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                {
                                    foreach (var som in sons)
                                    {
                                        sonsList.Add(som.idsom);
                                    }
                                }
                            }
                        }
                    }
                }

                return sonsList.Distinct().ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsSonsByIdSecaoNoSQLSincrono")]
        public List<int> GetIdsSonsByIdSecaoNoSQLSincrono(int Id)
        {
            try
            {
                IMongoCollection<SonsModelsNoSQL.SecoesCanaisBsonModel> collection = mongoDatabase.GetCollection<SonsModelsNoSQL.SecoesCanaisBsonModel>("SonsSecoesSites");
                List<int> sonsList = new List<int>();

                var filter = Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                           Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                           Builders<SonsModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                List<SonsModelsNoSQL.SecoesCanaisBsonModel> canais = collection.Find(filter).ToList();

                foreach (var canal in canais)
                {
                    var editorias = canal.Editorias;
                    foreach (var editoria in editorias)
                    {
                        var secoes = editoria.secoes;
                        foreach (var secao in secoes)
                        {
                            var subsecoes = secao.subsecoes;
                            foreach (var subsecao in subsecoes)
                            {
                                var sons = subsecao.sons;

                                if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                {
                                    foreach (var som in sons)
                                    {
                                        sonsList.Add(som.idsom);
                                    }
                                }
                            }
                        }
                    }
                }

                return sonsList.Distinct().ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetSomByIdNoSQL")]
        public async Task<SonsModelsNoSQL.SonsBsonModel> GetSomByIdNoSQL(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<SonsModelsNoSQL.SonsBsonModel>("Sons");
                var filter = Builders<SonsModelsNoSQL.SonsBsonModel>.Filter.Eq("idsom", Id);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

        #region Buscas Banco Relacional
        private static List<SonsModelsNoSQL.SecoesCanaisModel> GetSecoesCanais()
        {
            List<SonsModelsNoSQL.SecoesCanaisModel> secoesCanaisModel = new List<SonsModelsNoSQL.SecoesCanaisModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "SecoesCanais/GetAll";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoescanaisJsonString = response.Content.ReadAsStringAsync().Result;
                secoesCanaisModel = JsonConvert.DeserializeObject<List<SonsModelsNoSQL.SecoesCanaisModel>>(secoescanaisJsonString);
            }

            return secoesCanaisModel;
        }
        public List<SonsModelsNoSQL.SecoesModel> GetListaSecoes(SonsModelsNoSQL.EnumTipoSecao tipo, int idSecaoPai = 0)
        {
            List<SonsModelsNoSQL.SecoesModel> secoesModel = new List<SonsModelsNoSQL.SecoesModel>();
            string lista = "8,9,10,11,12,13,14,15";
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetListaSecoes?idTipoSecao=" + (int)tipo + "&idSecaoPai=" + idSecaoPai + "&idSite=" + IdSite + "&idSiteCidade=" + 1 + "&lista=" + lista;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<SonsModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
        }
        public List<SonsModelsNoSQL.McSonsModel> GetListaSons(int idSecao)
        {
            List<SonsModelsNoSQL.McSonsModel> mcSonsModel = new List<SonsModelsNoSQL.McSonsModel>();
            int qtddiasxmlsom = int.Parse(CommonBusiness.GetConfig("qtd_xml_som"));
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McSons/GetSom?idSecao=" + idSecao + "&idSite=" + IdSite + "&qtdDiasXmlSom=" + qtddiasxmlsom;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var sonsJsonString = response.Content.ReadAsStringAsync().Result;
                mcSonsModel = JsonConvert.DeserializeObject<List<SonsModelsNoSQL.McSonsModel>>(sonsJsonString);
            }

            return mcSonsModel;
        }
        private static List<SonsModelsNoSQL.McSonsModel> GetSonsByIdsSom(SonsModelsNoSQL.IdsSom idsSom)
        {
            List<SonsModelsNoSQL.McSonsModel> sons = new List<SonsModelsNoSQL.McSonsModel>();
            var client = CommonHttpClient.Instance;
            string param = JsonConvert.SerializeObject(idsSom);
            var URI = UrlBaseApi + "McSons/GetSonsByIdsSom";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(param, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var sonsJsonString = response.Content.ReadAsStringAsync().Result;
                sons = JsonConvert.DeserializeObject<List<SonsModelsNoSQL.McSonsModel>>(sonsJsonString);
            }

            return sons;
        }
        private static List<int> GetIdsSitesByIdSom(int IdSom)
        {
            List<int> sonsSecoesSites = new List<int>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McSonsSecoesSites/GetIdsSitesByIdSom?IdSom=" + IdSom;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var sonsSecoesSitesJsonString = response.Content.ReadAsStringAsync().Result;
                sonsSecoesSites = JsonConvert.DeserializeObject<List<int>>(sonsSecoesSitesJsonString);
            }

            return sonsSecoesSites;
        }
        private static SonsModelsNoSQL.McSonsModel GetSomByIdSom(int IdSom)
        {
            SonsModelsNoSQL.McSonsModel mcSonsModel = new SonsModelsNoSQL.McSonsModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McSons/" + IdSom;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var somJsonString = response.Content.ReadAsStringAsync().Result;
                mcSonsModel = JsonConvert.DeserializeObject<SonsModelsNoSQL.McSonsModel>(somJsonString);
            }

            return mcSonsModel;
        }
        public List<SonsModelsNoSQL.SecoesModel> GetSecoesSom(int IdSom)
        {
            List<SonsModelsNoSQL.SecoesModel> secoesModel = new List<SonsModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSecaoByIdSom?idSom=" + IdSom + "&idSite=" + IdSite;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<SonsModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
        }

        private static SonsModelsNoSQL.ImagensModel GetFotoDestaque(SonsModelsNoSQL.McSonsModel som)
        {
            NoticiasModelsNoSQL.McFotosModel multimidia = new NoticiasModelsNoSQL.McFotosModel();
            SonsModelsNoSQL.ImagensModel retorno = new SonsModelsNoSQL.ImagensModel();
            if (som.IdImagemDestaque.HasValue && som.IdImagemDestaque.Value > 0)
            {
                var client = CommonHttpClient.Instance;
                var URI = UrlBaseApi + "Fotos/" + som.IdImagemDestaque.Value;
                HttpResponseMessage response = client.GetAsync(URI).Result;
                if (response.IsSuccessStatusCode)
                {
                    var fotosJsonString = response.Content.ReadAsStringAsync().Result;
                    multimidia = JsonConvert.DeserializeObject<NoticiasModelsNoSQL.McFotosModel>(fotosJsonString);
                }

                if (multimidia == null)
                    return null;

                retorno.Arquivo = multimidia.Arquivo;
                retorno.Credito = RemoveTroublesomeCharacters(multimidia.Credito.Trim());
                retorno.Idmultimidia = multimidia.IdMultimidia;
                retorno.Legenda = RemoveTroublesomeCharacters(multimidia.Legenda.Trim());
                retorno.Tipo = "fotodestaque";
            }

            return retorno;
        }
        public SonsModelsNoSQL.ImagensModel GetFotoManchete(SonsModelsNoSQL.McSonsModel som)
        {
            NoticiasModelsNoSQL.McFotosModel multimidia = new NoticiasModelsNoSQL.McFotosModel();
            SonsModelsNoSQL.ImagensModel retorno = new SonsModelsNoSQL.ImagensModel();

            if (som.IdImagemManchete.HasValue && som.IdImagemManchete.Value > 0)
            {
                var client = CommonHttpClient.Instance;
                var URI = UrlBaseApi + "Fotos/" + som.IdImagemManchete.Value;
                HttpResponseMessage response = client.GetAsync(URI).Result;
                if (response.IsSuccessStatusCode)
                {
                    var fotosJsonString = response.Content.ReadAsStringAsync().Result;
                    multimidia = JsonConvert.DeserializeObject<NoticiasModelsNoSQL.McFotosModel>(fotosJsonString);
                }

                if (multimidia == null)
                    return null;

                retorno.Arquivo = multimidia.Arquivo;
                retorno.Credito = RemoveTroublesomeCharacters(multimidia.Credito.Trim());
                retorno.Idmultimidia = multimidia.IdMultimidia;
                retorno.Legenda = RemoveTroublesomeCharacters(multimidia.Legenda.Trim());
                retorno.Tipo = "fotomanchete";
            }

            return retorno;
        }

        #endregion

        #region Utilitários
        public static string RemoveTroublesomeCharacters(string inString)
        {
            if (inString == null) return null;
            StringBuilder newString = new StringBuilder();
            char ch;
            for (int i = 0; i < inString.Length; i++)
            {
                ch = inString[i];
                // remove any characters outside the valid UTF-8 range as well as all control characters
                // except tabs and new lines
                if ((ch < 0x00FD && ch > 0x001F) || ch == '\t' || ch == '\n' || ch == '\r')
                {
                    newString.Append(ch);
                }
            }
            return newString.ToString();
        }
        public static string GeraURL(string desc)
        {
            string surl = desc;

            if (surl != null)
            {
                surl = surl.Trim();
                char[] chars = "$%#@!*?;:~`=()[]{}|\\\'<>,^&\".".ToCharArray();
                surl = surl.Replace("/", "-")
                       .Replace("ª", "a")
                       .Replace("º", "o")
                       .Replace("á", "a")
                       .Replace("Á", "A")
                       .Replace("é", "e")
                       .Replace("É", "E")
                       .Replace("í", "i")
                       .Replace("Í", "I")
                       .Replace("ó", "o")
                       .Replace("Ó", "O")
                       .Replace("ú", "u")
                       .Replace("Ú", "U")
                       .Replace("ç", "c")
                       .Replace("Ç", "C")
                       .Replace("ã", "a")
                       .Replace("Ã", "A")
                       .Replace("õ", "o")
                       .Replace("Õ", "O")
                       .Replace("â", "a")
                       .Replace("Â", "A")
                       .Replace("ê", "e")
                       .Replace("Ê", "E")
                       .Replace("î", "i")
                       .Replace("Î", "I")
                       .Replace("ô", "o")
                       .Replace("Ô", "O")
                       .Replace("û", "u")
                       .Replace("Û", "U")
                       .Replace("à", "a")
                       .Replace("À", "A")
                       .Replace("è", "e")
                       .Replace("È", "E")
                       .Replace("ì", "i")
                       .Replace("Ì", "I")
                       .Replace("ò", "o")
                       .Replace("Ò", "O")
                       .Replace("ù", "u")
                       .Replace("Ù", "U")
                       .Replace("ä", "a")
                       .Replace("Ä", "A")
                       .Replace("ë", "e")
                       .Replace("Ë", "E")
                       .Replace("ï", "i")
                       .Replace("Ï", "I")
                       .Replace("ö", "o")
                       .Replace("Ö", "O")
                       .Replace("ü", "u")
                       .Replace("Ü", "U")
                       .Replace(".", "-")
                       .Replace('"', '-');
                for (int i = 0; i < chars.Length; i++)
                {
                    string strChar = chars.GetValue(i).ToString();
                    if (surl.Contains(strChar))
                        surl = surl.Replace(strChar, String.Empty);
                }
                surl = surl.Replace(" ", "-").Replace("--", "-").Replace("+", "-").Trim();
                if (surl.Length > 255)
                    surl = surl.Substring(0, 254);
            }
            return surl;
        }

        #endregion

        #region Métodos utilizados em UserControls

        [Route("ObtemColunistasLateralInternaNoSQL")]
        [HttpGet]
        public string ObtemColunistasLateralInternaNoSQL(int IdSecao, int Quantidade)
        {
            SonsNoSQLController sonsNoSQLController = new SonsNoSQLController(true);
            var listaIdsSons = sonsNoSQLController.GetIdsSonsByIdSecaoNoSQLSincrono(IdSecao);

            string imagem;
            StringBuilder html = new StringBuilder();

            html.Append("<div class='donnot-miss-widget mb-5'>");
            html.Append("<div class='cbnrb2020-heading'>");
            html.Append("<h6 class='d-flex flex-wrap font-pt text-uppercase border-0 align-items-center mb-4' style='letter-spacing: 1px'><small class='my-auto mr-3' style='font-size: 0.5em !important'><i class='fas fa-circle fa-sm'></i></small><strong>COLUNISTAS</strong></h6>");
            html.Append("</div>");

            if (listaIdsSons.Any())
            {
                foreach (var idSom in listaIdsSons.Take(Quantidade))
                {
                    var som = GetSomByIdNoSQL(idSom).Result;

                    #region Recuperando a imagem

                    imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, som.imagens.Any() ? som.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);

                    #endregion

                    #region HTML

                    var url = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(som.idsom, "4", IdSecao) + som.url;

                    html.Append("<div class='cbnrb2020-single-category-post row g-0 align-items-center pt-0 border-0'>");
                    html.Append("<div class='col-3 dont-miss-post-thumb rounded-circle overflow-hidden bg-gray-imgfx'>");
                    html.Append("    <img class='img-fluid p-2 rounded-circle w-100' src='" + imagem + "' alt='' />");
                    html.Append("</div>");

                    html.Append("<div class='col-9 pl-3'>");
                    html.Append("<p class='font-base font-weight-bolder font-italic h6 text-dark'>" + som.assunto + "</p>");
                    html.Append("<h6><a href='" + url + "' class='font-pt'>" + som.manchete + "</a></h6>");

                    html.Append("<div class='icones-player sidebar w-100 d-flex pr-2'>");
                    html.Append("<a href='javascript:void(0)' onclick='alterarPlay(" + som.idsom + ")' class='pr-3' title='player'>");
                    html.Append("<i class='far color fa-play-circle'></i>");
                    html.Append("</a>");
                    html.Append("<a href='#' class='pr-3' title='share'>");
                    html.Append("<i class='fas color fa-share-square' style='margin-bottom: 1px;'></i>");
                    html.Append("</a>");
                    html.Append("</div>");

                    html.Append("</div>");
                    html.Append("</div>");

                    html.Append("</div>");
                    html.Append("</li>");

                    #endregion
                }

                html.Append("</div>");

                html.Append("<br />");
                html.Append("<hr class='linha text-secondary' style='opacity: 1;' />");

                return html.ToString();
            }
            else
            {
                return "Não foram encontrados resultados.";
            }
        }

        [Route("ObtemProgramasLateralInternaNoSQL")]
        [HttpGet]
        public string ObtemProgramasLateralInternaNoSQL(int IdSecao, int Quantidade)
        {
            SonsNoSQLController sonsNoSQLController = new SonsNoSQLController(true);
            var listaIdsSons = sonsNoSQLController.GetIdsSonsByIdSecaoNoSQLSincrono(IdSecao);

            string imagem;
            StringBuilder html = new StringBuilder();

            html.Append("<div class='donnot-miss-widget mb-5'>");
            html.Append("<div class='cbnrb2020-heading'>");
            html.Append("<h6 class='d-flex flex-wrap font-pt text-uppercase border-0 align-items-center mb-4' style='letter-spacing: 1px'><small class='my-auto mr-3' style='font-size: 0.5em !important'><i class='fas fa-circle fa-sm'></i></small><strong>PROGRAMAS</strong></h6>");
            html.Append("</div>");

            if (listaIdsSons.Any())
            {
                foreach (var idSom in listaIdsSons.Take(Quantidade))
                {
                    var som = GetSomByIdNoSQL(idSom).Result;

                    #region Recuperando a imagem

                    imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, som.imagens.Any() ? som.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);

                    #endregion

                    #region HTML

                    var url = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(som.idsom, "4", IdSecao) + som.url;

                    html.Append("<div class='cbnrb2020-single-category-post row g-0 align-items-start pt-0 border-0'>");
                    html.Append("<div class='col-4 dont-miss-post-thumb'>");
                    html.Append("    <img class='img-fluid' src='/img/design_podcast3.jpg' alt='' />");
                    html.Append("</div>");
                    html.Append("<div class='col-8 pl-3'>");
                    html.Append("<h6><a href='" + url + "' class='font-pt'>" + som.manchete + "</a></h6>");
                    html.Append("<div class='icones-player sidebar w-100 d-flex pr-2'>");
                    html.Append("<a href='javascript:void(0)' onclick='alterarPlay(" + som.idsom + ")' class='pr-3' title='player'>");
                    html.Append("<i class='far color fa-play-circle'></i>");
                    html.Append("</a>");
                    html.Append("<a href='#' class='pr-3' title='share'>");
                    html.Append("<i class='fas color fa-share-square' style='margin-bottom: 1px;'></i>");
                    html.Append("</a>");
                    html.Append("<span class='ml-auto mt-1 text-right'>" + GetDataExtenso2(som.publicacao.ToDateTime()) + "</span>");

                    html.Append("</div>");

                    html.Append("</div>");

                    html.Append("</div>");

                    #endregion
                }

                html.Append("</div>");

                html.Append("<br />");
                html.Append("<hr class='linha text-secondary' style='opacity: 1;' />");

                return html.ToString();
            }
            else
            {
                return "Não foram encontrados resultados.";
            }
        }

        [Route("ObtemPodcastsPorSecaoPaginadaMaisConteudoInternaNoSQL")]
        [HttpGet]
        public string ObtemPodcastsPorSecaoPaginadaMaisConteudoInternaNoSQL(int IdSecao, int Quantidade)
        {
            SonsNoSQLController sonsNoSQLController = new SonsNoSQLController(true);
            var listaIdsSons = sonsNoSQLController.GetIdsSonsByIdSecaoNoSQLSincrono(IdSecao);

            string imagem;
            StringBuilder html = new StringBuilder();

            if (listaIdsSons.Any())
            {
                foreach (var idSom in listaIdsSons.Take(Quantidade))
                {
                    var som = GetSomByIdNoSQL(idSom).Result;

                    #region Recuperando a imagem

                    imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, som.imagens.Any() ? som.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);

                    #endregion

                    #region HTML

                    var url = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(som.idsom, "4", IdSecao) + som.url;

                    html.Append("<li class='cbnrb2020-single-todays-post my-5 audio'>");
                    html.Append("<div class='todays-post-content'>");

                    html.Append("<figure class='todays-post-thumb bg-gray-imgfx float-left mr-3 '>");
                    html.AppendFormat("<img class='img-fluid' src='{0}' alt='{1}' title='{1}'>", imagem, som.manchete);
                    html.Append("</figure>");

                    html.Append("<div class='d-flex align-items-center mb-3'>");
                    html.Append("<div class='cbnrb2020-post-tag antetitulo mr-2'><span class='tagspan m-0'>" + som.assunto + "</span>");
                    html.Append("</div>");

                    html.Append("<div class='icones-player action sbs my-0 p-0'>");
                    html.Append("<a href='javascript:void(0)' class='play-ondemand my-0 p-0' onclick='alterarPlay(" + som.idsom + ")' " +
                        "aria-label='Escutar notícia' data-id='" + som.idsom + "' data-qualificador='" + som.assunto + "' data-categoria='Podcast' data-programas='Jornal da CBN' " +
                        "data-quadros='" + som.assunto + "' data-titulo='" + som.manchete + "' data-audioduracao='00:25:59' " +
                        "data-caminho='3/2020/09/14/315372_20200914' data-dtcriacao='" + som.publicacao + "' data-dtpublicacao='" + som.publicacao + "' " +
                        "data-url='" + url + "' data-adunit='cbn/ondemand' " +
                        "data-ctarget='ondemand,podcast,politica,jornal-da-cbn,panorama-cbn,bianca-santos,frederico-goulart,panorama-cbn,teste-da-vacina-de-oxford-retomado-e-perdao-divida'>" +
                        "<i class='far color fa-play-circle text-dark fa-lg'></i></a>");
                    html.Append("</div>");
                    html.Append("</div>");

                    var dataextenso = GetDataExtenso(som.publicacao.ToDateTime());

                    html.Append("<h3 class='destaque'>");
                    html.Append("<a href='" + url + "'>" + som.manchete + "</a>");
                    html.Append("</h3>");
                    html.Append("<p class='subtitulo text-justify'>" + som.destaque + "</p>");
                    html.Append("<span class='d-block cbnrb2020-post-date data text-right'>" + dataextenso + "</span>");

                    html.Append("</div>");
                    html.Append("</li>");

                    #endregion
                }

                html.Append("<br />");
                html.Append("<hr class='linha text-secondary' style='opacity: 1;' />");

                return html.ToString();
            }
            else
            {
                return "Não foram encontrados resultados.";
            }
        }

        #endregion

        private string GetDataExtenso(DateTime dateTime)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("pt-Br");
            int dia = dateTime.Day;
            int ano = dateTime.Year;
            string diaSemana = new CultureInfo("pt-BR").DateTimeFormat.GetDayName(dateTime.DayOfWeek);
            return diaSemana.First().ToString().ToUpper() + diaSemana.Substring(1) + ", " + dateTime.ToString("dd/MM/yyyy") + ", " + dateTime.Hour.ToString() + ":" + dateTime.Minute.ToString();
        }

        private string GetDataExtenso2(DateTime dateTime)
        {
            CultureInfo culture = new CultureInfo("pt-BR");
            DateTimeFormatInfo dtfi = culture.DateTimeFormat;
            int dia = dateTime.Day;
            int ano = dateTime.Year;
            string mes = culture.TextInfo.ToTitleCase(dtfi.GetMonthName(dateTime.Month));
            return mes.Substring(0, 3) + " " + dia + ", " + ano;
        }
    }
}