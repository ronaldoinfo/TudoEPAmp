using CMS.CacheSync.Front.BLL;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
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
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using WebApi.SiteNoSQL.Controllers;

namespace WebApi.NoticiaNoSQL.Controllers
{
    [RoutePrefix("api/NoticiasNoSQL")]
    public class NoticiasNoSQLController : ApiController
    {
        private static string UrlBaseApi;
        private static int IdSite;
        private static SitesModelsNoSQL.SitesModel sitesModel;
        private static IMongoDatabase mongoDatabase;

        /// <summary>
        /// Existem 2 construtores, sendo 1 sem parâmetro, que busca do tbsites do MSSQL. (na verdade sempre que formos publicar devemos pegar direto do MSSQL)
        /// O outro construtor busca dos sites do NoSQL para maior velocidade nas buscas e também quando o MSSQL estiver fora.
        /// </summary>
        public NoticiasNoSQLController()
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

        public NoticiasNoSQLController(bool FromNoSQL = false)
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
        /// Gera documento no mongo baseado nos id's das notícias que estão no documento NoticiasSecoesSites
        /// </summary>
        [HttpGet]
        [Route("PublicarNoticias")]
        public string PublicarNoticias()
        {
            List<dynamic> documents = new List<dynamic>();
            mongoDatabase.DropCollection("Noticias");
            string inicio = DateTime.Now.ToString();
            string idsNoticia = string.Empty;
            var noticias = mongoDatabase.GetCollection<dynamic>("Noticias");

            foreach (var item in GetAllIdsNoticiasNoSQL<int>())
            {
                idsNoticia += item + ",";
            }

            if (idsNoticia.Length > 0)
                idsNoticia = idsNoticia.Substring(0, idsNoticia.Length - 1);

            var subsecoesNoticias = GetNoticiasByIdsNoticia(new NoticiasModelsNoSQL.IdsNoticia { Ids = idsNoticia });
            CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL extensoesXslBLL = new CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL();

            subsecoesNoticias.AsParallel().ForAll(subsecaoNoticia =>
            {
                string idsites = GeraCampoIdSites(subsecaoNoticia);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : subsecaoNoticia.IdSitePadrao;
                List<CommonNoSQL.SecoesSites> secoessites = GeraSecoesSites(subsecaoNoticia, subsecaoNoticia.IdNoticia);
                subsecaoNoticia.Imagens = new List<NoticiasModelsNoSQL.ImagensModel>();
                NoticiasModelsNoSQL.ImagensModel imagemdestaque, imagemmanchete, imagempatrocinio;
                string arquivos, videos, galerias, sons;

                Fotos(subsecaoNoticia, out imagemdestaque, out imagemmanchete, out imagempatrocinio);

                if (imagemdestaque != null && imagemdestaque.Idmultimidia > 0)
                {
                    subsecaoNoticia.Imagens.Add(imagemdestaque);
                }

                if (imagemmanchete != null && imagemmanchete.Idmultimidia > 0)
                {
                    subsecaoNoticia.Imagens.Add(imagemmanchete);
                }

                if (imagempatrocinio != null && imagempatrocinio.Idmultimidia > 0)
                {
                    subsecaoNoticia.Imagens.Add(imagempatrocinio);
                }

                MidiaAssociada(subsecaoNoticia, out arquivos, out videos, out galerias, out sons);

                var urlCompleta = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(subsecaoNoticia.IdNoticia, "1");

                documents.Add(new
                {
                    idnoticia = subsecaoNoticia.IdNoticia,
                    ativo = subsecaoNoticia.Ativo,
                    publicacao = subsecaoNoticia.DtPublicacao.ToString("s").Trim(),
                    expiracao = subsecaoNoticia.DtExpiracao.Value.ToString("s").Trim(),
                    tiponoticia = subsecaoNoticia.TipoDestaque,
                    url = !string.IsNullOrWhiteSpace(subsecaoNoticia.Url) ? RemoveTroublesomeCharacters(GeraURLNoticia(subsecaoNoticia, null)).Trim() : string.Empty,
                    assunto = !string.IsNullOrWhiteSpace(subsecaoNoticia.Assunto) ? RemoveTroublesomeCharacters(subsecaoNoticia.Assunto).Trim() : string.Empty,
                    assunto_alternativo = !string.IsNullOrWhiteSpace(subsecaoNoticia.Assunto_alternativo) ? RemoveTroublesomeCharacters(subsecaoNoticia.Assunto_alternativo).Trim() : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(subsecaoNoticia.Destaque) ? RemoveTroublesomeCharacters(subsecaoNoticia.Destaque).Trim() : string.Empty,
                    manchete = !string.IsNullOrWhiteSpace(subsecaoNoticia.Manchete) ? RemoveTroublesomeCharacters(subsecaoNoticia.Manchete).Trim() : string.Empty,
                    tags = !string.IsNullOrEmpty(subsecaoNoticia.Tags) ? RemoveTroublesomeCharacters(subsecaoNoticia.Tags).Trim() : string.Empty,
                    tipo = "N",
                    subtiponoticia = subsecaoNoticia.SubTipoDestaque,
                    idioma = subsecaoNoticia.IdIdioma,
                    mob = subsecaoNoticia.Mobile.HasValue && subsecaoNoticia.Mobile.Value ? "S" : "N",
                    credito = !string.IsNullOrEmpty(subsecaoNoticia.Credito) ? RemoveTroublesomeCharacters(subsecaoNoticia.Credito).Trim() : string.Empty,
                    nivelrestricao = subsecaoNoticia.NivelRestricao,
                    tipomidiaembed = subsecaoNoticia.TipoMidiaEmbed,
                    idtipoconteudo = subsecaoNoticia.IdTipoConteudo,
                    atualizacao = subsecaoNoticia.DtAtualizacao != null ? subsecaoNoticia.DtAtualizacao.ToString("s") : string.Empty,
                    idsites,
                    secoessites,
                    idportal,
                    idparceiro = subsecaoNoticia.IdParceiro != null ? subsecaoNoticia.IdParceiro.ToString() : string.Empty,
                    precovoucher = subsecaoNoticia.Precovoucher != null ? subsecaoNoticia.Precovoucher.ToString() : string.Empty,
                    precofinalvoucher = subsecaoNoticia.Precofinalvoucher != null ? subsecaoNoticia.Precofinalvoucher.ToString() : string.Empty,
                    descontovoucher = subsecaoNoticia.Descontovoucher != null ? subsecaoNoticia.Descontovoucher.ToString() : string.Empty,
                    qtdlimitevoucher = subsecaoNoticia.QtdLimiteVoucher != null ? subsecaoNoticia.QtdLimiteVoucher.ToString() : string.Empty,
                    contemcomentarios = subsecaoNoticia.Contemcomentario == null ? false : subsecaoNoticia.Contemcomentario,
                    contemcomentariofacebook = subsecaoNoticia.ContemcomentarioFacebook == null ? false : subsecaoNoticia.ContemcomentarioFacebook,
                    fonte = !string.IsNullOrWhiteSpace(subsecaoNoticia.Fonte) ? RemoveTroublesomeCharacters(subsecaoNoticia.Fonte).Trim() : string.Empty,
                    destinofonte = !string.IsNullOrWhiteSpace(subsecaoNoticia.DestinoFonte) ? RemoveTroublesomeCharacters(subsecaoNoticia.DestinoFonte).Trim() : string.Empty,
                    destinocredito = !string.IsNullOrWhiteSpace(subsecaoNoticia.DestinoCredito) ? RemoveTroublesomeCharacters(subsecaoNoticia.DestinoCredito).Trim() : string.Empty,
                    direcionaurl = subsecaoNoticia.DirecionarUrl,
                    destino = !string.IsNullOrWhiteSpace(subsecaoNoticia.Destino) ? RemoveTroublesomeCharacters(subsecaoNoticia.Destino).Trim() : string.Empty,
                    textonoticia = !string.IsNullOrEmpty(subsecaoNoticia.Noticia) ? ReplaceNonPrintableCaracteres(RemoveTroublesomeCharacters(subsecaoNoticia.Noticia), string.Empty).Trim() : string.Empty,
                    imagens = subsecaoNoticia.Imagens,
                    arquivos,
                    videos,
                    galerias,
                    sons,
                    siteprincipal = subsecaoNoticia.IdSitePadrao,
                    secaoprincipal = subsecaoNoticia.IdSecao,
                    urlCompleta = urlCompleta + RemoveTroublesomeCharacters(GeraURLNoticia(subsecaoNoticia, null)).Trim(),
                });

                // publica o arquivo associado no NoSQL
                if (!string.IsNullOrWhiteSpace(arquivos))
                {
                    foreach (var item in arquivos.Split(','))
                    {
                        int IdFile = Convert.ToInt32(item);
                        WebApi.ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController arquivosAssociadosNoSQLController = new ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController();
                        arquivosAssociadosNoSQLController.InserirUploadFile(IdFile);
                    }
                }
            });

            //Parallel.ForEach(subsecoesNoticias, subsecaoNoticia =>
            //{
            //    string idsites = GeraCampoIdSites(subsecaoNoticia);
            //    int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : subsecaoNoticia.IdSitePadrao;
            //    List<CommonNoSQL.SecoesSites> secoessites = GeraSecoesSites(subsecaoNoticia, subsecaoNoticia.IdNoticia);
            //    subsecaoNoticia.Imagens = new List<NoticiasModelsNoSQL.ImagensModel>();
            //    NoticiasModelsNoSQL.ImagensModel imagemdestaque, imagemmanchete, imagempatrocinio;
            //    string arquivos, videos, galerias, sons;

            //    Fotos(subsecaoNoticia, out imagemdestaque, out imagemmanchete, out imagempatrocinio);

            //    if (imagemdestaque != null && imagemdestaque.Idmultimidia > 0)
            //    {
            //        subsecaoNoticia.Imagens.Add(imagemdestaque);
            //    }

            //    if (imagemmanchete != null && imagemmanchete.Idmultimidia > 0)
            //    {
            //        subsecaoNoticia.Imagens.Add(imagemmanchete);
            //    }

            //    if (imagempatrocinio != null && imagempatrocinio.Idmultimidia > 0)
            //    {
            //        subsecaoNoticia.Imagens.Add(imagempatrocinio);
            //    }

            //    MidiaAssociada(subsecaoNoticia, out arquivos, out videos, out galerias, out sons);

            //    var urlCompleta = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(subsecaoNoticia.IdNoticia, "1");

            //    documents.Add(new
            //    {
            //        idnoticia = subsecaoNoticia.IdNoticia,
            //        ativo = subsecaoNoticia.Ativo,
            //        publicacao = subsecaoNoticia.DtPublicacao.ToString("s").Trim(),
            //        expiracao = subsecaoNoticia.DtExpiracao.Value.ToString("s").Trim(),
            //        tiponoticia = subsecaoNoticia.TipoDestaque,
            //        url = !string.IsNullOrWhiteSpace(subsecaoNoticia.Url) ? RemoveTroublesomeCharacters(GeraURLNoticia(subsecaoNoticia, null)).Trim() : string.Empty,
            //        assunto = !string.IsNullOrWhiteSpace(subsecaoNoticia.Assunto) ? RemoveTroublesomeCharacters(subsecaoNoticia.Assunto).Trim() : string.Empty,
            //        assunto_alternativo = !string.IsNullOrWhiteSpace(subsecaoNoticia.Assunto_alternativo) ? RemoveTroublesomeCharacters(subsecaoNoticia.Assunto_alternativo).Trim() : string.Empty,
            //        destaque = !string.IsNullOrWhiteSpace(subsecaoNoticia.Destaque) ? RemoveTroublesomeCharacters(subsecaoNoticia.Destaque).Trim() : string.Empty,
            //        manchete = !string.IsNullOrWhiteSpace(subsecaoNoticia.Manchete) ? RemoveTroublesomeCharacters(subsecaoNoticia.Manchete).Trim() : string.Empty,
            //        tags = !string.IsNullOrEmpty(subsecaoNoticia.Tags) ? RemoveTroublesomeCharacters(subsecaoNoticia.Tags).Trim() : string.Empty,
            //        tipo = "N",
            //        subtiponoticia = subsecaoNoticia.SubTipoDestaque,
            //        idioma = subsecaoNoticia.IdIdioma,
            //        mob = subsecaoNoticia.Mobile.HasValue && subsecaoNoticia.Mobile.Value ? "S" : "N",
            //        credito = !string.IsNullOrEmpty(subsecaoNoticia.Credito) ? RemoveTroublesomeCharacters(subsecaoNoticia.Credito).Trim() : string.Empty,
            //        nivelrestricao = subsecaoNoticia.NivelRestricao,
            //        tipomidiaembed = subsecaoNoticia.TipoMidiaEmbed,
            //        idtipoconteudo = subsecaoNoticia.IdTipoConteudo,
            //        atualizacao = subsecaoNoticia.DtAtualizacao != null ? subsecaoNoticia.DtAtualizacao.ToString("s") : string.Empty,
            //        idsites,
            //        secoessites,
            //        idportal,
            //        idparceiro = subsecaoNoticia.IdParceiro != null ? subsecaoNoticia.IdParceiro.ToString() : string.Empty,
            //        precovoucher = subsecaoNoticia.Precovoucher != null ? subsecaoNoticia.Precovoucher.ToString() : string.Empty,
            //        precofinalvoucher = subsecaoNoticia.Precofinalvoucher != null ? subsecaoNoticia.Precofinalvoucher.ToString() : string.Empty,
            //        descontovoucher = subsecaoNoticia.Descontovoucher != null ? subsecaoNoticia.Descontovoucher.ToString() : string.Empty,
            //        qtdlimitevoucher = subsecaoNoticia.QtdLimiteVoucher != null ? subsecaoNoticia.QtdLimiteVoucher.ToString() : string.Empty,
            //        contemcomentarios = subsecaoNoticia.Contemcomentario == null ? false : subsecaoNoticia.Contemcomentario,
            //        contemcomentariofacebook = subsecaoNoticia.ContemcomentarioFacebook == null ? false : subsecaoNoticia.ContemcomentarioFacebook,
            //        fonte = !string.IsNullOrWhiteSpace(subsecaoNoticia.Fonte) ? RemoveTroublesomeCharacters(subsecaoNoticia.Fonte).Trim() : string.Empty,
            //        destinofonte = !string.IsNullOrWhiteSpace(subsecaoNoticia.DestinoFonte) ? RemoveTroublesomeCharacters(subsecaoNoticia.DestinoFonte).Trim() : string.Empty,
            //        destinocredito = !string.IsNullOrWhiteSpace(subsecaoNoticia.DestinoCredito) ? RemoveTroublesomeCharacters(subsecaoNoticia.DestinoCredito).Trim() : string.Empty,
            //        direcionaurl = subsecaoNoticia.DirecionarUrl,
            //        destino = !string.IsNullOrWhiteSpace(subsecaoNoticia.Destino) ? RemoveTroublesomeCharacters(subsecaoNoticia.Destino).Trim() : string.Empty,
            //        textonoticia = !string.IsNullOrEmpty(subsecaoNoticia.Noticia) ? ReplaceNonPrintableCaracteres(RemoveTroublesomeCharacters(subsecaoNoticia.Noticia), string.Empty).Trim() : string.Empty,
            //        imagens = subsecaoNoticia.Imagens,
            //        arquivos,
            //        videos,
            //        galerias,
            //        sons,
            //        siteprincipal = subsecaoNoticia.IdSitePadrao,
            //        secaoprincipal = subsecaoNoticia.IdSecao,
            //        urlCompleta = urlCompleta + RemoveTroublesomeCharacters(GeraURLNoticia(subsecaoNoticia, null)).Trim(),
            //    });

            //    // publica o arquivo associado no NoSQL
            //    if (!string.IsNullOrWhiteSpace(arquivos))
            //    {
            //        foreach (var item in arquivos.Split(','))
            //        {
            //            int IdFile = Convert.ToInt32(item);
            //            WebApi.ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController arquivosAssociadosNoSQLController = new ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController();
            //            arquivosAssociadosNoSQLController.InserirUploadFile(IdFile);
            //        }
            //    }
            //});

            noticias.InsertManyAsync(documents, new InsertManyOptions() { IsOrdered = false, BypassDocumentValidation = true });

            #region Criação de índices

            var options1 = new CreateIndexOptions { Name = "idnoticiaIDX", Unique = true };
            IndexKeysDefinition<dynamic> key1 = Builders<dynamic>.IndexKeys.Descending("idnoticia");
            var indexModel1 = new CreateIndexModel<dynamic>(key1, options1);
            noticias.Indexes.CreateOneAsync(indexModel1);

            //IndexKeysDefinition<dynamic> key2 = Builders<dynamic>.IndexKeys.Text(@"$**"); // Cria um único índice para todos os campos string
            //var indexModel2 = new CreateIndexModel<dynamic>(key2, new CreateIndexOptions() { Name = "geralIDX" });
            //noticias.Indexes.CreateOneAsync(indexModel2);

            var options5 = new CreateIndexOptions { Name = "publicacaoIDX" };
            IndexKeysDefinition<dynamic> key5 = Builders<dynamic>.IndexKeys.Descending("publicacao");
            var indexModel5 = new CreateIndexModel<dynamic>(key5, options5);
            noticias.Indexes.CreateOneAsync(indexModel5);

            var options6 = new CreateIndexOptions { Name = "expiracaoIDX" };
            IndexKeysDefinition<dynamic> key6 = Builders<dynamic>.IndexKeys.Descending("expiracao");
            var indexModel6 = new CreateIndexModel<dynamic>(key6, options6);
            noticias.Indexes.CreateOneAsync(indexModel6);

            var options7 = new CreateIndexOptions { Name = "idsitesIDX" };
            IndexKeysDefinition<dynamic> key7 = Builders<dynamic>.IndexKeys.Descending("idsites");
            var indexModel7 = new CreateIndexModel<dynamic>(key7, options7);
            noticias.Indexes.CreateOneAsync(indexModel7);

            var options8 = new CreateIndexOptions { Name = "tiponoticiaIDX" };
            IndexKeysDefinition<dynamic> key8 = Builders<dynamic>.IndexKeys.Descending("tiponoticia");
            var indexModel8 = new CreateIndexModel<dynamic>(key8, options8);
            noticias.Indexes.CreateOneAsync(indexModel8);

            #endregion

            Sync(SyncNoticiaBLL.Chamadas.PublicarNoticias, "NoticiasNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        /// <summary>
        /// Gera documento no mongo baseado nas árvores de editorias,secoes,subseções e idnoticia
        /// Este método não pode ser assíncrono, pois o documento de Noticias depende do mesmo para ser gerado.
        /// </summary>
        [HttpGet]
        [Route("PublicarNoticiasSecoesSites")]
        public string PublicarNoticiasSecoesSites()
        {
            List<dynamic> documents = new List<dynamic>();
            mongoDatabase.DropCollection("NoticiasSecoesSites");
            string inicio = DateTime.Now.ToString();
            var canais = mongoDatabase.GetCollection<dynamic>("NoticiasSecoesSites");
            List<NoticiasModelsNoSQL.SecoesCanaisModel> secoesCanaisModels = GetSecoesCanais();

            // canais
            foreach (var canal in secoesCanaisModels)
            {
                List<NoticiasModelsNoSQL.SecoesModel> editorias = GetEditorias(sitesModel.idSite, canal.IdCanal);
                canal.Editorias = new List<dynamic>();

                // transfere o valor do campo [canal] para a editoria
                editorias.Select(c => { c.Canal = canal.Canal; return c; }).ToList();

                // editorias
                foreach (var editoria in editorias.Where(a => a.IdCanal == canal.IdCanal))
                {
                    List<NoticiasModelsNoSQL.SecoesModel> secoes = GetSecoes(sitesModel.idSite, editoria, 0, 0);

                    // seções
                    editoria.ListSecoesModel = new List<dynamic>();
                    foreach (var secao in secoes)
                    {
                        secao.Canal = editoria.Canal;
                        List<NoticiasModelsNoSQL.SecoesModel> subsecoes = GetSubSecoes(sitesModel, secao, 0, 0);

                        // subsecoes
                        secao.ListSecoesModel = new List<dynamic>();
                        foreach (var subsecao in subsecoes)
                        {
                            subsecao.Canal = secao.Canal;
                            List<NoticiasModelsNoSQL.NoticiasModel> subsecoesNoticias = GetSubSecoesNoticias(sitesModel, subsecao, 0);

                            // noticias
                            subsecao.ListNoticiasModels = new List<dynamic>();
                            foreach (var subsecaoNoticia in subsecoesNoticias)
                            {
                                subsecao.ListNoticiasModels.Add(new { idnoticia = subsecaoNoticia.IdNoticia, publicacao = subsecaoNoticia.DtPublicacao.ToLocalTime() });
                            }

                            // add somente se tiver conteúdo
                            if (subsecao.ListNoticiasModels.Any())
                            {
                                secao.ListSecoesModel.Add(new
                                {
                                    idsecao = subsecao.IdSecao,
                                    idsecaopai = subsecao.IdSecaoPai,
                                    nomesecao = subsecao.Secao,
                                    subsecao.Agencia,
                                    secao.Diretorio,
                                    noticias = subsecao.ListNoticiasModels
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

                //canais.InsertOne(canal);
                documents.Add(canal);
            }

            canais.InsertMany(documents, new InsertManyOptions() { IsOrdered = false });

            #region Criação de índices
            IndexKeysDefinition<dynamic> keys = Builders<dynamic>.IndexKeys.Descending("Editorias.secoes.subsecoes.idsecao");
            var options = new CreateIndexOptions { Name = "NoticiasSecoesSitesIDX" };
            var indexModel = new CreateIndexModel<dynamic>(keys, options);
            canais.Indexes.CreateOneAsync(indexModel);
            #endregion

            Sync(SyncNoticiaBLL.Chamadas.PublicarNoticiasSecoesSites, "NoticiasNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("RemoverNoticiaSecaoSite")]
        public bool RemoverNoticiaSecaoSite(int IdNoticia, int IdSecao)
        {
            try
            {
                var collectionNoticiasSecoesSites = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasSecoesModel>("NoticiasSecoesSites");
                var filterNoticiasSecoesSites = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Filter.Eq("Editorias.secoes.subsecoes.noticias.idnoticia", IdNoticia);
                var updateNoticiasSecoesSites = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Update.PullFilter("Editorias.$[].secoes.$[].subsecoes.$[i].noticias", Builders<BsonDocument>.Filter.Eq("idnoticia", IdNoticia));
                var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<NoticiasModelsNoSQL.NoticiasSecoesModel>("{'i.idsecao': " + IdSecao + "}") };
                var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                var resultadoNoticiasSecoesSites = collectionNoticiasSecoesSites.UpdateOne(filterNoticiasSecoesSites, updateNoticiasSecoesSites, updateOptions);

                object[] param = { "NoticiasNoSQL", "IdNoticia", IdNoticia, "IdSecao", IdSecao };
                Sync(SyncNoticiaBLL.Chamadas.RemoverNoticiaSecaoSite, param);

                return (resultadoNoticiasSecoesSites.MatchedCount > 0 && resultadoNoticiasSecoesSites.ModifiedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverNoticia")]
        public bool RemoverNoticia(int IdNoticia)
        {
            try
            {
                var collectionNoticias = mongoDatabase.GetCollection<dynamic>("Noticias");
                var filterNoticias = Builders<dynamic>.Filter.Eq("idnoticia", IdNoticia);
                var resultadoNoticias = collectionNoticias.DeleteOne(filterNoticias);

                object[] param = { "NoticiasNoSQL", "IdNoticia", IdNoticia };
                Sync(SyncNoticiaBLL.Chamadas.RemoverNoticia, param);

                return (resultadoNoticias.DeletedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirNoticia")]
        public bool InserirNoticia(int IdNoticia)
        {
            try
            {
                RemoverNoticia(IdNoticia);

                var collectionNoticias = mongoDatabase.GetCollection<dynamic>("Noticias");
                var noticia = GetNoticiaByIdNoticia(IdNoticia);
                string idsites = GeraCampoIdSites(noticia);
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : noticia.IdSitePadrao;
                List<CommonNoSQL.SecoesSites> secoessites = GeraSecoesSites(noticia, noticia.IdNoticia);
                noticia.Imagens = new List<NoticiasModelsNoSQL.ImagensModel>();
                NoticiasModelsNoSQL.ImagensModel imagemdestaque, imagemmanchete, imagempatrocinio;
                string arquivos, videos, galerias, sons;

                Fotos(noticia, out imagemdestaque, out imagemmanchete, out imagempatrocinio);

                if (imagemdestaque != null && imagemdestaque.Idmultimidia > 0)
                {
                    noticia.Imagens.Add(imagemdestaque);
                }

                if (imagemmanchete != null && imagemmanchete.Idmultimidia > 0)
                {
                    noticia.Imagens.Add(imagemmanchete);
                }

                if (imagempatrocinio != null && imagempatrocinio.Idmultimidia > 0)
                {
                    noticia.Imagens.Add(imagempatrocinio);
                }

                MidiaAssociada(noticia, out arquivos, out videos, out galerias, out sons);

                CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL extensoesXslBLL = new CMS.Personalizacoes.Front.BLL.ExtensoesXslBLL();
                var urlCompleta = extensoesXslBLL.MontaPrefixoUrlPorTipoMidia(noticia.IdNoticia, "1");

                collectionNoticias.InsertOneAsync(new
                {
                    idnoticia = noticia.IdNoticia,
                    ativo = noticia.Ativo,
                    publicacao = noticia.DtPublicacao.ToString("s").Trim(),
                    expiracao = noticia.DtExpiracao.Value.ToString("s").Trim(),
                    tiponoticia = noticia.TipoDestaque,
                    url = !string.IsNullOrWhiteSpace(noticia.Url) ? RemoveTroublesomeCharacters(GeraURLNoticia(noticia, null)).Trim() : string.Empty,
                    assunto = !string.IsNullOrWhiteSpace(noticia.Assunto) ? RemoveTroublesomeCharacters(noticia.Assunto).Trim() : string.Empty,
                    assunto_alternativo = !string.IsNullOrWhiteSpace(noticia.Assunto_alternativo) ? RemoveTroublesomeCharacters(noticia.Assunto_alternativo).Trim() : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(noticia.Destaque) ? RemoveTroublesomeCharacters(noticia.Destaque).Trim() : string.Empty,
                    manchete = !string.IsNullOrWhiteSpace(noticia.Manchete) ? RemoveTroublesomeCharacters(noticia.Manchete).Trim() : string.Empty,
                    tags = !string.IsNullOrEmpty(noticia.Tags) ? RemoveTroublesomeCharacters(noticia.Tags).Trim() : string.Empty,
                    tipo = "N",
                    subtiponoticia = noticia.SubTipoDestaque,
                    idioma = noticia.IdIdioma,
                    mob = noticia.Mobile.HasValue && noticia.Mobile.Value ? "S" : "N",
                    credito = !string.IsNullOrEmpty(noticia.Credito) ? RemoveTroublesomeCharacters(noticia.Credito).Trim() : string.Empty,
                    nivelrestricao = noticia.NivelRestricao,
                    tipomidiaembed = noticia.TipoMidiaEmbed,
                    idtipoconteudo = noticia.IdTipoConteudo,
                    atualizacao = noticia.DtAtualizacao != null ? noticia.DtAtualizacao.ToString("s") : string.Empty,
                    idsites,
                    secoessites,
                    idportal,
                    idparceiro = noticia.IdParceiro != null ? noticia.IdParceiro.ToString() : string.Empty,
                    precovoucher = noticia.Precovoucher != null ? noticia.Precovoucher.ToString() : string.Empty,
                    precofinalvoucher = noticia.Precofinalvoucher != null ? noticia.Precofinalvoucher.ToString() : string.Empty,
                    descontovoucher = noticia.Descontovoucher != null ? noticia.Descontovoucher.ToString() : string.Empty,
                    qtdlimitevoucher = noticia.QtdLimiteVoucher != null ? noticia.QtdLimiteVoucher.ToString() : string.Empty,
                    contemcomentarios = noticia.Contemcomentario == null ? false : noticia.Contemcomentario,
                    contemcomentariofacebook = noticia.ContemcomentarioFacebook == null ? false : noticia.ContemcomentarioFacebook,
                    fonte = !string.IsNullOrWhiteSpace(noticia.Fonte) ? RemoveTroublesomeCharacters(noticia.Fonte).Trim() : string.Empty,
                    destinofonte = !string.IsNullOrWhiteSpace(noticia.DestinoFonte) ? RemoveTroublesomeCharacters(noticia.DestinoFonte).Trim() : string.Empty,
                    destinocredito = !string.IsNullOrWhiteSpace(noticia.DestinoCredito) ? RemoveTroublesomeCharacters(noticia.DestinoCredito).Trim() : string.Empty,
                    direcionaurl = noticia.DirecionarUrl,
                    destino = !string.IsNullOrWhiteSpace(noticia.Destino) ? RemoveTroublesomeCharacters(noticia.Destino).Trim() : string.Empty,
                    textonoticia = !string.IsNullOrEmpty(noticia.Noticia) ? ReplaceNonPrintableCaracteres(RemoveTroublesomeCharacters(noticia.Noticia), string.Empty).Trim() : string.Empty,
                    imagens = noticia.Imagens,
                    arquivos,
                    videos,
                    galerias,
                    sons,
                    siteprincipal = noticia.IdSitePadrao,
                    secaoprincipal = noticia.IdSecao,
                    urlCompleta = urlCompleta + RemoveTroublesomeCharacters(GeraURLNoticia(noticia, null)).Trim(),
                }, new InsertOneOptions() { BypassDocumentValidation = true });

                // publica o arquivo associado no NoSQL
                if (!string.IsNullOrWhiteSpace(arquivos))
                {
                    foreach (var item in arquivos.Split(','))
                    {
                        int IdFile = Convert.ToInt32(item);
                        WebApi.ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController arquivosAssociadosNoSQLController = new ArquivosAssociadosNoSQLController.Controllers.ArquivosAssociadosNoSQLController();
                        arquivosAssociadosNoSQLController.InserirUploadFile(IdFile);
                    }
                }

                object[] param = { "NoticiasNoSQL", "IdNoticia", IdNoticia };
                Sync(SyncNoticiaBLL.Chamadas.InserirNoticia, param);

                #region Purge CDN AZION

                PurgeURL(urlCompleta + RemoveTroublesomeCharacters(GeraURLNoticia(noticia, null)).Trim());

                #endregion

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("InserirNoticiaSecaoSite")]
        public bool InserirNoticiaSecaoSite(int IdNoticia)
        {
            try
            {
                // optamos por: sempre gerar o arquivo de noticias secoes sites, pois estavamos tendo problemas com o UpdateOne do Mongo
                PublicarNoticiasSecoesSites();

                //var collectionNoticiasSecoesSites = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasSecoesModel>("NoticiasSecoesSites");
                //var secoesNoticia = GetSecoesNoticia(IdNoticia);
                //var noticia = GetNoticiaByIdNoticia(IdNoticia);

                //foreach (var item in secoesNoticia)
                //{
                //    RemoverNoticiaSecaoSite(IdNoticia, item.IdSecao);

                //    // Busca nas SUBSECOES se existe o idsecao da noticia
                //    FieldDefinition<NoticiasModelsNoSQL.NoticiasSecoesModel, dynamic> field = "Editorias.secoes.subsecoes";
                //    var filter = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Filter.Empty;
                //    var result = collectionNoticiasSecoesSites.DistinctAsync(field, filter).GetAwaiter().GetResult().ToListAsync().GetAwaiter().GetResult().Where(a => a.idsecao == item.IdSecao);

                //    if (result.Any())
                //    {
                //        // Se encontrar no mongo, insere notícia dentro da SUBSECAO especificada
                //        FilterDefinition<NoticiasModelsNoSQL.NoticiasSecoesModel> filterNoticiasSecoesSites = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Filter.Empty;
                //        var updateNoticiasSecoesSites = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Update.Push("Editorias.$[].secoes.$[].subsecoes.$[i].noticias", new { idnoticia = IdNoticia, publicacao = noticia.DtPublicacao.ToLocalTime() });
                //        var arrayFilters = new List<ArrayFilterDefinition> { new JsonArrayFilterDefinition<NoticiasModelsNoSQL.NoticiasSecoesModel>("{'i.idsecao': " + item.IdSecao + "}") };
                //        var updateOptions = new UpdateOptions { ArrayFilters = arrayFilters };
                //        var resultadoNoticiasSecoesSites = collectionNoticiasSecoesSites.UpdateOne(filterNoticiasSecoesSites, updateNoticiasSecoesSites, updateOptions);
                //    }
                //    else
                //    {
                //        // Se não encontrar no mongo, refaz o arquivo do zero e sai do foreach
                //        PublicarNoticiasSecoesSites();
                //        break;
                //    }
                // }

                object[] param = { "NoticiasNoSQL", "IdNoticia", IdNoticia };
                Sync(SyncNoticiaBLL.Chamadas.InserirNoticiaSecaoSite, param);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverNoticiasExpiradas")]
        public async Task<string> RemoverNoticiasExpiradas()
        {
            string inicio = DateTime.Now.ToString();
            var collection = await GetAllNoticiasNoSQL();

            foreach (var item in collection)
            {
                if (DateTime.Now >= Convert.ToDateTime(item.expiracao))
                {
                    RemoverNoticia(item.idnoticia);
                }
            }

            Sync(SyncNoticiaBLL.Chamadas.RemoverNoticiasExpiradas, "NoticiasNoSQL");
            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("PublicarNoticiasBusca")]
        public string PublicarNoticiasBusca(List<NoticiasModelsNoSQL.NoticiasModel> lista)
        {
            List<dynamic> documents = new List<dynamic>();
            mongoDatabase.DropCollection("NoticiasBusca");
            string inicio = DateTime.Now.ToString();
            string idsNoticia = string.Empty;
            var noticias = mongoDatabase.GetCollection<dynamic>("NoticiasBusca");

            Parallel.ForEach(lista, noticia =>
            {
                string idsites = GeraCampoIdSites(noticia);
                noticia.Imagens = new List<NoticiasModelsNoSQL.ImagensModel>();
                int idportal = idsites.Contains(sitesModel.idSite.ToString()) ? sitesModel.idSite : noticia.IdSitePadrao;

                documents.Add(new
                {
                    idnoticia = noticia.IdNoticia,
                    ativo = noticia.Ativo,
                    publicacao = noticia.DtPublicacao.ToString("s").Trim(),
                    expiracao = noticia.DtExpiracao.Value.ToString("s").Trim(),
                    url = !string.IsNullOrWhiteSpace(noticia.Url) ? RemoveTroublesomeCharacters(GeraURLNoticia(noticia, null)).Trim() : string.Empty,
                    assunto = !string.IsNullOrWhiteSpace(noticia.Assunto) ? RemoveTroublesomeCharacters(noticia.Assunto).Trim() : string.Empty,
                    assunto_alternativo = !string.IsNullOrWhiteSpace(noticia.Assunto_alternativo) ? RemoveTroublesomeCharacters(noticia.Assunto_alternativo).Trim() : string.Empty,
                    destaque = !string.IsNullOrWhiteSpace(noticia.Destaque) ? RemoveTroublesomeCharacters(noticia.Destaque).Trim() : string.Empty,
                    manchete = !string.IsNullOrWhiteSpace(noticia.Manchete) ? RemoveTroublesomeCharacters(noticia.Manchete).Trim() : string.Empty,
                    tags = !string.IsNullOrEmpty(noticia.Tags) ? RemoveTroublesomeCharacters(noticia.Tags).Trim() : string.Empty,
                    credito = !string.IsNullOrEmpty(noticia.Credito) ? RemoveTroublesomeCharacters(noticia.Credito).Trim() : string.Empty,
                    idsites,
                    idportal,
                    fonte = !string.IsNullOrWhiteSpace(noticia.Fonte) ? RemoveTroublesomeCharacters(noticia.Fonte).Trim() : string.Empty,
                    destinofonte = !string.IsNullOrWhiteSpace(noticia.DestinoFonte) ? RemoveTroublesomeCharacters(noticia.DestinoFonte).Trim() : string.Empty,
                    destinocredito = !string.IsNullOrWhiteSpace(noticia.DestinoCredito) ? RemoveTroublesomeCharacters(noticia.DestinoCredito).Trim() : string.Empty,
                    destino = !string.IsNullOrWhiteSpace(noticia.Destino) ? RemoveTroublesomeCharacters(noticia.Destino).Trim() : string.Empty,
                    textonoticia = !string.IsNullOrEmpty(noticia.Noticia) ? ReplaceNonPrintableCaracteres(RemoveTroublesomeCharacters(noticia.Noticia), string.Empty).Trim() : string.Empty,
                });
            });

            noticias.InsertManyAsync(documents, new InsertManyOptions() { IsOrdered = false, BypassDocumentValidation = true });

            #region Criação de índices

            var options1 = new CreateIndexOptions { Name = "idnoticiaIDX", Unique = true };
            IndexKeysDefinition<dynamic> key1 = Builders<dynamic>.IndexKeys.Descending("idnoticia");
            var indexModel1 = new CreateIndexModel<dynamic>(key1, options1);
            noticias.Indexes.CreateOneAsync(indexModel1);

            IndexKeysDefinition<dynamic> key2 = Builders<dynamic>.IndexKeys.Text(@"$**"); // Cria um único índice para todos os campos string
            var indexModel2 = new CreateIndexModel<dynamic>(key2, new CreateIndexOptions() { Name = "geralIDX" });
            noticias.Indexes.CreateOneAsync(indexModel2);

            var options5 = new CreateIndexOptions { Name = "publicacaoIDX" };
            IndexKeysDefinition<dynamic> key5 = Builders<dynamic>.IndexKeys.Descending("publicacao");
            var indexModel5 = new CreateIndexModel<dynamic>(key5, options5);
            noticias.Indexes.CreateOneAsync(indexModel5);

            var options6 = new CreateIndexOptions { Name = "expiracaoIDX" };
            IndexKeysDefinition<dynamic> key6 = Builders<dynamic>.IndexKeys.Descending("expiracao");
            var indexModel6 = new CreateIndexModel<dynamic>(key6, options6);
            noticias.Indexes.CreateOneAsync(indexModel6);

            var options7 = new CreateIndexOptions { Name = "idsitesIDX" };
            IndexKeysDefinition<dynamic> key7 = Builders<dynamic>.IndexKeys.Descending("idsites");
            var indexModel7 = new CreateIndexModel<dynamic>(key7, options7);
            noticias.Indexes.CreateOneAsync(indexModel7);

            #endregion

            //Sync(SyncNoticiaBLL.Chamadas.PublicarNoticiasBusca, "NoticiasNoSQL");

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("PublicarSecoes")]
        public string PublicarSecoes()
        {
            mongoDatabase.DropCollection("Secoes");

            string inicio = DateTime.Now.ToString();
            var secoesCollection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesModel>("Secoes");

            foreach (var item in GetAllSecoes())
            {
                secoesCollection.InsertOneAsync(item);
            }

            #region Criação de índices
            IndexKeysDefinition<NoticiasModelsNoSQL.SecoesModel> keys = Builders<NoticiasModelsNoSQL.SecoesModel>.IndexKeys.Ascending("IdSecao");
            var options = new CreateIndexOptions { Name = "SecoesIDX" };
            var indexModel = new CreateIndexModel<NoticiasModelsNoSQL.SecoesModel>(keys, options);
            secoesCollection.Indexes.CreateOneAsync(indexModel);
            #endregion

            Sync(SyncNoticiaBLL.Chamadas.PublicarSecoes, "NoticiasNoSQL");
            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("PublicarCanais")]
        public string PublicarCanais()
        {
            mongoDatabase.DropCollection("SecoesCanais");

            string inicio = DateTime.Now.ToString();
            var secoesCollection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>("SecoesCanais");

            foreach (var item in GetAllSecoesCanais())
            {
                secoesCollection.InsertOneAsync(item);
            }

            #region Criação de índices
            IndexKeysDefinition<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar> keys = Builders<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>.IndexKeys.Ascending("IdCanal");
            var options = new CreateIndexOptions { Name = "SecoesCanaisIDX" };
            var indexModel = new CreateIndexModel<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>(keys, options);
            secoesCollection.Indexes.CreateOneAsync(indexModel);
            #endregion

            Sync(SyncNoticiaBLL.Chamadas.PublicarCanais, "NoticiasNoSQL");
            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        #endregion

        #region Métodos Auxiliares
        private void Fotos(NoticiasModelsNoSQL.NoticiasModel subsecaoNoticia, out NoticiasModelsNoSQL.ImagensModel imagemdestaque, out NoticiasModelsNoSQL.ImagensModel imagemmanchete, out NoticiasModelsNoSQL.ImagensModel imagempatrocinio)
        {
            imagemdestaque = GetFotoDestaque(subsecaoNoticia);
            imagemmanchete = GetFotoManchete(subsecaoNoticia);
            imagempatrocinio = GetFotoPatrocinio(subsecaoNoticia);
        }
        private static void MidiaAssociada(NoticiasModelsNoSQL.NoticiasModel subsecaoNoticia, out string arquivos, out string videos, out string galerias, out string sons)
        {
            arquivos = GetArquivosAssociados(subsecaoNoticia);
            videos = GetVideosAssociados(subsecaoNoticia);
            galerias = GetGaleriasAssociadas(subsecaoNoticia);
            sons = GetSonsAssociados(subsecaoNoticia);
        }
        private static string GeraCampoIdSites(NoticiasModelsNoSQL.NoticiasModel subsecaoNoticia)
        {
            List<string> sites = new List<string>();
            var noticiassecoessites = GetIdsSitesByIdNoticia(subsecaoNoticia.IdNoticia);

            foreach (var portal in noticiassecoessites.Distinct())
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

        private static List<CommonNoSQL.SecoesSites> GeraSecoesSites(NoticiasModelsNoSQL.NoticiasModel subsecaoNoticia, int IdConteudo)
        {
            List<CommonNoSQL.SecoesSites> secoessites = new List<CommonNoSQL.SecoesSites>();
            var noticiassecoessites = GetNoticiasSecoesSitesByIdNoticia(subsecaoNoticia.IdNoticia);

            foreach (var item in noticiassecoessites.Distinct())
            {
                CommonNoSQL.SecoesSites obj = new CommonNoSQL.SecoesSites { idconteudo = IdConteudo, idsecao = item.idSecao, idsite = item.idSite };
                secoessites.Add(obj);
            }

            return secoessites;
        }

        private void Sync(SyncNoticiaBLL.Chamadas metodo, params object[] args)
        {
            SyncNoticiaBLL syncNoticiaBLL = new SyncNoticiaBLL();
            syncNoticiaBLL.PropagarCacheWebApi(metodo, args);
        }

        private static void PurgeURL(string urlCompleta)
        {
            FrameworkExtension.CommonBusiness.CommonAzionHelper commonAzionHelper = new FrameworkExtension.CommonBusiness.CommonAzionHelper();
            var token = commonAzionHelper.GenerateToken();
            List<string> urls = new List<string>
            {
                urlCompleta
            };
            commonAzionHelper.PurgeURL(urls, token);
        }

        #endregion

        #region Buscas NoSQL
        public static List<int> GetAllIdsNoticiasNoSQL<T>()
        {
            try
            {
                var noticias = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasSecoesModel>("NoticiasSecoesSites");
                FieldDefinition<NoticiasModelsNoSQL.NoticiasSecoesModel, int> field = "Editorias.secoes.subsecoes.noticias.idnoticia";
                var filter = Builders<NoticiasModelsNoSQL.NoticiasSecoesModel>.Filter.Empty;

                return noticias.DistinctAsync(field, filter).Result.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsNoticiasByIdSecaoNoSQL")]
        public async Task<List<int>> GetIdsNoticiasByIdSecaoNoSQL(int Id)
        {
            try
            {
                IMongoCollection<NoticiasModelsNoSQL.SecoesCanaisBsonModel> collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesCanaisBsonModel>("NoticiasSecoesSites");
                List<int> noticiasList = new List<int>();

                var filter = Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                             Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                             Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                List<NoticiasModelsNoSQL.SecoesCanaisBsonModel> canais = await collection.Find(filter).ToListAsync();

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
                                var noticias = subsecao.noticias;

                                if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                {
                                    foreach (var noticia in noticias)
                                    {
                                        noticiasList.Add(noticia.idnoticia);
                                    }
                                }
                            }
                        }
                    }
                }

                return noticiasList.Distinct().ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetIdsNoticiasByIdSecaoNoSQLSincrono")]
        public List<NoticiasModelsNoSQL.NoticiasBsonCustomModel> GetIdsNoticiasByIdSecaoNoSQLSincrono(int Id = 1, int? IdSite = null)
        {
            try
            {
                IMongoCollection<NoticiasModelsNoSQL.SecoesCanaisBsonModel> collection;

                if (IdSite != null)
                {
                    var client = CommonMongoClient.Instance;
                    mongoDatabase = client.GetDatabase(IdSite.ToString());
                    collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesCanaisBsonModel>("NoticiasSecoesSites");
                }
                else
                {
                    collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesCanaisBsonModel>("NoticiasSecoesSites");
                }

                if (Id != 1)
                {
                    List<NoticiasModelsNoSQL.NoticiasBsonCustomModel> noticiasList = new List<NoticiasModelsNoSQL.NoticiasBsonCustomModel>();

                    var filter = Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.idsecao", Id) |
                                 Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.idsecao", Id) |
                                 Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Eq("Editorias.secoes.subsecoes.idsecao", Id);

                    // manter para estudos, mesmo porque essa linha é mais lenta que a forma de filtro acima
                    // var findFluent = collection.Find(Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.ElemMatch(canal => canal.Editorias, editoria => editoria.idsecao == Id || editoria.secoes.Any(a => a.idsecao == Id) || editoria.secoes.Any(a => a.subsecoes.Any(b => b.idsecao == Id)))).ToList();

                    var canais = collection.Find(filter).ToList();

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
                                    var noticias = subsecao.noticias;

                                    if (editoria.idsecao == Id || secao.idsecao == Id || subsecao.idsecao == Id)
                                    {
                                        foreach (var noticia in noticias)
                                        {
                                            noticiasList.Add(new NoticiasModelsNoSQL.NoticiasBsonCustomModel { idnoticia = noticia.idnoticia, publicacao = noticia.publicacao });
                                        }
                                    }
                                }
                            }
                        }
                    }

                    return noticiasList.Distinct().Where(a => a.publicacao <= DateTime.Now).ToList();
                }
                else
                {
                    List<NoticiasModelsNoSQL.NoticiasBsonCustomModel> noticiasList = new List<NoticiasModelsNoSQL.NoticiasBsonCustomModel>();

                    var filter = Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.Empty;

                    // manter para estudos, mesmo porque essa linha é mais lenta que a forma de filtro acima
                    // var findFluent = collection.Find(Builders<NoticiasModelsNoSQL.SecoesCanaisBsonModel>.Filter.ElemMatch(canal => canal.Editorias, editoria => editoria.idsecao == Id || editoria.secoes.Any(a => a.idsecao == Id) || editoria.secoes.Any(a => a.subsecoes.Any(b => b.idsecao == Id)))).ToList();

                    var canais = collection.Find(filter).ToList();

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
                                    var noticias = subsecao.noticias;

                                    foreach (var noticia in noticias)
                                    {
                                        noticiasList.Add(new NoticiasModelsNoSQL.NoticiasBsonCustomModel { idnoticia = noticia.idnoticia, publicacao = noticia.publicacao });
                                    }

                                }
                            }
                        }
                    }

                    return noticiasList.Distinct().Where(a => a.publicacao <= DateTime.Now).ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetSecaoByIdNoSQL")]
        public NoticiasModelsNoSQL.SecoesBsonModelAuxiliar GetSecaoByIdNoSQL(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesBsonModelAuxiliar>("Secoes");
                var filter = Builders<NoticiasModelsNoSQL.SecoesBsonModelAuxiliar>.Filter.Eq("IdSecao", Id);
                return collection.Find(filter).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new NoticiasModelsNoSQL.SecoesBsonModelAuxiliar();
            }
        }

        [HttpGet]
        [Route("GetSecaoCanalByIdCanalNoSQL")]
        public dynamic GetSecaoCanalByIdCanalNoSQL(NoticiasModelsNoSQL.SecoesBsonModelAuxiliar obj)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>("SecoesCanais");
                var filter = Builders<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>.Filter.Eq("IdCanal", obj.IdCanal);
                return collection.Find(filter).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetNoticiaByIdNoSQL")]
        public async Task<NoticiasModelsNoSQL.NoticiasBsonModel> GetNoticiaByIdNoSQL(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("Noticias");
                var filter = Builders<NoticiasModelsNoSQL.NoticiasBsonModel>.Filter.Eq("idnoticia", Id);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetNoticiaByIdNoSQLSincrono")]
        public NoticiasModelsNoSQL.NoticiasBsonModel GetNoticiaByIdNoSQLSincrono(int Id)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("Noticias");
                var filter = Builders<NoticiasModelsNoSQL.NoticiasBsonModel>.Filter.Eq("idnoticia", Id);
                return collection.Find(filter).FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetNoticiasByIdsNoSQLSincrono")]
        public List<NoticiasModelsNoSQL.NoticiasBsonModel> GetNoticiasByIdsNoSQLSincrono(List<int> listIdNoticia)
        {
            try
            {
                // exclusão do campo noticia/textonoticia por ser muito grande e não ter utilidade neste tipo de lista em específico
                var fieldsBuilder = Builders<NoticiasModelsNoSQL.NoticiasBsonModel>.Projection;
                var fieldsExcluded = fieldsBuilder.Exclude(d => d.textonoticia);

                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("Noticias");
                var filter = Builders<NoticiasModelsNoSQL.NoticiasBsonModel>.Filter.In(a => a.idnoticia, listIdNoticia);
                return collection.Find(filter).Project<NoticiasModelsNoSQL.NoticiasBsonModel>(fieldsExcluded).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetAllNoticiasNoSQL")]
        public async Task<List<NoticiasModelsNoSQL.NoticiasBsonModel>> GetAllNoticiasNoSQL()
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("Noticias");
                return await collection.FindAsync(_ => true).Result.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetAllNoticiasNoSQLSincrono")]
        public List<NoticiasModelsNoSQL.NoticiasBsonModel> GetAllNoticiasNoSQLSincrono()
        {
            try
            {
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("Noticias");
                return collection.Find(_ => true).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Somente irá funcionar se houverem indices de texto criados.
        /// </summary>
        /// <param name="Texto"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("GetNoticiasByAnyTextAnyFields")]
        public List<NoticiasModelsNoSQL.NoticiasBsonModel> GetNoticiasByAnyTextAnyFields(string Texto)
        {
            try
            {
                /// <summary> stopwords: Contém os pronomes, preposições que serão ignorados no momento da busca aumentando a performance.
                /// </summary>
                string[] stopWords =
                {
                    "a",
                    "à",
                    "adeus",
                    "agora",
                    "aí",
                    "ainda",
                    "além",
                    "algo",
                    "algumas",
                    "alguns",
                    "ali",
                    "ano",
                    "anos",
                    "ante",
                    "antes",
                    "ao",
                    "aos",
                    "apenas",
                    "apoio",
                    "após",
                    "aquela",
                    "aquelas",
                    "aquele",
                    "aqueles",
                    "aqui",
                    "aquilo",
                    "área",
                    "as",
                    "às",
                    "assim",
                    "até",
                    "atrás",
                    "através",
                    "baixo",
                    "bastante",
                    "bem",
                    "boa",
                    "boas",
                    "bom",
                    "bons",
                    "breve",
                    "cá",
                    "cada",
                    "catorze",
                    "cedo",
                    "cento",
                    "certamente",
                    "certeza",
                    "cima",
                    "cinco",
                    "coisa",
                    "com",
                    "como",
                    "conselho",
                    "contra",
                    "custa",
                    "da",
                    "dá",
                    "dão",
                    "daquela",
                    "daquelas",
                    "daquele",
                    "daqueles",
                    "dar",
                    "das",
                    "de",
                    "debaixo",
                    "demais",
                    "dentro",
                    "depois",
                    "desde",
                    "dessa",
                    "dessas",
                    "desse",
                    "desses",
                    "desta",
                    "destas",
                    "deste",
                    "destes",
                    "deve",
                    "deverá",
                    "dez",
                    "dezanove",
                    "dezasseis",
                    "dezassete",
                    "dezoito",
                    "dia",
                    "diante",
                    "diz",
                    "dizem",
                    "dizer",
                    "do",
                    "dois",
                    "dos",
                    "doze",
                    "duas",
                    "dúvida",
                    "e",
                    "é",
                    "ela",
                    "elas",
                    "ele",
                    "eles",
                    "em",
                    "embora",
                    "entre",
                    "era",
                    "és",
                    "essa",
                    "essas",
                    "esse",
                    "esses",
                    "esta",
                    "está",
                    "estão",
                    "estar",
                    "estas",
                    "estás",
                    "estava",
                    "este",
                    "estes",
                    "esteve",
                    "estive",
                    "estivemos",
                    "estiveram",
                    "estiveste",
                    "estivestes",
                    "estou",
                    "eu",
                    "exemplo",
                    "faço",
                    "falta",
                    "favor",
                    "faz",
                    "fazeis",
                    "fazem",
                    "fazemos",
                    "fazer",
                    "fazes",
                    "fez",
                    "fim",
                    "final",
                    "foi",
                    "fomos",
                    "for",
                    "foram",
                    "forma",
                    "foste",
                    "fostes",
                    "fui",
                    "geral",
                    "grande",
                    "grandes",
                    "grupo",
                    "há",
                    "hoje",
                    "hora",
                    "horas",
                    "isso",
                    "isto",
                    "já",
                    "lá",
                    "lado",
                    "local",
                    "logo",
                    "longe",
                    "lugar",
                    "maior",
                    "maioria",
                    "mais",
                    "mal",
                    "mas",
                    "máximo",
                    "me",
                    "meio",
                    "menor",
                    "menos",
                    "mês",
                    "meses",
                    "meu",
                    "meus",
                    "mil",
                    "minha",
                    "minhas",
                    "momento",
                    "muito",
                    "muitos",
                    "na",
                    "nada",
                    "não",
                    "naquela",
                    "naquelas",
                    "naquele",
                    "naqueles",
                    "nas",
                    "nem",
                    "nenhuma",
                    "nessa",
                    "nessas",
                    "nesse",
                    "nesses",
                    "nesta",
                    "nestas",
                    "neste",
                    "nestes",
                    "nível",
                    "no",
                    "noite",
                    "nome",
                    "nos",
                    "nós",
                    "nossa",
                    "nossas",
                    "nosso",
                    "nossos",
                    "nova",
                    "novas",
                    "nove",
                    "novo",
                    "novos",
                    "num",
                    "numa",
                    "número",
                    "nunca",
                    "o",
                    "obra",
                    "obrigada",
                    "obrigado",
                    "oitava",
                    "oitavo",
                    "oito",
                    "onde",
                    "ontem",
                    "onze",
                    "os",
                    "ou",
                    "outra",
                    "outras",
                    "outro",
                    "outros",
                    "para",
                    "parece",
                    "parte",
                    "partir",
                    "paucas",
                    "pela",
                    "pelas",
                    "pelo",
                    "pelos",
                    "perante",
                    "perto",
                    "pode",
                    "pôde",
                    "podem",
                    "poder",
                    "põe",
                    "põem",
                    "ponto",
                    "pontos",
                    "por",
                    "porque",
                    "porquê",
                    "posição",
                    "possível",
                    "possivelmente",
                    "posso",
                    "pouca",
                    "pouco",
                    "poucos",
                    "primeira",
                    "primeiras",
                    "primeiro",
                    "primeiros",
                    "própria",
                    "próprias",
                    "próprio",
                    "próprios",
                    "próxima",
                    "próximas",
                    "próximo",
                    "próximos",
                    "puderam",
                    "quáis",
                    "qual",
                    "quando",
                    "quanto",
                    "quarta",
                    "quarto",
                    "quatro",
                    "que",
                    "quê",
                    "quem",
                    "quer",
                    "quereis",
                    "querem",
                    "queremas",
                    "queres",
                    "quero",
                    "questão",
                    "quinta",
                    "quinto",
                    "quinze",
                    "relação",
                    "sabe",
                    "sabem",
                    "são",
                    "se",
                    "segunda",
                    "segundo",
                    "sei",
                    "seis",
                    "sem",
                    "sempre",
                    "ser",
                    "seria",
                    "sete",
                    "sétima",
                    "sétimo",
                    "seu",
                    "seus",
                    "sexta",
                    "sexto",
                    "sim",
                    "sistema",
                    "sob",
                    "sobre",
                    "trás",
                    "sois",
                    "somos",
                    "sou",
                    "sua",
                    "suas",
                    "tal",
                    "talvez",
                    "também",
                    "tanta",
                    "tantas",
                    "tanto",
                    "tão",
                    "tarde",
                    "te",
                    "tem",
                    "têm",
                    "temos",
                    "tendes",
                    "tenho",
                    "tens",
                    "ter",
                    "terceira",
                    "terceiro",
                    "teu",
                    "teus",
                    "teve",
                    "tive",
                    "tivemos",
                    "tiveram",
                    "tiveste",
                    "tivestes",
                    "toda",
                    "todas",
                    "todo",
                    "todos",
                    "trabalho",
                    "três",
                    "treze",
                    "tu",
                    "tua",
                    "tuas",
                    "tudo",
                    "um",
                    "uma",
                    "umas",
                    "uns",
                    "vai",
                    "vais",
                    "vão",
                    "vários",
                    "vem",
                    "vêm",
                    "vens",
                    "ver",
                    "vez",
                    "vezes",
                    "viagem",
                    "vindo",
                    "vinte",
                    "você",
                    "vocês",
                    "vos",
                    "vós",
                    "vossa",
                    "vossas",
                    "vosso",
                    "vossos",
                    "zero"
                };
                string textoFormatado = string.Empty;
                int first = 0;
                foreach (var item in Texto.ToLowerInvariant().Split(' '))
                {
                    if (!Array.FindAll(stopWords, s => s.Equals(item)).Any())
                        textoFormatado = first == 0 ? textoFormatado + item.Trim() : textoFormatado + " " + item.Trim();
                    else
                        continue;
                    first++;
                }

                textoFormatado = RemoveDiacritics(textoFormatado);
                var collection = mongoDatabase.GetCollection<NoticiasModelsNoSQL.NoticiasBsonModel>("NoticiasBusca");
                var filter = Builders<NoticiasModelsNoSQL.NoticiasBsonModel>.Filter.Text(textoFormatado, new TextSearchOptions { DiacriticSensitive = false });
                return collection.FindAsync(filter).Result.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

        #region Buscas Banco Relacional

        [HttpGet]
        [Route("GetSecoesCanais")]
        public List<NoticiasModelsNoSQL.SecoesCanaisModel> GetSecoesCanais()
        {
            List<NoticiasModelsNoSQL.SecoesCanaisModel> secoesCanaisModel = new List<NoticiasModelsNoSQL.SecoesCanaisModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "SecoesCanais/GetAll";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoescanaisJsonString = response.Content.ReadAsStringAsync().Result;
                secoesCanaisModel = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesCanaisModel>>(secoescanaisJsonString);
            }

            return secoesCanaisModel;
        }
        private static List<NoticiasModelsNoSQL.SecoesModel> GetEditorias(int IdSite, int IdCanal)
        {
            List<NoticiasModelsNoSQL.SecoesModel> editorias = new List<NoticiasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetEditorias?idTipoSecao=" + (int)NoticiasModelsNoSQL.EnumTipoSecao.Editoria + "&idSite=" + IdSite + "&lista=" + "1,3,5,7,9,11,13,15";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                editorias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return editorias;
        }
        private static List<NoticiasModelsNoSQL.SecoesModel> GetSecoes(int IdSite, NoticiasModelsNoSQL.SecoesModel secao, int idSubSecaoEspecifico, int idNoticiaEspecifico)
        {
            List<NoticiasModelsNoSQL.SecoesModel> secoes = new List<NoticiasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSecoes?idSecao=" + secao.IdSecao + "&idTipoSecao=" + (int)NoticiasModelsNoSQL.EnumTipoSecao.Editoria + "&idSite=" + IdSite + "&lista=" + "1,3,5,7,9,11,13,15";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoes = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoes;
        }
        private static List<NoticiasModelsNoSQL.NoticiasModel> GetSubSecoesNoticias(SitesModelsNoSQL.SitesModel Site, NoticiasModelsNoSQL.SecoesModel subsecao, int idNoticiaEspecifico)
        {
            List<NoticiasModelsNoSQL.NoticiasModel> noticias = new List<NoticiasModelsNoSQL.NoticiasModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Noticias/GetNodeSubSecao?idSecao=" + subsecao.IdSecao + "&idSite=" + Site.idSite + "&siteAgrupado=" + Site.agruparConteudo;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasJsonString = response.Content.ReadAsStringAsync().Result;
                noticias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.NoticiasModel>>(noticiasJsonString);
            }

            return noticias;
        }
        private static List<NoticiasModelsNoSQL.SecoesModel> GetSubSecoes(SitesModelsNoSQL.SitesModel Site, NoticiasModelsNoSQL.SecoesModel secao, int idSubSecaoEspecifico, int idNoticiaEspecifico = 0)
        {
            List<NoticiasModelsNoSQL.SecoesModel> subsecoes = new List<NoticiasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSubSecoes?idSecao=" + secao.IdSecao + "&idSubSecaoEspecifico=" + idSubSecaoEspecifico + "&idTipoSecao=" + (int)NoticiasModelsNoSQL.EnumTipoSecao.SubSecao + "&idSite=" + Site.idSite + "&lista=" + "1,3,5,7,9,11,13,15";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                subsecoes = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return subsecoes;
        }
        private static List<int> GetIdsSitesByIdNoticia(int IdNoticia)
        {
            List<int> noticiasSecoesSites = new List<int>();
            var client = CommonHttpClient.Instance;
            string filterBody = JsonConvert.SerializeObject(new { idNoticia = IdNoticia });
            var URI = UrlBaseApi + "NoticiasSecoesSites/GetIdsSitesByIdNoticia?IdNoticia=" + IdNoticia;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasSecoesSitesJsonString = response.Content.ReadAsStringAsync().Result;
                noticiasSecoesSites = JsonConvert.DeserializeObject<List<int>>(noticiasSecoesSitesJsonString);
            }

            return noticiasSecoesSites;
        }

        private static List<CMS.Noticia.Model.NoticiasSecoesSitesModel> GetNoticiasSecoesSitesByIdNoticia(int IdNoticia)
        {
            List<CMS.Noticia.Model.NoticiasSecoesSitesModel> noticiasSecoesSites = new List<CMS.Noticia.Model.NoticiasSecoesSitesModel>();
            var client = CommonHttpClient.Instance;
            string filterBody = JsonConvert.SerializeObject(new { idNoticia = IdNoticia });
            var URI = UrlBaseApi + "NoticiasSecoesSites/GetByFilter/";

            HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasSecoesSitesJsonString = response.Content.ReadAsStringAsync().Result;
                noticiasSecoesSites = JsonConvert.DeserializeObject<List<CMS.Noticia.Model.NoticiasSecoesSitesModel>>(noticiasSecoesSitesJsonString);
            }

            return noticiasSecoesSites;
        }

        private static NoticiasModelsNoSQL.ImagensModel GetFotoDestaque(NoticiasModelsNoSQL.NoticiasModel noticia)
        {
            NoticiasModelsNoSQL.McFotosModel multimidia = new NoticiasModelsNoSQL.McFotosModel();
            NoticiasModelsNoSQL.ImagensModel retorno = new NoticiasModelsNoSQL.ImagensModel();
            if (noticia.IdImagemDestaque.HasValue && noticia.IdImagemDestaque.Value > 0)
            {
                var client = CommonHttpClient.Instance;
                var URI = UrlBaseApi + "Fotos/" + noticia.IdImagemDestaque.Value;
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
        public NoticiasModelsNoSQL.ImagensModel GetFotoManchete(NoticiasModelsNoSQL.NoticiasModel noticia)
        {
            NoticiasModelsNoSQL.McFotosModel multimidia = new NoticiasModelsNoSQL.McFotosModel();
            NoticiasModelsNoSQL.ImagensModel retorno = new NoticiasModelsNoSQL.ImagensModel();

            if (noticia.IdImagemManchete.HasValue && noticia.IdImagemManchete.Value > 0)
            {
                var client = CommonHttpClient.Instance;
                var URI = UrlBaseApi + "Fotos/" + noticia.IdImagemManchete.Value;
                HttpResponseMessage response = client.GetAsync(URI).Result;
                if (response.IsSuccessStatusCode)
                {
                    var fotosJsonString = response.Content.ReadAsStringAsync().Result;
                    multimidia = JsonConvert.DeserializeObject<NoticiasModelsNoSQL.McFotosModel>(fotosJsonString);
                }

                if (multimidia == null)
                    return null;

                retorno.Arquivo = multimidia.Arquivo;
                retorno.Credito = !string.IsNullOrEmpty(multimidia.Credito) ? RemoveTroublesomeCharacters(multimidia.Credito.Trim()) : string.Empty;
                retorno.Idmultimidia = multimidia.IdMultimidia;
                retorno.Legenda = RemoveTroublesomeCharacters(multimidia.Legenda.Trim());
                retorno.Tipo = "fotomanchete";
            }

            return retorno;
        }
        public NoticiasModelsNoSQL.ImagensModel GetFotoPatrocinio(NoticiasModelsNoSQL.NoticiasModel noticia)
        {
            NoticiasModelsNoSQL.McFotosModel multimidia = new NoticiasModelsNoSQL.McFotosModel();
            NoticiasModelsNoSQL.ImagensModel retorno = new NoticiasModelsNoSQL.ImagensModel();

            if (noticia.IdImagemPatrocinio.HasValue && noticia.IdImagemPatrocinio.Value > 0)
            {
                var client = CommonHttpClient.Instance;
                var URI = UrlBaseApi + "Fotos/" + noticia.IdImagemPatrocinio.Value;
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
                retorno.Tipo = "fotopatrocinio";
            }

            return retorno;
        }
        private static string GetVideosAssociados(NoticiasModelsNoSQL.NoticiasModel noticiasModel)
        {
            List<NoticiasModelsNoSQL.McVideosNoticiasModel> mcVideosNoticias = new List<NoticiasModelsNoSQL.McVideosNoticiasModel>();
            string retorno = string.Empty;

            try
            {
                var client = CommonHttpClient.Instance;
                NoticiasModelsNoSQL.McVideosNoticiasModel filter = new NoticiasModelsNoSQL.McVideosNoticiasModel();
                filter.NOTICIA_ID = noticiasModel.IdNoticia;
                string filterBody = JsonConvert.SerializeObject(filter);
                var URI = UrlBaseApi + "VideosNoticias/GetByFilter/";
                HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
                if (response.IsSuccessStatusCode)
                {
                    var mcVideosNoticiasJsonString = response.Content.ReadAsStringAsync().Result;
                    mcVideosNoticias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.McVideosNoticiasModel>>(mcVideosNoticiasJsonString);
                }

                string videos = string.Empty;
                if (mcVideosNoticias != null && mcVideosNoticias.Any())
                {
                    foreach (NoticiasModelsNoSQL.McVideosNoticiasModel vid in mcVideosNoticias)
                    {
                        videos += vid.VIDEO_ID + ",";
                    }
                    if (videos.Length > 0)
                        videos = videos.Substring(0, videos.Length - 1);//retirar a última vírgula
                }

                return videos;

            }
            catch
            {
                return null;
            }
        }
        private static string GetGaleriasAssociadas(NoticiasModelsNoSQL.NoticiasModel noticiasModel)
        {
            List<NoticiasModelsNoSQL.NoticiasGaleriasModel> noticiasGalerias = new List<NoticiasModelsNoSQL.NoticiasGaleriasModel>();
            var client = CommonHttpClient.Instance;
            NoticiasModelsNoSQL.NoticiasGaleriasModel filter = new NoticiasModelsNoSQL.NoticiasGaleriasModel();
            filter.IdNoticia = noticiasModel.IdNoticia;
            string filterBody = JsonConvert.SerializeObject(filter);
            var URI = UrlBaseApi + "NoticiasGalerias/GetByFilter/";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasGaleriasJsonString = response.Content.ReadAsStringAsync().Result;
                noticiasGalerias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.NoticiasGaleriasModel>>(noticiasGaleriasJsonString);
            }

            string galerias = string.Empty;
            if (noticiasGalerias != null && noticiasGalerias.Any())
            {
                foreach (NoticiasModelsNoSQL.NoticiasGaleriasModel gal in noticiasGalerias)
                {
                    galerias += gal.IdGaleria + ",";
                }

                if (galerias.Length > 0)
                    galerias = galerias.Substring(0, galerias.Length - 1);
            }

            return galerias;
        }
        private static string GetArquivosAssociados(NoticiasModelsNoSQL.NoticiasModel noticiasModel)
        {
            List<NoticiasModelsNoSQL.NoticiasFilesModel> noticiasFiles = new List<NoticiasModelsNoSQL.NoticiasFilesModel>();
            string retorno = string.Empty;

            try
            {
                var client = CommonHttpClient.Instance;
                NoticiasModelsNoSQL.NoticiasFilesModel filter = new NoticiasModelsNoSQL.NoticiasFilesModel();
                filter.IdNoticia = noticiasModel.IdNoticia;
                string filterBody = JsonConvert.SerializeObject(filter);
                var URI = UrlBaseApi + "NoticiasFiles/GetByFilter/";
                HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
                if (response.IsSuccessStatusCode)
                {
                    var noticiasFilesJsonString = response.Content.ReadAsStringAsync().Result;
                    noticiasFiles = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.NoticiasFilesModel>>(noticiasFilesJsonString);
                }

                string arquivos = string.Empty;
                if (noticiasFiles != null && noticiasFiles.Any())
                {
                    arquivos = string.Empty;

                    foreach (NoticiasModelsNoSQL.NoticiasFilesModel not in noticiasFiles)
                    {
                        arquivos += not.IdFile + ",";
                    }

                    if (arquivos.Length > 0)
                        arquivos = arquivos.Substring(0, arquivos.Length - 1);//retirar a última vírgula
                }

                return arquivos;
            }
            catch
            {
                return null;
            }
        }
        private static string GetSonsAssociados(NoticiasModelsNoSQL.NoticiasModel noticiasModel)
        {
            List<NoticiasModelsNoSQL.McSonsNoticiasModel> mcSonsNoticias = new List<NoticiasModelsNoSQL.McSonsNoticiasModel>();
            var client = CommonHttpClient.Instance;
            NoticiasModelsNoSQL.McSonsNoticiasModel filter = new NoticiasModelsNoSQL.McSonsNoticiasModel();
            filter.NOTICIA_ID = noticiasModel.IdNoticia;
            string filterBody = JsonConvert.SerializeObject(filter);
            var URI = UrlBaseApi + "SonsNoticias/GetByFilter/";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(filterBody, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var mcSonsNoticiasJsonString = response.Content.ReadAsStringAsync().Result;
                mcSonsNoticias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.McSonsNoticiasModel>>(mcSonsNoticiasJsonString);
            }

            string sons = string.Empty;
            if (mcSonsNoticias != null && mcSonsNoticias.Any())
            {
                foreach (NoticiasModelsNoSQL.McSonsNoticiasModel som in mcSonsNoticias)
                {
                    sons += som.SOM_ID + ",";
                }

                if (sons.Length > 0)
                    sons = sons.Substring(0, sons.Length - 1);
            }

            return sons;
        }
        private static List<NoticiasModelsNoSQL.NoticiasModel> GetNoticiasByIdsNoticia(NoticiasModelsNoSQL.IdsNoticia idsNoticia)
        {
            List<NoticiasModelsNoSQL.NoticiasModel> noticias = new List<NoticiasModelsNoSQL.NoticiasModel>();
            var client = CommonHttpClient.Instance;
            string param = JsonConvert.SerializeObject(idsNoticia);
            var URI = UrlBaseApi + "Noticias/GetNoticiasByIdsNoticia";
            HttpResponseMessage response = client.PostAsync(URI, new StringContent(param, Encoding.UTF8, "application/json")).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasJsonString = response.Content.ReadAsStringAsync().Result;
                noticias = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.NoticiasModel>>(noticiasJsonString);
            }

            return noticias;
        }
        private static NoticiasModelsNoSQL.NoticiasModel GetNoticiaByIdNoticia(int IdNoticia)
        {
            NoticiasModelsNoSQL.NoticiasModel noticia = new NoticiasModelsNoSQL.NoticiasModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Noticias/" + IdNoticia;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var noticiasJsonString = response.Content.ReadAsStringAsync().Result;
                noticia = JsonConvert.DeserializeObject<NoticiasModelsNoSQL.NoticiasModel>(noticiasJsonString);
            }

            return noticia;
        }
        private static List<NoticiasModelsNoSQL.SecoesModel> GetSecoesNoticia(int IdNoticia)
        {
            List<NoticiasModelsNoSQL.SecoesModel> secoesModels = new List<NoticiasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/GetSecoesNoticia2?idNoticia=" + IdNoticia + "&idSite=" + IdSite + "&agruparconteudo=" + sitesModel.agruparConteudo;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesNoticiaAuxJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModels = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesModel>>(secoesNoticiaAuxJsonString);
            }

            return secoesModels;
        }

        public static NoticiasModelsNoSQL.SecoesModel GetSecaoById(int IdSecao)
        {
            NoticiasModelsNoSQL.SecoesModel secao = new NoticiasModelsNoSQL.SecoesModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes/" + IdSecao;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secaoJsonString = response.Content.ReadAsStringAsync().Result;
                secao = JsonConvert.DeserializeObject<NoticiasModelsNoSQL.SecoesModel>(secaoJsonString);
            }

            return secao;
        }
        private static List<NoticiasModelsNoSQL.SecoesModel> GetAllSecoes()
        {
            List<NoticiasModelsNoSQL.SecoesModel> secoesModel = new List<NoticiasModelsNoSQL.SecoesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "Secoes";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesModel>>(secoesJsonString);
            }

            return secoesModel;
        }

        private static List<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar> GetAllSecoesCanais()
        {
            List<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar> secoesModel = new List<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "SecoesCanais/GetAll";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var secoesJsonString = response.Content.ReadAsStringAsync().Result;
                secoesModel = JsonConvert.DeserializeObject<List<NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar>>(secoesJsonString);
            }

            return secoesModel;
        }


        #endregion

        #region Utilitarios
        private static string GeraURLNoticia(NoticiasModelsNoSQL.NoticiasModel noticia, NoticiasModelsNoSQL.CidadesModel cidade)
        {
            string Extensao;
            if (noticia.IdTipoConteudo == 1)
                Extensao = "NOT";
            else if (noticia.IdTipoConteudo == 2)
                Extensao = "PUBE";
            else if (noticia.IdTipoConteudo == 3)
                Extensao = "BRND";
            else if (noticia.IdTipoConteudo == 4)
                Extensao = "BLOG";
            else
                Extensao = "NOT";

            string url = Extensao + ",{0},{1},{2},{3}.aspx";

            int idCidade = 0, idRegiao = 0;

            if (cidade != null)
            {
                idCidade = cidade.IdCidade;
                idRegiao = cidade.IdRegiao ?? 0;
            }
            url = string.Format(url, idRegiao, idCidade, noticia.IdNoticia, GeraURL(string.IsNullOrEmpty(noticia.Url) ? noticia.Manchete : noticia.Url));
            return url;
        }
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
        public static string ReplaceNonPrintableCaracteres(string texto, string replaceWith)
        {
            StringBuilder resultado = new StringBuilder();

            for (int i = 0; i < texto.Length; i++)
            {
                char c = texto[i];
                byte b = (byte)c;

                if (b < 32)
                {
                    resultado.Append(replaceWith);
                }
                else
                {
                    resultado.Append(c);
                }
            }

            return resultado.ToString();
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

        /// <summary>
        /// Remove diacríticos.
        /// [Na ortografia do português, são diacríticos os acentos gráficos, a cedilha, o trema e o til.]
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        static string RemoveDiacritics(string text)
        {
            return string.Concat(text.Normalize(NormalizationForm.FormD).Where(ch => CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark)).Normalize(NormalizationForm.FormC);
        }

        #endregion

        #region Métodos utilizados em UserControls

        public string ObtemNoticiasPorSecaoPaginadaNoSQL(int IdSecao, int Quantidade, int? IdSite = null)
        {
            NoticiasNoSQLController noticiasNoSQLController = new NoticiasNoSQLController(true);
            var listaIdsNoticias = noticiasNoSQLController.GetIdsNoticiasByIdSecaoNoSQLSincrono(IdSecao, Convert.ToInt32(IdSite)).OrderByDescending(a => a.publicacao).ToList();

            string imagem;
            StringBuilder html = new StringBuilder();

            if (listaIdsNoticias != null && listaIdsNoticias.Any())
            {
                foreach (var item in listaIdsNoticias.Take(Quantidade))
                {
                    var noticia = GetNoticiaByIdNoSQL(item.idnoticia).Result;

                    if (noticia != null)
                    {
                        #region Recuperando a imagem

                        if (noticia.imagens != null && noticia.imagens.Count() > 0)
                            imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, noticia.imagens.Where(a => a.Tipo == "fotomanchete").Count() > 0 ? noticia.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);
                        else
                            imagem = string.Empty;

                        #endregion

                        #region HTML

                        var url = noticia.urlCompleta;

                        html.Append("<li class='cbnrb2020-single-todays-post my-5 audio'>");
                        html.Append("<div class='todays-post-content'>");

                        html.Append("<figure class='todays-post-thumb bg-gray-imgfx float-left mr-3 '>");
                        html.AppendFormat("<img class='img-fluid' src='{0}' alt='{1}' title='{1}'>", imagem, noticia.manchete);
                        html.Append("</figure>");

                        html.Append("<div class='d-flex align-items-center mb-1 mb-md-3'>");
                        html.Append("<div class='cbnrb2020-post-tag antetitulo mr-2'><span class='tagspan m-0'>" + noticia.assunto + "</span>");
                        html.Append("</div>");

                        html.Append("<div class='icones-player action sbs my-0 p-0'>");
                        html.Append("<a href='javascript:void(0)' class='play-ondemand my-0 p-0' onclick='alterarPlay(" + noticia.idnoticia + ")' " +
                            "aria-label='Escutar notícia' data-id='" + noticia.idnoticia + "' data-qualificador='" + noticia.assunto + "' data-categoria='Podcast' data-programas='Jornal da CBN' " +
                            "data-quadros='" + noticia.assunto + "' data-titulo='" + noticia.manchete + "' data-audioduracao='00:25:59' " +
                            "data-caminho='3/2020/09/14/315372_20200914' data-dtcriacao='" + noticia.publicacao + "' data-dtpublicacao='" + noticia.publicacao + "' " +
                            "data-url='" + url + "' data-adunit='tudoep' " +
                            "data-ctarget=''>" +
                            "<i class='bi bi-play-circle color text-dark fa-lg'></i></a>");
                        html.Append("</div>");
                        html.Append("</div>");

                        html.Append("<h3 class='destaque'>");
                        html.Append("<a href='" + url + "'>" + noticia.manchete + "</a>");
                        html.Append("</h3>");
                        html.Append("<p class='subtitulo text-justify'>" + noticia.destaque + "</p>");

                        html.Append("</div>");
                        html.Append("</li>");

                        #endregion
                    }
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
    }
}