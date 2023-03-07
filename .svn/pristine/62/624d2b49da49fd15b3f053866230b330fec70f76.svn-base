using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class editoriaBase_internaGFOT : System.Web.UI.Page
    {
        public int NivelRestricao { get; set; }
        private string editoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            editoria = "editoriaBase";
            this.Page.Title = "tituloBase";
            this.Page.MetaDescription = "metaDescBase";
            this.Page.MetaKeywords = "metaKeyBase";
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