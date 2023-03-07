<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:import href="../../xsl/xsl-funcoes/funcoes_portal_v6.xsl" />
  
  <xsl:template name="bc_v6_destaqueA">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="author">
      <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
    </xsl:variable>

    <div id="bc_v6_destaqueA" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <a itemprop="url" class="img-thumb-zoom" href="{$link}" title="" data-track-category="Box - Not�cias" data-track-event="click" data-track-label="Link: Imagem Destaque - Not�cia: {$manchete}">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="tamanho" select="'150'"/>
            <xsl:with-param name="altura" select="'114'"/>
			      <xsl:with-param name="tipo" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-left'"/>
          </xsl:call-template>
        </a>
      </div>
      <h4 itemprop="headline">
          <span class="no-margin-top" itemprop="name">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </span>
      </h4>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!--bc_v6_destaqueB-->
  <xsl:template name="bc_v6_destaqueB">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="author">
      <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
    </xsl:variable>

    <div id="bc_v6_destaqueB" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <a itemprop="url" class="img-thumb-zoom" href="{$link}" title="" data-track-category="Box - Not�cias" data-track-event="click" data-track-label="Link: Imagem Destaque - Not�cia: {@manchete}">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="tamanho" select="'150'"/>
            <xsl:with-param name="altura" select="'114'"/>
			      <xsl:with-param name="tipo" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-left'"/>
          </xsl:call-template>
        </a>
      </div>
      <h4>
          <span class="no-margin-top" itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </span>
      </h4>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>

  </xsl:template>

  <!--Versão dos boxes em AMP 2023 -->
	<!--Página para validações AMP https://search.google.com/test/rich-results-->

<xsl:template name="bc_amp_destaque_a">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="link_amp_fotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
       <div class="box300-cont">
		<div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select='translate($assunto, $quot, $apos)'/>
            </xsl:call-template>
          </span>
        </div>
      <div class="info-box">
        <h2>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select='translate($manchete, $quot, $apos)'/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </div>
	  </div>
    </article>
  </xsl:template>

</xsl:stylesheet>