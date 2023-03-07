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
    public partial class masterpages_Templates_Interna_AMP : System.Web.UI.MasterPage
    {
        public bool? IndexarNoGoogle { get; set; }

        public bool ativarModuloTABULA = false;

        public static string IdSite = String.Empty;
        public string Editoria { get { return _editoria; } set { _editoria = value; } }
        public string Secao { get { return _secao; } set { _secao = value; } }

        private string _editoria = String.Empty;

        private string _secao = String.Empty;
        public int NivelRestricao { get; set; }
        public string SiteUrlHtml { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                Secao = "";
            Template_AMP_Master master = this.Master as Template_AMP_Master;
            master.IndexarNoGoogle = IndexarNoGoogle;
            master.Editoria = _editoria;
            master.Secao = _secao;
            CMS.Noticia.Front.Common.CacheHelper cacheHelper = new Noticia.Front.Common.CacheHelper();
            cacheHelper.Manipula();
        }
    }
}