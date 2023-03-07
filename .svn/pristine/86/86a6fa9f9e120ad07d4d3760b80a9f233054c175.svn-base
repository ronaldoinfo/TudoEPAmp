<%@ Page Language="C#" %>

<%@ Import Namespace="FrameworkExtension" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.Net.Http.Headers" %>
<%@ Import Namespace="Newtonsoft.Json" %>

<script runat="server" type="text/C#">
    public List<CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL> Linhas { get; set; }
    public List<CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL> Boxes { get; set; }
    private List<string> atributosInterno = new List<string>();

    public List<string> AtributosInterno
    {
        get
        {
            if (atributosInterno.Count == 0)
            {
                atributosInterno.Add("nome");
                atributosInterno.Add("idmodelobox");
                atributosInterno.Add("xsltemplate");
                atributosInterno.Add("xpathinicial");
                atributosInterno.Add("categoria");
                atributosInterno.Add("tipobox");
                atributosInterno.Add("xpathformat");
                atributosInterno.Add("tiponoticia");
                atributosInterno.Add("tiponoticiamodelo");
                atributosInterno.Add("cidade");
                atributosInterno.Add("srcusercontrol");
            }

            return atributosInterno;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int idlayout = FrameworkExtension.Utils.NumericHelper.GetInt(Request["idLayout"]);

        // - - - - - - - - - - - - - - - - - - - - - - - -
        // Carrega o xsl de personalização padrão
        // - - - - - - - - - - - - - - - - - - - - - - - -

        CMS.Personalizacoes.Front.BLL.PersonalizacaoSecoesLayoutBLL personalizacaoSecoesLayoutBLL = new CMS.Personalizacoes.Front.BLL.PersonalizacaoSecoesLayoutBLL();
        CMS.Personalizacoes.Model.PersonalizacaoSecoesLayoutModel secaoLayoutModel = null;

        secaoLayoutModel = personalizacaoSecoesLayoutBLL.GetById(idlayout);

        var secaoControlEdit = new CMS.Personalizacoes.Front.BLL.SecaoPersonalizacaoControlBLL(secaoLayoutModel);

        if (!secaoControlEdit.Carregar())
            throw new Exception("Ocorreu um erro ao tentar carregar o XML do layout " + idlayout.ToString());

        // Cria objeto Linhas e Boxes vazio
        this.Linhas = new List<CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL>();
        this.Boxes = new List<CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL>();

        // Criar uma lista apenas com os boxes
        foreach (var linha in secaoControlEdit.BoxControlsPersonalizacao)
        {
            this.Linhas.Add(linha);
            foreach (var colunas in linha.BoxControlsPersonalizacao)
                foreach (var box in colunas.BoxControlsPersonalizacao)
                    this.Boxes.Add(box);
        }
    }

    public string GerarXPathBox(CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL box, bool isTagKey)
    {
        if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idsecao")
            && !string.IsNullOrEmpty(box.BoxControlPersonalizacaoParent.Atributos["idsecao"])
            && box.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Dinamico)
        {
            var strWhere = "";
            var nomeKey = box.XSLTemplate + "_" + box.GetHashCode();

            if (box.Atributos.ContainsKey("tiponoticia") && !string.IsNullOrEmpty(box.Atributos["tiponoticia"]))
                strWhere += "[" + box.Atributos["tiponoticia"] + "]";

            if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("cidade") && !string.IsNullOrEmpty(box.BoxControlPersonalizacaoParent.Atributos["cidade"]))
                strWhere += "[" + box.BoxControlPersonalizacaoParent.Atributos["cidade"] + "]";

            if (!isTagKey)
            {
                strWhere += string.Format("[generate-id(.) = generate-id(key('{0}', @idnoticia)[1])]", nomeKey);
                strWhere += "[xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]";
            }

            var strXPath = "";
            var keyUse = "";
            var IdCanal = string.Empty;

            if (box.Atributos.ContainsKey("XMLVideos") && !string.IsNullOrEmpty(box.Atributos["XMLVideos"]))
            {
                if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] == "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$videos//midiaCenter//*[@idsecao={0}]//*[@idcanal={1}]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idvideo";
                }
                else if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] != "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$videos//midiaCenter//*[@idcanal={1}]//*[@idsecao={0}]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idvideo";
                }
                else
                {
                    strXPath = string.Format("$videos//midiaCenter//*[@idsecao={0}]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"]);
                    keyUse = "@idvideo";
                }
            }
            else if (box.Atributos.ContainsKey("XMLSons") && !string.IsNullOrEmpty(box.Atributos["XMLSons"]))
            {
                if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] == "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$sons//midiaCenter//*[@idsecao={0}]//*[@idcanal={1}]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idsom";
                }
                else if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] != "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$sons//midiaCenter//*[@idcanal={1}]//*[@idsecao={0}]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idsom";
                }
                else
                {
                    strXPath = string.Format("$sons//midiaCenter//*[@idsecao={0}]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"]);
                    keyUse = "@idsom";
                }
            }
            else if (box.Atributos.ContainsKey("XMLGalerias") && !string.IsNullOrEmpty(box.Atributos["XMLGalerias"]))
            {
                if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] == "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$galerias//midiaCenter//*[@idsecao={0}]//*[@idcanal={1}]//galeria[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idgaleria)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idgaleria";
                }
                else if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] != "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("$galerias//midiaCenter//*[@idcanal={1}]//*[@idsecao={0}]//galeria[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idgaleria)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idgaleria";
                }
                else
                {
                    strXPath = string.Format("$galerias//midiaCenter//*[@idsecao={0}]//galeria[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idgaleria)=false]", box.BoxControlPersonalizacaoParent.Atributos["idsecao"]);
                    keyUse = "@idgaleria";
                }
            }
            else
            {
                // Acrescentado verificação de nodes CANAL por: Ronaldo 31-07-2019
                if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] == "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("//*[@idsecao={0}]//*[@idcanal={1}]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" + strWhere, box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idnoticia";
                }
                else if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idcanal") && box.BoxControlPersonalizacaoParent.Atributos["idsecao"] != "1")
                {
                    IdCanal = box.BoxControlPersonalizacaoParent.Atributos["idcanal"];
                    strXPath = string.Format("//*[@idcanal={1}]//*[@idsecao={0}]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" + strWhere, box.BoxControlPersonalizacaoParent.Atributos["idsecao"], IdCanal);
                    keyUse = "@idnoticia";
                }
                else
                {
                    strXPath = string.Format("//*[@idsecao={0}]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" + strWhere, box.BoxControlPersonalizacaoParent.Atributos["idsecao"]);
                    keyUse = "@idnoticia";
                }
            }

            if (box.BoxControlPersonalizacaoParent.Atributos.ContainsKey("idsites"))
            {
                strXPath += string.Format("[xsl-extensoes:estaem(@idsites,{0})]" + strWhere, box.BoxControlPersonalizacaoParent.Atributos["idsites"]);
                keyUse = "@idnoticia";
            }

            if (isTagKey)
            {
                var tag = "<xsl:key name=\"{0}\" match=\"{1}\" use=\"{2}\"/>";
                return string.Format(tag, nomeKey, strXPath, keyUse);
            }

            return strXPath;
        }

        return "";
    }

    public void GeraCallTemplate(CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL box)
    {
        if (box.BoxControlsPersonalizacao.Count > 0)
        {
            var position = 1;
            foreach (var intbox in box.BoxControlsPersonalizacao)
            {
                // MEDIACENTER MOD5 ESTATICO
                if (intbox.Atributos.ContainsKey("secao_id") && !string.IsNullOrEmpty(intbox.Atributos["secao_id"])
                    && box.Atributos.ContainsKey("emc") && box.Atributos["emc"] == "5"
                    && intbox.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Estatico)
                {
                    var cssStyle = position > 1 ? "display:none;" : "";
                    this.Write("<div id=\"aba{0}\" style=\"{1}\">", position.ToString(), cssStyle);
                    this.Write("<xsl:call-template name=\"{0}\">", intbox.XSLTemplate);
                    this.MontaAtributos(intbox);
                    this.Write("</xsl:call-template>");
                    this.Write("</div>");
                }
                else
                {
                    var cond = "";
                    if (box.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Estatico)
                        cond = "1=1";
                    else
                        cond = "position()=" + position.ToString();

                    this.Write("<xsl:if test=\"{0}\">", cond);

                    var idnoticia = "";
                    if (intbox.Atributos.ContainsKey("idnoticia") && !string.IsNullOrEmpty(intbox.Atributos["idnoticia"]))
                    {
                        idnoticia = "'" + intbox.Atributos["idnoticia"] + "'";
                    }
                    else
                    {
                        if (box.Atributos.ContainsKey("XMLVideos"))
                            idnoticia = "@idvideo";
                        else if (box.Atributos.ContainsKey("XMLGalerias"))
                            idnoticia = "@idgaleria";
                        else if (box.Atributos.ContainsKey("XMLSons"))
                            idnoticia = "@idsom";
                        else
                            idnoticia = "@idnoticia";
                    }

                    // Indica a noticia como selecionada, salvo os da categoria genericos que são publicicade, selos, separadores de linhas entre outros que desejarmos.
                    if (!box.Categoria.ToLower().Equals("genericos"))
                        this.Write("<xsl:value-of select=\"xsl-extensoes:SetValorSelecionado({0})\" />", idnoticia);

                    this.Write("<xsl:call-template name=\"{0}\">", box.XSLTemplate);

                    if (box.TipoBox != CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Dinamico)
                        this.MontaAtributos(intbox);

                    var positionParam = position == box.BoxControlsPersonalizacao.Count ? "'ultimo'" : position.ToString();
                    this.Write("<xsl:with-param name=\"position\" select=\"{0}\" />", positionParam);

                    this.Write("</xsl:call-template>");
                    this.Write("</xsl:if>");
                }
                position++;
            }
        }
        else
        {
            var cond = "";
            if (box.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Estatico)
                cond = "1=1";
            else
                cond = "position()=1";

            this.Write("<xsl:if test=\"{0}\">", cond);

            var idnoticia = "";
            if (box.Atributos.ContainsKey("idnoticia") && !string.IsNullOrEmpty(box.Atributos["idnoticia"]))
            {
                idnoticia = "'" + box.Atributos["idnoticia"] + "'";
            }
            else
            {
                if (box.Atributos.ContainsKey("XMLVideos"))
                    idnoticia = "@idvideo";
                else if (box.Atributos.ContainsKey("XMLGalerias"))
                    idnoticia = "@idgaleria";
                else if (box.Atributos.ContainsKey("XMLSons"))
                    idnoticia = "@idsom";
                else
                    idnoticia = "@idnoticia";
            }

            // Indica a noticia como selecionada, salvo os da categoria genericos que são publicicade, selos, separadores de linhas entre outros que desejarmos.
            if (!box.Categoria.ToLower().Equals("genericos"))
                this.Write("<xsl:value-of select=\"xsl-extensoes:SetValorSelecionado({0})\" />", idnoticia);

            this.Write("<xsl:call-template name=\"{0}\">", box.XSLTemplate);

            if (box.TipoBox != CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Dinamico)
                this.MontaAtributos(box);

            this.Write("</xsl:call-template>");
            this.Write("</xsl:if>");
        }
    }

    public void GerarAbasEMC(CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL coluna)
    {
        foreach (var box in coluna.BoxControlsPersonalizacao)
        {
            if (box.Atributos.ContainsKey("emc") && box.Atributos["emc"] == "5" && box.BoxControlsPersonalizacao.Count > 1)
            {
                this.Write("<div class=\"abas-videos\">");
                this.Write("<ul id=\"abas\" class=\"abas\">");

                var position = 1;
                foreach (var intbox in box.BoxControlsPersonalizacao)
                {
                    this.Write("<xsl:call-template name=\"monta-aba\">");
                    this.MontaAtributos(intbox);
                    this.Write("<xsl:with-param name=\"pos\" select=\"{0}\" />", position.ToString());
                    this.Write("</xsl:call-template>");
                    position++;
                }

                this.Write("</ul>");
                this.Write("</div>");

            }
        }
    }

    public void MontaAtributos(CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL box)
    {
        foreach (var attr in box.Atributos)
        {
            if (!AtributosInterno.Contains(attr.Key))
            {
                var value = attr.Value.Replace("\"", "&quot;");
                value = value.Replace("'", "&apos;");
                this.Write("<xsl:with-param name=\"{0}\" select=\"'{1}'\" />", attr.Key, value);
            }
        }
    }

    public string MontaAtributosUserControl(CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL box)
    {
        var ret = "";

        foreach (var attr in box.Atributos)
        {
            if (!AtributosInterno.Contains(attr.Key))
            {
                var value = attr.Value.Replace("\"", "&quot;");
                value = value.Replace("'", "&apos;");
                ret += string.Format("{0}=&quot;{1}&quot; ", attr.Key, value);
            }
        }

        return ret;
    }

    public void Write(string text, params string[] args)
    {
        this.Write(text, true, args);
    }

    public void Write(string text, bool breakLine = true, params string[] args)
    {
        if (!string.IsNullOrEmpty(text))
        {
            Response.Write(string.Format(text, args) + (breakLine ? "\r\n" : ""));
        }
    }
