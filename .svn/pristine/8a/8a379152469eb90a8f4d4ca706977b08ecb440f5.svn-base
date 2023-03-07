using System;
using System.Configuration;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class masterpages_Template_Home_AMP : System.Web.UI.MasterPage
    {
        // ADICIONADO PARA HABILITAR A META TAG ROBOTS ** TRUE = ALL; FALSE = NOINDEX,NOFOLLOW 
        public bool? IndexarNoGoogle { get; set; }

        //-> ativa Modulo TABULA
        public bool ativarModuloTABULA = false;

        //-> informações do SITE, EDITORIA e PAGINA
        public static string IdSite = String.Empty;
        public string Editoria { get { return _editoria; } set { _editoria = value; } }
        public string Secao { get { return _secao; } set { _secao = value; } }

        private string _editoria = String.Empty;

        private string _secao = String.Empty;
        public string SiteUrlHtml { get; set; }

        public string SiteName { get; set; }
        protected void Page_Init(object sender, EventArgs e)
        {
            SiteUrlHtml = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() : string.Empty;
            SiteUrlHtml = String.Concat(SiteUrlHtml, System.Web.HttpContext.Current.Request.RawUrl.ToString());

            if (String.IsNullOrEmpty(SiteName))
                SiteName = ConfigurationManager.AppSettings["SiteName"].ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Editoria))
                Editoria = "home";

            if (string.IsNullOrEmpty(Secao))
                Secao = "";

            Template_AMP_Master master = this.Master as Template_AMP_Master;
            master.IndexarNoGoogle = IndexarNoGoogle;
            master.Editoria = _editoria;
            master.Secao = _secao;
        }
    }
}