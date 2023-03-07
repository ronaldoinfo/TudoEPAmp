using FrameworkExtension.Configuration;
using FrameworkExtension.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Caching;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace CMS.Web.FrontEnd.TemplatesV55.Comuns
{
    public class ClassNegocio
    {
        public ClassNegocio()
        {
        }

        public static Int64 qtdConteudoLido
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session["qtdConteudoLido"]);
            }

            set
            {
               HttpContext.Current.Session["qtdConteudoLido"] = value;
            }
        }
        public static int GetIdPortal
        {
            get
            {
                return Convert.ToInt32(FrameworkExtension.CommonBusiness.CommonBusiness.GetConfig("id_site"));
            }
        }
        public static CMS.Interatividade.Model.Extensions.InternautaCadastroFrontendModel Usuario
        {
            get
            {
                if (HttpContext.Current.Session["usuarioSessao"] == null)
                    HttpContext.Current.Session["usuarioSessao"] = new CMS.Interatividade.Model.Extensions.InternautaCadastroFrontendModel();
                return (CMS.Interatividade.Model.Extensions.InternautaCadastroFrontendModel)HttpContext.Current.Session["usuarioSessao"];
            }
            set
            {
                HttpContext.Current.Session["usuarioSessao"] = value;
            }
        }        
        public static string getValueAppSettings(string key)
        {
            return System.Configuration.ConfigurationManager.AppSettings.AllKeys.Contains(key) ? System.Configuration.ConfigurationManager.AppSettings[key] : string.Empty;
        }
        public static String HttpRaizSite
        {
            get
            {
                return FrameworkExtension.CommonBusiness.CommonBusiness.GetHttpAddress("~/");
            }
        }
        //public static Boolean PodeTerComentario(string idNoticia)
        //{
        //    XmlDocument doc = xmlBLL.GetXmlConteudo(true);
        //    XmlNode nodeTemComentario = doc.SelectSingleNode("//noticia[@idnoticia=" + idNoticia + "]/detalhe/@contemcomentarios");
        //    if (nodeTemComentario != null)
        //    {
        //        string temComentario = nodeTemComentario.Value;
        //        if (!String.IsNullOrEmpty(temComentario) && temComentario == "S")
        //            return true;
        //    }
        //    return false;
        //}
        //public static Boolean PodeTerComentarioFacebook(string idNoticia)
        //{
        //    XmlDocument doc = xmlBLL.GetXmlConteudo(true);
        //    XmlNode nodeTemComentarioFacebook = doc.SelectSingleNode("//noticia[@idnoticia=" + idNoticia + "]/detalhe/@contemcomentarioFacebook");

        //    if (nodeTemComentarioFacebook != null)
        //    {
        //        string temComentario = nodeTemComentarioFacebook.Value;
        //        if (!String.IsNullOrEmpty(temComentario) && temComentario == "S")
        //            return true;
        //    }

        //    return false;
        //}
        public static XDocument obtemCache(string path, string nome)
        {
            if (HttpContext.Current.Cache[nome] == null)
            {
                FileStream _File = new FileStream(HttpContext.Current.Server.MapPath(path), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                HttpContext.Current.Cache.Insert(nome, XDocument.Load(_File), new CacheDependency(HttpContext.Current.Server.MapPath(path)));
                _File.Close();
            }

            return (XDocument)HttpContext.Current.Cache[nome];
        }
        private static XmlReader obtemLeitorXML(string arq)
        {
            try
            {
                return new XmlTextReader(HttpContext.Current.Server.MapPath(arq));
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("The process cannot access the file"))
                    return obtemLeitorXML(arq);
                else
                    throw ex;
            }
        }
        //public static string retornaAtributo(string xpath)
        //{
        //    XmlDocument docPortal = xmlBLL.GetXml(true);
        //    XPathNavigator nav = docPortal.CreateNavigator();
        //    XPathNodeIterator iter = nav.Select(xpath);
        //    iter.MoveNext();
        //    XmlNode no = ((IHasXmlNode)iter.Current).GetNode();
        //    if (no != null)
        //        return no.Value;
        //    else
        //        return "";
        //}
        public static bool? verificaNivelRestricaoNoticia(CMS.Interatividade.Model.InteratividadeInternautaCadastroModel internautaCadastroModel, int? publicador = null)
        {
            bool? retorno = false;

            int idpublicador = NumericHelper.GetInt(FrameworkExtension.CommonBusiness.CommonBusiness.GetConfig("idpublicador"));

            try
            {
                if (internautaCadastroModel != null && internautaCadastroModel.idCadastro != 0)
                    retorno = true;
                else
                    retorno = false;
            }
            catch
            {
                retorno = false;
            }

            return retorno;
        }
        public static string GeraSenha()
        {
            int Tamanho = 8; // Numero de digitos da senha
            string senha = string.Empty;
            for (int i = 0; i < Tamanho; i++)
            {
                Random random = new Random();
                int codigo = Convert.ToInt32(random.Next(48, 122).ToString());

                if ((codigo >= 48 && codigo <= 57) || (codigo >= 97 && codigo <= 122))
                {
                    string _char = ((char)codigo).ToString();
                    if (!senha.Contains(_char))
                    {
                        senha += _char;
                    }
                    else
                    {
                        i--;
                    }
                }
                else
                {
                    i--;
                }
            }
            return senha;
        }
        public static List<string> ProcessRSSItem(string rssURL, int quantidade, string categoria)
        {
            List<string> lista = new List<string>();

            System.Xml.XmlNodeList rssItems;

            String sIpProxy = "";
            sIpProxy = "http://proxy01.globoi.com:3128";
            System.Net.WebRequest myRequest = ProxyPass(rssURL, sIpProxy);
            System.Net.WebResponse myResponse = myRequest.GetResponse();

            System.IO.Stream rssStream = myResponse.GetResponseStream();
            System.Xml.XmlDocument rssDoc = new System.Xml.XmlDocument();
            rssDoc.Load(rssStream);

            if (!string.IsNullOrEmpty(categoria))
            {
                categoria = HttpUtility.UrlEncode(categoria, Encoding.GetEncoding(28597)).Replace("+", " ");
                rssItems = rssDoc.SelectNodes("rss/channel/item[translate(category,'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüýÿ','AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeiiiinooooouuuuyy') ='" + categoria + "']");
            }
            else
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            if (rssItems.Count <= 0)
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            string title = "";
            string link = "";
            string description = "";
            string datapub = "";

            if ((rssItems.Count > 0))
            {
                for (int i = 0; i < quantidade; i++)
                {
                    if (i == rssItems.Count)
                        break;

                    System.Xml.XmlNode rssDetail;

                    rssDetail = rssItems.Item(i).SelectSingleNode("title");
                    if (rssDetail != null)
                    {
                        title = rssDetail.InnerText;
                    }
                    else
                    {
                        title = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("link");
                    if (rssDetail != null)
                    {
                        link = rssDetail.InnerText;
                    }
                    else
                    {
                        link = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("description");
                    if (rssDetail != null)
                    {
                        description = rssDetail.InnerText;
                    }
                    else
                    {
                        description = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("pubDate");
                    if (rssDetail != null)
                    {
                        datapub = rssDetail.InnerText;
                    }
                    else
                    {
                        datapub = "";
                    }
                    lista.Add("<div class='rss-item clearfix'><h2><a class='titulo' href='" + link + "' target='_blank'>" + title + "</a></h2><div class='descricao'>" + description + "</div><p class='leia-mais'><a href='" + link + "' target='_blank'> <strong>Leia mais...</strong></a></p></div>");

                }
            }
            return lista;
        }

        public static List<string> ProcessRSSItemSimples(string rssURL, int quantidade, string categoria)
        {
            List<string> lista = new List<string>();

            System.Xml.XmlNodeList rssItems;

            String sIpProxy = "";
            sIpProxy = "http://proxy01.globoi.com:3128";
            System.Net.WebRequest myRequest = ProxyPass(rssURL, sIpProxy);
            System.Net.WebResponse myResponse = myRequest.GetResponse();

            System.IO.Stream rssStream = myResponse.GetResponseStream();
            System.Xml.XmlDocument rssDoc = new System.Xml.XmlDocument();
            rssDoc.Load(rssStream);

            if (!string.IsNullOrEmpty(categoria))
            {
                categoria = HttpUtility.UrlEncode(categoria, Encoding.GetEncoding(28597)).Replace("+", " ");
                rssItems = rssDoc.SelectNodes("rss/channel/item[translate(category,'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüýÿ','AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeiiiinooooouuuuyy') ='" + categoria + "']");
            }
            else
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            if (rssItems.Count <= 0)
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            string title = "";
            string link = "";
            // string description = "";
            // string datapub = "";

            if ((rssItems.Count > 0))
            {
                for (int i = 0; i < quantidade; i++)
                {
                    if (i == rssItems.Count)
                        break;

                    System.Xml.XmlNode rssDetail;

                    rssDetail = rssItems.Item(i).SelectSingleNode("title");
                    if (rssDetail != null)
                    {
                        title = rssDetail.InnerText;
                    }
                    else
                    {
                        title = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("link");
                    if (rssDetail != null)
                    {
                        link = rssDetail.InnerText;
                    }
                    else
                    {
                        link = "";
                    }
                    lista.Add("<p class='descricao'><strong><a class='titulo' href='" + link + "' target='new'>" + title + "</a></strong> <br /></p><div class='limpa'></div>");

                }
            }
            return lista;
        }

        public static List<string> ProcessRSSItem300Random(string rssURL, int quantidade, string categoria)
        {
            List<string> lista = new List<string>();

            System.Xml.XmlNodeList rssItems;

            String sIpProxy = "";
            sIpProxy = "http://proxy01.globoi.com:3128";
            System.Net.WebRequest myRequest = ProxyPass(rssURL, sIpProxy);
            System.Net.WebResponse myResponse = myRequest.GetResponse();

            System.IO.Stream rssStream = myResponse.GetResponseStream();
            System.Xml.XmlDocument rssDoc = new System.Xml.XmlDocument();
            rssDoc.Load(rssStream);

            if (!string.IsNullOrEmpty(categoria))
            {
                categoria = HttpUtility.UrlEncode(categoria, Encoding.GetEncoding(28597)).Replace("+", " ");
                rssItems = rssDoc.SelectNodes("rss/channel/item[translate(category,'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüýÿ','AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeiiiinooooouuuuyy') ='" + categoria + "']");
            }
            else
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            if (rssItems.Count <= 0)
            {
                rssItems = rssDoc.SelectNodes("rss/channel/item");
            }

            string title = "";
            string link = "";
            string description = "";
            string datapub = "";

            if ((rssItems.Count > 0))
            {
                for (int i = 0; i < quantidade; i++)
                {
                    if (i == rssItems.Count)
                        break;

                    System.Xml.XmlNode rssDetail;

                    rssDetail = rssItems.Item(i).SelectSingleNode("title");
                    if (rssDetail != null)
                    {
                        title = rssDetail.InnerText;
                    }
                    else
                    {
                        title = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("link");
                    if (rssDetail != null)
                    {
                        link = rssDetail.InnerText;
                    }
                    else
                    {
                        link = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("description");
                    if (rssDetail != null)
                    {
                        description = rssDetail.InnerText;
                    }
                    else
                    {
                        description = "";
                    }

                    rssDetail = rssItems.Item(i).SelectSingleNode("pubDate");
                    if (rssDetail != null)
                    {
                        datapub = rssDetail.InnerText;
                    }
                    else
                    {
                        datapub = "";
                    }
                    lista.Add("<p class='descricao'><strong><a class='titulo' href='" + link + "' target='new'>" + title + "</a></strong> <br /> " + description + "<a href='" + link + "' target='new'> <strong>Leia mais...</strong></a></p><div class='limpa'></div>");
                }
            }
            return lista;
        }

        private static System.Net.WebRequest ProxyPass(string pa_uri, string pa_proxyuri)
        {
            //Cria o objeto Request
            System.Net.WebRequest oReg;
            oReg = System.Net.WebRequest.Create(pa_uri);

            //Cria o objeto Proxy
            //System.Net.WebProxy oProxy;
            //oProxy = new System.Net.WebProxy(pa_proxyuri, true); //Passa pelo Proxy

            //Cria as credenciais para utilizar no Proxy
            //oProxy.Credentials = new System.Net.NetworkCredential("", "", ""); //Caso não necessite deixe apenas as aspas. Ex:  ("", "", "")
            //oReg.Proxy = oProxy;

            return oReg;
        }

        public static string insereVoceNaEptv(string nome, string cpf, string email, string telefone, string endereco, string bairro, string cidade, string estado, string titulo, string texto, bool textosim, bool fotossim, bool videosim, string video_legenda, string video_arquivo, string video_thumb, string video_subpasta, string video_duracao, string video_largura, string video_altura, string fotos_subpasta, bool terra)
        {
            try
            {
                string sConn = ConfigurationManager.ConnectionStrings["EPTV.ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("spEMC_insereVoceNaEPTV", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter pnome = cmd.Parameters.Add("@VOCENAEPTV_NOME", SqlDbType.VarChar);
                    SqlParameter pcpf = cmd.Parameters.Add("@VOCENAEPTV_CPF", SqlDbType.VarChar);
                    SqlParameter pemail = cmd.Parameters.Add("@VOCENAEPTV_EMAIL", SqlDbType.VarChar);
                    SqlParameter pfone = cmd.Parameters.Add("@VOCENAEPTV_TELEFONE", SqlDbType.VarChar);
                    SqlParameter pendereco = cmd.Parameters.Add("@VOCENAEPTV_ENDERECO", SqlDbType.VarChar);
                    SqlParameter pbairro = cmd.Parameters.Add("@VOCENAEPTV_BAIRRO", SqlDbType.VarChar);
                    SqlParameter pcidade = cmd.Parameters.Add("@VOCENAEPTV_CIDADE", SqlDbType.VarChar);
                    SqlParameter pestado = cmd.Parameters.Add("@VOCENAEPTV_ESTADO", SqlDbType.VarChar);
                    SqlParameter ptitulo = cmd.Parameters.Add("@VOCENAEPTV_TITULO", SqlDbType.VarChar);
                    SqlParameter ptexto = cmd.Parameters.Add("@VOCENAEPTV_TEXTO", SqlDbType.VarChar);
                    SqlParameter ptextosim = cmd.Parameters.Add("@VOCENAEPTV_TEXTOSIM", SqlDbType.Bit);
                    SqlParameter pfotossim = cmd.Parameters.Add("@VOCENAEPTV_FOTOSSIM", SqlDbType.Bit);
                    SqlParameter pvideosim = cmd.Parameters.Add("@VOCENAEPTV_VIDEOSIM", SqlDbType.Bit);
                    SqlParameter pvideolegenda = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_LEGENDA", SqlDbType.VarChar);
                    SqlParameter pvideoarquivo = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_ARQUIVO", SqlDbType.VarChar);
                    SqlParameter pvideothumb = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_THUMBNAIL", SqlDbType.VarChar);
                    SqlParameter pvideosubpasta = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_SUBPASTA", SqlDbType.VarChar);
                    SqlParameter pvideoduracao = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_DURACAO", SqlDbType.VarChar);
                    SqlParameter pfotosubpasta = cmd.Parameters.Add("@VOCENAEPTV_FOTOS_SUBPASTA", SqlDbType.VarChar);
                    SqlParameter pvideolargura = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_DIMENSAO_LAR", SqlDbType.VarChar);
                    SqlParameter pvideoaltura = cmd.Parameters.Add("@VOCENAEPTV_VIDEO_DIMENSAO_ALT", SqlDbType.VarChar);
                    SqlParameter pterra = cmd.Parameters.Add("@VOCENAEPTV_TERRA", SqlDbType.Bit);

                    pnome.Value = nome;
                    pcpf.Value = cpf;
                    pemail.Value = email;
                    pfone.Value = telefone;
                    pendereco.Value = endereco;
                    pbairro.Value = bairro;
                    pcidade.Value = cidade;
                    pestado.Value = estado;
                    ptitulo.Value = titulo;
                    ptexto.Value = texto;
                    ptextosim.Value = textosim;
                    pfotossim.Value = fotossim;
                    pvideosim.Value = videosim;
                    pvideolegenda.Value = video_legenda;
                    pvideoarquivo.Value = video_arquivo;
                    pvideothumb.Value = video_thumb;
                    pvideosubpasta.Value = video_subpasta;
                    pvideoduracao.Value = video_duracao;
                    pfotosubpasta.Value = fotos_subpasta;
                    pvideolargura.Value = video_largura;
                    pvideoaltura.Value = video_altura;
                    pterra.Value = terra;

                    return cmd.ExecuteScalar().ToString();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static void insereFoto(string arquivo, string legenda, int id)
        {
            try
            {
                string sConn = ConfigurationManager.ConnectionStrings["EPTV.ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("spEMC_insereVoceNaEPTVFoto", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter pfotoarquivo = cmd.Parameters.Add("@FOTO_ARQUIVO", SqlDbType.VarChar);
                    SqlParameter plegenda = cmd.Parameters.Add("@FOTO_LEGENDA", SqlDbType.VarChar);
                    SqlParameter pid = cmd.Parameters.Add("@VOCENAEPTV_ID", SqlDbType.Int);

                    pfotoarquivo.Value = arquivo;
                    plegenda.Value = legenda;
                    pid.Value = id;

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string Host()
        {
            return ConfigurationManager.AppSettings["dominio-viaeptv"];
        }        

        #region Métodos para gerar <meta> tags no Header

        public static void GeraTags(Page pagina, string tipoTag, string tagID, string[,] arr, bool removePropertyID = false)
        {           
            if (tipoTag == "meta")
            {                
                HtmlMeta tag = new HtmlMeta();
                HtmlMeta tagTemp = new HtmlMeta();

                if ((HtmlMeta)pagina.Header.FindControl(tagID) != null)
                {
                    tag = (HtmlMeta)pagina.Header.FindControl(tagID);
                    for (int i = 0; i < arr.GetLength(0); i++)
                    {
                        for (int j = 0; j < arr.GetLength(1); j++)
                        {
                            if (arr[i, 0] == "content")
                            {
                                tag.Content = arr[i, j];

                            }
                            else if (arr[i, 0] == "name")
                            {
                                tag.Name = arr[i, j];
                            }

                            else
                            {
                                tag.Attributes.Add(arr[i, 0], arr[i, j]);
                            }
                        }
                    }
                }
                else
                {
                    if (!removePropertyID)
                        tag.ID = tagID;
                    for (int i = 0; i < arr.GetLength(0); i++)
                    {
                        for (int j = 0; j < arr.GetLength(1); j++)
                        {
                            tag.Attributes.Add(arr[i, 0], arr[i, j]);
                        }
                    }                    
                }
                pagina.Header.Controls.Add(tag);
            }
            else if (tipoTag == "link")
            {
                HtmlLink tag = new HtmlLink();
                if ((HtmlLink)pagina.Header.FindControl(tagID) != null)
                {
                    tag = (HtmlLink)pagina.Header.FindControl(tagID);
                    for (int i = 0; i < arr.GetLength(0); i++)
                    {
                        for (int j = 0; j < arr.GetLength(1); j++)
                        {
                            if (arr[i, 0] == "href")
                            {
                                tag.Href = arr[i, j];

                            }
                            else
                            {
                                tag.Attributes.Add(arr[i, 0], arr[i, j]);
                            }
                        }
                    }
                }
                else
                {
                    if (!removePropertyID)
                        tag.ID = tagID;
                    for (int i = 0; i < arr.GetLength(0); i++)
                    {
                        for (int j = 0; j < arr.GetLength(1); j++)
                        {
                            tag.Attributes.Add(arr[i, 0], arr[i, j]);
                        }
                    }
                }
                pagina.Header.Controls.Add(tag);                     
            }
        }

        public static string GetImgNoticiaInterna(string ConteudoNoticia, string FotoManchete, bool onlySrc = false)
        {
            string pattern = onlySrc == false ? "(<img\\b|(?!^)\\G)[^>]*?\\b(src)=([\"']?)([^>]*?)\\3" : "";
            string ImagemNoticia = Regex.Match(ConteudoNoticia, pattern + ">", RegexOptions.IgnoreCase).Groups[4].Value;

            if (String.IsNullOrEmpty(ImagemNoticia))
                ImagemNoticia = Regex.Match(ConteudoNoticia, pattern + ">", RegexOptions.IgnoreCase).Groups[3].Value;

            if (String.IsNullOrEmpty(ImagemNoticia))
            {
                if (!String.IsNullOrEmpty(FotoManchete))
                {
                    ImagemNoticia = ConfigurationManager.AppSettings["EMC_DBImagens"] + "/" + FotoManchete;
                }
                else
                {
                    ImagemNoticia = ConfigurationManager.AppSettings["SiteUrl"] + "/img/logos/" + ConfigurationManager.AppSettings["ImagemPadrao"];
                }
            }

            return ImagemNoticia;
        }

        public static string GetUrlImg(string ConteudoNoticia)
        {
            var str = ConteudoNoticia ;
            var regex = new Regex(@"(['""])([^'""]+\.(jpg|png|bmp|gif|webp|jpeg))\1");
            var match = regex.Match(str);
            return match.ToString();
        }

        #endregion

        #region Métodos para encurtar URL das Páginas
        public static string EncurtaUrl(string longUrl)
        {
            string bitLogin = "webmastereptv";
            string bitApiKey = "R_b728f22e970e484ba96836e222be571e";
            var url = string.Format("http://api.bit.ly/shorten?format=json&version=2.0.1&longUrl={0}&login={1}&apiKey={2}", HttpUtility.UrlEncode(longUrl), bitLogin, bitApiKey);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            try
            {
                WebResponse response = request.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    dynamic jsonResponse = js.Deserialize<dynamic>(reader.ReadToEnd());
                    string s = jsonResponse["results"][longUrl]["shortUrl"];
                    return s;
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.GetEncoding("utf-8"));
                    String errorText = reader.ReadToEnd();
                    // log errorText
                }
                throw;
            }
        }
        #endregion

      
    }
}