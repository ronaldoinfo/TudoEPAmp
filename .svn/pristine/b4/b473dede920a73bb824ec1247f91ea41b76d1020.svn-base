using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using CMS.MidiaCenter.Model;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using FrameworkExtension.Utils;
using System.Configuration;
using WebApi.MidiaCenterNoSQL.Galerias.Controllers;
using System.Text;

public partial class comuns_galerias_ucGaleria_Interna_AMP : System.Web.UI.UserControl
{
    //-> ativa Modulo CXENSE
    public bool ativarModuloCXENSE = false;
    public string linkBloqueio;
    //-> ativa Modulo TABULA
    public bool ativarModuloTABULA = false;

    //-> ativa Módulo Twitter
    public bool ativarContaTwitter = false;
    //-> ativa Módulo Facebook
    public bool ativarContaFacebook = false;
    //-> ativa Módulo GPlus
    public bool ativarGPlus = false;

    public int IDSite { get; set; }
    public string SiteName { get; set; }

    private string dominio;
    public string urlLogoSite { get; set; }

    public string fotolink = string.Empty;
    public string subPasta { get; set; }
    public string ID_Galeria { get; set; }
    public string DataPublicacao { get; set; }
    public string DataAtualizacao { get; set; }
    public string DataExpiracao { get; set; }
    public string IDSecao { get; set; }
    public string TituloGaleria { get; set; }
    public string DestaqueGaleria { get; set; }
    public string TagsGaleria { get; set; }
    public int NivelRestricao { get; set; }
    public string credito { get; set; }
    public string QtdFotos { get; set; }
    public string Resumo { get; set; }
    public string LinkImagem { get; set; }
    public string DataPublicacaoFormatada { get; set; }
    public string UrlLogoSite { get; set; }
    public int idgaleria { get; set; }
    private static GaleriasModelsNoSQL.GaleriasBsonModel galeriaBsonModel = new GaleriasModelsNoSQL.GaleriasBsonModel();

    private static CMS.MidiaCenter.Model.McGaleriasModel mcGaleriasModel = new McGaleriasModel();
    public string UA { get; set; }

