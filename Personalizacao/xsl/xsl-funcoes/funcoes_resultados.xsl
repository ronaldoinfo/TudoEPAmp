<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:variable name="imagens" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />
  
<xsl:template name="imagemescudo">
  <xsl:param name="idequipe" />

  <xsl:variable name="idmultimidia">
      <xsl:value-of select="/resultados/equipes/equipe[@idequipe=$idequipe]/@multimidia"/>
  </xsl:variable>
  
  <xsl:variable name="arqimagem">
    <xsl:if test="$idmultimidia!=''">
      <xsl:value-of select="concat($imagens,'/',$idmultimidia,'_pq.jpg')"/>
    </xsl:if>
  </xsl:variable>
  
  <xsl:if test="$arqimagem!=''">
    <img src="{$arqimagem}" alt="{@equipe}" />
  </xsl:if>

</xsl:template>

<xsl:template name="formatahora">
	<xsl:param name="data" />
	<xsl:value-of select="concat(substring($data,9,2),':',substring($data,11,2))" />
</xsl:template>

<xsl:template name="retorna-local">
  <xsl:param name="local" />
  <xsl:value-of select="/resultados/locais/local[@idlocal=$local]/@nome" />
</xsl:template>
  
<xsl:template name="retorna-local-cidade">
  <xsl:param name="local" />
  <xsl:value-of select="/resultados/locais/local[@idlocal=$local]/@cidade" />
</xsl:template>

</xsl:stylesheet>