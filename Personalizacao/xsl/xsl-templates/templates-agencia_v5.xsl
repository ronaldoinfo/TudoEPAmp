<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- AGÊNCIA PADRAO - Assunto + Manchete - Ivan: ok revisado micro-codigos - HTML OK - Thiago -->
  <xsl:template name="bc_agencia_eptv">
    <xsl:param name="quantidade" />
    <xsl:param name="assunto" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    
    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="8"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>
    <div id="bc_agencia_eptv">
    <header>
      <h4 class="card-header no-padding-right">
        últimas notícias
        <a href="agencia.aspx" class="link link-access right pt-10">Ver todas</a>
      </h4>
    </header>
    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <ul class="schedule schedule-simple no-padding-top mg-bt-30">
      <xsl:for-each select="//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <xsl:variable name="author">
            <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
          </xsl:variable>
          <li itemscope="" itemtype="https://schema.org/NewsArticle" >
            <time itemprop="datePublished" class="col-md-3 date align-middle no-padding-left h4" >
              <xsl:call-template name="formatahora-extenso">
                <xsl:with-param name="data" select="@publicacao">
                </xsl:with-param>
              </xsl:call-template>
            </time>
            <h3 class="col-md-9 p align-middle no-padding-right" itemprop="headline">
              <xsl:call-template name="cria-link-diretorio" />
            </h3>
            <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
            <xsl:call-template name="get-destaque">
              <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
            </xsl:call-template>
            <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
            <xsl:value-of select="$author" disable-output-escaping="yes"/>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
    </div>
  </xsl:template>

  <!-- AGÊNCIA COM IMAGENS - Foto Pequena + Assunto + Manchete - Ivan: ok revisado micro-codigos -->
  <xsl:template name="bc_agencia_eptv_com_imagem">
    <xsl:param name="quantidade" />
    <xsl:param name="idsecao" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    
    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="3"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_idsecao">
      <xsl:if test="$idsecao=''">
        <xsl:value-of select="1"/>
      </xsl:if>
      <xsl:if test="$idsecao!=''">
        <xsl:value-of select="$idsecao"/>
      </xsl:if>
    </xsl:variable>

    <div id="bc_agencia_eptv_com_imagem" class="bc-nota-tabs">   
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <!-- <div class="schedule schedule-simple">
      <style type="text/css">
        .ajusta-ultimas img {width: 100%; max-height: 59px; object-fit: cover;}
      </style> -->
        <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
            <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
            <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
            <xsl:variable name="url-amigavel">
              <xsl:call-template name="cria-link" />
            </xsl:variable>
            <div class="d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
            <div class="row gx-3" itemscope="" itemtype="https://schema.org/NewsArticle"> 
              <div class="col">
                <xsl:call-template name="carregaImagensBoxes" />
              </div>
              <xsl:variable name="author">
                <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
              </xsl:variable>
              <div class="col-8">
                <div class="d-flex m-0 p-0">
                  <time itemprop="datePublished" class="chapeu fw-bolder text-uppercase small" datetime="{@publicacao}" style="color: var(--bs-primary);">
                    <xsl:call-template name="formatahora-extenso">
                    <xsl:with-param name="data" select="@publicacao">
                    </xsl:with-param>
                    </xsl:call-template>
                  </time>
                </div>
                <span class="d-block pt-2" itemprop="headline">
                  <xsl:call-template name="cria-link-diretorio" />
                </span>

				<xsl:call-template name="get-meta-foto">
					<xsl:with-param name="tipo" select="destaque"/>
				</xsl:call-template>
				  
                <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
                <xsl:call-template name="get-destaque">
                  <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
                </xsl:call-template>
                <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
                <xsl:value-of select="$author" disable-output-escaping="yes"/>
              </div>
              </div>
            </div>
          </xsl:if>
        </xsl:for-each>
      <!-- </div> -->
      <a href="agencia.aspx" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="Ver todas">
        Ver todas
      </a>
    </div>
  </xsl:template>
  
</xsl:stylesheet>