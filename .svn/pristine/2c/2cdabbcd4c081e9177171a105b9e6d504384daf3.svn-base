using FrameworkExtension.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class masterpages_Templates_InternaNOT_AMP : System.Web.UI.MasterPage
    {
        // ADICIONADO PARA HABILITAR A META TAG ROBOTS ** TRUE = ALL; FALSE = NOINDEX,NOFOLLOW 
        public bool? IndexarNoGoogle { get; set; }
        //-> ativa Modulo TABULA
        public bool ativarModuloTABULA = false;

        //-> informações do SITE, EDITORIA e PAGINA
        public static string idsite = String.Empty;
        public string Secao { get; set; }
        public string Editoria { get; set; }
        public string Diretorio { get; set; }
        public bool? Especial { get; set; }

        public string idnoticia;
        public string SiteUrlHtml { get; set; }

        CMS.Noticia.Front.Common.CacheHelper cacheHelper = new Noticia.Front.Common.CacheHelper();

        public bool ativarModuloCXENSE = false;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ativarModuloCXENSE = ConfigurationManager.AppSettings["ativarModuloCXENSE"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloCXENSE"]) : false;
                idsite = ((Hashtable)ConfigurationManager.GetSection("viaeptv.noticia"))["id_site"].ToString();
                ativarModuloTABULA = ConfigurationManager.AppSettings["ativarModuloTABULA"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloTABULA"]) : false;
                SiteUrlHtml = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() : string.Empty;
                SiteUrlHtml = String.Concat(SiteUrlHtml, System.Web.HttpContext.Current.Request.RawUrl.ToString());
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Editoria))
                Editoria = "noticias";
            if (string.IsNullOrEmpty(Secao))
                Secao = "/noticias";
            if (string.IsNullOrEmpty(Diretorio))
                Diretorio = "/noticias";
            if (Especial == null)
                Especial = false;

            Template_AMP_Master master = this.Master as Template_AMP_Master;
            master.Editoria = Editoria;
            master.Secao = Secao;
            master.IndexarNoGoogle = IndexarNoGoogle;

            if (Request.QueryString.Count > 0)
            {
                idnoticia = FrameworkExtension.CommonBusiness.CommonBusiness.RequestPosicaoZeroString;
                cacheHelper.Manipula(this.ucNoticia_Interna_AMP.NivelRestricao);

                int intNoticia = NumericHelper.GetInt(idnoticia);
                if (intNoticia > 0)
                {
                    this.ucNoticia_Interna_AMP.IDNoticia = idnoticia;
                    this.ucNoticia_Interna_AMP.IDSite = idsite.ToInt();
                    this.ucNoticia_Interna_AMP.Editoria = Editoria;
                    this.ucNoticia_Interna_AMP.Diretorio = Diretorio;
                    this.ucNoticia_Interna_AMP.Especial = Especial;
                }
            }
        }
    }
}