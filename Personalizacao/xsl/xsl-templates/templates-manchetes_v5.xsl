<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- MANCHETE_A - Mega Box - Foto Mega + Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_a">
    <xsl:param name="idnoticia" />
	<xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div id="bc_manchete_a" itemscope="" itemtype="https://schema.org/NewsArticle">
      <figure class="col-md-12 no-padding fig-caption-span" >
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <!-- <xsl:with-param name="tipo" select="'manchete'"/> -->
          <xsl:with-param name="widthbox" select="'100%'" />
        </xsl:call-template>
        <figcaption>
          <span>
            <label class="tag pt-10 no-margin-bottom">
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
              </xsl:call-template>
            </label>
            <h3 class="no-margin-top no-margin-bottom" itemprop="headline">
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="$manchete"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h3>
          </span>
        </figcaption>
      </figure>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- MANCHETE_B - Big Box - Foto Big + Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_b">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div id="bc_manchete_b" class="d-block position-relative" itemscope="" itemtype="https://schema.org/NewsArticle">
      <figure class="no-padding fig-caption-span">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="cssclass" select="'img-fluid w-100 rounded-3 lazyloaded'"/>
          <xsl:with-param name="widthbox" select="'738'" />
        </xsl:call-template>
        <figcaption class="d-block w-100">
          <div class="fw-bolder small chapeu d-inline-flex align-items-center text-uppercase mb-2 mt-3" style="color: var(--bs-primary);">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
            </xsl:call-template>
          </div>
            <h2 class="display-5 lh-1 fw-bolder" itemprop="headline" style="letter-spacing: normal;">
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="$manchete"/>
                <xsl:with-param name="cssclass" select="'display'"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h2>
        </figcaption>
      </figure>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- MANCHETE_C - Multi-Box - Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_c">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div id="bc_manchete_c" itemscope="" itemtype="https://schema.org/NewsArticle">
      <span class="tag">
        <xsl:call-template name="get-assunto">
          <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
        </xsl:call-template>
      </span>
      <h3 class="no-margin-top no-margin-bottom" itemprop="headline">
        <xsl:call-template name="linkmanchete">
          <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
          <xsl:with-param name="link" select="$link"/>
        </xsl:call-template>
      </h3>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- MANCHETE_D -->
  <xsl:template name="bc_manchete_d">
    <!--Dinâmico-->
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <xsl:variable name="nome-css-class" xml:space="default">
      <xsl:choose>
        <xsl:when test="$position='1'">float-left comassunto col-12 col-md-6 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='ultimo'">float-left semassunto col-12 col-md-6 no-padding-right pd-0</xsl:when>
        <xsl:when test="$position='3'">float-left semassunto col-12 col-md-6 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='2'">float-right comassunto col-12 col-md-6 no-padding-right pd-0</xsl:when>
      </xsl:choose>
    </xsl:variable>

    <div class="{$nome-css-class}">
      <div id="bc_manchete_d" itemscope="" itemtype="https://schema.org/NewsArticle">
        <div class="manchete-item-cont align-top no-padding">
          <span class="tag p-t-10 assunto-tag">
            <xsl:call-template name="linkassunto">
              <xsl:with-param name="conteudo" select="$assunto"/>
            </xsl:call-template>
          </span>
          <h4 itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h4>
          <ul class="headline" style="display: none;">
            <li>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </li>
          </ul>
          <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
          <xsl:call-template name="get-destaque">
            <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
          </xsl:call-template>
          <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

          <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
          <xsl:value-of select="@publicacao" />
          <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
          <xsl:value-of select="@publicacao" />
          <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
          <xsl:value-of select="$author" disable-output-escaping="yes"/>
        </div>
      </div>
    </div>
  </xsl:template>

  <!-- MANCHETE_E - Manch Box - Foto Manchete + Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_e">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <xsl:variable name="chapeu">
      <xsl:if test="$assunto=''">
        <xsl:value-of select="@assunto"/>
      </xsl:if>
    </xsl:variable>

    <div id="bc_manchete_e" itemscope="" itemtype="https://schema.org/NewsArticle">
      <figure class="no-padding fig-caption-span">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="widthbox" select="'576'" />
        </xsl:call-template>
        <figcaption>
          <label class="tag pt-10 no-margin-bottom">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
            </xsl:call-template>
          </label>
          <h5 itemprop="headline" class="no-margin-top no-margin-bottom">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h5>
        </figcaption>
      </figure>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
      <xsl:call-template name="get-destaque">
        <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- MANCHETE_G - Manch Box - Foto Manchete + Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_g">
    <xsl:param name="idnoticia" />
	<xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="chapeu">
      <xsl:if test="$assunto!=''">
        <xsl:value-of select="$assunto"/>
      </xsl:if>
      <xsl:if test="$assunto=''">
        <xsl:value-of select="@assunto"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_manchete_g" class="bc_manchete_g d-block position-relative" itemscope="" itemtype="https://schema.org/NewsArticle">
      <xsl:call-template name="linkfoto">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="cssclass" select="'img-fluid w-100 rounded-3'"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="tipo" select="'destaque'"/>
        <xsl:with-param name="widthbox" select="'512'" />
      </xsl:call-template>
      <div class="d-block w-100">
        <div class="fw-bolder small chapeu d-inline-flex align-items-center text-uppercase mb-2 mt-3" style="color: var(--bs-primary);">
          <xsl:call-template name="linkassunto">
            <xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </div>
        <h3 class="h3 fw-bolder" itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'display'"/>
          </xsl:call-template>
        </h3>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
        <xsl:call-template name="get-destaque">
          <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
        </xsl:call-template>
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	    <xsl:value-of select="$author" disable-output-escaping="yes"/>
      </div>
    </div>
  </xsl:template>

  <!-- MANCHETE_G_CLUBE (Compatibilidade) - Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_g_clube">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="descontovoucher" />

    <div id="bc_manchete_g_clube" class="intbox box-manchete clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box300">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="@url"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            <xsl:with-param name="tipo" select="'destaque'"/>
            <xsl:with-param name="widthbox" select="'576'" />
          </xsl:call-template>
        </div>
        <div class="box300-cont">
          <div class="materia-assunto">
            <span>
              desconto de <xsl:value-of select="round(translate(@descontovoucher,',','.'))" />%
            </span>
          </div>
          <div class="info-box">
            <h2 style="margin-left: 5%; text-align: left;" itemprop="headline">
              <xsl:call-template name="fazlink">
                <xsl:with-param name="conteudo">
                  <xsl:value-of select="concat(substring(@manchete,1,70),'...')" />
                  <xsl:value-of select="''" />
                </xsl:with-param>
                <xsl:with-param name="link">
                  <xsl:value-of select="$link"/>
                </xsl:with-param>
              </xsl:call-template>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <!-- MANCHETE_H - Foto Manchete + Assunto + Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_h">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_manchete_h" class="article mb-3" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="card position-relative" style="background-color: var(--bs-primary);">
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete" />
          <xsl:with-param name="cssclass" select="'card-img-top img-fluid'"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="tamanho" select="'576'" />
        </xsl:call-template>
        <div class="card-body py-0">
          <label class="d-flex tag mb-1">
            <span class="h6 chapeu fw-bolder small text-uppercase" style="color: var(--bs-white);">
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
              </xsl:call-template>
            </span>
          </label>
          
          <span class="h5 d-block card-title mb-3" itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete" />
              <xsl:with-param name="link" select="$link" />
              <xsl:with-param name="cssclass" select="'d-block'"/>
            </xsl:call-template>
          </span>

          <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
          <xsl:value-of select="@publicacao" />
          <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
          <xsl:value-of select="@publicacao" />
          <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	        <xsl:value-of select="$author" disable-output-escaping="yes" />	      
        </div>
      </div>
    </div>
  </xsl:template>

  <!--  MANCHETE_I (Compatibilidade) -  Foto Manchete + Manchete -->
  <xsl:template name="bc_manchete_i">
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div id="bc_manchete_i" class="intbox box-manchete clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box300">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            <xsl:with-param name="tipo" select="'destaque'"/>
            <xsl:with-param name="widthbox" select="'576'" />
          </xsl:call-template>
        </div>
        <div class="info-box">
          <h2 itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
        <xsl:call-template name="get-destaque">
          <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
        </xsl:call-template>
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	      <xsl:value-of select="$author" disable-output-escaping="yes"/>
      </div>
    </div>
  </xsl:template>

  <!-- MANCHETE_J - Foto Manchete + Assunto + Manchete + Texto Destaque  - Ivan: ok revisado micro-codigos e classes css -->
  <xsl:template name="bc_manchete_j">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_manchete_j" itemscope="" itemtype="https://schema.org/NewsArticle">
      <figure class="col-lg-4 float-left no-padding pd-lt-0 pd-rt-0">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="widthbox" select="'576'" />
        </xsl:call-template>
      </figure>
      <figcaption class="col-lg-6 float-right">
        <span class="tag">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
          </xsl:call-template>
        </span>
        <h3 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
        <h6 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h6>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	      <xsl:value-of select="$author" disable-output-escaping="yes"/>
      </figcaption>
    </div>
  </xsl:template>

  <!--  MANCHETE_L (Compatibilidade) - BIG BOX - Foto Manchete vertical + Assunto + Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_l">
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_manchete_l" class="intbox box-manchete clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box300">
        <div class="row">
          <div class="col-xs-6">
            <div class="item-thumbnail">
              <xsl:call-template name="linkfotomanchete">
                <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                <xsl:with-param name="tamanho" select="'vl'"/>
                <xsl:with-param name="link" select="$link"/>
                <xsl:with-param name="cssclass" select="'img-left'"/>
                <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="info-box">
              <div class="materia-assunto">
                <span>
                  <xsl:value-of select="@assunto" />
                </span>
              </div>
              <h2 itemprop="headline">
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
              <h3 itemprop="description">
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
            <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
            <xsl:value-of select="@publicacao" />
            <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
            <xsl:value-of select="@publicacao" />
            <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	          <xsl:value-of select="$author" disable-output-escaping="yes"/>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <!--News_v5 - Manch_M - Foto + Assunto + Manchete - idModeloBox = 258-->
  <xsl:template name="bc_manchete_m">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div itemscope="" itemtype="https://schema.org/NewsArticle">
      <section class="full mg-bt-30">
        <figure class="col-md-6 float-left no-padding pd-lt-0 pd-rt-0">
          <xsl:call-template name="linkfoto">
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            <xsl:with-param name="tipo" select="'destaque'"/>
            <xsl:with-param name="widthbox" select="'100%'" />
          </xsl:call-template>
        </figure>
        <figcaption class="col-md-6 float-right pd-lt-0 pd-rt-0">
          <h1 class="h4" itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h1>
          <ul class="headline">
            <li itemprop="description">
              <xsl:call-template name="linkdestaque">
                <xsl:with-param name="conteudo" select="$destaque"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </li>
          </ul>
        </figcaption>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	      <xsl:value-of select="$author" disable-output-escaping="yes"/>
      </section>
    </div>
  </xsl:template>

  <!-- MANCHETE_O (Compatibilidade) - Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_o">
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_manchete_o" class="intbox box-manchete clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box300">
        <div class="info-box">
          <h2 itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3 itemprop="description">
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="$destaque"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	      <xsl:value-of select="$author" disable-output-escaping="yes"/>
      </div>
    </div>
  </xsl:template>

  <!-- MANCHETE_NOTA - Manchete + Notas bc_manchete_notas/bc_manchete_notas-300-->
  <xsl:template name="bc_manchete_notas">
    <xsl:param name="idsecao" />
    <xsl:param name="quantidade" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="_idsecao">
      <xsl:if test="$idsecao=''">
        <xsl:value-of select="1"/>
      </xsl:if>
      <xsl:if test="$idsecao!=''">
        <xsl:value-of select="$idsecao"/>
      </xsl:if>
    </xsl:variable>

    <div class="float-left no-padding-right onList" id="bc_manchete_notas">
      <xsl:text disable-output-escaping="yes">	
        &lt;div class="full onList-headLine"&gt;	      <!-- Abre div com class full onList-headLine-->
	    </xsl:text>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:sort select="@tiponoticia" order="ascending" />
        <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;" />
        <xsl:if test="position() &lt;= $quantidade">
          <xsl:if test="@tiponoticia='1' and xsl-extensoes:GetVar('posicao') = 0">
            <xsl:value-of select="xsl-extensoes:SetVar('posicao',1)"/>
            <xsl:call-template name="linkfotomanchete">
            </xsl:call-template>
            <span class="text">
              <a href="onlist/{@url}" class="link-white">
                <xsl:value-of select="@manchete" />
              </a>
            </span>
            <xsl:text disable-output-escaping="yes">	
              &lt;/div&gt;	      <!-- fecha div com class full onList-headLine-->
	          </xsl:text>
          </xsl:if>
          <xsl:if test="xsl-extensoes:GetVar('posicao') = 1 and position() = 1">
            <xsl:text disable-output-escaping="yes">	
                &lt;ul class="schedule"&gt; <!-- Abre ul schedule-->                
	            </xsl:text>
          </xsl:if>
          <xsl:if test="xsl-extensoes:GetVar('posicao') = 1 and position() &gt; 1">
            <li>
              <div class="col-lg-3 col-3 date align-middle h4">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </div>
              <div class="col-lg-9 col-9 align-sub no-padding-right">
                <a href="onlist/{@url}">
                  <xsl:value-of select="@manchete" />
                </a>
              </div>
            </li>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">	
          &lt;/ul&gt; <!-- Fecha ul schedule-->                
	      </xsl:text>
    </div>
  </xsl:template>

  <!-- MANCHETE_NOTA_ONLIST - Manchete + Notas bc_manchete_notas/bc_manchete_notas-300-->
  <xsl:template name="bc_manchete_notas_onlist">
    <xsl:param name="idsecao" />
    <xsl:param name="quantidade" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="_idsecao">
      <xsl:if test="$idsecao=''">
        <xsl:value-of select="1"/>
      </xsl:if>
      <xsl:if test="$idsecao!=''">
        <xsl:value-of select="$idsecao"/>
      </xsl:if>
    </xsl:variable>

    <div class="float-left no-padding-right onList" id="bc_manchete_notas">
      <div class="full h4 card-header no-padding-right">
        <a href="onlist/" title="OL List">
          <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onlist.svg" alt="ON List" width="100px" class="margin-left" />
        </a>
      </div>
      <xsl:text disable-output-escaping="yes">	
        &lt;div class="full onList-headLine"&gt;	      <!-- Abre div com class full onList-headLine-->
	    </xsl:text>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:sort select="@tiponoticia" order="ascending" />
        <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;" />
        <xsl:if test="position() &lt;= $quantidade">
          <xsl:if test="@tiponoticia='1' and xsl-extensoes:GetVar('posicao') = 0">
            <xsl:value-of select="xsl-extensoes:SetVar('posicao',1)"/>
            <xsl:call-template name="linkfotomanchete">
            </xsl:call-template>
            <span class="text">
              <a href="onlist/{@url}" class="link-white">
                <xsl:value-of select="@manchete" />
              </a>
            </span>
            <xsl:text disable-output-escaping="yes">	
              &lt;/div&gt;	      <!-- fecha div com class full onList-headLine-->
	          </xsl:text>
          </xsl:if>
          <xsl:if test="xsl-extensoes:GetVar('posicao') = 1 and position() = 1">
            <xsl:text disable-output-escaping="yes">	
                &lt;ul class="schedule"&gt; <!-- Abre ul schedule-->                
	            </xsl:text>
          </xsl:if>
          <xsl:if test="xsl-extensoes:GetVar('posicao') = 1 and position() &gt; 1">
            <li>
              <!-- <div class="col-lg-3 col-3 date align-middle h4">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </div> -->
              <div class="col-lg-12 col-12 align-sub no-padding-right">
                <a href="onlist/{@url}">
                  <xsl:value-of select="@manchete" />
                </a>
              </div>
            </li>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">	
          &lt;/ul&gt; <!-- Fecha ul schedule-->                
	      </xsl:text>
    </div>
  </xsl:template>

  <!-- BOX URGENTE - Multi-Box - Assunto + Manchete - Ivan: ok revisado -->
  <xsl:template name="bc_urgente_ep">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <xsl:param name="link"/>
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div id="bc_urgente_ep" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div itemprop="alternateName" class="tit-urgente">URGENTE</div>
      <div class="txt-urgente">
        <h3>
          <a itemprop="url" href="{$link}">
            <span class="manchete-urgente" itemprop="headline">
              <xsl:value-of select="translate($manchete, $quot, $apos)" disable-output-escaping="yes"/>
            </span>
          </a>
        </h3>
        <h6>
          <a href="{$link}">
            <span class="destaque-urgente" itemprop="description">
              <xsl:value-of select="translate($destaque, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h6>
      </div>
    </div>
  </xsl:template>

  <!-- BOX DAREDACAO - Multi-Box - Manchete - Ivan: ok revisado -->
  <xsl:template name="bc_daredacao">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="link"/>
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div id="bc_daredacao" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div itemprop="alternateName" class="col-md-2 tit-daredacao-chapeu">DA REDAÇÃO</div>
      <div class="tit-daredacao">
        <h3>
          <a itemprop="url" href="{$link}">
            <span class="manchete-daredacao" itemprop="headline">
              <xsl:value-of select="translate($manchete, $quot, $apos)" disable-output-escaping="yes"/>
            </span>
          </a>
        </h3>
      </div>
    </div>
  </xsl:template>

  <!-- BOX AOVIVO - Multi-Box - Manchete + Linha Fina - Ivan: ok revisado micro-codigos mas precisa ajustar css -->
  <xsl:template name="bc_aovivo">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <xsl:param name="link"/>
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div itemscope="" itemtype="https://schema.org/NewsArticle" id="bc_aovivo">
      <div class="tit-urgente">AO VIVO</div>
      <div class="txt-urgente">
        <h3>
          <a itemprop="url" href="{$link}" target="top">
            <span class="manchete-urgente" itemprop="headline">
              <xsl:value-of select="translate($manchete, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h3>
        <h4>
          <a href="{$link}" target="top">
            <span class="destaque-urgente" itemprop="description">
              <xsl:value-of select="translate($destaque, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h4>
      </div>
    </div>
  </xsl:template>

  <!-- BOX Manchete Carrossel Mega 900px - Estático -->
  <xsl:template name="bc_manchete_imagens_rotativas_mega">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    <xsl:param name="tipoImagem" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="numero_img">
      <xsl:value-of select="position()" />
    </xsl:variable>
    <!-- Estático -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
            &lt;div class="col-12"&gt;
            &lt;div class="carousel" id="bc_manchete_imagens_rotativas_mega" style="height:360px;"&gt;
        </xsl:text>
      </xsl:if>
      <xsl:call-template name="linkfoto_assunto_destaque_manchete_v5">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="manchete" select="translate($manchete, $quot, $apos)" />
        <xsl:with-param name="destaque" select="translate($destaque, $quot, $apos)" />
        <xsl:with-param name="assunto" select="translate($assunto, $quot, $apos)" />
      </xsl:call-template>
      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;              
            &lt;/div&gt;              
        </xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- BOX Manchete Carrossel 300px - Estático -->
  <xsl:template name="bc_manchete_rotativas_300">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="nome-css-class">
      <xsl:choose>
        <xsl:when test="contains(@url,'PUBE,') or contains(@url,'BRND,')">
          <xsl:value-of select="'informepublicitario'" />
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
            
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
            &lt;div id="bc_manchete_rotativas_300" class="carousel"&gt;
        </xsl:text>
    </xsl:if>

    <div class="card pb-4 position-relative" style="background-color: var(--bs-primary);">
      <figure>
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="cssclass" select="'card-img-top img-fluid ls-is-cached lazyloaded'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="widthbox" select="'576'" />
        </xsl:call-template>
      </figure>
      <figcaption class="{$nome-css-class} card-body py-0">
        <label class="d-block tag mb-1">
          <span class="chapeu fw-bolder small text-uppercase" style="color: var(--bs-white);">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)" />
            </xsl:call-template>
          </span>
        </label>
        <span class="h5 d-block card-title m-0">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'stretched-link'"/>
          </xsl:call-template>
        </span>
      </figcaption>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
        </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="bc_manchete_com_nota">
    <xsl:param name="idsecao" />
    <xsl:param name="idsecao2" />
    <xsl:param name="titulo" />
    <xsl:param name="url" />
    <xsl:param name="idsite" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div id="bc_manchete_com_nota" class="col-12" >
      <h1 class="card-header no-padding-right h4">
        <xsl:value-of select="$titulo"/>
        <a href="{$url}" class="link link-access right pt-10">Acessar</a>
      </h1>
      <section class="full mg-bt-30">
        <xsl:if test="$idsite=''">
          <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia=1][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending"/>
            <xsl:if test="position()=1">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <figure class="col-md-6 float-left no-padding pd-lt-0 pd-rt-0">
                <xsl:call-template name="linkfoto">
                  <xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo"/>
                  <xsl:with-param name="widthbox" select="'269'" />
                </xsl:call-template>
              </figure>
              <figcaption class="col-md-6 float-right pd-lt-0 pd-rt-0">
                <label class="tag mg-tp-10" itemprop="about">
                  <xsl:call-template name="get-assunto">
                    <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
                  </xsl:call-template>
                </label>
                <h1 class="h4" itemprop="name">
                  <xsl:call-template name="linkmanchete">
                    <xsl:with-param name="conteudo" select="@manchete"/>
                  </xsl:call-template>
                </h1>
                <xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
                  <xsl:sort select="@publicacao" order="descending"/>
                  <xsl:if test="position()&lt;=1">
                    <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
                    <ul class="headline">
                      <li itemprop="description">
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="@manchete"/>
                        </xsl:call-template>
                      </li>
                    </ul>
                  </xsl:if>
                </xsl:for-each>
              </figcaption>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="$idsite!=''">
          <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia=1][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][xsl-extensoes:estaem(@idsites,$idsite)]">
            <xsl:sort select="@publicacao" order="descending"/>
            <xsl:if test="position()=1">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <figure class="col-md-6 float-left no-padding pd-lt-0 pd-rt-0">
                <xsl:call-template name="linkfoto">
                  <xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo"/>
                  <xsl:with-param name="widthbox" select="'269'" />
                </xsl:call-template>
              </figure>
              <figcaption class="col-md-6 float-right pd-lt-0 pd-rt-0">
                <label class="tag mg-tp-10" itemprop="about">
                  <xsl:call-template name="get-assunto">
                    <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
                  </xsl:call-template>
                </label>
                <h1 class="h4" itemprop="name">
                  <xsl:call-template name="linkmanchete">
                    <xsl:with-param name="conteudo" select="@manchete"/>
                  </xsl:call-template>
                </h1>

                <xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][xsl-extensoes:estaem(@idsites,$idsite)]">
                  <xsl:sort select="@publicacao" order="descending"/>
                  <xsl:if test="position()&lt;=1">
                    <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
                    <ul class="headline">
                      <li itemprop="description">
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="@manchete"/>
                        </xsl:call-template>
                      </li>
                    </ul>
                  </xsl:if>
                </xsl:for-each>

              </figcaption>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
      </section>
    </div>
  </xsl:template>

  <!-- MANCHETE_R SEM ASSUNTO 900 - [4 fotos] + [4 manchetes (abaixo de cada foto) ] - Status: Passar por webdesigner -->
  <!--clone Destaq_K-->
  <xsl:template name="bc_manchete_r">
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
	      &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div id="bc_manchete_r" class="col-12 col-lg-3 col-xl-3" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="manchete-item-imagem">
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="''"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        </xsl:call-template>
      </div>
      <div class="manchete-item-cont">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
      </div>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
	      &lt;/div&gt;
      </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- MANCHETE_S COM ASSUNTO 900 - [4 fotos] + [4 manchetes (abaixo de cada foto) ] - Status: Passar por webdesigner -->
  <!--clone Destaq_N-->
  <xsl:template name="bc_manchete_s">
	<xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
		      &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    
    <div id="bc_manchete_s" class="col-12 col-lg-3 col-xl-3" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="manchete-item-imagem">
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="''"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        </xsl:call-template>
      </div>
      <div class="manchete-item-cont">
        <label>
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </label>
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
      </div>
    </div>
    <xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
    <xsl:call-template name="get-destaque">
      <xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
    </xsl:call-template>
    <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

    <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
    <xsl:value-of select="@publicacao" />
    <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
    <xsl:value-of select="@publicacao" />
    <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
    <xsl:value-of select="$author" disable-output-escaping="yes"/>

    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
	      &lt;/div&gt;
      </xsl:text>
    </xsl:if>
  </xsl:template>


  <!-- BOX CHAMADA ELEIÇÕES rotativos com no máximo 3 notícias. Destaque + Manchete -->
  <xsl:template name="bc_urgente_eleicoes">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <xsl:param name="link"/>
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
            &lt;div class="carousel-eleicoes"&gt;
        </xsl:text>
    </xsl:if>

    <div id="bc_urgente_ep" class="bc_urgente_eleicoes" itemscope="" itemtype="https://schema.org/NewsArticle" >
      <a href="politica/eleicoes/" style="width: 150px; float: left; padding: 20px 0 0 25px;">
        <img src="https://www.tudoep.com/politica/eleicoes/img/logo-box.png" style="width: auto !important;" />
      </a>
      <div class="txt-urgente">
        <h3>
          <a itemprop="url" href="{$link}">
            <span class="manchete-urgente" itemprop="headline">
              <xsl:value-of select="translate($manchete, $quot, $apos)" disable-output-escaping="yes"/>
            </span>
          </a>
        </h3>
        <h6>
          <a href="{$link}">
            <span class="destaque-urgente" itemprop="description">
              <xsl:value-of select="translate($destaque, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h6>
      </div>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
        </xsl:text>
    </xsl:if>
  </xsl:template>


  <!-- DOCON_REPORTAGEM_ESPECIAL -->
  <xsl:template name="bc_docon_rep_esp">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_docon_rep_esp" itemscope="" itemtype="https://schema.org/NewsArticle" >
      <figure class="col-md-8 float-left no-padding pd-lt-0 pd-rt-0">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="widthbox" select="''" />
        </xsl:call-template>
      </figure>
      <figcaption class="col-md-4 float-right pd-lt-0 pd-rt-0">
        <span class="tag">
          <xsl:for-each select="//*[@idsecao=1]//noticia[@idnoticia=$idnoticia]">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
            </xsl:call-template>
          </xsl:for-each>
        </span>
        <h3 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
        <h6 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h6>
      </figcaption>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- FLIPPAGE_REPORTAGEM_ESPECIAL -->
  <xsl:template name="bc_report_esp_flippage">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div itemscope="" itemtype="https://schema.org/NewsArticle" id="bc_docon_rep_esp">
      <figure class="col-md-8 float-left no-padding pd-lt-0 pd-rt-0">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
        </xsl:call-template>
      </figure>
      <figcaption class="col-md-4 float-right pd-lt-0 pd-rt-0">
        <span class="tag">
          <xsl:for-each select="//*[@idsecao=1]//noticia[@idnoticia=$idnoticia]">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
            </xsl:call-template>
          </xsl:for-each>
        </span>
        <h3 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
        <h6 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h6>
      </figcaption>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- DOCON BOX ARTIGOS-->
  <xsl:template name="bc_docon_art">
	<xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div itemscope="" itemtype="https://schema.org/NewsArticle" id="bc_docon_art">
      <figure class="col-lg-4 float-left no-padding pd-lt-0 pd-rt-0">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
        </xsl:call-template>
      </figure>
      <figcaption class="col-lg-8 float-right">
        <span class="tag">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
          </xsl:call-template>
        </span>
        <h3 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
        <h6 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h6>
      </figcaption>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- FLIPPAGE BOX ARTIGOS-->
  <xsl:template name="bc_art_flippage">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:param name="idnoticia" />
	
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div itemscope="" itemtype="https://schema.org/NewsArticle" id="bc_docon_art">
      <figure class="col-lg-4 float-left no-padding pd-lt-0 pd-rt-0">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
        </xsl:call-template>
      </figure>
      <figcaption class="col-lg-8 float-right">
        <span class="tag">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
          </xsl:call-template>
        </span>
        <h3 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
        <h6 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h6>
      </figcaption>

      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>
    </div>
  </xsl:template>

  <!-- BOX Manchete Carrossel 300px - Estático MOD 2 -->
  <xsl:template name="bc_manchete_rotativas_300_MOD_2">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="nome-css-class">
      <xsl:choose>
        <xsl:when test="contains(@url,'PUBE,') or contains(@url,'BRND,')">
          <xsl:value-of select="'informepublicitario'" />
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
            &lt;figure class="no-padding fig-caption-span" id="bc_manchete_rotativas_300" &gt;
            &lt;div class="carousel"&gt;
        </xsl:text>
    </xsl:if>

    <h4 class="card-header no-padding-right">
      <a href="onplay/" title="ON Play">
        <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
      </a>
    </h4>
    <div>
      <a href="{$link}">
        <xsl:call-template name="linkfoto">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <!--<xsl:with-param name="tipo" select="'pq'"/>-->
          <xsl:with-param name="widthbox" select="'576'" />
        </xsl:call-template>
      </a>
      <figcaption class="{$nome-css-class}">
        <span class="tag p-t-10">
          <label class="tag pt-10">
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)" />
            </xsl:call-template>
          </label>
          <h5>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)" />
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h5>
        </span>
      </figcaption>

    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
        </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- INÍCIO BOXES IMÓVEL SHOW -->

  <xsl:template name="bc_imovelshow_lancamentosregiao">
    <xsl:param name="qtdzona1" />
    <xsl:param name="qtdzona2" />
    <xsl:param name="qtdzona3" />
    <xsl:param name="qtdzona4" />
    <xsl:param name="idsecaozona1" />
    <xsl:param name="idsecaozona2" />
    <xsl:param name="idsecaozona3" />
    <xsl:param name="idsecaozona4" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div class="row row-cols-md-4 row-cols-2 gy-4 pb-5">

      <div class="col ">
        <a href="lancamentos-imobiliarios/zona-norte">
          <span class="h1 w-100 d-block display-6 text-center fw-bold text-secondary fst-italic mx-auto mb-3">
            <span class="fw-light">Zona</span> Norte
          </span>
        </a>
        <div class="d-block slider-expositores1 owl-carousel owl-loaded owl-drag">
          <xsl:for-each select="//*[@idsecao=$idsecaozona1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:sort select="@tiponoticia" order="ascending" />
            <xsl:if test="position() &lt;= $qtdzona1">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotopatrocinio/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="imagempatrocinio">
                <xsl:if test="$imagem = ''">
                  <xsl:value-of select="fotodestaque/@arquivo"/>
                </xsl:if>
                <xsl:if test="$imagem != ''">
                  <xsl:value-of select ="fotopatrocinio/@arquivo"/>
                </xsl:if>
              </xsl:variable>

              <div class="card border-top-0 border-bottom-0 border-end-0 d-flex position-relative" style="border: 1px dashed var(--bs-light);">
                <img class="card-img-top img-fluid px-4" src="https://emc.tudoep.com/dbimagens/{$imagempatrocinio}" alt="{$manchete}" />
                <div class="card-body noticias px-0 pb-0 d-flex flex-wrap align-items-end">
                  <div class="posts">
                    <div class="single-todays-post row gx-2 mx-0 mt-3 justify-content-start align-items-stretch">
                      <div class="col todays-post-thumb" style="background: var(--bs-light) url(/ribeiraopreto/imovelshow/img/paleta-adorno32.svg) no-repeat bottom right; background-size: cover; max-width: 3%;">
                        <span class="adorno visually-hidden">adorno</span>
                      </div>
                      <div class="col todays-post-content ps-3 pl-3">
                        <div class="post-tag text-uppercase h6 small">
                          <span class="fw-bold text-primary small">
                            <xsl:value-of select="$chapeu"/>
                          </span>
                        </div>
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="$manchete"/>
                          <xsl:with-param name="link" select="@link"/>
                          <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>
      <div class="col ">
        <a href="lancamentos-imobiliarios/zona-sul">
          <span class="h1 w-100 d-block display-6 text-center fw-bold text-secondary fst-italic mx-auto mb-3">
            <span class="fw-light">Zona</span> Sul
          </span>
        </a>
        <div class="d-block slider-expositores2 owl-carousel owl-loaded owl-drag">
          <xsl:for-each select="//*[@idsecao=$idsecaozona2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:sort select="@tiponoticia" order="ascending" />
            <xsl:if test="position() &lt;= $qtdzona2">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotopatrocinio/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="imagempatrocinio">
                <xsl:if test="$imagem = ''">
                  <xsl:value-of select="fotodestaque/@arquivo"/>
                </xsl:if>
                <xsl:if test="$imagem != ''">
                  <xsl:value-of select ="fotopatrocinio/@arquivo"/>
                </xsl:if>
              </xsl:variable>

              <div class="card border-top-0 border-bottom-0 border-end-0 d-flex position-relative" style="border: 1px dashed var(--bs-light);">
                <img class="card-img-top img-fluid px-4" src="https://emc.tudoep.com/dbimagens/{$imagempatrocinio}" alt="{$manchete}" />
                <div class="card-body noticias px-0 pb-0 d-flex flex-wrap align-items-end">
                  <div class="posts">
                    <div class="single-todays-post row gx-2 mx-0 mt-3 justify-content-start align-items-stretch">
                      <div class="col todays-post-thumb" style="background: var(--bs-light) url(/ribeiraopreto/imovelshow/img/paleta-adorno32.svg) no-repeat bottom right; background-size: cover; max-width: 3%;">
                        <span class="adorno visually-hidden">adorno</span>
                      </div>
                      <div class="col todays-post-content ps-3 pl-3">
                        <div class="post-tag text-uppercase h6 small">
                          <span class="fw-bold text-primary small">
                            <xsl:value-of select="$chapeu"/>
                          </span>
                        </div>
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="$manchete"/>
                          <xsl:with-param name="link" select="@link"/>
                          <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>

      <div class="col ">
        <a href="lancamentos-imobiliarios/zona-leste">
          <span class="h1 w-100 d-block display-6 text-center fw-bold text-secondary fst-italic mx-auto mb-3">
            <span class="fw-light">Zona</span> Leste
          </span>
        </a>

        <div class="d-block slider-expositores3 owl-carousel owl-loaded owl-drag">

          <xsl:for-each select="//*[@idsecao=$idsecaozona3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:sort select="@tiponoticia" order="ascending" />
            <xsl:if test="position() &lt;= $qtdzona3">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>
              <xsl:variable name="imagem">
                <xsl:value-of select="fotopatrocinio/@arquivo"/>
              </xsl:variable>
              <xsl:variable name="imagempatrocinio">
                <xsl:if test="$imagem = ''">
                  <xsl:value-of select="fotodestaque/@arquivo"/>
                </xsl:if>
                <xsl:if test="$imagem != ''">
                  <xsl:value-of select ="fotopatrocinio/@arquivo"/>
                </xsl:if>
              </xsl:variable>

              <div class="card border-top-0 border-bottom-0 border-end-0 d-flex position-relative" style="border: 1px dashed var(--bs-light);">
                <img class="card-img-top img-fluid px-4" src="https://emc.tudoep.com/dbimagens/{$imagempatrocinio}" alt="{$manchete}" />
                <div class="card-body noticias px-0 pb-0 d-flex flex-wrap align-items-end">
                  <div class="posts">
                    <div class="single-todays-post row gx-2 mx-0 mt-3 justify-content-start align-items-stretch">
                      <div class="col todays-post-thumb" style="background: var(--bs-light) url(/ribeiraopreto/imovelshow/img/paleta-adorno32.svg) no-repeat bottom right; background-size: cover; max-width: 3%;">
                        <span class="adorno visually-hidden">adorno</span>
                      </div>
                      <div class="col todays-post-content ps-3 pl-3">
                        <div class="post-tag text-uppercase h6 small">
                          <span class="fw-bold text-primary small">
                            <xsl:value-of select="$chapeu"/>
                          </span>
                        </div>
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="$manchete"/>
                          <xsl:with-param name="link" select="@link"/>
                          <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>

      </div>

      <div class="col ">
        <a href="lancamentos-imobiliarios/zona-oeste">
          <span class="h1 w-100 d-block display-6 text-center fw-bold text-secondary fst-italic mx-auto mb-3">
            <span class="fw-light">Zona</span> Oeste
          </span>
        </a>
        <div class="d-block slider-expositores4 owl-carousel owl-loaded owl-drag">
          <xsl:for-each select="//*[@idsecao=$idsecaozona4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:sort select="@tiponoticia" order="ascending" />
            <xsl:if test="position() &lt;= $qtdzona4">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotopatrocinio/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="imagempatrocinio">
                <xsl:if test="$imagem = ''">
                  <xsl:value-of select="fotodestaque/@arquivo"/>
                </xsl:if>
                <xsl:if test="$imagem != ''">
                  <xsl:value-of select ="fotopatrocinio/@arquivo"/>
                </xsl:if>
              </xsl:variable>
              <div class="card border-top-0 border-bottom-0 border-end-0 d-flex position-relative" style="border: 1px dashed var(--bs-light);">
                <img class="card-img-top img-fluid px-4" src="https://emc.tudoep.com/dbimagens/{$imagempatrocinio}" alt="{$manchete}" />
                <div class="card-body noticias px-0 pb-0 d-flex flex-wrap align-items-end">
                  <div class="posts">
                    <div class="single-todays-post row gx-2 mx-0 mt-3 justify-content-start align-items-stretch">
                      <div class="col todays-post-thumb" style="background: var(--bs-light) url(/ribeiraopreto/imovelshow/img/paleta-adorno32.svg) no-repeat bottom right; background-size: cover; max-width: 3%;">
                        <span class="adorno visually-hidden">adorno</span>
                      </div>
                      <div class="col todays-post-content ps-3 pl-3">
                        <div class="post-tag text-uppercase h6 small">
                          <span class="fw-bold text-primary small">
                            <xsl:value-of select="$chapeu"/>
                          </span>
                        </div>
                        <xsl:call-template name="linkmanchete">
                          <xsl:with-param name="conteudo" select="$manchete"/>
                          <xsl:with-param name="link" select="@link"/>
                          <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_imovelshow_expositores">
    <div class="slider-expositores-full1 owl-carousel owl-loaded owl-drag position-relative py-3">
      <div class="d-block px-3 px-md-4">
        <a href="expositores/bild" title="bild">
          <img src="/ribeiraopreto/imovelshow/img/bild.jpg" width="225" height="197" alt="bild" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/copema" title="copema">
          <img src="/ribeiraopreto/imovelshow/img/copema.jpg" width="225" height="197" alt="copema" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/3bs" title="3bs">
          <img src="/ribeiraopreto/imovelshow/img/3bs.jpg" width="225" height="197" alt="3bs" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/pagano" title="pagano">
          <img src="/ribeiraopreto/imovelshow/img/pagano.jpg" width="225" height="197" alt="pagano" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/perplan" title="perplan">
          <img src="/ribeiraopreto/imovelshow/img/perplan.jpg" width="225" height="197" alt="perplan" class="img-fluid py-5" />
        </a>
      </div>

      <div class="d-block px-3 px-md-4">
        <a href="expositores/morada-engenharia" title="morada">
          <img src="/ribeiraopreto/imovelshow/img/morada.jpg" width="225" height="197" alt="morada" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/ascen" title="ascen">
          <img src="/ribeiraopreto/imovelshow/img/ascen.jpg" width="225" height="197" alt="ascen" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/pafil" title="pafil">
          <img src="/ribeiraopreto/imovelshow/img/pafil.jpg" width="225" height="197" alt="pafil" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/stefani-nogueira" title="stefani">
          <img src="/ribeiraopreto/imovelshow/img/stefani.jpg" width="225" height="197" alt="stefani" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/top-life" title="toplife">
          <img src="/ribeiraopreto/imovelshow/img/toplife.jpg" width="225" height="197" alt="toplife" class="img-fluid py-5" />
        </a>
      </div>

      <div class="d-block px-3 px-md-4">
        <a href="expositores/pedreschi" title="pedreschi">
          <img src="/ribeiraopreto/imovelshow/img/pedreschi_2.jpg" width="225" height="197" alt="pedreschi" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/brz-empreendimentos" title="brz-empreendimentos">
          <img src="/ribeiraopreto/imovelshow/img/brz-empreendimentos.jpg" width="225" height="197" alt="brz-empreendimentos" class="img-fluid py-5" />
        </a>
      </div>
      <div class="d-block px-3 px-md-4">
        <a href="expositores/costallat" title="costallat">
          <img src="/ribeiraopreto/imovelshow/img/costallat.jpg" width="225" height="197" alt="costallat" class="img-fluid py-5" />
        </a>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_imovelshow_servicos">
    <div class="slider-expositores-full2 ajusta-full owl-carousel owl-loaded owl-drag position-relative py-3" style="border-bottom: 1px dashed var(--bs-light);">
      <div class="col px-3 px-md-4">
        <a href="servicos/todeschini" title="todeschini">
          <img src="/ribeiraopreto/imovelshow/img/todeschini.jpg" width="225" height="197" alt="todeschini" class="img-fluid" />
        </a>
      </div>
      <div class="col px-3 px-md-4">
        <a href="lojistas/casa-rara/" title="casa-rara">
          <img src="/ribeiraopreto/imovelshow/img/casa-rara.jpg" width="225" height="197" alt="casa-rara" class="img-fluid" />
        </a>
      </div>
      <div class="col px-3 px-md-4">
        <a href="lojistas/eurobike" title="eurobike">
          <img src="/ribeiraopreto/imovelshow/img/eurobike.jpg" width="225" height="197" alt="eurobike" class="img-fluid" />
        </a>
      </div>

      <div class="col px-3 px-md-4">
        <a href="lojistas/copercana" title="copercana">
          <img src="/ribeiraopreto/imovelshow/img/copercana.jpg" width="225" height="197" alt="eurobike" class="img-fluid" />
        </a>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_imovelshow_titulosecao">
    <xsl:param name="titulo" />
    <xsl:param name="fraselogos" />
    <xsl:param name="link" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <br />
    <br />
    <a class="d-block col-9 col-md-3 mx-auto text-center" href="{$link}" title="{$titulo}">
      <h3 class="section-header h6 fw-bold text-uppercase text-primary lh-base px-4 pb-2 mx-auto" style="border-bottom: 1px dashed var(--bs-secondary);">
        <xsl:value-of select="$titulo" />
      </h3>
      <p class="h5 fw-normal fst-italic text-center mt-3">
        <xsl:value-of select="$fraselogos" />
      </p>
    </a>
    <br />

  </xsl:template>

  <xsl:template name="bc_imovelshow_3expositores">
    <xsl:param name="titulo1" />
    <xsl:param name="titulo2" />
    <xsl:param name="titulo3" />
    <xsl:param name="idsecao1" />
    <xsl:param name="idsecao2" />
    <xsl:param name="idsecao3" />
    <xsl:param name="posicaopub" />
    <xsl:param name="qde" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div class="noticias row justify-content-center gy-4 pb-5 mt-4 px-2">

      <div class="col-sm-4 col-lg-3">
        <div class="posts">
          <span class="d-none">verifica xsl</span>
          <xsl:for-each select="//*[@idsecao=$idsecao1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="xsl-extensoes:randomiza()" />
            <!--<xsl:sort select="@publicacao" order="descending" />-->
            <xsl:if test="position() &lt;=$qde">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="link">
                <xsl:value-of select="@url"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotodestaque/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="legenda">
                <xsl:value-of select="fotodestaque/@legenda"/>
              </xsl:variable>

              <xsl:variable name="credito">
                <xsl:value-of select="fotodestaque/@credito"/>
              </xsl:variable>

              <xsl:if test="$titulo1=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$chapeu" />
                    <span class="d-none">verifica xsl</span>

                  </span>
                </div>
              </xsl:if>

              <xsl:if test="$titulo1 !=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$titulo1" />
                    <span class="d-none">verifica xsl</span>

                  </span>
                </div>
              </xsl:if>

              <div class="single-todays-post row g-0 align-items-stretch position-relative mb-4">
                <div class="col-5 todays-post-thumb pe-3">
                  <div class="bg-primary">
                    <img class="img-fluid" src="https://emc.tudoep.com/dbimagens/{$imagem}" style="mix-blend-mode: screen;" width="155" height="96" alt="{$credito}" title="{$legenda}" />
                    <span class="d-none">verifica xsl</span>

                  </div>
                </div>
                <div class="col todays-post-content">
                  <span class="fw-light fst-italic">
                    <span class="d-none">verifica xsl</span>

                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="@link"/>
                      <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>

      <div class="col-sm-4 col-lg-3">
        <div class="posts">
          <span class="d-none">verifica xsl</span>
          <xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <!--<xsl:sort select="xsl-extensoes:randomiza()" />-->
            <xsl:if test="position() &lt;=$qde">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotodestaque/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="legenda">
                <xsl:value-of select="fotodestaque/@legenda"/>
              </xsl:variable>

              <xsl:variable name="credito">
                <xsl:value-of select="fotodestaque/@credito"/>
              </xsl:variable>

              <xsl:if test="$titulo2=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$chapeu" />
                    <span class="d-none">verifica xsl</span>

                  </span>
                </div>
              </xsl:if>

              <xsl:if test="$titulo2 !=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$titulo2" />
                    <span class="d-none">verifica xsl</span>

                  </span>
                </div>
              </xsl:if>

              <div class="single-todays-post row g-0 align-items-stretch position-relative mb-4">
                <div class="col-5 todays-post-thumb pe-3">
                  <div class="bg-primary">
                    <img class="img-fluid" src="https://emc.tudoep.com/dbimagens/{$imagem}" style="mix-blend-mode: screen;" width="155" height="96" alt="{$credito}" title="{$legenda}" />
                    <span class="d-none">verifica xsl</span>
                  </div>
                </div>
                <div class="col todays-post-content">
                  <span class="fw-light fst-italic">
                    <span class="d-none">verifica xsl</span>
                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="@link"/>
                      <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>

      <div class="col-sm-4 col-lg-3">
        <div class="posts">
          <span class="d-none">verifica xsl</span>
          <xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <!--<xsl:sort select="xsl-extensoes:randomiza()" />-->
            <xsl:if test="position() &lt;=$qde">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="link">
                <xsl:value-of select="@url"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotodestaque/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="legenda">
                <xsl:value-of select="fotodestaque/@legenda"/>
              </xsl:variable>

              <xsl:variable name="credito">
                <xsl:value-of select="fotodestaque/@credito"/>
              </xsl:variable>

              <xsl:if test="$titulo3=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$chapeu" />
                    <span class="d-none">verifica xsl</span>
                  </span>
                </div>
              </xsl:if>

              <xsl:if test="$titulo3 !=''">
                <div class="expositor-tag text-uppercase h6 small">
                  <span class="fw-bold text-primary small">
                    <xsl:value-of select="$titulo3" />
                    <span class="d-none">verifica xsl</span>

                  </span>
                </div>
              </xsl:if>

              <div class="single-todays-post row g-0 align-items-stretch position-relative mb-4">
                <div class="col-5 todays-post-thumb pe-3">
                  <div class="bg-primary">
                    <img class="img-fluid" src="https://emc.tudoep.com/dbimagens/{$imagem}" style="mix-blend-mode: screen;" width="155" height="96" alt="{$credito}" title="{$legenda}" />
                    <span class="d-none">verifica xsl</span>
                  </div>
                </div>
                <div class="col todays-post-content">
                  <span class="fw-light fst-italic">
                    <span class="d-none">verifica xsl</span>
                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="@link"/>
                      <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>

      <div class="col-sm-4 col-lg-3 d-flex">
        <div class="opec mx-auto">
          <div id="{$posicaopub}" class="adunit" data-dimensions="300x250,250x250,200x200,fluid" data-size-mapping="RM" data-targeting="" itemscope="" itemtype="https://schema.org/WPAdBlock">
            <span class="d-none">opec</span>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_imovelshow_morarbem">
    <xsl:param name="idsecao" />
    <xsl:param name="posicaopub" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div class="noticias row justify-content-center gx-0 gy-4 pb-5 mt-4 px-2">
      <div class="col-md-9">
        <div class="row posts gx-md-0 justify-content-between">
          <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:if test="position() &lt;=6">
              <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
              <xsl:variable name="chapeu">
                <xsl:value-of select="@assunto"/>
              </xsl:variable>

              <xsl:variable name="link">
                <xsl:value-of select="@url"/>
              </xsl:variable>

              <xsl:variable name="manchete">
                <xsl:value-of select="@manchete"/>
              </xsl:variable>

              <xsl:variable name="imagem">
                <xsl:value-of select="fotodestaque/@arquivo"/>
              </xsl:variable>

              <xsl:variable name="legenda">
                <xsl:value-of select="fotodestaque/@legenda"/>
              </xsl:variable>

              <xsl:variable name="credito">
                <xsl:value-of select="fotodestaque/@credito"/>
              </xsl:variable>

              <div class="single-todays-post col-md-4 row gx-3 gx-md-2 align-items-stretch position-relative mb-4">
                <div class="col-5 todays-post-thumb pe-3">
                  <div class="bg-primary">
                    <img class="img-fluid" src="https://emc.tudoep.com/dbimagens/{$imagem}" style="mix-blend-mode: screen;" width="155" height="96" alt="{$credito}" title="{$legenda}" />
                    <span class="d-none">verifica xsl</span>

                  </div>
                </div>
                <div class="col todays-post-content">

                  <div class="chapeu post-tag text-uppercase h6 small">
                    <span class="fw-bold text-primary small">
                      <xsl:value-of select="$chapeu" />
                    </span>
                  </div>
                  <span class="fw-light fst-italic">
                    <span class="d-none">verifica xsl</span>

                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="@link"/>
                      <xsl:with-param name="cssclass" select="'fw-light fst-italic stretched-link'"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>
      <div class="col-sm-4 col-lg-3 d-flex">
        <div class="opec mx-auto">
          <div id="{$posicaopub}" class="adunit" data-dimensions="300x250,250x250,200x200,fluid" data-size-mapping="RM" data-targeting="" itemscope="" itemtype="https://schema.org/WPAdBlock">
            <span class="d-none">opec</span>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <!--bx-especiais-->
  <xsl:template name="bx-especiais">
    <xsl:param name="tituloboxe" />
    <xsl:param name="linhafina" />
    <xsl:param name="descricao" />
    <xsl:param name="idsecao" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div id="bx-especiais" class="mt-5 mb-5">
      <div class="row">
        <div class="col-3 box-especiais">
          <div class="tit-especiais">
            <h4>
              <xsl:value-of select="$tituloboxe"/>
            </h4>
            <p>
              <xsl:value-of select="$linhafina"/>
            </p>
          </div>
          <div class="descr-especiais">
            <p>
              <xsl:value-of select="$descricao"/>
            </p>
          </div>
        </div>

        <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending"/>
          <xsl:if test="position() &lt;= 3">
            <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
            <div class="col-3 mt-3 mb-3">
              <div id="bc_manchete_g" class="article">
                <figure class="article-img">
                  <xsl:call-template name="get-foto">
                    <xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo"/>
                    <xsl:with-param name="tipo" select="'manchete'"/>
                  </xsl:call-template>
                </figure>
                <div class="card-body">
                  <label>
                    <xsl:call-template name="get-assunto">
                      <xsl:with-param name="conteudo" select="@assunto"/>
                      <xsl:with-param name="link" select="@link"/>
                    </xsl:call-template>
                  </label>
                  <h3>
                    <span class="">
                      <xsl:call-template name="linkmanchete">
                        <xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
                        <xsl:with-param name="link" select="@link"/>
                        <xsl:with-param name="cssclass" select="'stretched-link'"/>
                      </xsl:call-template>
                    </span>
                  </h3>
                </div>
              </div>
            </div>
          </xsl:if>
        </xsl:for-each>
      </div>
    </div>

  </xsl:template>

  <!-- BOX AOVIVO - Multi-Box - Manchete + Linha Fina + Texto Destaque -->
  <xsl:template name="bc_aovivo_v55">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <xsl:param name="textodestaque"/>
    <xsl:param name="link"/>
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <div itemscope="" itemtype="https://schema.org/NewsArticle" id="bc_aovivo">
      <div class="tit-urgente">
        <xsl:value-of select="translate($textodestaque, $quot, $apos)" disable-output-escaping="yes" />
      </div>
      <div class="txt-urgente">
        <h3>
          <a itemprop="url" href="{$link}" target="top">
            <span class="manchete-urgente" itemprop="headline">
              <xsl:value-of select="translate($manchete, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h3>
        <h4>
          <a href="{$link}" target="top">
            <span class="destaque-urgente">
              <xsl:value-of select="translate($destaque, $quot, $apos)" disable-output-escaping="yes" />
            </span>
          </a>
        </h4>
      </div>
    </div>
  </xsl:template>




  
  
</xsl:stylesheet>