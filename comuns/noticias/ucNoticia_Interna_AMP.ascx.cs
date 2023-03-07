using CMS.MidiaCenter.Model;
using CMS.Noticia.Model.Extensions;
using FrameworkExtension.Utils;
using HtmlAgilityPack;
using HtmlToAMPHelper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApi.ArquivosAssociadosNoSQLController.Controllers;
using WebApi.MidiaCenterNoSQL.Sons.Controllers;
using WebApi.MidiaCenterNoSQL.Videos.Controllers;
using WebApi.NoticiaNoSQL.Controllers;

namespace CMS.Web.FrontEnd.TemplatesV55.Comuns.Noticias
{
    public partial class ucNoticia_Interna_AMP : System.Web.UI.UserControl
    {
        //-> ativa Modulo CXENSE
        public bool ativarModuloCXENSE = false;
        public string linkBloqueio;
        //-> ativa Modulo Audima
        public bool ativarModuloAudima = false;
        //-> ativa Modulo TABULA
        public bool ativarModuloTABULA = false;
        //-> ativa Módulo Twitter
        public bool ativarContaTwitter = false;
        //-> ativa Módulo Facebook
        public bool ativarContaFacebook = false;
        //-> ativa Módulo GPlus
        public bool ativarGPlus = false;
        public string IDNoticia { get; set; }
        public int idnoticia { get; set; }
        public int IDSite { get; set; }
        public string SiteName { get; set; }
        public string UrlLogoSite { get; set; }

        public string URLSite { get; set; }

        private string dominio;
        public string Base { get; set; }
        public string Editoria { get; set; }
        public string Diretorio { get; set; }
        public string SaibaMais { get; set; }
        public bool? Especial { get; set; }
        public string ImagemNoticia { get; set; }
        public string ImagemNoticiaUrl { get; set; }
        public string TituloPagina { get; set; }
        public string TituloNoticia { get; set; }
        public string LinhafinaNoticia { get; set; }
        public string MetaKeywords { get; set; }
        public string ConteudoNoticia { get; set; }
        public string ConteudoArquivos { get; set; }
        public string ConteudoVideos { get; set; }
        public string ConteudoGalerias { get; set; }
        public string ConteudoPodcasts { get; set; }
        public string DataPublicacaoNoticia { get; set; }
        public string DataExpiracaoNoticia { get; set; }
        public string DataPublicacaoNoticiaFormatada { get; set; }
        public string DataAtualizacaoNoticia { get; set; }
        public string FonteNoticia { get; set; }
        public string CreditoNoticia { get; set; }
        public string DestinoCredito { get; set; }
        public int NivelRestricao { get; set; }
        public string TipoMidiaEmbed { get; set; }
        public string TitComentario { get; set; }
        public bool checkFace = false;
        public bool check = false;

        public string UA { get; set; }

        private static NoticiasModelsNoSQL.NoticiasBsonModel noticiaBsonModel = new NoticiasModelsNoSQL.NoticiasBsonModel();

        private static CMS.Noticia.Model.NoticiasModel noticiaHTMLModel = new CMS.Noticia.Model.NoticiasModel();

