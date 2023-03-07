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
          <li itemscope="" itemtype="http://schema.org/NewsArticle" >
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
        <xsl:value-of select="8"/>
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

    <div id="bc_agencia_eptv_com_imagem">
    <header>
      <h4 class="card-header no-padding-right">
        últimas notícias
        <a href="agencia.aspx" class="link link-access right pt-10">Ver todas</a>
      </h4>
    </header>
    
    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <ul class="schedule schedule-simple no-padding-top mg-bt-30">
      <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <li itemscope="" itemtype="http://schema.org/Periodical" >
            <xsl:text disable-output-escaping="yes">&lt;meta itemprop="headline" content="</xsl:text><xsl:call-template name="get-manchete"><xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/></xsl:call-template><xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
            <div class="col-12 date align-middle no-padding-left">

				<h3>
				<xsl:call-template name="carregaImagensBoxes" />
					<time itemprop="datePublished" class="col-lg-3 col-3 date align-middle no-padding-left h5" datetime="{@publicacao}">
					  <xsl:call-template name="formatahora-extenso">
						<xsl:with-param name="data" select="@publicacao">
						</xsl:with-param>
					  </xsl:call-template>
					</time>
				  <xsl:call-template name="cria-link-diretorio" />
				</h3>
            </div>
          </li>          
        </xsl:if>
      </xsl:for-each>
    </ul>
	
    </div>
	
	
  </xsl:template>
  
</xsl:stylesheet>