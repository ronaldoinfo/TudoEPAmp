using CMS.CacheSync.Front.BLL;
using CMS.MidiaCenter.Model;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using FrameworkExtension.CommonBusiness;
using MongoDB.Bson;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using WebApi.SiteNoSQL.Controllers;

namespace WebApi.MidiaCenterNoSQL.Galerias.Controllers
{
    [RoutePrefix("api/GaleriasNoSQL")]
    public class GaleriasNoSQLController : ApiController
    {
        private static string UrlBaseApi;
        private static int IdSite;
        private static SitesModelsNoSQL.SitesModel sitesModel;
        private static IMongoDatabase mongoDatabase;

        /// <summary>
        /// Existem 2 construtores, sendo 1 sem parâmetro, que busca do tbsites do MSSQL. (na verdade sempre que formos publicar devemos pegar direto do MSSQL)
        /// O outro construtor busca dos sites do NoSQL para maior velocidade nas buscas e também quando o MSSQL estiver fora.
        /// </summary>
        public GaleriasNoSQLController()
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

        public GaleriasNoSQLController(bool FromNoSQL = false)
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
        /// Gera documento no mongo baseado nas árvores de editorias,secoes,subseções e idgaleria
        /// </summary>
        [HttpGet]
        [Route("PublicarGaleriasSecoesSites")]
        public string PublicarGaleriasSecoesSites()
        {
            mongoDatabase.DropCollectionAsync("GaleriasSecoesSites");
            string inicio = DateTime.Now.ToString();
            var canais = mongoDatabase.GetCollection<GaleriasModelsNoSQL.SecoesCanaisModel>("GaleriasSecoesSites");
            List<GaleriasModelsNoSQL.SecoesCanaisModel> secoesCanaisModels = GetSecoesCanais();

            // canais
            foreach (var canal in secoesCanaisModels)
            {
                List<GaleriasModelsNoSQL.SecoesModel> editorias = GetListaSecoes(GaleriasModelsNoSQL.EnumTipoSecao.Editoria);
                canal.Editorias = new List<dynamic>();

                // transfere o valor do campo [canal] para a editoria
                editorias.Select(c => { c.Canal = canal.Canal; return c; }).ToList();

                // editorias
                foreach (var editoria in editorias.Where(a => a.IdCanal == canal.IdCanal))
                {
                    List<GaleriasModelsNoSQL.SecoesModel> secoes = GetListaSecoes(GaleriasModelsNoSQL.EnumTipoSecao.Secao, editoria.IdSecao);

                    // seções
                    editoria.ListSecoesModel = new List<dynamic>();
                    foreach (var secao in secoes)
                    {
                        secao.Canal = editoria.Canal;
                        List<GaleriasModelsNoSQL.SecoesModel> subsecoes = GetListaSecoes(GaleriasModelsNoSQL.EnumTipoSecao.SubSecao, secao.IdSecao);

                        // subsecoes
                        secao.ListSecoesModel = new List<dynamic>();
                        foreach (var subsecao in subsecoes)
                        {
                            subsecao.Canal = secao.Canal;
                            List<GaleriasModelsNoSQL.McGaleriasModel> galerias = GetListaGalerias(subsecao.IdSecao);

                            // galerias
                            subsecao.ListGaleriasModels = new List<dynamic>();
                            foreach (var galeria in galerias)
                            {
                                subsecao.ListGaleriasModels.Add(new { idgaleria = galeria.GALERIA_ID });
                            }

                            // add somente se tiver conteúdo
                            if (subsecao.ListGaleriasModels.Any())
                            {
                                secao.ListSecoesModel.Add(new
                                {
                                    idsecao = subsecao.IdSecao,
                                    idsecaopai = subsecao.IdSecaoPai,
                                    nomesecao = subsecao.Secao,
                                    subsecao.Agencia,
                                    galerias = subsecao.ListGaleriasModels
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
            IndexKeysDefinition<GaleriasModelsNoSQL.SecoesCanaisModel> keys = Builders<GaleriasModelsNoSQL.SecoesCanaisModel>.IndexKeys.Descending("Editorias.secoes.subsecoes.idsecao");
            var options = new CreateIndexOptions { Name = "GaleriasSecoesSitesIDX" };
            var indexModel = new CreateIndexModel<GaleriasModelsNoSQL.SecoesCanaisModel>(keys, options);
            canais.Indexes.CreateOneAsync(indexModel);
            #endregion

            Sync(SyncMultimidiaBLL.Chamadas.PublicarGaleriasSecoesSites, "GaleriasNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        /// <summary>
        /// Gera documento no mongo baseado nos id's das galerias que estão no documento GaleriasSecoesSites
        /// </summary>
        [HttpGet]
        [Route("PublicarGalerias")]
        public string PublicarGalerias()
        {
            mongoDatabase.DropCollectionAsync("Galerias");
            string inicio = DateTime.Now.ToString();
            string idsGaleria = string.Empty;
            var galeriasMongo = mongoDatabase.GetCollection<dynamic>("Galerias");

            foreach (var item in GetAllIdsGaleriasNoSQL<int>())
            {
                idsGaleria += item + ",";
            }

            if (idsGaleria.Length > 0)
                idsGaleria = idsGaleria.Substring(0, idsGaleria.Length - 1);

            var galerias = GetGaleriasByIdsGaleria(new GaleriasModelsNoSQL.IdsGaleria { Ids = idsGaleria });

            foreach (var galeria in galerias)
            {
                string idsites = GeraCampoIdSites(galeria);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : (int)galeria.SITEPRINCIPAL_ID;

                List<GaleriasModelsNoSQL.McGaleriasFotosModel> listaFotos = GetFotos(galeria.GALERIA_ID);
                List<dynamic> fotos = new List<dynamic>();

                foreach (var fotosModel in listaFotos)
                {
                    fotos.Add(new
                    {
                        idfoto = fotosModel.FOTO_ID,
                        legenda = !string.IsNullOrWhiteSpace(fotosModel.FOTO_LEGENDA) ? RemoveTroublesomeCharacters(fotosModel.FOTO_LEGENDA).Trim() : string.Empty,
                        thumb = !string.IsNullOrWhiteSpace(fotosModel.FOTO_THUMBNAIL) ? fotosModel.FOTO_THUMBNAIL.Trim() : string.Empty,
                        credito = !string.IsNullOrWhiteSpace(fotosModel.FOTO_CREDITO) ? RemoveTroublesomeCharacters(fotosModel.FOTO_CREDITO).Trim() : string.Empty
                    });
                }

                galeriasMongo.InsertOne(new
                {
                    ativo = galeria.GALERIA_ATIVA,
                    idgaleria = galeria.GALERIA_ID,
                    publicacao = galeria.GALERIA_DATA_PUBLICACAO.ToString("s"),
                    expiracao = galeria.GALERIA_DATA_EXPIRACAO.ToString("s"),
                    manchete = !string.IsNullOrWhiteSpace(galeria.GALERIA_MANCHETE) ? RemoveTroublesomeCharacters(galeria.GALERIA_MANCHETE.Trim()) : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(galeria.GALERIA_DESTAQUE) ? RemoveTroublesomeCharacters(galeria.GALERIA_DESTAQUE.Trim()) : string.Empty,
                    url = "GFOT,0,3," + galeria.GALERIA_ID + "," + GeraURL(galeria.GALERIA_URL) + ".aspx",
                    tags = !string.IsNullOrWhiteSpace(galeria.GALERIA_TAG_BUSCA) ? RemoveTroublesomeCharacters(galeria.GALERIA_TAG_BUSCA.Trim().ToLower()) : string.Empty,
                    votos = (galeria.GALERIA_RATE_VOTO1 + galeria.GALERIA_RATE_VOTO2 + galeria.GALERIA_RATE_VOTO3 + galeria.GALERIA_RATE_VOTO4 + galeria.GALERIA_RATE_VOTO5).ToString(),
                    rate = galeria.GALERIA_RATE,
                    resumo = !string.IsNullOrWhiteSpace(galeria.GALERIA_RESUMO) ? galeria.GALERIA_RESUMO.Trim() : string.Empty,
                    subpasta = !string.IsNullOrWhiteSpace(galeria.GALERIA_SUBPASTA) ? galeria.GALERIA_SUBPASTA.Trim() : string.Empty,
                    nivelrestricao = galeria.GALERIA_NIVELRESTRICAO != null ? (int)galeria.GALERIA_NIVELRESTRICAO : 0,
                    secaoid = galeria.SECAOPRINCIPAL_ID,
                    credito = !string.IsNullOrWhiteSpace(galeria.GALERIA_CREDITO) ? RemoveTroublesomeCharacters(galeria.GALERIA_CREDITO).Trim() : string.Empty,
                    atualizacao = galeria.GALERIA_DATA_ATUALIZACAO.HasValue ? galeria.GALERIA_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                    idsites,
                    idportal,
                    fotos
                });
            }

            #region Criação de índices

            var options1 = new CreateIndexOptions { Name = "idgaleriaIDX", Unique = true };
            IndexKeysDefinition<dynamic> key1 = Builders<dynamic>.IndexKeys.Descending("idgaleria");
            var indexModel1 = new CreateIndexModel<dynamic>(key1, options1);
            galeriasMongo.Indexes.CreateOneAsync(indexModel1);

            var options2 = new CreateIndexOptions { Name = "mancheteIDX" };
            IndexKeysDefinition<dynamic> key2 = Builders<dynamic>.IndexKeys.Text("manchete");
            var indexModel2 = new CreateIndexModel<dynamic>(key2, options2);
            galeriasMongo.Indexes.CreateOneAsync(indexModel2);

            var options3 = new CreateIndexOptions { Name = "destaqueIDX" };
            IndexKeysDefinition<dynamic> key3 = Builders<dynamic>.IndexKeys.Text("destaque");
            var indexModel3 = new CreateIndexModel<dynamic>(key3, options3);
            galeriasMongo.Indexes.CreateOneAsync(indexModel3);

            var options4 = new CreateIndexOptions { Name = "tagsIDX" };
            IndexKeysDefinition<dynamic> key4 = Builders<dynamic>.IndexKeys.Text("tags");
            var indexModel4 = new CreateIndexModel<dynamic>(key4, options4);
            galeriasMongo.Indexes.CreateOneAsync(indexModel4);

            var options5 = new CreateIndexOptions { Name = "publicacaoIDX" };
            IndexKeysDefinition<dynamic> key5 = Builders<dynamic>.IndexKeys.Descending("publicacao");
            var indexModel5 = new CreateIndexModel<dynamic>(key5, options5);
            galeriasMongo.Indexes.CreateOneAsync(indexModel5);

            var options6 = new CreateIndexOptions { Name = "expiracaoIDX" };
            IndexKeysDefinition<dynamic> key6 = Builders<dynamic>.IndexKeys.Descending("expiracao");
            var indexModel6 = new CreateIndexModel<dynamic>(key6, options6);
            galeriasMongo.Indexes.CreateOneAsync(indexModel6);

            var options7 = new CreateIndexOptions { Name = "idsitesIDX" };
            IndexKeysDefinition<dynamic> key7 = Builders<dynamic>.IndexKeys.Descending("idsites");
            var indexModel7 = new CreateIndexModel<dynamic>(key7, options7);
            galeriasMongo.Indexes.CreateOneAsync(indexModel7);

            #endregion

            Sync(SyncMultimidiaBLL.Chamadas.PublicarGalerias, "GaleriasNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("RemoverGaleriaSecaoSite")]
        public bool RemoverGaleriaSecaoSite(int IdGaleria, int IdSecao)
        {
            try
            {
                var collectionGaleriasSecoesSites = mongoDatabase.GetCollection<GaleriasModelsNoSQL.GaleriasSecoesModel>("GaleriasSecoesSites");
                var filterGaleriasSecoesSites = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Filter.Eq("Editorias.secoes.subsecoes.galerias.idgaleria", IdGaleria);
                var updateGaleriasSecoesSites = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Update.PullFilter("Editorias.$[].secoes.$[].subsecoes.$[i].galerias", Builders<BsonDocument>.Filter.Eq("idgaleria", IdGaleria));
                var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<GaleriasModelsNoSQL.GaleriasSecoesModel>("{'i.idsecao': " + IdSecao + "}") };
                var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                var resultadoGaleriasSecoesSites = collectionGaleriasSecoesSites.UpdateOne(filterGaleriasSecoesSites, updateGaleriasSecoesSites, updateOptions);

                object[] param = { "GaleriasNoSQL", "IdGaleria", IdGaleria, "IdSecao", IdSecao };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverGaleriaSecaoSite, param);

                return (resultadoGaleriasSecoesSites.MatchedCount > 0 && resultadoGaleriasSecoesSites.ModifiedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverGaleria")]
        public bool RemoverGaleria(int IdGaleria)
        {
            try
            {
                var collectionGalerias = mongoDatabase.GetCollection<dynamic>("Galerias");
                var filterGalerias = Builders<dynamic>.Filter.Eq("idgaleria", IdGaleria);
                var resultadoGalerias = collectionGalerias.DeleteOne(filterGalerias);

                object[] param = { "GaleriasNoSQL", "IdGaleria", IdGaleria };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverGaleria, param);

                return (resultadoGalerias.DeletedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirGaleria")]
        public bool InserirGaleria(int IdGaleria)
        {
            try
            {
                RemoverGaleria(IdGaleria);

                var galeriasMongo = mongoDatabase.GetCollection<dynamic>("Galerias");
                var galeria = GetGaleriaByIdGaleria(IdGaleria);

                string idsites = GeraCampoIdSites(galeria);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : (int)galeria.SITEPRINCIPAL_ID;

                List<GaleriasModelsNoSQL.McGaleriasFotosModel> listaFotos = GetFotos(galeria.GALERIA_ID);
                List<dynamic> fotos = new List<dynamic>();

                foreach (var fotosModel in listaFotos)
                {
                    fotos.Add(new
                    {
                        idfoto = fotosModel.FOTO_ID,
                        legenda = !string.IsNullOrWhiteSpace(fotosModel.FOTO_LEGENDA) ? RemoveTroublesomeCharacters(fotosModel.FOTO_LEGENDA).Trim() : string.Empty,
                        thumb = !string.IsNullOrWhiteSpace(fotosModel.FOTO_THUMBNAIL) ? fotosModel.FOTO_THUMBNAIL.Trim() : string.Empty,
                        credito = !string.IsNullOrWhiteSpace(fotosModel.FOTO_CREDITO) ? RemoveTroublesomeCharacters(fotosModel.FOTO_CREDITO).Trim() : string.Empty
                    });
                }

                galeriasMongo.InsertOneAsync(new
                {
                    ativo = galeria.GALERIA_ATIVA,
                    idgaleria = galeria.GALERIA_ID,
                    publicacao = galeria.GALERIA_DATA_PUBLICACAO.ToString("s"),
                    expiracao = galeria.GALERIA_DATA_EXPIRACAO.ToString("s"),
                    manchete = !string.IsNullOrWhiteSpace(galeria.GALERIA_MANCHETE) ? RemoveTroublesomeCharacters(galeria.GALERIA_MANCHETE.Trim()) : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(galeria.GALERIA_DESTAQUE) ? RemoveTroublesomeCharacters(galeria.GALERIA_DESTAQUE.Trim()) : string.Empty,
                    url = "GFOT,0,3," + galeria.GALERIA_ID + "," + GeraURL(galeria.GALERIA_URL) + ".aspx",
                    tags = !string.IsNullOrWhiteSpace(galeria.GALERIA_TAG_BUSCA) ? RemoveTroublesomeCharacters(galeria.GALERIA_TAG_BUSCA.Trim().ToLower()) : string.Empty,
                    votos = (galeria.GALERIA_RATE_VOTO1 + galeria.GALERIA_RATE_VOTO2 + galeria.GALERIA_RATE_VOTO3 + galeria.GALERIA_RATE_VOTO4 + galeria.GALERIA_RATE_VOTO5).ToString(),
                    rate = galeria.GALERIA_RATE,
                    resumo = !string.IsNullOrWhiteSpace(galeria.GALERIA_RESUMO) ? galeria.GALERIA_RESUMO.Trim() : string.Empty,
                    subpasta = !string.IsNullOrWhiteSpace(galeria.GALERIA_SUBPASTA) ? galeria.GALERIA_SUBPASTA.Trim() : string.Empty,
                    nivelrestricao = galeria.GALERIA_NIVELRESTRICAO != null ? (int)galeria.GALERIA_NIVELRESTRICAO : 0,
                    secaoid = galeria.SECAOPRINCIPAL_ID,
                    credito = !string.IsNullOrWhiteSpace(galeria.GALERIA_CREDITO) ? RemoveTroublesomeCharacters(galeria.GALERIA_CREDITO).Trim() : string.Empty,
                    atualizacao = galeria.GALERIA_DATA_ATUALIZACAO.HasValue ? galeria.GALERIA_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                    idsites,
                    idportal,
                    fotos
                });

                object[] param = { "GaleriasNoSQL", "IdGaleria", IdGaleria };
                Sync(SyncMultimidiaBLL.Chamadas.InserirGaleria, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirGaleriaSecaoSite")]
        public bool InserirGaleriaSecaoSite(int IdGaleria)
        {
            try
            {
                var collectionGaleriasSecoesSites = mongoDatabase.GetCollection<GaleriasModelsNoSQL.GaleriasSecoesModel>("GaleriasSecoesSites");
                var secoesGaleria = GetSecoesGaleria(IdGaleria);

                foreach (var item in secoesGaleria)
                {
                    RemoverGaleriaSecaoSite(IdGaleria, item.IdSecao);

                    // Busca nas SUBSECOES se existe o idsecao do Galeria
                    FieldDefinition<GaleriasModelsNoSQL.GaleriasSecoesModel, dynamic> field = "Editorias.secoes.subsecoes";
                    var filter = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Filter.Empty;
                    var result = collectionGaleriasSecoesSites.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult().Where(a => a.idsecao == item.IdSecao);

                    if (result.Any())
                    {
                        // Se encontrar no mongo, insere notícia dentro da SUBSECAO especificada
                        FilterDefinition<GaleriasModelsNoSQL.GaleriasSecoesModel> filterGaleriasSecoesSites = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Filter.Empty;
                        var updateGaleriasSecoesSites = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Update.Push("Editorias.$[].secoes.$[].subsecoes.$[i].galerias", new { idgaleria = IdGaleria });
                        var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<GaleriasModelsNoSQL.GaleriasSecoesModel>("{'i.idsecao': " + item.IdSecao + "}") };
                        var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                        var resultadoGaleriasSecoesSites = collectionGaleriasSecoesSites.UpdateOne(filterGaleriasSecoesSites, updateGaleriasSecoesSites, updateOptions);
                    }
                    else
                    {
                        // Se não encontrar no mongo, refaz o arquivo do zero e sai do foreach
                        PublicarGaleriasSecoesSites();
                        break;
                    }
                }

                object[] param = { "GaleriasNoSQL", "IdGaleria", IdGaleria };
                Sync(SyncMultimidiaBLL.Chamadas.InserirGaleriaSecaoSite, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region Métodos Auxiliares
        private static string GeraCampoIdSites(GaleriasModelsNoSQL.McGaleriasModel mcGaleriasModel)
        {
            List<string> sites = new List<string>();
            var galeriassecoessites = GetIdsSitesByIdGaleria(mcGaleriasModel.GALERIA_ID);

            foreach (var portal in galeriassecoessites.Distinct())
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

        #endregion

        #region Buscas NoSQL
        public static List<int> GetAllIdsGaleriasNoSQL<T>()
        {
            try
            {
                var galerias = mongoDatabase.GetCollection<GaleriasModelsNoSQL.GaleriasSecoesModel>("GaleriasSecoesSites");
                FieldDefinition<GaleriasModelsNoSQL.GaleriasSecoesModel, int> field = "Editorias.secoes.subsecoes.galerias.idgaleria";
                var filter = Builders<GaleriasModelsNoSQL.GaleriasSecoesModel>.Filter.Empty;

                return galerias.DistinctAsync(field, filter).Result.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static List<SitesModel> GetAllSitesNoSQL<T>()
        {
            try
            {
                var sites = mongoDatabase.GetCollection<SitesModel>("Sites");
                var filter = Builders<SitesModel>.Filter.Empty;

                return mongoDatabase.GetCollection<SitesModel>("Sites").Find(filter).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsGaleriasByIdSecaoNoSQL")]
        public async Task<List<int>> GetIdsGaleriasByIdSecaoNoSQL(int Id)
        {
            try
            {
                IMongoCollection<GaleriasModelsNoSQL.SecoesCanaisBsonModel> collection = mongoDatabase.GetCollection<GaleriasModelsNoSQL.SecoesCanaisBsonModel>("GaleriasSecoesSites");
                List<int> galeriasList = new List<int>();

                var filter = Builders<GaleriasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                           Builders<GaleriasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                           Builders<GaleriasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                List<GaleriasModelsNoSQL.SecoesCanaisBsonModel> canais = await collection.Find(filter).ToListAsync();

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
                                var galerias = subsecao.galerias;

                                if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                {
                                    foreach (var galeria in galerias)
                                    {
                                        galeriasList.Add(galeria.idgaleria);
                                    }
                                }
                            }
                        }
                    }
                }

                return galeriasList.Distinct().ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetGaleriaByIdNoSQL")]
        public async Task<GaleriasModelsNoSQL.GaleriasBsonModel> GetGaleriaByIdNoSQL(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<GaleriasModelsNoSQL.GaleriasBsonModel>("Galerias");
                var filter = Builders<GaleriasModelsNoSQL.GaleriasBsonModel>.Filter.Eq("idgaleria", Id);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

        #region Buscas Banco Relacional
        private static List<GaleriasModelsNoSQL.SecoesCanaisModel> GetSecoesCanais()
        {
            List<GaleriasModelsNoSQL.SecoesCanaisModel> secoesCanaisModel = new List<GaleriasModelsNoSQL.SecoesCanaisModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "SecoesCanais/GetAll";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoescanaisJsonString = response.Content.ReadAsStringAsync().Result;
                secoesCanaisModel = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.SecoesCanaisModel>>(secoescanaisJsonString);
            }

            return secoesCanaisModel;
        }
        public List<GaleriasModelsNoSQL.SecoesModel> GetListaSecoes(GaleriasModelsNoSQL.EnumTipoSecao tipo, int idSecaoPai = 0)
        {
            List<GaleriasModelsNoSQL.SecoesModel> secoesModel = new List<GaleriasModelsNoSQL.SecoesModel>();
            string lista = "4,5,6,7,12,13,14,15";
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetListaSecoes?idTipoSecao=" + (int)tipo + "&idSecaoPai=" + idSecaoPai + "&idSite=" + IdSite + "&idSiteCidade=" + 1 + "&lista=" + lista;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
        }
        public List<GaleriasModelsNoSQL.McGaleriasModel> GetListaGalerias(int idSecao)
        {
            List<GaleriasModelsNoSQL.McGaleriasModel> mcGaleriasModel = new List<GaleriasModelsNoSQL.McGaleriasModel>();
            int qtddiasxmlgaleria = int.Parse(CommonBusiness.GetConfig("qtd_xml_galeria"));
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McGalerias/GetGaleria?idSecao=" + idSecao + "&idSite=" + IdSite + "&qtdDiasXmlGaleria=" + qtddiasxmlgaleria;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var galeriasJsonString = response.Content.ReadAsStringAsync().Result;
                mcGaleriasModel = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.McGaleriasModel>>(galeriasJsonString);
            }

            return mcGaleriasModel;
        }
        private static List<GaleriasModelsNoSQL.McGaleriasModel> GetGaleriasByIdsGaleria(GaleriasModelsNoSQL.IdsGaleria idsGaleria)
        {
            List<GaleriasModelsNoSQL.McGaleriasModel> galerias = new List<GaleriasModelsNoSQL.McGaleriasModel>();
            var client = CommonHttpClient.Instance;
            string param = JsonConvert.SerializeObject(idsGaleria);
            var URI = UrlBaseApi + "McGalerias/GetGaleriasByIdsGaleria";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(param, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var galeriasJsonString = response.Content.ReadAsStringAsync().Result;
                galerias = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.McGaleriasModel>>(galeriasJsonString);
            }

            return galerias;
        }
        private static List<int> GetIdsSitesByIdGaleria(int IdGaleria)
        {
            List<int> galeriasSecoesSites = new List<int>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McGaleriasSecoesSites/GetIdsSitesByIdGaleria?IdGaleria=" + IdGaleria;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var galeriasSecoesSitesJsonString = response.Content.ReadAsStringAsync().Result;
                galeriasSecoesSites = JsonConvert.DeserializeObject<List<int>>(galeriasSecoesSitesJsonString);
            }

            return galeriasSecoesSites;
        }

        public List<GaleriasModelsNoSQL.McGaleriasFotosModel> GetFotos(int idGaleria)
        {
            List<GaleriasModelsNoSQL.McGaleriasFotosModel> mcGaleriasFotosModel = new List<GaleriasModelsNoSQL.McGaleriasFotosModel>();
            var client = CommonHttpClient.Instance;
            GaleriasModelsNoSQL.McGaleriasFotosModel filter = new GaleriasModelsNoSQL.McGaleriasFotosModel();
            filter.GALERIA_ID = idGaleria;
            filter.FOTO_ATIVA = true;
            string filterBody = JsonConvert.SerializeObject(filter);
            var URI = UrlBaseApi + "McGaleriasFotos/GetByFilter/";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var galeriaFotosJsonString = response.Content.ReadAsStringAsync().Result;
                mcGaleriasFotosModel = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.McGaleriasFotosModel>>(galeriaFotosJsonString);
            }

            return mcGaleriasFotosModel;
        }
        private static GaleriasModelsNoSQL.McGaleriasModel GetGaleriaByIdGaleria(int IdGaleria)
        {
            GaleriasModelsNoSQL.McGaleriasModel galeriasModel = new GaleriasModelsNoSQL.McGaleriasModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McGalerias/" + IdGaleria;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var galeriaJsonString = response.Content.ReadAsStringAsync().Result;
                galeriasModel = JsonConvert.DeserializeObject<GaleriasModelsNoSQL.McGaleriasModel>(galeriaJsonString);
            }

            return galeriasModel;
        }

        public List<GaleriasModelsNoSQL.SecoesModel> GetSecoesGaleria(int IdGaleria)
        {
            List<GaleriasModelsNoSQL.SecoesModel> secoesModel = new List<GaleriasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSecaoByIdGaleria?idGaleria=" + IdGaleria + "&idSite=" + IdSite;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<GaleriasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
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
    }
}