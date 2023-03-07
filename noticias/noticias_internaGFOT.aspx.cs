using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class noticias_noticias_internaGFOT : System.Web.UI.Page
    {
        public int NivelRestricao { get; set; }
        private string editoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            editoria = "noticias";
            this.Page.Title = "Galerias";
            this.Page.MetaDescription = "Confira as últimas galerias da editoria noticias";
            this.Page.MetaKeywords = "noticias empresas pioneiras";
            masterpages_Templates_Interna_AMP master = this.Master as masterpages_Templates_Interna_AMP;
            master.Editoria = editoria;
            NivelRestricao = Application["NivelRestricaoGaleria"] != null ? Convert.ToInt32(Application["NivelRestricaoGaleria"]) : 0;
            master.NivelRestricao = NivelRestricao;
            HabilitarOutputCache(NivelRestricao);
        }
        private void HabilitarOutputCache(int NivelRestricao)
        {
            // Habilita o OutputCache quando o video for PUBLICO (0)
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