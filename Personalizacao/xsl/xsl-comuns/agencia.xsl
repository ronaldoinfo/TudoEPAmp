<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="../xsl-funcoes/funcoes_portal.xsl"/>
 
  <xsl:param name="idsecao" />
  <xsl:param name="diretorio" />

  <xsl:template match="/">
    <xsl:variable name="pegasecao">
      <xsl:if test="$idsecao=''">
        <xsl:value-of select="//editoria[@diretorio = $diretorio]/@idsecao" />
      </xsl:if>
      <xsl:if test="$idsecao!=''">
        <xsl:value-of select="$idsecao" />
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="agencia">
      <xsl:with-param name="_idsecao" select="$pegasecao"/>
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="agencia">
    <xsl:param name="_idsecao" />
    <div class="big-cont">
      <div class="box">
        <div class="intbox">
          <ul class="lista-not-interna">
            <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
              <xsl:sort select="@publicacao" order="descending" />
              <xsl:if test="position() &lt; 300 and xsl-extensoes:NaoSelecionada(@idnoticia)" >
                <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
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
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>