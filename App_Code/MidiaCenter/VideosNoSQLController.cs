using CMS.CacheSync.Front.BLL;
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

namespace WebApi.MidiaCenterNoSQL.Videos.Controllers
{
    [RoutePrefix("api/VideosNoSQL")]
    public class VideosNoSQLController : ApiController
    {
        private static string UrlBaseApi;
        private static int IdSite;
        private static SitesModelsNoSQL.SitesModel sitesModel;
        private static IMongoDatabase mongoDatabase;

        /// <summary>
        /// Existem 2 construtores, sendo 1 sem parâmetro, que busca do tbsites do MSSQL. (na verdade sempre que formos publicar devemos pegar direto do MSSQL)
        /// O outro construtor busca dos sites do NoSQL para maior velocidade nas buscas e também quando o MSSQL estiver fora.
        /// </summary>
        public VideosNoSQLController()
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
        public VideosNoSQLController(bool FromNoSQL = false)
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
        /// Gera documento no mongo baseado nas árvores de editorias,secoes,subseções e idvideo
        /// </summary>
        [HttpGet]
        [Route("PublicarVideosSecoesSites")]
        public string PublicarVideosSecoesSites()
        {
            mongoDatabase.DropCollectionAsync("VideosSecoesSites");
            string inicio = DateTime.Now.ToString();
            var canais = mongoDatabase.GetCollection<VideosModelsNoSQL.SecoesCanaisModel>("VideosSecoesSites");
            List<VideosModelsNoSQL.SecoesCanaisModel> secoesCanaisModels = GetSecoesCanais();

            // canais
            foreach (var canal in secoesCanaisModels)
            {
                List<VideosModelsNoSQL.SecoesModel> editorias = GetListaSecoes(VideosModelsNoSQL.EnumTipoSecao.Editoria);
                canal.Editorias = new List<dynamic>();

                // transfere o valor do campo [canal] para a editoria
                editorias.Select(c => { c.Canal = canal.Canal; return c; }).ToList();

                // editorias
                foreach (var editoria in editorias.Where(a => a.IdCanal == canal.IdCanal))
                {
                    List<VideosModelsNoSQL.SecoesModel> secoes = GetListaSecoes(VideosModelsNoSQL.EnumTipoSecao.Secao, editoria.IdSecao);

                    // seções
                    editoria.ListSecoesModel = new List<dynamic>();
                    foreach (var secao in secoes)
                    {
                        secao.Canal = editoria.Canal;
                        List<VideosModelsNoSQL.SecoesModel> subsecoes = GetListaSecoes(VideosModelsNoSQL.EnumTipoSecao.SubSecao, secao.IdSecao);

                        // subsecoes
                        secao.ListSecoesModel = new List<dynamic>();
                        foreach (var subsecao in subsecoes)
                        {
                            subsecao.Canal = secao.Canal;
                            List<VideosModelsNoSQL.McVideosModel> videos = GetListaVideos(subsecao.IdSecao);

                            // videos
                            subsecao.ListVideosModels = new List<dynamic>();
                            foreach (var video in videos)
                            {
                                subsecao.ListVideosModels.Add(new { idvideo = video.VIDEO_ID });
                            }

                            // add somente se tiver conteúdo
                            if (subsecao.ListVideosModels.Any())
                            {
                                secao.ListSecoesModel.Add(new
                                {
                                    idsecao = subsecao.IdSecao,
                                    idsecaopai = subsecao.IdSecaoPai,
                                    nomesecao = subsecao.Secao,
                                    subsecao.Agencia,
                                    videos = subsecao.ListVideosModels
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
            IndexKeysDefinition<VideosModelsNoSQL.SecoesCanaisModel> keys = Builders<VideosModelsNoSQL.SecoesCanaisModel>.IndexKeys.Descending("Editorias.secoes.subsecoes.idsecao");
            var options = new CreateIndexOptions { Name = "VideosSecoesSitesIDX" };
            var indexModel = new CreateIndexModel<VideosModelsNoSQL.SecoesCanaisModel>(keys, options);
            canais.Indexes.CreateOneAsync(indexModel);
            #endregion

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        /// <summary>
        /// Gera documento no mongo baseado nos id's dos vídeos que estão no documento VideosSecoesSites
        /// </summary>
        [HttpGet]
        [Route("PublicarVideos")]
        public string PublicarVideos()
        {
            mongoDatabase.DropCollectionAsync("Videos");
            string inicio = DateTime.Now.ToString();
            string idsVideo = string.Empty;
            var videosMongo = mongoDatabase.GetCollection<dynamic>("Videos");

            foreach (var item in GetAllIdsVideosNoSQL<int>())
            {
                idsVideo += item + ",";
            }

            if (idsVideo.Length > 0)
                idsVideo = idsVideo.Substring(0, idsVideo.Length - 1);

            var videos = GetVideosByIdsVideo(new VideosModelsNoSQL.IdsVideo { Ids = idsVideo });

            foreach (var video in videos)
            {
                string idsites = GeraCampoIdSites(video);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : video.SITEPRINCIPAL_ID;

                videosMongo.InsertOne(
                    new
                    {
                        ativo = video.VIDEO_ATIVO,
                        idvideo = video.VIDEO_ID,
                        publicacao = video.VIDEO_DATA_PUBLICACAO.ToString("s"),
                        expiracao = video.VIDEO_DATA_EXPIRACAO.ToString("s"),
                        assunto = !string.IsNullOrWhiteSpace(video.VIDEO_CHAPEU) ? RemoveTroublesomeCharacters(video.VIDEO_CHAPEU).Trim() : string.Empty,
                        manchete = !string.IsNullOrWhiteSpace(video.VIDEO_MANCHETE) ? RemoveTroublesomeCharacters(video.VIDEO_MANCHETE).Trim() : string.Empty,
                        destaque = !string.IsNullOrWhiteSpace(video.VIDEO_DESTAQUE) ? RemoveTroublesomeCharacters(video.VIDEO_DESTAQUE).Trim() : string.Empty,
                        resumo = !string.IsNullOrWhiteSpace(video.VIDEO_RESUMO) ? RemoveTroublesomeCharacters(video.VIDEO_RESUMO).Trim() : string.Empty,
                        url = string.Format("VID,0,{1},{0}", GeraURL(video.VIDEO_URL), video.VIDEO_ID),
                        subpasta = !string.IsNullOrWhiteSpace(video.VIDEO_SUBPASTA) ? RemoveTroublesomeCharacters(video.VIDEO_SUBPASTA).Trim() : string.Empty,
                        arquivo = !string.IsNullOrWhiteSpace(video.VIDEO_ARQUIVO) ? RemoveTroublesomeCharacters(video.VIDEO_ARQUIVO).Trim() : string.Empty,
                        wide = (video.VIDEO_FORMATO_WIDE != null && video.VIDEO_FORMATO_WIDE == true) ? "S" : "N",
                        dimensao_alt = video.VIDEO_DIMENSAO_ALT.ToString(),
                        dimensao_lar = video.VIDEO_DIMENSAO_LAR.ToString(),
                        duracao = video.VIDEO_DURACAO,
                        tags = video.VIDEO_TAG_BUSCA.ToLower(),
                        views = video.VIDEO_VIEWS.ToString(),
                        votos = (video.VIDEO_RATE_VOTO1 + video.VIDEO_RATE_VOTO2 + video.VIDEO_RATE_VOTO3 + video.VIDEO_RATE_VOTO4 + video.VIDEO_RATE_VOTO5).ToString(),
                        rate = video.VIDEO_RATE.ToString(),
                        nivelrestricao = (int)video.VIDEO_NIVELRESTRICAO,
                        thumb = video.VIDEO_THUMBNAIL,
                        thumb_full_hd = video.VIDEO_THUMBNAIL_NEW,
                        atualizacao = video.VIDEO_DATA_ATUALIZACAO.HasValue ? video.VIDEO_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                        idsites,
                        idportal,
                        credito = video.VIDEO_CREDITO
                    });
            }

            #region Criação de índices

            var options1 = new CreateIndexOptions { Name = "idvideoIDX", Unique = true };
            IndexKeysDefinition<dynamic> key1 = Builders<dynamic>.IndexKeys.Descending("idvideo");
            var indexModel1 = new CreateIndexModel<dynamic>(key1, options1);
            videosMongo.Indexes.CreateOneAsync(indexModel1);

            var options2 = new CreateIndexOptions { Name = "mancheteIDX" };
            IndexKeysDefinition<dynamic> key2 = Builders<dynamic>.IndexKeys.Text("manchete");
            var indexModel2 = new CreateIndexModel<dynamic>(key2, options2);
            videosMongo.Indexes.CreateOneAsync(indexModel2);

            var options3 = new CreateIndexOptions { Name = "destaqueIDX" };
            IndexKeysDefinition<dynamic> key3 = Builders<dynamic>.IndexKeys.Text("destaque");
            var indexModel3 = new CreateIndexModel<dynamic>(key3, options3);
            videosMongo.Indexes.CreateOneAsync(indexModel3);

            var options4 = new CreateIndexOptions { Name = "tagsIDX" };
            IndexKeysDefinition<dynamic> key4 = Builders<dynamic>.IndexKeys.Text("tags");
            var indexModel4 = new CreateIndexModel<dynamic>(key4, options4);
            videosMongo.Indexes.CreateOneAsync(indexModel4);

            var options5 = new CreateIndexOptions { Name = "publicacaoIDX" };
            IndexKeysDefinition<dynamic> key5 = Builders<dynamic>.IndexKeys.Descending("publicacao");
            var indexModel5 = new CreateIndexModel<dynamic>(key5, options5);
            videosMongo.Indexes.CreateOneAsync(indexModel5);

            var options6 = new CreateIndexOptions { Name = "expiracaoIDX" };
            IndexKeysDefinition<dynamic> key6 = Builders<dynamic>.IndexKeys.Descending("expiracao");
            var indexModel6 = new CreateIndexModel<dynamic>(key6, options6);
            videosMongo.Indexes.CreateOneAsync(indexModel6);

            var options7 = new CreateIndexOptions { Name = "idsitesIDX" };
            IndexKeysDefinition<dynamic> key7 = Builders<dynamic>.IndexKeys.Descending("idsites");
            var indexModel7 = new CreateIndexModel<dynamic>(key7, options7);
            videosMongo.Indexes.CreateOneAsync(indexModel7);

            #endregion

            Sync(SyncMultimidiaBLL.Chamadas.PublicarVideos, "VideosNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("RemoverVideoSecaoSite")]
        public bool RemoverVideoSecaoSite(int IdVideo, int IdSecao)
        {
            try
            {
                var collectionVideosSecoesSites = mongoDatabase.GetCollection<VideosModelsNoSQL.VideosSecoesModel>("VideosSecoesSites");
                var filterVideosSecoesSites = Builders<VideosModelsNoSQL.VideosSecoesModel>.Filter.Eq("Editorias.secoes.subsecoes.videos.idvideo", IdVideo);
                var updateVideosSecoesSites = Builders<VideosModelsNoSQL.VideosSecoesModel>.Update.PullFilter("Editorias.$[].secoes.$[].subsecoes.$[i].videos", Builders<BsonDocument>.Filter.Eq("idvideo", IdVideo));
                var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<VideosModelsNoSQL.VideosSecoesModel>("{'i.idsecao': " + IdSecao + "}") };
                var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                var resultadoVideosSecoesSites = collectionVideosSecoesSites.UpdateOne(filterVideosSecoesSites, updateVideosSecoesSites, updateOptions);

                object[] param = { "VideosNoSQL", "IdVideo", IdVideo, "IdSecao", IdSecao };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverVideoSecaoSite, param);

                return (resultadoVideosSecoesSites.MatchedCount > 0 && resultadoVideosSecoesSites.ModifiedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverVideo")]
        public bool RemoverVideo(int IdVideo)
        {
            try
            {
                var collectionVideos = mongoDatabase.GetCollection<dynamic>("Videos");
                var filterVideos = Builders<dynamic>.Filter.Eq("idvideo", IdVideo);
                var resultadoVideos = collectionVideos.DeleteOne(filterVideos);

                object[] param = { "VideosNoSQL", "IdVideo", IdVideo, };
                Sync(SyncMultimidiaBLL.Chamadas.RemoverVideo, param);

                return (resultadoVideos.DeletedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirVideo")]
        public bool InserirVideo(int IdVideo)
        {
            try
            {
                RemoverVideo(IdVideo);

                var videosMongo = mongoDatabase.GetCollection<dynamic>("Videos");
                var video = GetVideoByIdVideo(IdVideo);

                string idsites = GeraCampoIdSites(video);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : video.SITEPRINCIPAL_ID;

                videosMongo.InsertOneAsync(new
                {
                    ativo = video.VIDEO_ATIVO,
                    idvideo = video.VIDEO_ID,
                    publicacao = video.VIDEO_DATA_PUBLICACAO.ToString("s"),
                    expiracao = video.VIDEO_DATA_EXPIRACAO.ToString("s"),
                    assunto = !string.IsNullOrWhiteSpace(video.VIDEO_CHAPEU) ? RemoveTroublesomeCharacters(video.VIDEO_CHAPEU).Trim() : string.Empty,
                    manchete = !string.IsNullOrWhiteSpace(video.VIDEO_MANCHETE) ? RemoveTroublesomeCharacters(video.VIDEO_MANCHETE).Trim() : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(video.VIDEO_DESTAQUE) ? RemoveTroublesomeCharacters(video.VIDEO_DESTAQUE).Trim() : string.Empty,
                    resumo = !string.IsNullOrWhiteSpace(video.VIDEO_RESUMO) ? RemoveTroublesomeCharacters(video.VIDEO_RESUMO).Trim() : string.Empty,
                    url = string.Format("VID,0,{1},{0}", GeraURL(video.VIDEO_URL), video.VIDEO_ID),
                    subpasta = !string.IsNullOrWhiteSpace(video.VIDEO_SUBPASTA) ? RemoveTroublesomeCharacters(video.VIDEO_SUBPASTA).Trim() : string.Empty,
                    arquivo = !string.IsNullOrWhiteSpace(video.VIDEO_ARQUIVO) ? RemoveTroublesomeCharacters(video.VIDEO_ARQUIVO).Trim() : string.Empty,
                    wide = (video.VIDEO_FORMATO_WIDE != null && video.VIDEO_FORMATO_WIDE == true) ? "S" : "N",
                    dimensao_alt = video.VIDEO_DIMENSAO_ALT.ToString(),
                    dimensao_lar = video.VIDEO_DIMENSAO_LAR.ToString(),
                    duracao = video.VIDEO_DURACAO,
                    tags = video.VIDEO_TAG_BUSCA.ToLower(),
                    views = video.VIDEO_VIEWS.ToString(),
                    votos = (video.VIDEO_RATE_VOTO1 + video.VIDEO_RATE_VOTO2 + video.VIDEO_RATE_VOTO3 + video.VIDEO_RATE_VOTO4 + video.VIDEO_RATE_VOTO5).ToString(),
                    rate = video.VIDEO_RATE.ToString(),
                    nivelrestricao = (int)video.VIDEO_NIVELRESTRICAO,
                    thumb = video.VIDEO_THUMBNAIL,
                    thumb_full_hd = video.VIDEO_THUMBNAIL_NEW,
                    atualizacao = video.VIDEO_DATA_ATUALIZACAO.HasValue ? video.VIDEO_DATA_ATUALIZACAO.Value.ToString("s") : string.Empty,
                    idsites,
                    idportal,
                    credito = video.VIDEO_CREDITO
                });

                object[] param = { "VideosNoSQL", "IdVideo", IdVideo, };
                Sync(SyncMultimidiaBLL.Chamadas.InserirVideo, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirVideoSecaoSite")]
        public bool InserirVideoSecaoSite(int IdVideo)
        {
            try
            {
                var collectionVideosSecoesSites = mongoDatabase.GetCollection<VideosModelsNoSQL.VideosSecoesModel>("VideosSecoesSites");
                var secoesVideo = GetSecoesVideo(IdVideo);

                foreach (var item in secoesVideo)
                {
                    RemoverVideoSecaoSite(IdVideo, item.IdSecao);

                    // Busca nas SUBSECOES se existe o idsecao do video
                    FieldDefinition<VideosModelsNoSQL.VideosSecoesModel, dynamic> field = "Editorias.secoes.subsecoes";
                    var filter = Builders<VideosModelsNoSQL.VideosSecoesModel>.Filter.Empty;
                    var result = collectionVideosSecoesSites.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult().Where(a => a.idsecao == item.IdSecao);

                    if (result.Any())
                    {
                        // Se encontrar no mongo, insere notícia dentro da SUBSECAO especificada
                        FilterDefinition<VideosModelsNoSQL.VideosSecoesModel> filterVideosSecoesSites = Builders<VideosModelsNoSQL.VideosSecoesModel>.Filter.Empty;
                        var updateVideosSecoesSites = Builders<VideosModelsNoSQL.VideosSecoesModel>.Update.Push("Editorias.$[].secoes.$[].subsecoes.$[i].videos", new { idvideo = IdVideo });
                        var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<VideosModelsNoSQL.VideosSecoesModel>("{'i.idsecao': " + item.IdSecao + "}") };
                        var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                        var resultadoVideosSecoesSites = collectionVideosSecoesSites.UpdateOne(filterVideosSecoesSites, updateVideosSecoesSites, updateOptions);
                    }
                    else
                    {
                        // Se não encontrar no mongo, refaz o arquivo do zero e sai do foreach
                        PublicarVideosSecoesSites();
                        break;
                    }
                }

                object[] param = { "VideosNoSQL", "IdVideo", IdVideo, };
                Sync(SyncMultimidiaBLL.Chamadas.InserirVideoSecaoSite, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region Métodos Auxiliares
        private static string GeraCampoIdSites(VideosModelsNoSQL.McVideosModel mcVideosModel)
        {
            List<string> sites = new List<string>();
            var videossecoessites = GetIdsSitesByIdVideo(mcVideosModel.VIDEO_ID);

            foreach (var portal in videossecoessites.Distinct())
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
        public static List<int> GetAllIdsVideosNoSQL<T>()
        {
            try
            {
                var videos = mongoDatabase.GetCollection<VideosModelsNoSQL.VideosSecoesModel>("VideosSecoesSites");
                FieldDefinition<VideosModelsNoSQL.VideosSecoesModel, int> field = "Editorias.secoes.subsecoes.videos.idvideo";
                var filter = Builders<VideosModelsNoSQL.VideosSecoesModel>.Filter.Empty;

                return videos.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsVideosByIdSecaoNoSQL")]
        public async Task<List<int>> GetIdsVideosByIdSecaoNoSQL(int Id)
        {
            try
            {
                IMongoCollection<VideosModelsNoSQL.SecoesCanaisBsonModel> collection = mongoDatabase.GetCollection<VideosModelsNoSQL.SecoesCanaisBsonModel>("VideosSecoesSites");
                List<int> videosList = new List<int>();

                var filter = Builders<VideosModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                             Builders<VideosModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                             Builders<VideosModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                List<VideosModelsNoSQL.SecoesCanaisBsonModel> canais = await collection.Find(filter).ToListAsync();

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
                                var videos = subsecao.videos;

                                if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                {
                                    foreach (var video in videos)
                                    {
                                        videosList.Add(video.idvideo);
                                    }
                                }
                            }
                        }
                    }
                }

                return videosList.Distinct().ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetVideoByIdNoSQL")]
        public async Task<VideosModelsNoSQL.VideosBsonModel> GetVideoByIdNoSQL(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<VideosModelsNoSQL.VideosBsonModel>("Videos");
                var filter = Builders<VideosModelsNoSQL.VideosBsonModel>.Filter.Eq("idvideo", Id);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

        #region Buscas Banco Relacional
        private static List<VideosModelsNoSQL.SecoesCanaisModel> GetSecoesCanais()
        {
            List<VideosModelsNoSQL.SecoesCanaisModel> secoesCanaisModel = new List<VideosModelsNoSQL.SecoesCanaisModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "SecoesCanais/GetAll";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoescanaisJsonString = response.Content.ReadAsStringAsync().Result;
                secoesCanaisModel = JsonConvert.DeserializeObject<List<VideosModelsNoSQL.SecoesCanaisModel>>(secoescanaisJsonString);
            }

            return secoesCanaisModel;
        }
        public List<VideosModelsNoSQL.SecoesModel> GetListaSecoes(VideosModelsNoSQL.EnumTipoSecao tipo, int idSecaoPai = 0)
        {
            List<VideosModelsNoSQL.SecoesModel> secoesModel = new List<VideosModelsNoSQL.SecoesModel>();
            string lista = "2,3,6,7,10,11,14,15";
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetListaSecoes?idTipoSecao=" + (int)tipo + "&idSecaoPai=" + idSecaoPai + "&idSite="
                + IdSite + "&idSiteCidade=" + 1 + "&lista=" + lista;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<VideosModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
        }
        public List<VideosModelsNoSQL.McVideosModel> GetListaVideos(int idSecao)
        {
            List<VideosModelsNoSQL.McVideosModel> mcVideosModel = new List<VideosModelsNoSQL.McVideosModel>();
            int qtddiasxmlvideo = int.Parse(CommonBusiness.GetConfig("qtd_xml_video"));
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McVideos/GetVideo?idSecao=" + idSecao + "&idSite=" + IdSite + "&qtdDiasXmlVideo=" + qtddiasxmlvideo;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var videosJsonString = response.Content.ReadAsStringAsync().Result;
                mcVideosModel = JsonConvert.DeserializeObject<List<VideosModelsNoSQL.McVideosModel>>(videosJsonString);
            }

            return mcVideosModel;
        }
        private static List<VideosModelsNoSQL.McVideosModel> GetVideosByIdsVideo(VideosModelsNoSQL.IdsVideo idsVideo)
        {
            List<VideosModelsNoSQL.McVideosModel> videos = new List<VideosModelsNoSQL.McVideosModel>();
            var client = CommonHttpClient.Instance;
            string param = JsonConvert.SerializeObject(idsVideo);
            var URI = UrlBaseApi + "McVideos/GetVideosByIdsVideo";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(param, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var videosJsonString = response.Content.ReadAsStringAsync().Result;
                videos = JsonConvert.DeserializeObject<List<VideosModelsNoSQL.McVideosModel>>(videosJsonString);
            }

            return videos;
        }
        private static List<int> GetIdsSitesByIdVideo(int IdVideo)
        {
            List<int> videosSecoesSites = new List<int>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McVideosSecoesSites/GetIdsSitesByIdVideo?IdVideo=" + IdVideo;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var videosSecoesSitesJsonString = response.Content.ReadAsStringAsync().Result;
                videosSecoesSites = JsonConvert.DeserializeObject<List<int>>(videosSecoesSitesJsonString);
            }

            return videosSecoesSites;
        }
        private static VideosModelsNoSQL.McVideosModel GetVideoByIdVideo(int IdVideo)
        {
            VideosModelsNoSQL.McVideosModel videosModel = new VideosModelsNoSQL.McVideosModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "McVideos/" + IdVideo;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var videoJsonString = response.Content.ReadAsStringAsync().Result;
                videosModel = JsonConvert.DeserializeObject<VideosModelsNoSQL.McVideosModel>(videoJsonString);
            }

            return videosModel;
        }
        public List<VideosModelsNoSQL.SecoesModel> GetSecoesVideo(int IdVideo)
        {
            List<VideosModelsNoSQL.SecoesModel> secoesModel = new List<VideosModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSecaoByIdVideo?idVideo=" + IdVideo + "&idSite=" + IdSite;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<VideosModelsNoSQL.SecoesModel>>(secoesJsonString);
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