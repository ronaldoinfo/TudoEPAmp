using CMS.MidiaCenter.Front.BLL;
using CMS.MidiaCenter.Model;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using FrameworkExtension.Utils;
using Security;
using System;
using System.Configuration;
using System.Linq;
using System.Text;
using WebApi.MidiaCenterNoSQL.Sons.Controllers;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class comuns_podcasts_ucPodcast_Interna_AMP : System.Web.UI.UserControl
    {
        McSonsBLL mcSonsBLL = new McSonsBLL();
        public string Browser
        {
            get;
            set;
        }
        public string Diretorio
        {
            get;
            set;
        }
        public string IDSecao
        {
            get;
            set;
        }
        public string IDSom
        {
            get;
            set;
        }
        public string IDRegiao
        {
            get;
            set;
        }
        public string IDPortal
        {
            get;
            set;
        }
        public string MostraVejaMais
        {
            get;
            set;
        }

        public string UrlSom { get; set; }
        public string AssuntoSom { get; set; }
        public string DuracaoSom { get; set; }
        public string TituloSom { get; set; }
        public string LinhaFinaSom { get; set; }
        public string LegandaSom { get; set; }
        public int NivelRestricaoSom { get; set; }
        public int IDSite { get; set; }
        public int idsom { get; set; }
        public string DataPublicacao { get; set; }
        public string DataExpiracao { get; set; }
        public string DataPublicacaoFormatada { get; set; }
        public string DataAtualizacao { get; set; }
        public string Credito { get; set; }
        public string SiteName { get; set; }
        public string UrlLogoSite { get; set; }
        public string Imagem { get; set; }
        public string UrlSite { get; set; }
        public string HtmlAudio { get; set; }

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

        public bool ativarGPlus = false;

        public string Editoria { get; set; }

        private string dominio;

        public string MetaKeywords { get; set; }

        private static SonsModelsNoSQL.SonsBsonModel somBsonModel = new SonsModelsNoSQL.SonsBsonModel();
        private static CMS.MidiaCenter.Model.McSonsModel mcSonModel = new McSonsModel();

        public string UA { get; set; }
        protected void Page_Init(object sender, EventArgs e)
        {
            somBsonModel = null;
            mcSonModel = null;
            CheckConnectionController checkConnectionController = new CheckConnectionController();

            try
            {
                if (String.IsNullOrEmpty(IDSom))
                {
                    if (Request.QueryString["SomId"].Contains(","))
                        IDSom = Request.QueryString["SomId"].Split(',')[2];
                    else
                        IDSom = Request.QueryString["SomId"];

                    idsom = NumericHelper.GetInt(IDSom);

                    if (idsom > 0)
                    {
                        if (checkConnectionController.TestConnectionNoSQL())
                        {
                            somBsonModel = new SonsNoSQLController(true).GetSomByIdNoSQL(Convert.ToInt32(IDSom)).Result;
                            if (somBsonModel != null && somBsonModel.idsom > 0)
                            {
                                NivelRestricaoSom = somBsonModel.nivelrestricao;
                                Application["NivelRestricaoSom"] = NivelRestricaoSom;
                            }
                            else
                            {
                                if (checkConnectionController.TestConnection())
                                {
                                    CMS.MidiaCenter.Front.BLL.McSonsBLL mcSonsBLL = new McSonsBLL();
                                    mcSonModel = mcSonsBLL.GetById(Convert.ToInt32(IDSom));
                                    NivelRestricaoSom = mcSonModel != null ? (int)mcSonModel.SOM_NIVELRESTRICAO : 0;
                                    Application["NivelRestricaoSom"] = NivelRestricaoSom;
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
                                CMS.MidiaCenter.Front.BLL.McSonsBLL mcSonsBLL = new McSonsBLL();
                                mcSonModel = mcSonsBLL.GetById(Convert.ToInt32(IDSom));
                                NivelRestricaoSom = mcSonModel != null ? (int)mcSonModel.SOM_NIVELRESTRICAO : 0;
                                Application["NivelRestricaoSom"] = NivelRestricaoSom;
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

                    Browser = Request.Browser.Browser + Request.Browser.Version;

                    if (Browser.Contains("Firefox"))
                        Browser = "Firefox";

                    else if (Browser.Contains("IE7.0"))
                        Browser = "IE7";

                    else if (Browser.Contains("IE8.0"))
                        Browser = "IE8";

                    if (String.IsNullOrEmpty(Diretorio))
                        Diretorio = "multimidia";

                    if (String.IsNullOrEmpty(IDSecao))
                        IDSecao = "1";

                    if (String.IsNullOrEmpty(MostraVejaMais))
                        MostraVejaMais = "true";

                    if (String.IsNullOrEmpty(Editoria))
                        Editoria = "Noticias";

                    if (IDSom != "0")
                    {
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
        private void GeracaoMetas()
        {
            if (String.IsNullOrEmpty(SiteName))
                SiteName = ConfigurationManager.AppSettings["SiteName"].ToString();

            UrlSite = ConfigurationManager.AppSettings["SiteUrl"];
            string ImagemPadrao = ConfigurationManager.AppSettings["ImagemPadrao"];
            UrlLogoSite = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() + ConfigurationManager.AppSettings["urlLogoSite"] : string.Empty;

            ClassNegocio.GeraTags(Page, "meta", "meta_title", new string[,] { { "name", "title" }, { "content", TituloSom } });
            ClassNegocio.GeraTags(Page, "meta", "og_title", new string[,] { { "property", "og:title" }, { "content", TituloSom } });
            ClassNegocio.GeraTags(Page, "meta", "og_description", new string[,] { { "property", "og:description" }, { "content", LinhaFinaSom } });

            ClassNegocio.GeraTags(Page, "meta", "twitter_title", new string[,] { { "name", "twitter:title" }, { "content", TituloSom } });
            ClassNegocio.GeraTags(Page, "meta", "twitter_description", new string[,] { { "name", "twitter:description" }, { "content", LinhaFinaSom } });

            Page.Title = TituloSom + " (" + LinhaFinaSom + ") - " + "Podcasts - " + ConfigurationManager.AppSettings["SiteName"];
            Page.MetaDescription = "Confira os últimos Podcasts do site " + ConfigurationManager.AppSettings["SiteName"];
            Page.MetaKeywords = (string.IsNullOrWhiteSpace(Request.QueryString["SomTitulo"]) ? "" : Request.QueryString["SomTitulo"] + " - ").Replace(", ", " ").Replace(" ", ", ");

            string ContaTwitter = "@" + ConfigurationManager.AppSettings["contaTwitter"];
            ClassNegocio.GeraTags(Page, "meta", "twitter_card", new string[,] { { "name", "twitter:card" }, { "content", "summary_large_image" } });
            ClassNegocio.GeraTags(Page, "meta", "twitter_site", new string[,] { { "name", "twitter:site", }, { "content", ContaTwitter } });
            ClassNegocio.GeraTags(Page, "meta", "twitter_title", new string[,] { { "name", "twitter:title" }, { "content", TituloSom } });
            ClassNegocio.GeraTags(Page, "meta", "twitter_description", new string[,] { { "name", "twitter:description" }, { "content", LinhaFinaSom } });

            #region Meta-Tags CXense
            if (ativarModuloCXENSE)
            {
                // exemplo passado por Pedro
                //<meta name="cXenseParse:ept-paywall" content="aberto"  />
                //<meta name="cXenseParse:ept-paywall" content="fechado" />

                var NivelRestricaoMetaTag = NivelRestricaoSom == 0 ? "publico" : NivelRestricaoSom == 1 ? "cadastrados" : "assinantes";

                // tags cxense custom
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Paywall" }, { "content", NivelRestricaoMetaTag } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:ept-Sessao" }, { "content", Editoria } }, true);

                // tags cxense padrão
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:title" }, { "content", TituloSom } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "cXenseParse:author" }, { "content", Credito } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:description" }, { "content", LinhaFinaSom } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:pageclass" }, { "content", "article" } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:url" }, { "content", dominio + this.Request.RawUrl.ToString() } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:articleid" }, { "content", IDSom } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:image" }, { "content", Imagem } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                DateTime? DataPublicacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataPublicacao) ? (DateTime?)DateTime.Parse(DataPublicacao) : null;
                var DataPublicacaoNoticiaFormatadaCX = DataPublicacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataPublicacaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:publishtime" }, { "content", DataPublicacaoNoticiaFormatadaCX } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                DateTime? DataExpiracaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataExpiracao) ? (DateTime?)DateTime.Parse(DataExpiracao) : null;
                var DataExpiracaoNoticiaFormatadaCX = DataExpiracaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataExpiracaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:recs:expirationtime" }, { "content", DataExpiracaoNoticiaFormatadaCX } }, true);

                // Data formatada com padrão ISO 8601 segundo manual CXense: https://wiki.cxense.com/display/cust/Document+parsing
                // article:modified_time
                DateTime? DataAtualizacaoNoticiaFormatadaCXense = !string.IsNullOrEmpty(DataAtualizacao) ? (DateTime?)DateTime.Parse(DataAtualizacao) : null;
                var DataAtualizacaoNoticiaFormatadaCX = DataAtualizacaoNoticiaFormatadaCXense != null ? String.Format("{0:yyyy-MM-ddTHH:mm:ssZ}", DataAtualizacaoNoticiaFormatadaCXense) : null;
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "article:modified_time" }, { "content", DataAtualizacaoNoticiaFormatadaCX } }, true);
                ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:keywords" }, { "content", MetaKeywords } }, true);
            }
            #endregion Meta-Tags CXense

        }
        private void CarregarConteudoBD()
        {
            if (somBsonModel == null)
            {
                if (mcSonModel != null && mcSonModel.SOM_ID > 0)
                {
                    // verifica se o som é ativo/inativo
                    if (mcSonModel.SOM_ATIVO != null && !(bool)mcSonModel.SOM_ATIVO)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se pertence ao site corrente
                    if (!mcSonModel.tbMCSons_Secoes_Sites.Any(a => a.idSite == IDSite))
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    // verifica se a data de publicação é válida
                    if (Convert.ToDateTime(mcSonModel.SOM_DATA_PUBLICACAO) > DateTime.Now)
                    {
                        Response.Redirect("/404.aspx", true);
                    }

                    var somlink = ConfigurationManager.AppSettings.AllKeys.Contains("EMC_Sons") ? ConfigurationManager.AppSettings["EMC_Sons"].ToString() + "/" : null;
                    UrlSom = somlink + mcSonModel.SOM_SUBPASTA + mcSonModel.SOM_ARQUIVO;
                    AssuntoSom = mcSonModel.SOM_CHAPEU;
                    TituloSom = mcSonModel.SOM_MANCHETE;
                    LinhaFinaSom = mcSonModel.SOM_DESTAQUE;
                    DuracaoSom = mcSonModel.SOM_DURACAO;
                    DataPublicacao = mcSonModel.SOM_DATA_PUBLICACAO.ToString();
                    DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacao) ? (DateTime?)DateTime.Parse(DataPublicacao) : null;
                    DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);
                    DataAtualizacao = mcSonModel.SOM_DATA_ATUALIZACAO != null ? mcSonModel.SOM_DATA_ATUALIZACAO.ToString() : string.Empty;
                    HtmlAudio = "<audio controls='' preload='auto' width='100%'><source src='" + UrlSom + "' type='audio/mpeg'></audio>";

                    if (mcSonModel.idImagemManchete != null)
                    {
                        // Atenção !!! nesta chamada "new SonsNoSQLController().GetFotoManchete ..." não passar nenhum parametro no construtor, pois queremos que o site seja retornado do MSSQL.
                        // porque essa notícia não foi encontrada no mongo ou porque o mongo está down.
                        var fotomanchete = new SonsNoSQLController().GetFotoManchete(new SonsModelsNoSQL.McSonsModel { IdImagemManchete = mcSonModel.idImagemManchete });
                        Imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, fotomanchete.Arquivo);
                        Credito = ClassNegocio.GetImgNoticiaInterna(string.Empty, fotomanchete.Credito);
                    }

                    MetaKeywords = mcSonModel.SOM_TAG_BUSCA;
                }
                else
                {
                    Response.Redirect("/404.aspx", true);
                }
            }
        }
        private void CarregarConteudoNoSQL()
        {
            if (somBsonModel != null && somBsonModel.idsom > 0)
            {
                // verifica se a data de publicação é válida
                if (Convert.ToDateTime(somBsonModel.publicacao) > DateTime.Now)
                    Response.Redirect("/404.aspx", true);

                // verifica se a notícia é ativa/inativa
                if (!(bool)somBsonModel.ativo)
                    Response.Redirect("/404.aspx", true);

                // verifica se pertence ao site corrente
                if (!somBsonModel.idsites.Split(',').Any(a => Convert.ToInt32(a) == IDSite))
                    Response.Redirect("/404.aspx", true);

                var somlink = ConfigurationManager.AppSettings.AllKeys.Contains("EMC_Sons") ? ConfigurationManager.AppSettings["EMC_Sons"].ToString() + "/" : null;
                UrlSom = somlink + somBsonModel.subpasta + somBsonModel.arquivo;
                AssuntoSom = somBsonModel.assunto;
                TituloSom = somBsonModel.manchete;
                LinhaFinaSom = somBsonModel.destaque;
                DuracaoSom = somBsonModel.duracao;
                DataPublicacao = somBsonModel.publicacao.ToString();
                DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacao) ? (DateTime?)DateTime.Parse(DataPublicacao) : null;
                DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);
                DataAtualizacao = somBsonModel.atualizacao;
                HtmlAudio = "<audio controls='' preload='auto' width='100%'><source src='" + UrlSom + "' type='audio/mpeg'></audio>";

                if (somBsonModel.imagens != null && somBsonModel.imagens.Count() > 0)
                    Imagem = ClassNegocio.GetImgNoticiaInterna(string.Empty, somBsonModel.imagens.Where(a => a.Tipo == "fotomanchete").Count() > 0 ? somBsonModel.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Arquivo : string.Empty);
                else
                    Imagem = string.Empty;

                if (!string.IsNullOrEmpty(Imagem) && Imagem != null)
                {
                    Credito = "Imagem: " + ClassNegocio.GetImgNoticiaInterna(string.Empty, somBsonModel.imagens.Where(a => a.Tipo == "fotomanchete").Count() > 0 ? somBsonModel.imagens.Where(a => a.Tipo == "fotomanchete").FirstOrDefault().Credito : string.Empty).Replace("https://emc.eptv.com.br/dbimagens/", "").Replace("https://emc.empresaspioneiras.com.br/dbimagens/", "");
                }
                else
                    Credito = string.Empty;

                MetaKeywords = somBsonModel.tags;
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

            stringBuilder.Append("        }");
            stringBuilder.Append("}");
            stringBuilder.Append("</script>");
            stringBuilder.Append("</amp-analytics>");

            return stringBuilder.ToString().Replace("'", "\"");
        }
    }
}