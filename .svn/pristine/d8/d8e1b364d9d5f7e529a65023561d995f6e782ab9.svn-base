<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:import href="../../xsl/xsl-funcoes/funcoes_portal_v6.xsl" />

  <xsl:template name="box_podcast_manchete_a300">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div id="box_podcast_manchete_a300">
      <h3 class="no-margin-top no-margin-bottom">
        <xsl:call-template name="linkmanchete">
          <xsl:with-param name="conteudo" select="$manchete"/>
          <xsl:with-param name="link" select="$link"/>
        </xsl:call-template>
      </h3>
    </div>

  </xsl:template>
</xsl:stylesheet>