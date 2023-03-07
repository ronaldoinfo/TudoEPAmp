using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class noticias_internaNOT : System.Web.UI.Page
    {
        public string Secao { get; set; }
        public string Editoria { get; set; }
        public string Idnoticia { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int nivelRestricao;

            Editoria = "noticias";
            Secao = "/";

            masterpages_Templates_InternaNOT_AMP master = this.Master as masterpages_Templates_InternaNOT_AMP;
            
            master.Editoria = Editoria;
            master.Diretorio = Secao;
            master.Secao = Secao;
            master.IndexarNoGoogle = true;
            nivelRestricao = Application["NivelRestricao"] != null ? Convert.ToInt32(Application["NivelRestricao"]) : 0;
            HabilitarOutputCache(nivelRestricao);
        }
        private void HabilitarOutputCache(int NivelRestricao)
        {
            // Habilita o OutputCache quando a noticia for PUBLICA (0)
            if (NivelRestricao == 0)
            {
                OutputCacheParameters outputCacheSettings = new OutputCacheParameters();
                outputCacheSettings.Duration = 12000;
                outputCacheSettings.VaryByParam = "*";
                outputCacheSettings.VaryByCustom = "idcadastro";
                InitOutputCache(outputCacheSettings);
            }
        }
    }
}