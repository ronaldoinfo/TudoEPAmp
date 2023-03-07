using CMS.MidiaCenter.Front.BLL;
using CMS.MidiaCenter.Model;
using FrameworkExtension.Utils;
using System;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using WebApi.MidiaCenterNoSQL.Videos.Controllers;

namespace CMS.Web.FrontEnd.TemplatesV55.Comuns.Videos
{
    public partial class comuns_videos_ucVideo_Interna_AMP : System.Web.UI.UserControl
    {
        McVideosBLL mcVideosBLL = new McVideosBLL();
        //-> ativa Modulo CXENSE
        public bool ativarModuloCXENSE = false;
        public string linkBloqueio;
        //-> ativa Módulo Twitter
        public bool ativarContaTwitter = false;
        //-> ativa Módulo Facebook
        public bool ativarContaFacebook = false;
        //-> ativa Módulo GPlus
        public bool ativarGPlus = false;
        public string MostrarVideo { get; set; }
        public string SiteName { get; set; }

        private string dominio;
        public string TituloPagina { get; set; }
        public string Editoria { get; set; }
        public string Diretorio { get; set; }
        public string IDSecao { get; set; }
        public string IDVideo { get; set; }
        public int idvideo { get; set; }
        public string IDRegiao { get; set; }
        public int IDPortal { get; set; }
        public string MostraVejaMais { get; set; }
        public string TituloVideo { get; set; }
        public string LinhaFinaVideo { get; set; }
        public string ResumoVideo { get; set; }
        public string AssuntoVideo { get; set; }
        public string DuracaoVideo { get; set; }
        public string UrlVideo { get; set; }
        public string DataPublicacaoVideo { get; set; }
        public string DataExpiracaoVideo { get; set; }
        public string TagsVideo { get; set; }
        public int NivelRestricaoVideo { get; set; }
        public string ImagemVideo { get; set; }
        public string ExtensaoVideo { get; set; }
        public DateTime DateVideo { get; set; }
        public string DataPublic { get; set; }
        public int IDSite { get; set; }
        public string Credito { get; set; }
        public string DataAtualizacao { get; set; }
        public string DataPublicacaoFormatada { get; set; }

        public bool ativarModuloTABULA = false;
        public string UrlLogoSite { get; set; }
        public string HtmlVideo { get; set; }

        private static VideosModelsNoSQL.VideosBsonModel videoBsonModel = new VideosModelsNoSQL.VideosBsonModel();

        private static CMS.MidiaCenter.Model.McVideosModel mcVideosModel = new McVideosModel();