</script>
<%
    Response.Clear();
    Response.ContentType = "text/xsl";
    //this.Write("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");
    this.Write("<xsl:stylesheet version=\"2.0\" exclude-result-prefixes=\"xsl-extensoes\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:xsl-extensoes=\"urn:xsl-extensoes\">");
    this.Write("<xsl:output method=\"xml\" encoding=\"iso-8859-1\" omit-xml-declaration=\"yes\" />");

    // Utilizar caminhos absolutos para poder ser carregado de qualquer modo - via URL ou via string em stream
    var absoluto = FrameworkExtension.CommonBusiness.CommonBusiness.GetPhysicalAddress("~/personalizacao/xsl");

    //this.Write("<xsl:include href=\"{0}\\xsl-funcoes\\funcoes_portal_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-manchetes_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-destaques_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-notas_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-agencia_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-emc_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-especiais_v5.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-especiais-jornais_v5.xsl\" />", absoluto);

    // Chamadas ref.: a versão 6 do layout
    this.Write("<xsl:include href=\"{0}\\xsl-funcoes\\funcoes_portal_v6.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-manchetes_v6.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-destaques_v6.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-notas_v6.xsl\" />", absoluto);
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-emc_v6.xsl\" />", absoluto);

    // Chamadas ref.: novos boxes específicos para podcasts
    this.Write("<xsl:include href=\"{0}\\xsl-templates\\templates-manchetes-podcasts.xsl\" />", absoluto);

    /*
     * GERA KEYS
     */
    foreach (var box in this.Boxes)
    {
        var key = this.GerarXPathBox(box, true);
        this.Write(key);
    }

    this.Write("<xsl:template match=\"/\">");
    /* 
     * GERA BOXES
     */
    var posicaolinha = 1;
    foreach (var linha in this.Linhas)
    {
        var posicaoColuna = 1;
        if (linha.TipoLinha.ToLower().Contains("fluid"))
        {
            this.Write("<section id='section" + posicaolinha + "' class=\"container-fluid pt-3\">");
            // this.Write("<div class=\"row px-0 mx-0 g-0\">");
            this.Write("<div class=\"row gy-3\">");
        }
        else
        {
            this.Write("<section id='section" + posicaolinha + "' class=\"container pt-3\">");
            this.Write("<div class=\"row gy-3\">");
        }

        foreach (var coluna in linha.BoxControlsPersonalizacao)
        {
            var strClass = "";

            if (linha.TipoLinha.ToLower().Contains("fluid"))
            {
                string nomesecao = string.Empty;
                string canal = coluna.Atributos.ContainsKey("canal") ? coluna.Atributos["canal"].ToString().Replace("?", "").ToLower() : string.Empty;
                if (!String.IsNullOrEmpty(canal))
                {
                    nomesecao = canal;
                }
                else
                {
                    nomesecao = coluna.Atributos["nomesecao"].ToString().Replace("?", "").ToLower();
                }

                if (coluna.WidthBox == 1200)
                {
                    strClass = "col-12 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 600)
                {
                    strClass = "col-12 col-md-6 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 500)
                {
                    strClass = "col-12 col-md-5 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 400)
                {
                    strClass = "col-12 col-md-4 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 300)
                {
                    strClass = "col-12 col-md-3 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
            }
            else
            {
                string nomesecao = string.Empty;
                string canal = coluna.Atributos.ContainsKey("canal") ? coluna.Atributos["canal"].ToString().Replace("?", "").ToLower() : string.Empty;
                if (!String.IsNullOrEmpty(canal))
                {
                    nomesecao = canal;
                }
                else
                {
                    nomesecao = coluna.Atributos["nomesecao"].ToString().Replace("?", "").ToLower();
                }

                if (coluna.WidthBox == 900)
                {
                    strClass = "col-12 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 600)
                {
                    strClass = "col-12 col-md-8 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 450)
                {
                    strClass = "col-12 col-md-6 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }

                else if (coluna.WidthBox == 400)
                {
                    strClass = "col-12 col-md-6 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }

		        else if (coluna.WidthBox == 350)
                {
                    strClass = "col-12 col-md-6 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }

                else if (coluna.WidthBox == 300)
                {
                    strClass = "col-12 col-md-4 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
		        else if (coluna.WidthBox == 250)
                {
                    strClass = "col-12 col-md-3 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 225)
                {
                    strClass = "col-12 col-md-3 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 200)
                {
                    strClass = "col-12 col-md-2 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
                else if (coluna.WidthBox == 150)
                {
                    strClass = "col-12 col-md-2 cor-ref-" + nomesecao
                                    .Replace(ClassHelper.TipoReplace.EspacoEmBranco, "")
                                        .Replace(ClassHelper.TipoReplace.Acento, "");
                }
            }
            posicaoColuna++;

            this.Write("<div class=\"{0}\">", strClass);

            if (coluna.Atributos.ContainsKey("exibir_titulo") && coluna.Atributos["exibir_titulo"] == "True")
            {
                var titClass = FrameworkExtension.CommonBusiness.CommonBusiness.RemoveAcentuacao(coluna.Nome).Replace(" ", "-").Replace("?", "").ToLower();
                this.Write("<div class=\"tit-box {0}\"><span>{1}", titClass, coluna.Nome);

                // Gera aba: só será aplicado ao MEDIACENTER MOD5 ESTATICO
                this.GerarAbasEMC(coluna);
                this.Write("</span></div>");
            }

            var posicaoBox = 1;

            foreach (var box in coluna.BoxControlsPersonalizacao)
            {
                posicaoBox++;

                if (!string.IsNullOrEmpty(box.SrcUserControl))
                {
                    // Falta gerar atributos
                    var atributos = this.MontaAtributosUserControl(box);
                    this.Write("<xsl:value-of disable-output-escaping=\"yes\" select=\"xsl-extensoes:CarregarUserControl('{0}', '{1}')\" />", box.SrcUserControl, atributos);
                }
                else
                {
                    //Ivan: retirado para eliminar div e manter cometario xsl
                    // this.Write("<div id=\"{0}\">", box.XSLTemplate);                   
                    this.Write("<xsl:comment>{0}</xsl:comment>", box.XSLTemplate);

                    if (box.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Dinamico)
                    {
                        var xpath = this.GerarXPathBox(box, false);

                        if (!string.IsNullOrEmpty(xpath))
                        {
                            var orderBy = box.Atributos.ContainsKey("orderby") ? box.Atributos["orderby"] : "@publicacao";
                            var orderDir = box.Atributos.ContainsKey("orderdirection") ? box.Atributos["orderdirection"] : "descending";

                            this.Write("<xsl:for-each select=\"{0}\">", xpath);
                            this.Write("<xsl:sort select=\"{0}\" order=\"{1}\" />", orderBy, orderDir);

                            // GERA CALL TEMPLATE
                            this.GeraCallTemplate(box);

                            this.Write("</xsl:for-each>");
                        }
                    }
                    else if (box.TipoBox == CMS.Personalizacoes.Front.BLL.BoxControlPersonalizacaoBLL.EnumTipoBox.Estatico)
                    {
                        // GERA CALL TEMPLATE
                        this.GeraCallTemplate(box);
                    }
                    //Ivan: retirado para eliminar div e manter cometario xsl
                    //this.Write("</div>");
                }
            }

            this.Write("</div>");

        }
        this.Write("</div>");  //Ivan: Fecha div do row              
        this.Write("</section>");
        posicaolinha++;
    }

    this.Write("</xsl:template>");
    this.Write("</xsl:stylesheet>");
%>