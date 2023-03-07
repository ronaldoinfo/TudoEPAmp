<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:param name="editoria" />
  <xsl:param name="idnoticia" />

  <xsl:template match="/">
    <xsl:if test="$idnoticia!=''">
      <xsl:call-template name="head" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="head">
    <xsl:for-each select="//noticia[@idnoticia=$idnoticia]">
      <xsl:if test="position()=1">
        <title>
          <xsl:value-of select="concat(@assunto,': ',@manchete, $editoria)"/>
        </title>
        <meta name="keywords" content="{@assunto}, {@tags}" />
        <meta name="description" content="{@manchete} - {@destaque}" />
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>