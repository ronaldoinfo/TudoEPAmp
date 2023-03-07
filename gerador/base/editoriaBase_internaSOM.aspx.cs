using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class editoriaBase_internaSOM : System.Web.UI.Page
    {
        public int NivelRestricao { get; set; }
        private string Editoria { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Editoria = "editoriaBase";
            masterpages_Templates_Interna_AMP master = this.Master as masterpages_Templates_Interna_AMP;
            master.Editoria = Editoria;
            NivelRestricao = Application["NivelRestricaoSom"] != null ? Convert.ToInt32(Application["NivelRestricaoSom"]) : 0;
            master.NivelRestricao = NivelRestricao;
            HabilitarOutputCache(NivelRestricao);
        }
        private void HabilitarOutputCache(int NivelRestricao)
        {
            // Habilita o OutputCache quando o podcast for PUBLICO (0)
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