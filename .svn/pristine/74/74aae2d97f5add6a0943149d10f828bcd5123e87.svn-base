<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:output method="html" indent="yes"/>

  <xsl:include href="../xsl-funcoes/funcoes_portal.xsl"/>
  <xsl:include href="saiba-mais.xsl"/>
  <xsl:include href="barra-compartilha.xsl"/>

  <xsl:param name="diretorio" />
  <xsl:param name="idnoticia" />

  <xsl:template match="/">
    <xsl:call-template name="interna" />
  </xsl:template>

  <xsl:template name="interna">
    <xsl:for-each select="//noticia[@idnoticia=$idnoticia]">
      <xsl:if test="position()=1">
        <h2>
          <xsl:value-of select="@manchete" />
        </h2>
        <h2 class="medio">
          <xsl:value-of select="@destaque" />
        </h2>

        <div id="barrameio-noticia">

          <xsl:call-template name="barra-dados-noticia" />

          <div class="tamanho-letra">
            <p>
              Alterar o tamanho da letra
              <a href="#diminuir" onclick="letra.diminuir();return false;" title="diminuir">A-</a>
              <a href="#aumentar" onclick="letra.aumentar();return false;" title="aumentar">A+</a>
            </p>
          </div>
        </div>
        <p>
          <xsl:value-of select="detalhe/@textonoticia" disable-output-escaping="yes" />
        </p> 

        <xsl:call-template name="saiba-mais">
          <xsl:with-param name="diretorio" select="$diretorio"/>
        </xsl:call-template>

        <xsl:call-template name="barra-compartilha"/>

      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Ivan: ok - esta atualizada; imprime a barra de dados da noticia da interna -->
  <xsl:template name="barra-dados-noticia">
    <xsl:variable name="fonte-minuscula">
      <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
      <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

      <xsl:value-of select="translate(detalhe/@fonte,$ucletters,$lcletters)" />
    </xsl:variable>

    <!--<xsl:if test="$fonte-minuscula='viaeptv.com'">
      <div class="foto-autor">
        <xsl:call-template name="fotojornalista">
          <xsl:with-param name="tamanho" select="'pq'" />
        </xsl:call-template>
      </div>
    </xsl:if>-->
    <div id="noticia-dados">
      <p>
        <time itemprop="datePublished" datetime="{@publicacao}">
          <xsl:call-template name="formatahora-extenso">
            <xsl:with-param name="data" select="@publicacao">
            </xsl:with-param>
          </xsl:call-template>
          |
          <xsl:call-template name="formatasodata">
            <xsl:with-param name="data" select="@publicacao">
            </xsl:with-param>
          </xsl:call-template>
        </time>
        <br />
        <xsl:if test="$fonte-minuscula='vc na eptv'">
          <xsl:if test="@vceptv_nome!='' and @vceptv_cidade!=''">
            Enviado por: <xsl:value-of select="@vceptv_nome" />,
            <xsl:value-of select="@vceptv_cidade" />
          </xsl:if>
        </xsl:if>
        <xsl:if test="$fonte-minuscula!='vc na eptv'">
          <xsl:if test="detalhe/@fonte!=''">
            <a itemprop="url" href="{detalhe/@destinofonte}" target="_blank">
              <xsl:value-of select="detalhe/@fonte" />
            </a>
          </xsl:if>
          <xsl:if test="detalhe/@credito!='' and detalhe/@destinocredito!=''">
            /
            <xsl:variable name="credito">
              <xsl:choose>
                <xsl:when test="not(contains(detalhe/@destinocredito, 'www')) and not(contains(detalhe/@destinocredito, 'mailto')) and contains(detalhe/@destinocredito, '@')">
                  <xsl:value-of select="concat('mailto:', detalhe/@destinocredito)"/>
                </xsl:when>

                <xsl:when test="contains(detalhe/@destinocredito, 'http://www')">
                  <xsl:value-of select="detalhe/@destinocredito"/>
                </xsl:when>

                <xsl:when test="contains(detalhe/@destinocredito, 'www') and not(contains(detalhe/@destinocredito, 'http'))  ">
                  <xsl:value-of select="concat('http://', detalhe/@destinocredito)"/>
                </xsl:when>

                <xsl:otherwise>
                  <xsl:value-of select="detalhe/@destinocredito"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <a itemprop="url" href="{$credito}" target="_blank">
              <xsl:value-of select="detalhe/@credito"/>
            </a>
          </xsl:if>
        </xsl:if>
      </p>
      <xsl:call-template name="barra-compartilha"/>
    </div>
  </xsl:template>

</xsl:stylesheet>