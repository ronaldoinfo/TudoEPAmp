using System;
using System.Configuration;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class Template_AMP_Master : System.Web.UI.MasterPage
    {
        //-> ADICIONADO PARA HABILITAR A META TAG ROBOTS ** TRUE = ALL; FALSE = NOINDEX,NOFOLLOW 
        public bool? IndexarNoGoogle { get; set; }
        //-> ativa Modulo CXENSE
        public bool ativarModuloCXENSE { get; set; }
        //-> ativa Modulo TABULA
        public bool ativarModuloTABULA = false;
        //-> ativa Conta Twitter
        public bool ativarContaTwitter = false;
        //-> ativa Conta Instagram
        public bool ativarContaInstagram = false;
        //-> ativa Conta Facebook
        public bool ativarContaFacebook = false;
        //-> ativa Conta GPlus
        public bool ativarGPlus = false;

        //-> informações do SITE, EDITORIA e PAGINA
        public static string IdSite = String.Empty;
        public string Editoria { get { return _editoria; } set { _editoria = value; } }
        public string Secao { get { return _secao; } set { _secao = value; } }
        public string TipoClasse { get { return _tipoclasse; } set { _tipoclasse = value; } }

        private string _editoria = String.Empty;
        private string _secao = String.Empty;
        private string _tipoclasse = String.Empty;

        public static string isHome;
        protected void Page_Init(object sender, EventArgs e)
        {
            IdSite = FrameworkExtension.CommonBusiness.CommonBusiness.GetConfig("id_site");
            isHome = System.Web.HttpContext.Current.Request.Url.ToString().ToLower().Contains("/default.aspx") ? "true" : "false";

            ativarModuloCXENSE = ConfigurationManager.AppSettings["ativarModuloCXENSE"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloCXENSE"]) : false;
            ativarModuloTABULA = ConfigurationManager.AppSettings["ativarModuloTABULA"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarModuloTABULA"]) : false;
            ativarContaTwitter = ConfigurationManager.AppSettings["ativarContaTwitter"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaTwitter"]) : false;
            ativarContaInstagram = ConfigurationManager.AppSettings["ativarContaInstagram"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaInstagram"]) : false;
            ativarContaFacebook = ConfigurationManager.AppSettings["ativarContaFacebook"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarContaFacebook"]) : false;
            ativarGPlus = ConfigurationManager.AppSettings["ativarGPlus"] != null ? Convert.ToBoolean(ConfigurationManager.AppSettings["ativarGPlus"]) : false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
    }
}