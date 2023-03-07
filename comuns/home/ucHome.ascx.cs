using System;
using System.IO;
using System.Web;

namespace CMS.Web.FrontEnd.TemplatesV55.Comuns
{
    public partial class ucHomeLinha : System.Web.UI.UserControl
    {
        public string editoria { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ltlconteudo.Text = CarregarHome();
            }
        }
        private string CarregarHome()
        {
            try
            {
                string htmlFile = "~/xsl/html/" + editoria + ".html";
                string pathFisico = FrameworkExtension.CommonBusiness.CommonBusiness.GetPhysicalAddress(htmlFile);

                if (!File.Exists(pathFisico))
                {
                    return "<div class='container'>É necessário gerar/publicar o layout no backend.</div>";
                }

                var htmlCache = HttpRuntime.Cache[pathFisico] != null ? HttpRuntime.Cache[pathFisico].ToString() : null;

                if (htmlCache == null)
                {
                    HttpRuntime.Cache.Insert(pathFisico, System.IO.File.ReadAllText(pathFisico));
                    htmlCache = HttpRuntime.Cache[pathFisico].ToString();
                    return htmlCache;
                }
                else
                {
                    return htmlCache;
                }

            }
            catch (Exception ex)
            {
                return "Ocorreu uma exceção: " + ex.Message;
            }
        }
    }
}