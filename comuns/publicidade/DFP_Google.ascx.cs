using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
    public partial class comuns_publicidade_DFP_Google : System.Web.UI.UserControl
    {
    public string DFP_Page { get; set; }
    public string DFP_listpos { get; set; }
    public string DFP_IDpagina { get; set; }
    public string DFP_Rede { get; set; }
    public string DFP_pgStr { get; set; }
    public string DFP_adUnitPage { get; set; }

    protected void Page_Load(object sender, EventArgs e)
        {
        //Parametro Obrigatório: IdRede e Nome_Site devem ser alterados conforme site
        string Nome_Site = "acidadeon";
        DFP_Rede = "43785210";

        string[] urlSplit = Page.ResolveUrl(Request.RawUrl.Replace("/especiais", "")).Split('/');
        urlSplit.SetValue(Nome_Site, 0);
        string urlPagina = urlSplit.Last();
        int qtd_par = urlSplit.Skip(1).Count();

        if (urlSplit.Last().Contains("GFOT"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "foto" } });
        }
        else if (urlSplit.Last().Contains("VID"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "video" } });
        }
        else if (urlSplit.Last().Contains("SOM"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "podcast" } });
        }
        else if (urlSplit.Last().Contains("NOT"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "noticia" } });
        }
        else if (urlSplit.Last().Contains("DIV"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "entretenimento" } });
        }
        else if (urlSplit.Last().Contains("CIN"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "entretenimento" } });
        }
        else if (urlSplit.Last().Contains("BLOG"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "postblog" } });
        }
        else if (urlSplit.Last().Contains("default.aspx"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgCategoria", new string[,] { { "name", "dfp_pgCategoria" }, { "content", "home" } });
        }

        if (!urlSplit.Last().ToLower().Contains("default") && !urlSplit.Last().Contains("previsualizarlayout"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgTipo", new string[,] { { "name", "dfp_pgTipo" }, { "content", "interna" } });
            DFP_adUnitPage = Nome_Site + ">interna";
            ClassNegocio.GeraTags(Page, "meta", "dfp_adUnitPage", new string[,] { { "name", "dfp_adUnitPage" }, { "content", DFP_adUnitPage } });
        }
        else if (urlSplit.Last().ToLower().Contains("default") || !urlSplit.Last().Contains("previsualizarlayout"))
        {
            ClassNegocio.GeraTags(Page, "meta", "dfp_pgTipo", new string[,] { { "name", "dfp_pgTipo" }, { "content", "home" } });
            DFP_adUnitPage = Nome_Site + ">home";
            ClassNegocio.GeraTags(Page, "meta", "dfp_adUnitPage", new string[,] { { "name", "dfp_adUnitPage" }, { "content", DFP_adUnitPage } });
        }

        if (qtd_par < 4)
        {
            DFP_Page = "~" + string.Join("/", urlSplit.Take(urlSplit.Length - 1)) + "*";
            DFP_pgStr = string.Join("/", urlSplit.Take(urlSplit.Length - 1));
        }
        else
        {
            if (qtd_par == 4)
            {
                DFP_Page = "~" + string.Join("/", urlSplit.Take(urlSplit.Length - 3));
                DFP_Page = DFP_Page + "/" + urlSplit[3].ToString() + "*";
                DFP_pgStr = string.Join("/", urlSplit.Take(urlSplit.Length - 3));
                DFP_pgStr = DFP_pgStr + "/" + urlSplit[3].ToString();
            }
            else
            {
                DFP_Page = "~" + string.Join("/", urlSplit.Take(urlSplit.Length - 3));
                DFP_Page = DFP_Page + "/" + urlSplit[4].ToString() + "*";
                DFP_pgStr = string.Join("/", urlSplit.Take(urlSplit.Length - 3));
                DFP_pgStr = DFP_pgStr + "/" + urlSplit[4].ToString();
            }
        }
        ClassNegocio.GeraTags(Page, "meta", "dfp_pgStr", new string[,] { { "name", "dfp_pgStr" }, { "content", DFP_pgStr.ToLower() } });
        ClassNegocio.GeraTags(Page, "meta", "dfp_Page", new string[,] { { "name", "dfp_Page" }, { "content", DFP_Page.ToLower() } });
    }
}