        public string DFP_Rede { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            noticiaHTMLModel = null;
            noticiaBsonModel = null;
            CheckConnectionController checkConnectionController = new CheckConnectionController();

            try
            {
                if (String.IsNullOrEmpty(IDNoticia))
                {
                    if (Request.QueryString.Count > 0 && Request.QueryString["idnoticia"].Contains(","))
                        IDNoticia = Request.QueryString["idnoticia"].Split(',')[1];
                    else
                    {
                        IDNoticia = Request.QueryString["idnoticia"];
                        idnoticia = NumericHelper.GetInt(IDNoticia);
                    }

                    if (idnoticia > 0)
                    {
                        if (checkConnectionController.TestConnectionNoSQL())
                        {
                            noticiaBsonModel = new NoticiasNoSQLController(true).GetNoticiaByIdNoSQL(idnoticia).Result;
                            if (noticiaBsonModel != null && noticiaBsonModel.idnoticia > 0)
                            {
                                NivelRestricao = noticiaBsonModel.nivelrestricao;
                                Application["NivelRestricao"] = NivelRestricao;
                            }
                            else
                            {
                                if (checkConnectionController.TestConnection())
                                {
                                    CMS.Noticia.Front.BLL.NoticiasBLL noticiasBLL = new Noticia.Front.BLL.NoticiasBLL();
                                    noticiaHTMLModel = noticiasBLL.GetById(idnoticia);
                                    NivelRestricao = noticiaHTMLModel != null ? noticiaHTMLModel.nivelRestricao : 0;
                                    Application["NivelRestricao"] = NivelRestricao;
                                }
                                else
                                {
                                    Response.Redirect("/404.aspx", true);
                                }
                            }
                        }
                        else
                        {
                            if (checkConnectionController.TestConnection())
                            {
                                CMS.Noticia.Front.BLL.NoticiasBLL noticiasBLL = new Noticia.Front.BLL.NoticiasBLL();
                                noticiaHTMLModel = noticiasBLL.GetById(idnoticia);
                                NivelRestricao = noticiaHTMLModel != null ? noticiaHTMLModel.nivelRestricao : 0;
                                Application["NivelRestricao"] = NivelRestricao;
                            }
                            else
                            {
                                Response.Redirect("/404.aspx", true);
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("/404.aspx", true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ativarModuloCXENSE = ConfigurationManager.AppSettings["ativarModuloCXENSE"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloCXENSE"]) : false;
                ativarModuloTABULA = ConfigurationManager.AppSettings["ativarModuloTABULA"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloTABULA"]) : false;
                ativarModuloAudima = ConfigurationManager.AppSettings["ativarModuloAudima"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloAudima"]) : false;
                linkBloqueio = ConfigurationManager.AppSettings["linkBloqueio"] !=null ? ConfigurationManager.AppSettings["linkBloqueio"].ToLower() : string.Empty;
                ativarContaTwitter = ConfigurationManager.AppSettings["ativarContaTwitter"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaTwitter"]) : false;
                ativarContaFacebook = ConfigurationManager.AppSettings["ativarContaFacebook"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaFacebook"]) : false;
                ativarGPlus = ConfigurationManager.AppSettings["ativarGPlus"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarGPlus"]) : false;
                UA = ConfigurationManager.AppSettings["uaAnalytics"] ?? string.Empty;
                DFP_Rede = ConfigurationManager.AppSettings["DFP_Rede"] ?? string.Empty;

                try
                {
                    if (IDSite <= 0)
                        IDSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
                    dominio = ConfigurationManager.AppSettings["SiteUrl"].ToString();

                    if (String.IsNullOrEmpty(Editoria))
                        Editoria = "Notícias";

                    if (idnoticia <= 0)
                        idnoticia = NumericHelper.GetInt(IDNoticia);

                    if (idnoticia > 0)
                    {
                        IDNoticia = idnoticia.ToString();

                        HttpCookie cookie = HttpContext.Current.Request.Cookies["LoginPaywall"];
                        if (cookie != null)
                            cookie["urlconteudorestrito"] = Request.RawUrl;

                        #region Carregar conteúdo a partir do NoSQL MongoDB

                        CarregarConteudoNoSQL();

                        #endregion

                        #region Carregar conteúdo a partir do Banco relacional

                        CarregarConteudoBD();

                        #endregion

                        #region Geração meta tags, meta descriptions, metas CXEnse

                        GeracaoMetas();

                        #endregion

                        if (NivelRestricao != 0)
                        {
                            if (HttpContext.Current.Cache[IDNoticia] == null)
                            {
                                HttpRuntime.Cache.Insert(IDNoticia, ConteudoNoticia + ConteudoArquivos + ConteudoVideos + ConteudoPodcasts);
                                ConteudoNoticia = string.Empty;
                                ConteudoArquivos = string.Empty;
                                ConteudoVideos = string.Empty;
                                ConteudoPodcasts = string.Empty;
                            }
                            else
                            {
                                ConteudoNoticia = string.Empty;
                                ConteudoArquivos = string.Empty;
                                ConteudoVideos = string.Empty;
                                ConteudoPodcasts = string.Empty;
                            }
                        }
                        HttpContext.Current.Response.Cookies.Add(new HttpCookie("NivelRestricao", NivelRestricao.ToString()));
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("/404.aspx", true);
                }
            }
        }

        #region Métodos referentes ao MONGO
        private void CarregarConteudoNoSQL()
        {
            try
            {
                if (noticiaBsonModel == null || noticiaBsonModel.idnoticia <= 0)
                    ConteudoNoticia = string.Empty;
                else
                {
                    // verifica se a data de publicação é válida
                    if (Convert.ToDateTime(noticiaBsonModel.publicacao) > DateTime.Now)
                        Response.Redirect("/404.aspx", true);

                    // verifica se a notícia é ativa/inativa
                    if (!noticiaBsonModel.ativo)
                        Response.Redirect("/404.aspx", true);

                    // verifica se pertence ao site corrente
                    if (!noticiaBsonModel.idsites.Split(',').Any(a => Convert.ToInt32(a) == IDSite))
                        Response.Redirect("/404.aspx", true);

                    ConteudoNoticia = noticiaBsonModel.textonoticia.Replace("<div>&nbsp;</div>", "");

                    TituloNoticia = noticiaBsonModel.manchete;
                    LinhafinaNoticia = noticiaBsonModel.destaque;
                    ImagemNoticia = ClassNegocio.GetImgNoticiaInterna(ConteudoNoticia, noticiaBsonModel.imagens.Any() ? noticiaBsonModel.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);
                    ImagemNoticiaUrl = ClassNegocio.GetUrlImg(ConteudoNoticia);
                    DataPublicacaoNoticia = noticiaBsonModel.publicacao.ToString();
                    DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacaoNoticia) ? (DateTime?)DateTime.Parse(DataPublicacaoNoticia) : null;

                    if (dtBanco != null)
                        DataPublicacaoNoticiaFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);

                    DataExpiracaoNoticia = noticiaBsonModel.expiracao.ToString();
                    DataAtualizacaoNoticia = noticiaBsonModel.atualizacao.ToString();
                    MetaKeywords = noticiaBsonModel.tags;
                    FonteNoticia = noticiaBsonModel.fonte;
                    CreditoNoticia = noticiaBsonModel.credito;
                    TipoMidiaEmbed = noticiaBsonModel.tipomidiaembed.ToString();
                    NivelRestricao = noticiaBsonModel.nivelrestricao;
                    check = (bool)noticiaBsonModel.contemcomentarios;
                    checkFace = (bool)noticiaBsonModel.contemcomentariofacebook;
                    ConteudoArquivos = CarregarArquivosAssociadosNoSQL(noticiaBsonModel);
                    ConteudoVideos = CarregarVideosNoSQL(noticiaBsonModel);
                    ConteudoPodcasts = CarregarSonsNoSQL(noticiaBsonModel);
                    DestinoCredito = string.IsNullOrWhiteSpace(noticiaBsonModel.destinocredito) ? URLSite : noticiaBsonModel.destinocredito;
                }
            }
            catch (Exception)
            {
                ConteudoNoticia = string.Empty;
            }
        }
        private string CarregarArquivosAssociadosNoSQL(NoticiasModelsNoSQL.NoticiasBsonModel noticiasBsonModel)
        {
            StringBuilder stringBuilderArquivos = new StringBuilder();
            string eMC_Arquivos = ConfigurationManager.AppSettings["EMC_Arquivos"] != null ? ConfigurationManager.AppSettings["EMC_Arquivos"].ToString() : null;
            try
            {
                var files = GetNoticiasFilesNoSQL(noticiasBsonModel.arquivos);
                if (files != null && files.Count > 0)
                {
                    stringBuilderArquivos.AppendLine("<hr class='my-2' />");
                    stringBuilderArquivos.AppendLine("<div class='arquivos'>");
                    foreach (var file in files)
                    {
                        var descricao = !string.IsNullOrWhiteSpace(file.Descricao) ? file.Descricao : "descrição do arquivo não informada.";
                        stringBuilderArquivos.AppendLine(string.Format("<a href='{0}' class='btn-baixar-pdf btn btn-outline-dark btn-lg px-5 d-table mx-auto mt-4 mb-4 bg-gray2 text-normalcase'><i class='far fa-file-pdf fa-lg'></i>&nbsp;{1}</a>", eMC_Arquivos + file.Caminho, descricao));
                    }
                    stringBuilderArquivos.AppendLine("<br />");
                    stringBuilderArquivos.AppendLine("</div>");
                }
                else
                {
                    return string.Empty;
                }

                return stringBuilderArquivos.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
        public List<NoticiasFilesModelCustom> GetNoticiasFilesNoSQL(string files)
        {
            var uploadFolders = new ArquivosAssociadosNoSQLController(true).GetUploadFolderByIdSiteNoSQL(IDSite).Result.caminhoRelativo;

            try
            {
                if (string.IsNullOrWhiteSpace(files))
                    throw new Exception("Necessário informar o parâmetro files do tipo string.");

                List<NoticiasFilesModelCustom> listaNoticiasFiles = new List<NoticiasFilesModelCustom>();

                for (int i = 0; i < files.Split(',').Length; i++)
                {
                    int idfile = Convert.ToInt32(files.Split(',')[i]);
                    ArquivosAssociadosModelsNoSQL.UploadFilesModel uploadFilesModel = new ArquivosAssociadosModelsNoSQL.UploadFilesModel();
                    uploadFilesModel = new ArquivosAssociadosNoSQLController(true).GetUploadFileByIdFileNoSQL(idfile).Result;

                    if (uploadFilesModel == null)
                        continue;

                    listaNoticiasFiles.Add(new NoticiasFilesModelCustom { Descricao = uploadFilesModel.descricao, Caminho = uploadFolders + uploadFilesModel.filename });
                }

                return listaNoticiasFiles;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string CarregarVideosNoSQL(NoticiasModelsNoSQL.NoticiasBsonModel noticiasBsonModel)
        {
            StringBuilder TagVideo = new StringBuilder();
            try
            {
                var videos = GetNoticiasVideosNoSQL(noticiasBsonModel.videos);

                if (videos != null && videos.Count > 0)
                {
                    TagVideo.AppendLine("<hr class='my-2' />");
                    TagVideo.AppendLine("<div class='videos'>");
                    foreach (var video in videos)
                    {
                        var videolink = ConfigurationManager.AppSettings["EMC_Videos"] != null ? ConfigurationManager.AppSettings["EMC_Videos"].ToString() + "/" : null;
                        string idVideo = video.idvideo.ToString();
                        string UrlVideo = videolink + video.subpasta + video.arquivo;
                        string UrlThumb = videolink + video.subpasta + video.thumb + "_1.jpg";
                        UrlThumb = UrlThumb.Replace("\\", "/");
                        UrlVideo = UrlVideo.Replace("\\", "/");
                        TagVideo.AppendLine(String.Format("<video controls='' id='content_video_{0}' class='video-js vjs-default-skin video-interna' preload='none' playsinline='playsinline' tabindex='-1' poster='{1}' width='640' height='360'><source src='{2}' type='video/mp4'></video>", idVideo, UrlThumb, UrlVideo));
                        TagVideo.AppendLine("<hr class='my-2' />");
                    }
                    TagVideo.AppendLine("<br />");
                    TagVideo.AppendLine("</div>");
                }
                else
                    return string.Empty;

                return TagVideo.ToString();
            }

            catch (Exception)
            {
                return string.Empty;
            }
        }
        private string CarregarSonsNoSQL(NoticiasModelsNoSQL.NoticiasBsonModel noticiasBsonModel)
        {
            StringBuilder TagAudio = new StringBuilder();
            try
            {
                var sons = GetNoticiasSonsNoSQL(noticiasBsonModel.sons);

                if (sons != null && sons.Count > 0)
                {
                    TagAudio.AppendLine("<hr class='my-2' />");
                    TagAudio.AppendLine("<div class='podcasts'>");
                    foreach (var som in sons)
                    {
                        var somlink = ConfigurationManager.AppSettings["EMC_Sons"] != null ? ConfigurationManager.AppSettings["EMC_Sons"].ToString() + "/" : null;
                        string UrlSom = somlink + som.subpasta + som.arquivo;
                        string AssuntoSom = som.assunto;
                        string TituloSom = som.manchete;
                        string LinhaFinaSom = som.destaque;
                        string DuracaoSom = som.duracao;
                        TagAudio.AppendLine("<audio controls='' preload='auto'> <source src='" + UrlSom + "' type='audio/mpeg'></audio>");
                    }
                    TagAudio.AppendLine("<br />");
                    TagAudio.AppendLine("</div>");
                }
                else
                {
                    return string.Empty;
                }
                return TagAudio.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
        public List<SonsModelsNoSQL.SonsBsonModel> GetNoticiasSonsNoSQL(string files)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(files))
                    throw new Exception("Necessário informar o parâmetro files do tipo string.");

                List<SonsModelsNoSQL.SonsBsonModel> listaSons = new List<SonsModelsNoSQL.SonsBsonModel>();

                for (int i = 0; i < files.Split(',').Length; i++)
                {
                    int idvideo = Convert.ToInt32(files.Split(',')[i]);
                    SonsModelsNoSQL.SonsBsonModel sonsBsonModel = new SonsModelsNoSQL.SonsBsonModel();
                    sonsBsonModel = new SonsNoSQLController(true).GetSomByIdNoSQL(idvideo).Result;

                    if (sonsBsonModel == null)
                        continue;

                    listaSons.Add(sonsBsonModel);
                }

                return listaSons;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<VideosModelsNoSQL.VideosBsonModel> GetNoticiasVideosNoSQL(string files)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(files))
                    throw new Exception("Necessário informar o parâmetro files do tipo string.");

                List<VideosModelsNoSQL.VideosBsonModel> listaVideos = new List<VideosModelsNoSQL.VideosBsonModel>();

                for (int i = 0; i < files.Split(',').Length; i++)
                {
                    int idvideo = Convert.ToInt32(files.Split(',')[i]);
                    VideosModelsNoSQL.VideosBsonModel videosBsonModel = new VideosModelsNoSQL.VideosBsonModel();
                    videosBsonModel = new VideosNoSQLController(true).GetVideoByIdNoSQL(idvideo).Result;

                    if (videosBsonModel == null)
                        continue;

                    listaVideos.Add(videosBsonModel);
                }

                return listaVideos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Métodos referentes ao MSSQL
        private void CarregarConteudoBD()
        {
            if (noticiaBsonModel == null)
            {
                if (noticiaHTMLModel != null && noticiaHTMLModel.idNoticia > 0)
                {
                    // verifica se a notícia é ativa/inativa
                    if (noticiaHTMLModel.ativo != null && !(bool)noticiaHTMLModel.ativo)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se pertence ao site corrente
                    if (!noticiaHTMLModel.tbNoticias_Secoes_Sites.Any(a => a.idSite == IDSite))
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se a data de publicação é válida
                    if (Convert.ToDateTime(noticiaHTMLModel.dtPublicacao) > DateTime.Now)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    if (noticiaHTMLModel.noticia != null)
                    {
                        ConteudoNoticia = noticiaHTMLModel.noticia.Replace("<div>&nbsp;</div>", "");
                    }

                    if (ConteudoNoticia != null)
                    {
                        if (noticiaHTMLModel != null)
                        {
                            TituloNoticia = noticiaHTMLModel.manchete;
                            LinhafinaNoticia = noticiaHTMLModel.destaque;
                        }
                        else
                        {
                            TituloNoticia = noticiaHTMLModel.manchete;
                            var inicioLinhaFina = noticiaHTMLModel.destaque.IndexOf(" - ");
                            LinhafinaNoticia = noticiaHTMLModel.destaque.Substring(inicioLinhaFina + 3, noticiaHTMLModel.destaque.Length - noticiaHTMLModel.destaque.IndexOf(" - ") - 3);
                        }

                        if (noticiaHTMLModel.idImagemManchete != null)
                        {
                            // Atenção !!! nesta chamada "new NoticiasNoSQLController().GetFotoManchete ..." não passar nenhum parametro no construtor, pois queremos que o site seja retornado do MSSQL.
                            // porque essa notícia não foi encontrada no mongo ou porque o mongo está down.
                            var fotomanchete = new NoticiasNoSQLController().GetFotoManchete(new NoticiasModelsNoSQL.NoticiasModel { IdImagemManchete = noticiaHTMLModel.idImagemManchete });
                            ImagemNoticia = ClassNegocio.GetImgNoticiaInterna(ConteudoNoticia, fotomanchete.Arquivo);
                            ImagemNoticiaUrl = ImagemNoticiaUrl = ClassNegocio.GetUrlImg(ConteudoNoticia);
                        }
                        else
                        {
                            ImagemNoticia = ClassNegocio.GetImgNoticiaInterna(ConteudoNoticia, string.Empty);
                            ImagemNoticiaUrl = ImagemNoticiaUrl = ClassNegocio.GetUrlImg(ConteudoNoticia);
                        }

                        DataPublicacaoNoticia = noticiaHTMLModel.dtPublicacao.ToString();
                        DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacaoNoticia) ? (DateTime?)DateTime.Parse(DataPublicacaoNoticia) : null;
                        if (dtBanco != null)
                            DataPublicacaoNoticiaFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);
                        DataExpiracaoNoticia = noticiaHTMLModel.dtExpiracao.ToString();
                        DataAtualizacaoNoticia = noticiaHTMLModel.dtAtualizacao.ToString();
                        MetaKeywords = noticiaHTMLModel.tags;
                        FonteNoticia = noticiaHTMLModel.fonte;
                        CreditoNoticia = noticiaHTMLModel.credito;
                        TipoMidiaEmbed = noticiaHTMLModel.tipoMidiaEmbed.ToString();
                        NivelRestricao = noticiaHTMLModel.nivelRestricao;
                        ConteudoArquivos = CarregarArquivosAssociados(idnoticia);
                        ConteudoVideos = CarregarVideos(idnoticia);
                        ConteudoPodcasts = CarregarPodcasts(idnoticia);
                        DestinoCredito = string.IsNullOrWhiteSpace(noticiaHTMLModel.destinoCredito) ? URLSite : noticiaBsonModel.destinocredito;

                        if (noticiaHTMLModel != null)
                        {
                            check = noticiaHTMLModel.contemcomentario != null ? (bool)noticiaHTMLModel.contemcomentario : false;
                            checkFace = noticiaHTMLModel.contemcomentarioFacebook != null ? (bool)noticiaHTMLModel.contemcomentarioFacebook : false;
                        }
                        else
                        {
                            check = false;
                            checkFace = false;
                        }
                    }
                }
                else
                {
                    Response.Redirect("/404.aspx", true);
                }
            }
        }
        private string CarregarArquivosAssociados(int IdNoticia)
        {
            StringBuilder stringBuilderArquivos = new StringBuilder();
            string eMC_Arquivos = ConfigurationManager.AppSettings["EMC_Arquivos"] != null ? ConfigurationManager.AppSettings["EMC_Arquivos"].ToString() : null;
            try
            {
                var files = GetNoticiasFilesModels(IdNoticia);
                if (files != null && files.Count > 0)
                {
                    stringBuilderArquivos.AppendLine("<hr class='my-2' />");
                    stringBuilderArquivos.AppendLine("<div class='arquivos'>");
                    foreach (var file in files)
                    {
                        stringBuilderArquivos.AppendLine(string.Format("<a href='{0}' class='btn-baixar-pdf btn btn-outline-dark btn-lg px-5 d-table mx-auto mt-4 mb-4 bg-gray2 text-normalcase'><i class='far fa-file-pdf fa-lg'></i>&nbsp;{1}</a>", eMC_Arquivos + file.Caminho, file.Descricao));
                    }
                    stringBuilderArquivos.AppendLine("<br />");
                    stringBuilderArquivos.AppendLine("</div>");
                }
                return stringBuilderArquivos.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
        public List<NoticiasFilesModelCustom> GetNoticiasFilesModels(int IdNoticia)
        {
            try
            {
                if (IdNoticia <= 0)
                    throw new Exception("Necessário informar o parâmetro IdNoticia.");
                List<NoticiasFilesModelCustom> listaNoticiasFiles = null;
                using (var client = new HttpClient())
                {
                    var URI = ConfigurationManager.AppSettings["urlBaseAPI"].ToString() + "NoticiasFiles/GetByFilterCustom?IdNoticia=" + IdNoticia;

                    // Add an Accept header for JSON format.
                    TimeSpan timespan = new TimeSpan(0, 15, 0);
                    client.Timeout = timespan;
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage response = client.GetAsync(URI).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        var noticiasFilesModeJsonString = response.Content.ReadAsStringAsync().Result;
                        listaNoticiasFiles = JsonConvert.DeserializeObject<List<NoticiasFilesModelCustom>>(noticiasFilesModeJsonString);
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
                return listaNoticiasFiles;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string CarregarVideos(int idnoticia)
        {
            StringBuilder TagVideo = new StringBuilder();
            try
            {
                var videos = GetVideosNoticiaByFilter(new McVideosNoticiasModel { NOTICIA_ID = idnoticia });
                CMS.MidiaCenter.Front.BLL.McVideosBLL mcVideosBLL = new CMS.MidiaCenter.Front.BLL.McVideosBLL();
                if (videos != null && videos.Count > 0)
                {
                    TagVideo.AppendLine("<hr class='my-2' />");
                    TagVideo.AppendLine("<div class='videos'>");
                    foreach (var video in videos)
                    {
                        var mcVideosModel = mcVideosBLL.GetById(video.VIDEO_ID);

                        if (mcVideosModel != null && mcVideosModel.VIDEO_ID > 0)
                        {
                            var videolink = ConfigurationManager.AppSettings["EMC_Videos"] != null ? ConfigurationManager.AppSettings["EMC_Videos"].ToString() + "/" : null;
                            string idVideo = mcVideosModel.VIDEO_ID.ToString();
                            string UrlVideo = videolink + mcVideosModel.VIDEO_SUBPASTA + mcVideosModel.VIDEO_ARQUIVO;
                            string UrlThumb = videolink + mcVideosModel.VIDEO_SUBPASTA + mcVideosModel.VIDEO_THUMBNAIL + "_1.jpg";
                            UrlThumb = UrlThumb.Replace("\\", "/");
                            TagVideo.AppendLine(String.Format("<video controls='' id='content_video_{0}' class='video-js vjs-default-skin video-interna' preload='none' playsinline='playsinline' tabindex='-1' poster='{1}' width='640' height='360'><source src='{2}' type='video/mp4'></video>", idVideo, UrlThumb, UrlVideo));
                            TagVideo.AppendLine("<hr class='my-2' />");
                        }
                        else
                        {
                            return string.Empty;
                        }
                    }
                    TagVideo.AppendLine("<br />");
                    TagVideo.AppendLine("</div>");
                }
                return TagVideo.ToString();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<McVideosNoticiasModel> GetVideosNoticiaByFilter(McVideosNoticiasModel filter)
        {
            try
            {
                if (filter == null)
                    throw new Exception("O filtro deve ser informado.");
                List<McVideosNoticiasModel> mcVideosNoticiasModel = null;
                using (var client = new HttpClient())
                {
                    var URI = ConfigurationManager.AppSettings["urlBaseAPI"].ToString() + "VideosNoticias/GetByFilter";
                    // Add an Accept header for JSON format.
                    TimeSpan timespan = new TimeSpan(0, 15, 0);
                    client.Timeout = timespan;
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // content é o objeto que vai no Body do POST 
                    StringContent content = new StringContent(JsonConvert.SerializeObject(filter), Encoding.UTF8, "application/json");
                    // chama o método GetByFilter passando o content no Body
                    HttpResponseMessage response = client.PostAsync(URI, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        var McVideosNoticiasModeJsonString = response.Content.ReadAsStringAsync().Result;
                        mcVideosNoticiasModel = JsonConvert.DeserializeObject<List<McVideosNoticiasModel>>(McVideosNoticiasModeJsonString);
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
                return mcVideosNoticiasModel;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string CarregarPodcasts(int idnoticia)
        {
            StringBuilder TagAudio = new StringBuilder();
            try
            {
                var sons = GetSonsNoticiaByFilter(new McSonsNoticiasModel { NOTICIA_ID = idnoticia });
                CMS.MidiaCenter.Front.BLL.McSonsBLL mcSonsBLL = new CMS.MidiaCenter.Front.BLL.McSonsBLL();
                if (sons != null && sons.Count > 0)
                {
                    TagAudio.AppendLine("<hr class='my-2' />");
                    TagAudio.AppendLine("<div class='podcasts'>");
                    foreach (var som in sons)
                    {
                        var mcSonsModel = mcSonsBLL.GetById(som.SOM_ID);
                        if (mcSonsModel != null && mcSonsModel.SOM_ID > 0)
                        {
                            var somlink = ConfigurationManager.AppSettings["EMC_Sons"] != null ? ConfigurationManager.AppSettings["EMC_Sons"].ToString() + "/" : null;
                            string UrlSom = somlink + mcSonsModel.SOM_SUBPASTA + mcSonsModel.SOM_ARQUIVO;
                            string AssuntoSom = mcSonsModel.SOM_CHAPEU;
                            string TituloSom = mcSonsModel.SOM_MANCHETE;
                            string LinhaFinaSom = mcSonsModel.SOM_DESTAQUE;
                            string DuracaoSom = mcSonsModel.SOM_DURACAO;
                            TagAudio.AppendLine("<audio controls='' preload='auto'> <source src='" + UrlSom + "' type='audio/mpeg'></audio>");
                        }
                        else
                        {
                            return string.Empty;
                        }
                    }
                    TagAudio.AppendLine("<br />");
                    TagAudio.AppendLine("</div>");
                }
                else
                {
                    return string.Empty;
                }
                return TagAudio.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<McSonsNoticiasModel> GetSonsNoticiaByFilter(McSonsNoticiasModel filter)
        {
            try
            {
                if (filter == null)
                    throw new Exception("O filtro deve ser informado.");

                List<McSonsNoticiasModel> mcSonsNoticiasModel = null;

                using (var client = new HttpClient())
                {
                    var URI = ConfigurationManager.AppSettings["urlBaseAPI"].ToString() + "SonsNoticias/GetByFilter";

                    // Add an Accept header for JSON format.
                    TimeSpan timespan = new TimeSpan(0, 15, 0);
                    client.Timeout = timespan;
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // content é o objeto que vai no Body do POST 
                    StringContent content = new StringContent(JsonConvert.SerializeObject(filter), Encoding.UTF8, "application/json");
                    // chama o método GetByFilter passando o content no Body
                    HttpResponseMessage response = client.PostAsync(URI, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        var McSonsNoticiasModeJsonString = response.Content.ReadAsStringAsync().Result;
                        mcSonsNoticiasModel = JsonConvert.DeserializeObject<List<McSonsNoticiasModel>>(McSonsNoticiasModeJsonString);
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
                return mcSonsNoticiasModel;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
        private void GeracaoMetas()
        {
            if (!String.IsNullOrEmpty(ConteudoNoticia) && !ConteudoNoticia.Contains("Olá internauta!"))
            {
                // Gera Meta Tags
                if (String.IsNullOrEmpty(SiteName))
                    SiteName = ConfigurationManager.AppSettings["SiteName"].ToString();
                URLSite = ConfigurationManager.AppSettings["SiteUrl"];
                string ImagemPadrao = ConfigurationManager.AppSettings["ImagemPadrao"];
                UrlLogoSite = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() + ConfigurationManager.AppSettings["urlLogoSite"] : string.Empty;

                TituloPagina = TituloNoticia.Trim() + " - " + SiteName;
                ClassNegocio.GeraTags(Page, "meta", "meta_title", new string[,] { { "name", "title" }, { "content", TituloPagina } });
                this.Parent.Page.Title = TituloPagina;

                if (String.IsNullOrEmpty(LinhafinaNoticia))
                {
                    ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", "Maior portal de conteúdo e noticias do interior do estado de São Paulo. Fique informado sobre tudo o que acontece na sua cidade, no Brasil e no mundo. Notícias sobre cotidiano, cultura, esporte, economia, entretenimento, política e outros conteúdos." } });
                }
                else
                {
                    ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", LinhafinaNoticia } });
                }
                this.Parent.Page.MetaDescription = LinhafinaNoticia;

                MetaKeywords = MetaKeywords.Replace("em, ", "").Replace("na, ", "").Replace("no, ", "").Replace("da, ", "").Replace("de, ", "").Replace("do, ", "");
                if (String.IsNullOrEmpty(MetaKeywords))
                {
                    ClassNegocio.GeraTags(Page, "meta", "keywords", new string[,] { { "name", "keywords" }, { "content", "portal, site, notícias, cotidiano, cultura, esporte, economia, entretenimento, política, videos, fotos" } });
                }
                else
                {
                    ClassNegocio.GeraTags(Page, "meta", "keywords", new string[,] { { "name", "keywords" }, { "content", MetaKeywords } });
                }
                this.Parent.Page.MetaKeywords = MetaKeywords;

                // Gera meta Tag da imagem padrão do site
                //ClassNegocio.GeraTags(Page, "link", "url_canonical", new string[,] { { "rel", "canonical" }, { "href", dominio + this.Request.RawUrl.ToString() } });
                ClassNegocio.GeraTags(Page, "link", "link_imagem", new string[,] { { "rel", "image_src" }, { "content", ImagemNoticia } });
                ClassNegocio.GeraTags(Page, "link", "url_icon", new string[,] { { "rel", "icon" }, { "href", "/favicon.ico" } });

                //--> ADICIONA META TAGS DO FACEBOOK, TWITTER E OUTRAS NO HEAD DA PÁGINA
                if (ativarContaFacebook)
                {
                    string UrlPaginaFacebook = ConfigurationManager.AppSettings["urlPaginaFacebook"];
                    ClassNegocio.GeraTags(Page, "meta", "og_site_name", new string[,] { { "property", "og:site_name" }, { "content", SiteName } });
                    ClassNegocio.GeraTags(Page, "meta", "og_title", new string[,] { { "property", "og:title" }, { "content", this.Page.Title.Trim() } });
                    ClassNegocio.GeraTags(Page, "meta", "og_description", new string[,] { { "property", "og:description" }, { "content", this.Page.MetaDescription.Trim() } });
                    ClassNegocio.GeraTags(Page, "meta", "og_type", new string[,] { { "property", "og:type" }, { "content", "website" } });
                    ClassNegocio.GeraTags(Page, "meta", "og_locale", new string[,] { { "property", "og:locale" }, { "content", "pt_BR" } });
                    ClassNegocio.GeraTags(Page, "meta", "og_url", new string[,] { { "property", "og:url" }, { "content", "https://" + HttpContext.Current.Request.Url.Host + Page.ResolveUrl(Request.RawUrl) + "" } });
                    ClassNegocio.GeraTags(Page, "meta", "og_image", new string[,] { { "property", "og:image" }, { "content", ImagemNoticia } });
                    ClassNegocio.GeraTags(Page, "meta", "article_publisher", new string[,] { { "property", "article:publisher" }, { "content", UrlPaginaFacebook } });
                    ClassNegocio.GeraTags(Page, "meta", "fb_admin", new string[,] { { "property", "fb:admins" }, { "content", ConfigurationManager.AppSettings["idAdminsFacebook"] } });
                    ClassNegocio.GeraTags(Page, "meta", "fb_appid", new string[,] { { "property", "fb:app_id" }, { "content", ConfigurationManager.AppSettings["idAPPFacebook"] } });
                }
                if (ativarContaTwitter)
                {
                    string ContaTwitter = "@" + ConfigurationManager.AppSettings["contaTwitter"];
                    ClassNegocio.GeraTags(Page, "meta", "twitter_card", new string[,] { { "name", "twitter:card" }, { "content", "summary_large_image" } });
                    ClassNegocio.GeraTags(Page, "meta", "twitter_site", new string[,] { { "name", "twitter:site", }, { "content", ContaTwitter } });
                    ClassNegocio.GeraTags(Page, "meta", "twitter_title", new string[,] { { "name", "twitter:title" }, { "content", this.Page.Title.Trim() } });
                    ClassNegocio.GeraTags(Page, "meta", "twitter_description", new string[,] { { "name", "twitter:description" }, { "content", this.Page.MetaDescription.Trim() } });
                    ClassNegocio.GeraTags(Page, "meta", "twitter_image_src", new string[,] { { "name", "twitter:image:src" }, { "content", ImagemNoticia } });
                }
                if (ativarGPlus)
                    ClassNegocio.GeraTags(Page, "link", "gplusID", new string[,] { { "rel", "publisher" }, { "url", ConfigurationManager.AppSettings["urlGPlus"] } });


                #region Meta-Tags CXense
                if (ativarModuloCXENSE)
                {
                    // exemplo passado por Pedro
                    //<meta name="cXenseParse:ept-paywall" content="aberto"  />
                    //<meta name="cXenseParse:ept-paywall" content="fechado" />

                    var NivelRestricaoMetaTag = NivelRestricao == 0 ? "publico" : NivelRestricao == 1 ? "cadastrados" : "assinantes";

                    // tags cxense custom
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Paywall" }, { "content", NivelRestricaoMetaTag } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Sessao" }, { "content", Editoria } }, true);

                    // tags cxense padrão
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:title" }, { "content", TituloPagina } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "cXenseParse:author" }, { "content", CreditoNoticia } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:description" }, { "content", LinhafinaNoticia } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:pageclass" }, { "content", "article" } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:url" }, { "content", dominio + this.Request.RawUrl.ToString() } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:articleid" }, { "content", IDNoticia } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:image" }, { "content", ImagemNoticia } }, true);

                    // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                    DateTime? DataPublicacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataPublicacaoNoticia) ? (DateTime?)DateTime.Parse(DataPublicacaoNoticia) : null;
                    var DataPublicacaoNoticiaFormatadaCX = DataPublicacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataPublicacaoNoticiaFormatadaCXense) : null;
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:publishtime" }, { "content", DataPublicacaoNoticiaFormatadaCX } }, true);

                    // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                    DateTime? DataExpiracaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataExpiracaoNoticia) ? (DateTime?)DateTime.Parse(DataExpiracaoNoticia) : null;
                    var DataExpiracaoNoticiaFormatadaCX = DataExpiracaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataExpiracaoNoticiaFormatadaCXense) : null;
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:expirationtime" }, { "content", DataExpiracaoNoticiaFormatadaCX } }, true);

                    // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                    // article:modified_time
                    DateTime? DataAtualizacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataAtualizacaoNoticia) ? (DateTime?)DateTime.Parse(DataAtualizacaoNoticia) : null;
                    var DataAtualizacaoNoticiaFormatadaCX = DataAtualizacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataAtualizacaoNoticiaFormatadaCXense) : null;
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "article:modified_time" }, { "content", DataAtualizacaoNoticiaFormatadaCX } }, true);
                    ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:keywords" }, { "content", MetaKeywords } }, true);
                }
                #endregion Meta-Tags CXense
            }
        }

        public string GeracaoAnalytics(bool ampCarousel, bool ampYoutube, bool ampVideo, bool ampAudio)
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.Append("<amp-analytics type='googleanalytics'>");
            stringBuilder.Append("<script type='application/json'>");
            stringBuilder.Append("{");
            stringBuilder.Append("    'vars': {");
            stringBuilder.Append("        'account': '"+ UA +"'");
            stringBuilder.Append("    },");
            stringBuilder.Append("    'triggers': {");
            stringBuilder.Append("        'default pageview': {");
            stringBuilder.Append("            'on': 'visible',");
            stringBuilder.Append("                'request': 'pageview',");
            stringBuilder.Append("                    'vars': {");
            stringBuilder.Append("                'title': '"+ Page.Header.Title +"'");
            stringBuilder.Append("            }");
            stringBuilder.Append("        }");

            // triggers galerias
            if (ampCarousel)
            {
                stringBuilder.Append(",        'swipeNext': {");
                stringBuilder.Append("            'on': 'click',");
                stringBuilder.Append("                'selector': '.amp-carousel-button-next',");
                stringBuilder.Append("                    'request': 'event',");
                stringBuilder.Append("                        'vars': {");
                stringBuilder.Append("                           'hitType': 'event',");
                stringBuilder.Append("                           'eventCategory': 'gallery-events',");
                stringBuilder.Append("                           'eventAction': 'swipe-next',");
                stringBuilder.Append("		                   'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("            }");
                stringBuilder.Append("        },");
                stringBuilder.Append("        'swipePrev': {");
                stringBuilder.Append("            'on': 'click',");
                stringBuilder.Append("                'selector': '.amp-carousel-button-prev', ");
                stringBuilder.Append("                    'request': 'event',");
                stringBuilder.Append("                        'vars': {");
                stringBuilder.Append("                           'hitType': 'event',");
                stringBuilder.Append("                           'eventCategory': 'gallery-events',");
                stringBuilder.Append("                           'eventAction': 'swipe-prev',");
                stringBuilder.Append("			               'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("            }");
                stringBuilder.Append("        }");
            }

            // triggers youtube
            if (ampYoutube)
            {
                stringBuilder.Append(",        'videoYoutubePlay': {");
                stringBuilder.Append("		            'on': 'video-play',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-youtube',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'video-youtube-events',");
                stringBuilder.Append("			            'eventAction': 'video-play',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            }");
            }

            // triggers video
            if (ampVideo)
            {
                stringBuilder.Append(",        'videoPlay': {");
                stringBuilder.Append("		            'on': 'video-play',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-video',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'video-events',");
                stringBuilder.Append("			            'eventAction': 'video-play',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            },");
                stringBuilder.Append("        'videoPause': {");
                stringBuilder.Append("		            'on': 'video-pause',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-video',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'video-events',");
                stringBuilder.Append("			            'eventAction': 'video-pause',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            },");
                stringBuilder.Append("        'videoEnded': {");
                stringBuilder.Append("		            'on': 'video-ended',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-video',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'video-events',");
                stringBuilder.Append("			            'eventAction': 'video-ended',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            },");
                stringBuilder.Append("        'videoPercentagePlayed' : { ");
                stringBuilder.Append("            'on': 'video-percentage-played',");
                stringBuilder.Append("            'request' : 'event' , ");
                stringBuilder.Append("            'selector' : 'amp-video' , ");
                stringBuilder.Append("            'videoSpec' : { ");
                stringBuilder.Append("              'percentages' : [ 5 ,  25 ,  50 ,  75 ,  100 ]");
                stringBuilder.Append("            } ,");
                stringBuilder.Append("              'vars': {");
                stringBuilder.Append("			            'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'video-events',");
                stringBuilder.Append("			            'eventAction': 'video-percentage-played',");
                stringBuilder.Append("			            'eventLabel': '${currentTime}'");
                stringBuilder.Append("                     }");
                stringBuilder.Append("          }");
            }

            // triggers audio
            if (ampAudio)
            {
                stringBuilder.Append(",        'audioPlay': {");
                stringBuilder.Append("		            'on': 'audio-play',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-audio',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'audio-events',");
                stringBuilder.Append("			            'eventAction': 'audio-play',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            },");
                stringBuilder.Append("        'audioPause': {");
                stringBuilder.Append("		            'on': 'audio-pause',");
                stringBuilder.Append("		            'request': 'event',");
                stringBuilder.Append("		            'selector': 'amp-audio',");
                stringBuilder.Append("		            'vars': {");
                stringBuilder.Append("                        'hitType': 'event',");
                stringBuilder.Append("			            'eventCategory': 'audio-events',");
                stringBuilder.Append("			            'eventAction': 'audio-pause',");
                stringBuilder.Append("			            'eventLabel': '" + Context.Request.Url.AbsoluteUri + "'");
                stringBuilder.Append("		            }");
                stringBuilder.Append("	            }");
             }

            stringBuilder.Append("        }");
            stringBuilder.Append("}");
            stringBuilder.Append("</script>");
            stringBuilder.Append("</amp-analytics>");

            return stringBuilder.ToString().Replace("'","\"");
        }
    }
}