        public string UA { get; set; }
        protected void Page_Init(object sender, EventArgs e)
        {
            videoBsonModel = null;
            mcVideosModel = null;
            CheckConnectionController checkConnectionController = new CheckConnectionController();

            try
            {
                if (String.IsNullOrEmpty(IDVideo))
                {
                    if (Request.QueryString["VideoID"].Contains(","))
                        IDVideo = Request.QueryString["VideoID"].Split(',')[1];
                    else
                        IDVideo = Request.QueryString["VideoID"];

                    idvideo = NumericHelper.GetInt(IDVideo);

                    if (idvideo > 0)
                    {
                        if (checkConnectionController.TestConnectionNoSQL())
                        {
                            videoBsonModel = new VideosNoSQLController(true).GetVideoByIdNoSQL(idvideo).Result;
                            if (videoBsonModel != null && videoBsonModel.idvideo > 0)
                            {
                                NivelRestricaoVideo = videoBsonModel.nivelrestricao;
                                Application["NivelRestricaoVideo"] = NivelRestricaoVideo;
                            }
                            else
                            {
                                if (checkConnectionController.TestConnection())
                                {
                                    CMS.MidiaCenter.Front.BLL.McVideosBLL mcVideosBLL = new McVideosBLL();
                                    mcVideosModel = mcVideosBLL.GetById(idvideo);
                                    NivelRestricaoVideo = mcVideosModel != null ? (byte)mcVideosModel.VIDEO_NIVELRESTRICAO : 0;
                                    Application["NivelRestricaoVideo"] = NivelRestricaoVideo;
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
                                CMS.MidiaCenter.Front.BLL.McVideosBLL mcVideosBLL = new McVideosBLL();
                                mcVideosModel = mcVideosBLL.GetById(idvideo);
                                NivelRestricaoVideo = mcVideosModel != null ? (byte)mcVideosModel.VIDEO_NIVELRESTRICAO : 0;
                                Application["NivelRestricaoVideo"] = NivelRestricaoVideo;
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
                linkBloqueio = ConfigurationManager.AppSettings["linkBloqueio"] != null ? ConfigurationManager.AppSettings["linkBloqueio"].ToLower() : string.Empty;
                ativarContaTwitter = ConfigurationManager.AppSettings["ativarContaTwitter"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaTwitter"]) : false;
                ativarContaFacebook = ConfigurationManager.AppSettings["ativarContaFacebook"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaFacebook"]) : false;
                ativarGPlus = ConfigurationManager.AppSettings["ativarGPlus"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarGPlus"]) : false;
                UA = ConfigurationManager.AppSettings["uaAnalytics"] ?? string.Empty;

                try
                {
                    if (IDSite <= 0)
                        IDSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());

                    dominio = ConfigurationManager.AppSettings["SiteUrl"].ToString();

                    if (String.IsNullOrEmpty(Editoria))
                        Editoria = "Notícias";

                    if (idvideo <= 0)
                        idvideo = NumericHelper.GetInt(IDVideo);

                    if (idvideo > 0)
                    {
                        IDVideo = idvideo.ToString();
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
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("/404.aspx", true);
                }
            }
        }
        private void CarregarConteudoBD()
        {
            if (videoBsonModel == null)
            {
                if (mcVideosModel != null && mcVideosModel.VIDEO_ID > 0)
                {
                    // verifica se a video é ativo/inativo
                    if (mcVideosModel.VIDEO_ATIVO != null && !(bool)mcVideosModel.VIDEO_ATIVO)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se pertence ao site corrente
                    if (!mcVideosModel.TbMC_VIDEOS_SECOES_SITES.Any(a => a.idSite == IDSite))
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se a data de publicação é válida
                    if (Convert.ToDateTime(mcVideosModel.VIDEO_DATA_PUBLICACAO) > DateTime.Now)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    TituloVideo = mcVideosModel.VIDEO_MANCHETE;
                    LinhaFinaVideo = mcVideosModel.VIDEO_DESTAQUE;
                    ResumoVideo = mcVideosModel.VIDEO_RESUMO;
                    ExtensaoVideo = "video/mp4";
                    var videolink = ConfigurationManager.AppSettings.AllKeys.Contains("EMC_Videos") ? ConfigurationManager.AppSettings["EMC_Videos"].ToString() + "/" : null;
                    var arquivo = videolink + mcVideosModel.VIDEO_SUBPASTA + mcVideosModel.VIDEO_ARQUIVO;
                    UrlVideo = arquivo;
                    ImagemVideo = videolink + mcVideosModel.VIDEO_SUBPASTA.Replace(@"\", "/") + mcVideosModel.VIDEO_ARQUIVO.Replace(".mp4", string.Empty) + "_1.jpg";
                    DuracaoVideo = mcVideosModel.VIDEO_DURACAO;
                    DataPublicacaoVideo = mcVideosModel.VIDEO_DATA_PUBLICACAO.ToString();
                    DataExpiracaoVideo = mcVideosModel.VIDEO_DATA_EXPIRACAO.ToString();
                    TagsVideo = mcVideosModel.VIDEO_TAG_BUSCA;
                    DateVideo = DateTime.Parse(DataPublicacaoVideo);
                    DataPublic = DateVideo.ToString("dd/MM/yyyy");
                    Credito = mcVideosModel.VIDEO_CREDITO;
                    DataAtualizacao = mcVideosModel.VIDEO_DATA_ATUALIZACAO != null ? mcVideosModel.VIDEO_DATA_ATUALIZACAO.ToString() : string.Empty;

                    DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacaoVideo) ? (DateTime?)DateTime.Parse(DataPublicacaoVideo) : null;
                    if (dtBanco != null)
                        DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);

                    HtmlVideo = "<video id='content_video' width='900px' class='video-player' controls='' preload='auto' poster='" + ImagemVideo + "' playsinline=''><source src='" + UrlVideo + "' type='video/mp4'></video>";
                }
                else
                {
                    Response.Redirect("/404.aspx", true);
                }
            }
        }
        private void GeracaoMetas()
        {
            if (String.IsNullOrEmpty(SiteName))
                SiteName = ConfigurationManager.AppSettings["SiteName"].ToString();

            string URLSite = ConfigurationManager.AppSettings["SiteUrl"];
            string ImagemPadrao = ConfigurationManager.AppSettings["ImagemPadrao"];
            UrlLogoSite = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() + ConfigurationManager.AppSettings["urlLogoSite"] : string.Empty;

            TituloPagina = !string.IsNullOrWhiteSpace(TituloVideo) ? TituloVideo.Trim() + " - " + SiteName : SiteName;
            ClassNegocio.GeraTags(Page, "meta", "meta_title", new string[,] { { "name", "title" }, { "content", TituloPagina } });
            this.Parent.Page.Title = TituloPagina;

            if (String.IsNullOrEmpty(LinhaFinaVideo))
            {
                ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", "Maior portal de conteúdo e noticias do interior do estado de São Paulo. Fique informado sobre tudo o que acontece na sua cidade, no Brasil e no mundo. Notícias sobre cotidiano, cultura, esporte, economia, entretenimento, política e outros conteúdos." } });
            }
            else
            {
                ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", LinhaFinaVideo } });
            }
            this.Parent.Page.MetaDescription = LinhaFinaVideo;

            // Gera meta Tag da imagem padrão do site
            ClassNegocio.GeraTags(Page, "link", "link_imagem", new string[,] { { "rel", "image_src" }, { "content", ImagemVideo } });
            ClassNegocio.GeraTags(Page, "link", "url_icon", new string[,] { { "rel", "icon" }, { "href", "/favicon.ico" } });

            ClassNegocio.GeraTags(Page, "meta", "nameVideo", new string[,] { { "itemprop", "name" }, { "content", TituloVideo } });
            ClassNegocio.GeraTags(Page, "meta", "descriptionVideo", new string[,] { { "itemprop", "description" }, { "content", LinhaFinaVideo } });
            ClassNegocio.GeraTags(Page, "meta", "durationVideo", new string[,] { { "itemprop", "duration" }, { "content", "PT" + (!string.IsNullOrWhiteSpace(DuracaoVideo) ? DuracaoVideo.ToUpper() : string.Empty) } });
            ClassNegocio.GeraTags(Page, "meta", "thumbnailUrlVideo", new string[,] { { "itemprop", "thumbnailUrl" }, { "content", ImagemVideo } });
            ClassNegocio.GeraTags(Page, "meta", "contentURLVideo", new string[,] { { "itemprop", "contentURL" }, { "content", UrlVideo } });
            ClassNegocio.GeraTags(Page, "meta", "uploadDateVideo", new string[,] { { "itemprop", "uploadDate" }, { "content", DataPublicacaoVideo } });
            ClassNegocio.GeraTags(Page, "meta", "expiresVideo", new string[,] { { "itemprop", "expires" }, { "content", DataExpiracaoVideo } });
            ClassNegocio.GeraTags(Page, "meta", "typeVideo", new string[,] { { "itemprop", "typeVideo" }, { "content", ExtensaoVideo } });
            ClassNegocio.GeraTags(Page, "meta", "id_pagina", new string[,] { { "name", "idpagina" }, { "content", IDVideo } });

            //--> ADICIONA META TAGS DO FACEBOOK, TWITTER E OUTRAS NO HEAD DA PÁGINA
            if (ativarContaFacebook)
            {
                string UrlPaginaFacebook = ConfigurationManager.AppSettings["urlPaginaFacebook"];
                Page.Header.Attributes.Add("prefix", "fb: http://ogp.me/ns/fb# video: http://ogp.me/ns/video#");
                ClassNegocio.GeraTags(Page, "meta", "og_site_name", new string[,] { { "property", "og:site_name" }, { "content", SiteName } });
                ClassNegocio.GeraTags(Page, "meta", "og_title", new string[,] { { "property", "og:title" }, { "content", this.Page.Title.Trim() } });
                ClassNegocio.GeraTags(Page, "meta", "og_description", new string[,] { { "property", "og:description" }, { "content", this.Page.MetaDescription.Trim() } });
                ClassNegocio.GeraTags(Page, "meta", "og_locale", new string[,] { { "property", "og:locale" }, { "content", "pt_BR" } });
                ClassNegocio.GeraTags(Page, "meta", "og_type", new string[,] { { "property", "og:type" }, { "content", "video" } });
                ClassNegocio.GeraTags(Page, "meta", "og_video_url", new string[,] { { "property", "og:video:url" }, { "content", UrlVideo } });
                ClassNegocio.GeraTags(Page, "meta", "og_video_image", new string[,] { { "property", "og:image" }, { "content", ImagemVideo } });
                ClassNegocio.GeraTags(Page, "meta", "og_video_type", new string[,] { { "property", "og:video:type" }, { "content", ExtensaoVideo } });
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
                ClassNegocio.GeraTags(Page, "meta", "twitter_image_src", new string[,] { { "name", "twitter:image:src" }, { "content", URLSite + "/img/" + ImagemPadrao } });
            }
            if (ativarGPlus)
                ClassNegocio.GeraTags(Page, "link", "gplusID", new string[,] { { "rel", "publisher" }, { "url", ConfigurationManager.AppSettings["urlGPlus"] } });

            #region Meta-Tags CXense
            if (ativarModuloCXENSE)
            {
                // exemplo passado por Pedro
                //<meta name="cXenseParse:ept-paywall" content="aberto"  />
                //<meta name="cXenseParse:ept-paywall" content="fechado" />

                var NivelRestricaoMetaTag = NivelRestricaoVideo == 0 ? "publico" : NivelRestricaoVideo == 1 ? "cadastrados" : "assinantes";

                // tags cxense custom
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Paywall" }, { "content", NivelRestricaoMetaTag } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Sessao" }, { "content", Editoria } }, true);

                // tags cxense padrão
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:title" }, { "content", TituloPagina } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "cXenseParse:author" }, { "content", SiteName } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:description" }, { "content", LinhaFinaVideo } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:pageclass" }, { "content", "article" } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:url" }, { "content", dominio + this.Request.RawUrl.ToString() } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:articleid" }, { "content", IDVideo } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:image" }, { "content", ImagemVideo } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                DateTime? DataPublicacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataPublic) ? (DateTime?)DateTime.Parse(DataPublic) : null;
                var DataPublicacaoNoticiaFormatadaCX = DataPublicacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataPublicacaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:publishtime" }, { "content", DataPublicacaoNoticiaFormatadaCX } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                DateTime? DataExpiracaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataExpiracaoVideo) ? (DateTime?)DateTime.Parse(DataExpiracaoVideo) : null;
                var DataExpiracaoNoticiaFormatadaCX = DataExpiracaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataExpiracaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:expirationtime" }, { "content", DataExpiracaoNoticiaFormatadaCX } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                // article:modified_time
                DateTime? DataAtualizacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataPublic) ? (DateTime?)DateTime.Parse(DataPublic) : null;
                var DataAtualizacaoNoticiaFormatadaCX = DataAtualizacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataAtualizacaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "article:modified_time" }, { "content", DataAtualizacaoNoticiaFormatadaCX } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:keywords" }, { "content", TituloVideo.Replace(" ", ",") } }, true);
            }
            #endregion Meta-Tags CXense
        }
        private void CarregarConteudoNoSQL()
        {
            if (videoBsonModel != null && videoBsonModel.idvideo > 0)
            {
                // verifica se a data de publicação é válida
                if (Convert.ToDateTime(videoBsonModel.publicacao) > DateTime.Now)
                    Response.Redirect("/404.aspx", true);

                // verifica se a video é ativo/inativo
                if (!(bool)videoBsonModel.ativo)
                    Response.Redirect("/404.aspx", true);

                // verifica se pertence ao site corrente
                if (!videoBsonModel.idsites.Split(',').Any(a => Convert.ToInt32(a) == IDSite))
                    Response.Redirect("/404.aspx", true);

                TituloVideo = videoBsonModel.manchete;
                LinhaFinaVideo = videoBsonModel.destaque;
                ResumoVideo = videoBsonModel.resumo;
                ExtensaoVideo = "video/mp4";
                var videolink = ConfigurationManager.AppSettings.AllKeys.Contains("EMC_Videos") ? ConfigurationManager.AppSettings["EMC_Videos"].ToString() + "/" : null;
                var arquivo = videolink + videoBsonModel.subpasta + videoBsonModel.arquivo;
                UrlVideo = arquivo;
                ImagemVideo = videolink + videoBsonModel.subpasta.Replace(@"\", "/") + videoBsonModel.arquivo.Replace(".mp4", string.Empty) + "_1.jpg";
                DuracaoVideo = videoBsonModel.duracao;
                DataPublicacaoVideo = videoBsonModel.publicacao.ToString();
                DataExpiracaoVideo = videoBsonModel.expiracao.ToString();
                TagsVideo = videoBsonModel.tags;
                DateVideo = DateTime.Parse(DataPublicacaoVideo);
                DataPublic = DateVideo.ToString("dd/MM/yyyy");
                Credito = videoBsonModel.credito;
                DataAtualizacao = videoBsonModel.atualizacao;

                DataPublicacaoVideo = videoBsonModel.publicacao;
                DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacaoVideo) ? (DateTime?)DateTime.Parse(DataPublicacaoVideo) : null;

                if (dtBanco != null)
                    DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);

                HtmlVideo = "<video id='content_video' width='900px' class='video-player' controls='' preload='auto' poster='" + ImagemVideo + "' playsinline=''><source src='" + UrlVideo + "' type='video/mp4'></video>";
            }
        }
        public string GeracaoAnalytics()
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.Append("<amp-analytics type='googleanalytics'>");
            stringBuilder.Append("<script type='application/json'>");
            stringBuilder.Append("{");
            stringBuilder.Append("    'vars': {");
            stringBuilder.Append("        'account': '" + UA + "'");
            stringBuilder.Append("    },");
            stringBuilder.Append("    'triggers': {");
            stringBuilder.Append("        'default pageview': {");
            stringBuilder.Append("            'on': 'visible',");
            stringBuilder.Append("                'request': 'pageview',");
            stringBuilder.Append("                    'vars': {");
            stringBuilder.Append("                'title': '" + Page.Header.Title + "'");
            stringBuilder.Append("            }");
            stringBuilder.Append("        }");

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

            stringBuilder.Append("        }");
            stringBuilder.Append("}");
            stringBuilder.Append("</script>");
            stringBuilder.Append("</amp-analytics>");

            return stringBuilder.ToString().Replace("'", "\"");
        }
    }
}