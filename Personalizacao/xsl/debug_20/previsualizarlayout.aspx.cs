using FrameworkExtension.Utils;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Xml;
using System.Xml.Xsl;
using CMS.Personalizacoes.Front.BLL;
using Enums = CMS.Personalizacoes.Model.Extensions.BoxControlModel;

public partial class personalizacao_xsl_debug_20_previsualizarlayout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int idlayout = NumericHelper.GetInt(Request["idLayout"]);
        string ObtemTransformacaoXslJsonString = string.Empty;

        if (idlayout == 0) 
            return;

        CMS.Personalizacoes.Model.PersonalizacaoSecoesLayoutModel secaoLayoutModel = null;
        CMS.Personalizacoes.Front.BLL.PersonalizacaoSecoesLayoutBLL personalizacaoSecoesLayoutBLL = new CMS.Personalizacoes.Front.BLL.PersonalizacaoSecoesLayoutBLL();
        secaoLayoutModel = personalizacaoSecoesLayoutBLL.GetById(idlayout);

        Enums.EnumTipoPagina tipoPagina = (Enums.EnumTipoPagina)Enum.Parse(typeof(Enums.EnumTipoPagina), secaoLayoutModel.TipoPagina.ToString());
        string urlXsl = null;
     
        CMS.Xml.Front.BLL.XmlBLL xmlBLL = new CMS.Xml.Front.BLL.XmlBLL();
        XmlDocument doc = xmlBLL.GetXml(true);

        XsltArgumentList args = new XsltArgumentList();

        urlXsl = FrameworkExtension.CommonBusiness.CommonBusiness.GetHttpAddress("~/personalizacao/xsl/xsl-personalizadores/personalizador-secao-linha.aspx?idLayout=" + Request["idLayout"]);
        CMS.Personalizacoes.Front.BLL.TransformaXslBLL transformaXslBLL = new CMS.Personalizacoes.Front.BLL.TransformaXslBLL();

        this.principal.Text = this.principal.Text = transformaXslBLL.ObtemTransformacaoXsl(urlXsl, args, true, doc);
        principal.Text = principal.Text.Replace("///", "/");
		
        ExtensoesXslBLL extensoesXslBLL = new ExtensoesXslBLL();
        extensoesXslBLL.LimpaListaConteudoSelecionado();
    }
}
