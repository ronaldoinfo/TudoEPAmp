<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <!-- Ivan: ok - esta atualizada; imprime a barra de dados da noticia da interna -->
  <xsl:template name="barra-dados-noticia">
    <xsl:variable name="fonte-minuscula">
      <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
      <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

      <xsl:value-of select="translate(detalhe/@fonte,$ucletters,$lcletters)" />
    </xsl:variable>

    <div id="noticia-dados">
      <p>
        <time itemprop="datePublished" datetime="{@publicacao}">
          <xsl:call-template name="formatahora-extenso">
            <xsl:with-param name="data" select="@publicacao">
            </xsl:with-param>
          </xsl:call-template>
         -
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
    </div>
  </xsl:template>
</xsl:stylesheet>
