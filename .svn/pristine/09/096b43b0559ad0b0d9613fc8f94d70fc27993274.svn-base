<%@ Page Language="C#" ContentType="text/xsl"%><?xml version="1.0" encoding="utf-8" ?>
<script language="CS" runat="server">
     public string diretorio = FrameworkExtension.CommonBusiness.CommonBusiness.RequestPosicaoZeroString;
</script>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" encoding="utf-8" />
<xsl:include href="../xsl-funcoes/funcoes_portal.xsl"/>
<xsl:key name="editoria-noticias" match="//editoria[@diretorio='<%=diretorio %>']//noticia" use="@idnoticia"/>
  <xsl:variable name="diretorio" select="'<%=diretorio %>'" />
  <xsl:template match="/">
    <div class="box l640">
      <div class="tit-box cor-ref">Mais Notícias</div>
      <div class="intbox">
        <ul class="lista-not">
          <xsl:for-each select="//editoria[@diretorio=$diretorio]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.)=generate-id(key('editoria-noticias',@idnoticia)[1])]">
            <xsl:sort select="@publicacao" order="descending"/>
            <xsl:if test="position() &lt; 11">
              <li>
                <div class="lista-data">
                  <xsl:call-template name="formatadata-extenso">
                    <xsl:with-param name="data" select="@publicacao"/>
                  </xsl:call-template>
                </div>
                <div class="lista-hora">
                  <xsl:call-template name="formatahora-extenso">
                    <xsl:with-param name="data" select="@publicacao"/>
                  </xsl:call-template>
                </div>
                <xsl:call-template name="cria-link-diretorio" />
              </li>
            </xsl:if>
          </xsl:for-each>
        </ul>
        <div class="vejamais">
          <p>
            <a href="{$diretorio}/agencia.aspx" class="mais"> <i class="fa fa-plus-circle"></i> notícias</a>
          </p>
        </div>
      </div>
    </div>
  </xsl:template>
  
  </xsl:stylesheet>