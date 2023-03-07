<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>  
  <xsl:param name="idsecao" />
  <xsl:param name="idsecaoinicial" />
  <xsl:param name="nomediretorio" />
  <xsl:param name="idnoticia" />

  <xsl:template match="/">

    <xsl:variable name="_idsecao">
      <xsl:if test="$idnoticia=''">
        <xsl:if test="$nomediretorio!=''">
          <xsl:call-template name="descobre-idsecao">
            <xsl:with-param name="diretorio" select="$nomediretorio" />
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="$nomediretorio=''">
          <xsl:value-of select="$idsecao"/>
        </xsl:if>
      </xsl:if>
        
      <xsl:if test="$idnoticia!=''">
        <xsl:value-of select="//noticia[@idnoticia=$idnoticia]/../@idsecao"/>
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="bread-crumb">
      <xsl:with-param name="idsecao" select="$_idsecao" />
      <xsl:with-param name="idsecaoinicial" select="$_idsecao" />
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template name="bread-crumb">
    <xsl:param name="idsecao" />
    <xsl:param name="idsecaoinicial" />
    
    <xsl:for-each select="//portal[@idsecao=$idsecao]">
      <xsl:if test="position()=1">
        <xsl:call-template name="bread-crumb">
          <xsl:with-param name="idsecao" select="@idsecaopai" />
        </xsl:call-template>

        <xsl:call-template name="linksecao">
          <xsl:with-param name="nomesecao" select="@nomesecao" />
          <xsl:with-param name="diretorio" select="''" />
        </xsl:call-template>
        
        <xsl:if test="$idsecaoinicial=''">
          >
        </xsl:if>
        
      </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each select="//editoria[@idsecao=$idsecao]">
      <xsl:if test="position()=1">
        <xsl:call-template name="bread-crumb">
          <xsl:with-param name="idsecao" select="@idsecaopai" />
        </xsl:call-template>

        <xsl:call-template name="linksecao">
          <xsl:with-param name="nomesecao" select="@nomesecao" />
          <xsl:with-param name="diretorio" select="@diretorio" />
        </xsl:call-template>

        <xsl:if test="$idsecaoinicial=''">
          >
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each select="//secao[@idsecao=$idsecao]">
      <xsl:if test="position()=1">
        <xsl:call-template name="bread-crumb">
          <xsl:with-param name="idsecao" select="../@idsecao" />
        </xsl:call-template>

        <xsl:call-template name="linksecao">
          <xsl:with-param name="nomesecao" select="@nomesecao" />
          <xsl:with-param name="diretorio" select="../@diretorio" />
        </xsl:call-template>
        
        <xsl:if test="$idsecaoinicial=''">
          >
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each select="//subsecao[@idsecao=$idsecao]">
      <xsl:if test="position()=1">
        <xsl:call-template name="bread-crumb">
          <xsl:with-param name="idsecao" select="../@idsecao" />
        </xsl:call-template>

        <xsl:call-template name="linksecao">
          <xsl:with-param name="nomesecao" select="@nomesecao" />
          <xsl:with-param name="diretorio" select="../../@diretorio" />
        </xsl:call-template>
        
        <xsl:if test="$idsecaoinicial=''">
          >
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
    
  </xsl:template>
</xsl:stylesheet>