    protected void Page_Init(object sender, EventArgs e)
    {
        galeriaBsonModel = null;
        mcGaleriasModel = null;
        CheckConnectionController checkConnectionController = new CheckConnectionController();

        try
        {
            if (String.IsNullOrEmpty(ID_Galeria))
            {
                if (Request.QueryString.Count > 0 && Request.QueryString["GaleriaID"].Contains(","))
                    ID_Galeria = Request.QueryString["GaleriaID"].Split(',')[1];
                else
                {
                    ID_Galeria = Request.QueryString["GaleriaID"];
                    idgaleria = NumericHelper.GetInt(ID_Galeria);
                }

                if (idgaleria > 0)
                {
                    if (checkConnectionController.TestConnectionNoSQL())
                    {
                        galeriaBsonModel = new GaleriasNoSQLController(true).GetGaleriaByIdNoSQL(idgaleria).Result;
                        if (galeriaBsonModel != null && galeriaBsonModel.idgaleria > 0)
                        {
                            NivelRestricao = galeriaBsonModel.nivelrestricao;
                            Application["NivelRestricaoGaleria"] = NivelRestricao;
                        }
                        else
                        {
                            if (checkConnectionController.TestConnection())
                            {
                                CMS.MidiaCenter.Front.BLL.McGaleriasBLL mcGaleriasBLL = new CMS.MidiaCenter.Front.BLL.McGaleriasBLL();
                                mcGaleriasModel = mcGaleriasBLL.GetById(idgaleria);
                                NivelRestricao = mcGaleriasModel != null ? (byte)mcGaleriasModel.GALERIA_NIVELRESTRICAO : 0;
                                Application["NivelRestricaoGaleria"] = NivelRestricao;
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
                            CMS.MidiaCenter.Front.BLL.McGaleriasBLL mcGaleriasBLL = new CMS.MidiaCenter.Front.BLL.McGaleriasBLL();
                            mcGaleriasModel = mcGaleriasBLL.GetById(idgaleria);
                            NivelRestricao = mcGaleriasModel != null ? (byte)mcGaleriasModel.GALERIA_NIVELRESTRICAO : 0;
                            Application["NivelRestricaoGaleria"] = NivelRestricao;
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
        try
        {
            if (!IsPostBack)
            {

                if (IDSite <= 0)
                    IDSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());

                dominio = ConfigurationManager.AppSettings["SiteUrl"].ToString();

                if (!string.IsNullOrWhiteSpace(ID_Galeria))
                {
                    ativarModuloCXENSE = ConfigurationManager.AppSettings["ativarModuloCXENSE"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloCXENSE"]) : false;
                    ativarModuloTABULA = ConfigurationManager.AppSettings["ativarModuloTABULA"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloTABULA"]) : false;
                    linkBloqueio = ConfigurationManager.AppSettings["linkBloqueio"] != null ? ConfigurationManager.AppSettings["linkBloqueio"].ToLower() : string.Empty;
                    ativarContaTwitter = ConfigurationManager.AppSettings["ativarContaTwitter"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaTwitter"]) : false;
                    ativarContaFacebook = ConfigurationManager.AppSettings["ativarContaFacebook"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaFacebook"]) : false;
                    ativarGPlus = ConfigurationManager.AppSettings["ativarGPlus"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarGPlus"]) : false;
                    fotolink = ConfigurationManager.AppSettings.AllKeys.Contains("EMC_Fotos") ? ConfigurationManager.AppSettings["EMC_Fotos"].ToString() + "/" : null;
                    UA = ConfigurationManager.AppSettings["uaAnalytics"] ?? string.Empty;

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
                else
                {
                    ltlErro.Text = "<div class='alert alert-info text-center' role='alert'>Galeria de Fotos não encontrada!</div>";
                }
            }
        }
        catch (Exception)
        {
            ltlErro.Text = "<div class='alert alert-info text-center' role='alert'>Galeria de Fotos não encontrada!</div>";
        }
    }

    private void CarregarConteudoBD()
    {
        if (galeriaBsonModel == null)
        {
            if (mcGaleriasModel != null && mcGaleriasModel.GALERIA_ID > 0)
            {
                // verifica se pertence ao site corrente
                if (!mcGaleriasModel.TbMC_GALERIAS_SECOES_SITES.Any(a => a.idSite == IDSite))
                {
                    Response.Redirect("/404.aspx", true);
                }

                // verifica se a data de publicação é válida
                if (Convert.ToDateTime(mcGaleriasModel.GALERIA_DATA_PUBLICACAO) > DateTime.Now)
                {
                    Response.Redirect("/404.aspx", true);
                }

                // verifica se a galeria é ativa/inativa
                if (mcGaleriasModel.GALERIA_ATIVA != null && !(bool)mcGaleriasModel.GALERIA_ATIVA)
                {
                    Response.Redirect("/404.aspx", true);
                }

                TituloGaleria = mcGaleriasModel.GALERIA_MANCHETE;
                DestaqueGaleria = mcGaleriasModel.GALERIA_DESTAQUE;
                Resumo = mcGaleriasModel.GALERIA_RESUMO;
                TagsGaleria = mcGaleriasModel.GALERIA_TAG_BUSCA;
                credito = mcGaleriasModel.GALERIA_CREDITO;
                DataPublicacao = mcGaleriasModel.GALERIA_DATA_PUBLICACAO.ToString();
                DataAtualizacao = mcGaleriasModel.GALERIA_DATA_ATUALIZACAO.ToString();
                DataExpiracao = mcGaleriasModel.GALERIA_DATA_EXPIRACAO.ToString();
                subPasta = mcGaleriasModel.GALERIA_SUBPASTA;
                NivelRestricao = (int)mcGaleriasModel.GALERIA_NIVELRESTRICAO;
                QtdFotos = mcGaleriasModel.TbMC_GALERIAS_Fotos.Count().ToString();

                DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacao) ? (DateTime?)DateTime.Parse(DataPublicacao) : null;
                DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);

                foreach (var attribute in mcGaleriasModel.TbMC_GALERIAS_Fotos)
                {
                    if (attribute == mcGaleriasModel.TbMC_GALERIAS_Fotos.First())
                    {
                        LinkImagem = fotolink + subPasta + attribute.FOTO_THUMBNAIL.ToString().Replace("_thumb", "").Replace("j.jpg", ".jpg").Replace("/", "\\");
                        break;
                    }
                }

                CreateAmpCarouselBD(mcGaleriasModel);
            }
        }
    }

    private void GeracaoMetas()
    {
        // Gera Meta Tags                    
        if (String.IsNullOrEmpty(SiteName))
            SiteName = ConfigurationManager.AppSettings["SiteName"].ToString();
        string URLSite = ConfigurationManager.AppSettings["SiteUrl"];
        string ImagemPadrao = ConfigurationManager.AppSettings["ImagemPadrao"];
        UrlLogoSite = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() + ConfigurationManager.AppSettings["urlLogoSite"] : string.Empty;

        string TituloPagina = TituloGaleria.Trim() + " - " + SiteName;
        ClassNegocio.GeraTags(Page, "meta", "meta_title", new string[,] { { "name", "title" }, { "content", TituloPagina } });
        this.Parent.Page.Title = TituloPagina;

        if (String.IsNullOrEmpty(DestaqueGaleria))
        {
            ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", "Maior portal de conteúdo e noticias do interior do estado de São Paulo. Fique informado sobre tudo o que acontece na sua cidade, no Brasil e no mundo. Notícias sobre cotidiano, cultura, esporte, economia, entretenimento, política e outros conteúdos." } });
        }
        else
        {
            ClassNegocio.GeraTags(Page, "meta", "metadescription", new string[,] { { "name", "description" }, { "content", DestaqueGaleria } });
        }
        this.Parent.Page.MetaDescription = DestaqueGaleria;

        TagsGaleria = TagsGaleria.Replace("em, ", "").Replace("na, ", "").Replace("no, ", "").Replace("da, ", "").Replace("de, ", "").Replace("do, ", "");
        TagsGaleria = TagsGaleria.Replace(";", ",").Replace(" ", ",");
        if (String.IsNullOrEmpty(TagsGaleria))
        {
            ClassNegocio.GeraTags(Page, "meta", "keywords", new string[,] { { "name", "keywords" }, { "content", "portal, site, notícias, cotidiano, cultura, esporte, economia, entretenimento, política, videos, fotos" } });
        }
        else
        {
            ClassNegocio.GeraTags(Page, "meta", "keywords", new string[,] { { "name", "keywords" }, { "content", TagsGaleria } });
        }
        this.Parent.Page.MetaKeywords = TagsGaleria;

        // Gera meta Tag da imagem padrão do site
        ClassNegocio.GeraTags(Page, "link", "link_imagem", new string[,] { { "rel", "image_src" }, { "content", LinkImagem } });
        ClassNegocio.GeraTags(Page, "link", "url_icon", new string[,] { { "rel", "icon" }, { "href", "/favicon.ico" } });

        //--> ADICIONA META TAGS DO FACEBOOK, TWITTER E OUTRAS NO HEAD DA PÁGINA
        if (ativarContaFacebook)
        {
            string UrlPaginaFacebook = ConfigurationManager.AppSettings["urlPaginaFacebook"];
            ClassNegocio.GeraTags(Page, "meta", "og_site_name", new string[,] { { "property", "og:site_name" }, { "content", SiteName } });
            ClassNegocio.GeraTags(Page, "meta", "og_title", new string[,] { { "property", "og:title" }, { "content", TituloGaleria } });
            ClassNegocio.GeraTags(Page, "meta", "og_description", new string[,] { { "property", "og:description" }, { "content", this.Parent.Page.MetaDescription.Trim() } });
            ClassNegocio.GeraTags(Page, "meta", "og_type", new string[,] { { "property", "og:type" }, { "content", "website" } });
            ClassNegocio.GeraTags(Page, "meta", "og_locale", new string[,] { { "property", "og:locale" }, { "content", "pt_BR" } });
            ClassNegocio.GeraTags(Page, "meta", "og_url", new string[,] { { "property", "og:url" }, { "content", "https://" + HttpContext.Current.Request.Url.Host + Page.ResolveUrl(Request.RawUrl) + "" } });
            ClassNegocio.GeraTags(Page, "meta", "og_image", new string[,] { { "property", "og:image" }, { "content", LinkImagem } });
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
            ClassNegocio.GeraTags(Page, "meta", "twitter_image_src", new string[,] { { "name", "twitter:image:src" }, { "content", LinkImagem } });
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

            // tags cxense padrão
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:title" }, { "content", TituloPagina } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "property", "cXenseParse:author" }, { "content", credito } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:description" }, { "content", this.Parent.Page.MetaDescription } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:pageclass" }, { "content", "article" } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:url" }, { "content", dominio + this.Request.RawUrl.ToString() } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:articleid" }, { "content", ID_Galeria } }, true);
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:image" }, { "content", LinkImagem } }, true);

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
            ClassNegocio.GeraTags(Page, "meta", string.Empty, new string[,] { { "name", "cXenseParse:keywords" }, { "content", TagsGaleria } }, true);
        }
        #endregion Meta-Tags CXense
    }

    private void CarregarConteudoNoSQL()
    {
        if (galeriaBsonModel != null && galeriaBsonModel.idgaleria > 0)
        {
            // verifica se a data de publicação é válida
            if (Convert.ToDateTime(galeriaBsonModel.publicacao) > DateTime.Now)
                Response.Redirect("/404.aspx", true);

            // verifica se a galeria é ativa/inativa
            if (!(bool)galeriaBsonModel.ativo)
                Response.Redirect("/404.aspx", true);

            // verifica se pertence ao site corrente
            if (!galeriaBsonModel.idsites.Split(',').Any(a => Convert.ToInt32(a) == IDSite))
                Response.Redirect("/404.aspx", true);

            TituloGaleria = galeriaBsonModel.manchete;
            DestaqueGaleria = galeriaBsonModel.destaque;
            Resumo = galeriaBsonModel.resumo;
            TagsGaleria = galeriaBsonModel.tags;
            credito = galeriaBsonModel.credito;
            DataPublicacao = galeriaBsonModel.publicacao.ToString();
            DataAtualizacao = galeriaBsonModel.atualizacao.ToString();
            DataExpiracao = galeriaBsonModel.expiracao.ToString();
            subPasta = galeriaBsonModel.subpasta;
            NivelRestricao = Convert.ToInt32(galeriaBsonModel.nivelrestricao);
            QtdFotos = galeriaBsonModel.fotos.Count().ToString();

            DateTime? dtBanco = !string.IsNullOrEmpty(DataPublicacao) ? (DateTime?)DateTime.Parse(DataPublicacao) : null;
            DataPublicacaoFormatada = String.Format("{0:d/M/yyyy HH:mm}", dtBanco);

            foreach (var attribute in galeriaBsonModel.fotos)
            {
                if (attribute == galeriaBsonModel.fotos.First())
                {
                    LinkImagem = fotolink + subPasta + attribute.thumb.ToString().Replace("_thumb", "").Replace("j.jpg", ".jpg").Replace("/", "\\");
                    break;
                }
            }

            CreateAmpCarouselNoSQL(galeriaBsonModel);
        }
    }
    private void CreateAmpCarouselNoSQL(GaleriasModelsNoSQL.GaleriasBsonModel galeriaBsonModel)
    {
        StringBuilder stringBuilderCarousel = new StringBuilder();

        stringBuilderCarousel.Append("<amp-carousel height='300' layout='fixed-height' type='carousel' role='region' aria-label=''>");

        foreach (var item in galeriaBsonModel.fotos)
        {
            var src = fotolink + subPasta + item.thumb.ToString().Replace("p.jpg", "g.jpg").Replace("_thumb.jpg", ".jpg").Replace("/", "\\");
            stringBuilderCarousel.AppendFormat("<amp-img src='{0}' width='400' height='300' alt=''></amp-img>", src);
        }

        stringBuilderCarousel.Append("</amp-carousel>");

        ltlCarousel.Text = stringBuilderCarousel.ToString();
    }
    private void CreateAmpCarouselBD(CMS.MidiaCenter.Model.McGaleriasModel mcGaleriasModel)
    {
        StringBuilder stringBuilderCarousel = new StringBuilder();

        stringBuilderCarousel.Append("<amp-carousel height='300' layout='fixed-height' type='carousel' role='region' aria-label=''>");

        foreach (var item in mcGaleriasModel.TbMC_GALERIAS_Fotos)
        {
            var src = fotolink + subPasta + item.FOTO_THUMBNAIL.ToString().Replace("p.jpg", "g.jpg").Replace("_thumb.jpg", ".jpg").Replace("/", "\\");
            stringBuilderCarousel.AppendFormat("<amp-img src='{0}' width='400' height='300' alt=''></amp-img>", src);
        }

        stringBuilderCarousel.Append("</amp-carousel>");

        ltlCarousel.Text = stringBuilderCarousel.ToString();
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

        stringBuilder.Append("        }");
        stringBuilder.Append("}");
        stringBuilder.Append("</script>");
        stringBuilder.Append("</amp-analytics>");

        return stringBuilder.ToString().Replace("'", "\"");
    }
}