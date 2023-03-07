using CMS.Personalizacoes.Front.BLL;
using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

[RoutePrefix("api/BlogsFront")]
public class BlogsFrontController : ApiController
{
    [Route("GetPostsByFilter")]
    [HttpPost]
    public string GetPostsByFilter([FromUri]string DataParaFiltro, [FromUri]string IDSecao)
    {
        try
        {
            if (string.IsNullOrEmpty(DataParaFiltro))
                return string.Empty;

            string IdPortal = ClassNegocio.GetIdPortal.ToString();
            string Tipo = "0";
            string Quantidade = "25";

            Dictionary<string, string> parametros = new Dictionary<string, string>();
            parametros.Add("idportal", IdPortal);
            parametros.Add("idsecao", IDSecao);
            parametros.Add("diretorio", "");
            parametros.Add("foto", Tipo);
            parametros.Add("quantidade", Quantidade);
            parametros.Add("sort", "");
            parametros.Add("dataFiltro", DataParaFiltro);

            TransformaPortal iTransformaPortal = new TransformaPortal();
            string Conteudo = iTransformaPortal.Ativas().Transforma("~/xsl/noticias/agencia_blogs.xsl", parametros, true);

            if (string.IsNullOrEmpty(Conteudo.Split('>')[1]))
            {
                Conteudo = "<h2 class='alert alert-danger'>Não existe post no mês!</h2>";
            }

            return Conteudo;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}