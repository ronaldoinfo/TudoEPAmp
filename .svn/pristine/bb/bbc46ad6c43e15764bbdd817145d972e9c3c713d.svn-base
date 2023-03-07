<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- DESTAQUE_A - Foto Destaque + Assunto + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_a">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
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

    <div id="bc_destaque_a">
      <div class="destaque-item-imagem" itemscope="" itemtype="https://schema.org/NewsArticle">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'150'"/>
          <xsl:with-param name="altura" select="'114'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <span class="tag">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select='translate($assunto, $quot, $apos)'/>
          </xsl:call-template>
        </span>
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select='translate($manchete, $quot, $apos)'/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_B - Foto Destaque + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_b">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
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

    <div id="bc_destaque_b">
      <div itemscope="" itemtype="https://schema.org/NewsArticle" class="destaque-item-imagem">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'150'"/>
          <xsl:with-param name="altura" select="'114'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select='translate($manchete, $quot, $apos)'/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_C PQ (Compatibilidade) - Assunto + Manchete + Foto destaque pq - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_c">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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

    <div id="bc_destaque_c" itemscope="" itemtype="https://schema.org/NewsArticle">      
      <span class="tag">
        <xsl:call-template name="get-assunto">
          <xsl:with-param name="conteudo" select="$assunto"/>
        </xsl:call-template>
      </span>
      <div class="col-4 col-sm-4 pull-left">
        <div class="destaque-item-imagem">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="tamanho" select="'90'"/>
            <xsl:with-param name="altura" select="'68'"/>
            <xsl:with-param name="tipo" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-left'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
      </div>
      <div class="col-8 col-sm-8 pull-right">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
    </div>
  </xsl:template>

  <!-- DESTAQUE_D - Assunto + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_d">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
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

    <div id="bc_destaque_d" itemscope="" itemtype="https://schema.org/NewsArticle">
      <span class="tag">
        <xsl:call-template name="get-assunto">
          <xsl:with-param name="conteudo" select="$assunto"/>
        </xsl:call-template>
      </span>
      <h5 itemprop="headline">
        <xsl:call-template name="linkmanchete">
          <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
          <xsl:with-param name="link" select="$link"/>
        </xsl:call-template>
      </h5>
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

  <!-- DESTAQUE_F - Duplo Box c/ Foto Destaque + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_f">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row" id="bc_destaque_f" &gt;
      </xsl:text>
    </xsl:if>
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div class="col-6" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
          <xsl:with-param name="tamanho" select="'150'"/>
          <xsl:with-param name="altura" select="'114'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-fluid img-center'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <h5 class="fw-bold" itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- DESTAQUE_G (PQ) - IntBox Foto Pequena + Chapeu + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_g">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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

    <div id="bc_destaque_g" class="row gx-3 p-0 w-100 py-2 border-top" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="col-3">
        <div class="destaque-item-imagem">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="tamanho" select="'90'"/>
            <xsl:with-param name="altura" select="'68'"/>
            <xsl:with-param name="tipo" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-fluid'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
      </div>
      <div class="col-9">
        <label class="d-block tag mb-1">
            <span class="chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="$assunto"/>
              </xsl:call-template>
            </span>
        </label>
        <span class="h6 d-block" itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </span>
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

  <!-- DESTAQUE_H (PQ) - IntBox c/ Foto Pequena + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_h">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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

    <div id="bc_destaque_h" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'90'"/>
          <xsl:with-param name="altura" select="'68'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_I (Compatibilidade 450) - Foto Destaque + Assunto + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_i">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="nome-css-class" xml:space="default">
      <xsl:choose>
        <xsl:when test="$position='1'">float-left col-md-4 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='2'">float-left col-md-4 no-padding-right pd-0</xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_destaque_i" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem align-top no-padding">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
          <xsl:with-param name="tamanho" select="'240'"/>
          <xsl:with-param name="altura" select="'180'"/>
          <xsl:with-param name="tipo" select="'destaque'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-center'"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont align-top no-padding">
        <span class="tag p-t-10">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_J (Compatibilidade 450) - Tr�s box contendo Assunto + Manchete + Foto destaque pequena; HTML Adaptado OK - Thiago -->
  <xsl:template name="bc_destaque_j">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="nome-css-class" xml:space="default">
      <xsl:choose>
        <xsl:when test="$position='1'">float-left col-md-4 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='2'">float-left col-md-4 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='3'">float-left col-md-4 no-padding-right pd-0</xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_destaque_j" class="col-md-4" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem align-top no-padding">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
          <xsl:with-param name="tamanho" select="'90'"/>
          <xsl:with-param name="altura" select="'68'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-center'"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont align-top no-padding">
        <span class="tag p-t-10">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_M (Compatibilidade 450) - Tr�s box contendo Manchete + Foto destaque pequena; HTML Adaptado OK - Thiago -->
  <xsl:template name="bc_destaque_m">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="nome-css-class" xml:space="default">
      <xsl:choose>
        <xsl:when test="$position='1'">float-left col-md-4 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='2'">float-left col-md-4 no-padding-left pd-0 mb-mg-bt-20</xsl:when>
        <xsl:when test="$position='3'">float-left col-md-4 no-padding-right pd-0</xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>

    <div id="bc_destaque_j" class="col-md-4" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem align-top no-padding">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
          <xsl:with-param name="tamanho" select="'90'"/>
          <xsl:with-param name="altura" select="'68'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-center'"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont align-top no-padding">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
  </xsl:template>

  <!-- DESTAQUE_O (Compatibilidade 450) - Duplo Box c/ Foto Pequena + Chapeu + Manchete - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_o">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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

    <div id="bc_destaque_o" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="col-sm-3">
        <div class="destaque-item-imagem">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="tipo" select="'destaque'"/>
            <xsl:with-param name="cssclass" select="'img-left'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
      </div>
      <div class="col-sm-9">
        <span class="tag">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
        <h4 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h4>
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

      </div>
    </div>
  </xsl:template>

  <!-- DESTAQUE_K SEM ASSUNTO - [4 fotos] + [4 destaques (abaixo de cada foto) ]  - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_k">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
      
    <div id="bc_destaque_k" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'90'"/>
          <xsl:with-param name="altura" select="'68'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="''"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- DESTAQUE_N - [4 fotos] + [4 destaques (abaixo de cada foto) ] - Ivan: ok revisado micro-codigos; HTML OK - Thiago -->
  <xsl:template name="bc_destaque_n">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
      
    <div id="bc_destaque_n" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="destaque-item-imagem">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'90'"/>
          <xsl:with-param name="altura" select="'68'"/>
          <xsl:with-param name="tipo" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="''"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
      <div class="destaque-item-cont">
        <span>
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
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
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_N SEM ASSUNTO  -->
  <xsl:template name="bc_destaque_n_sem_assunto">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <xsl:variable name="author">
		<xsl:if test="$idnoticia=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
        </xsl:if>
		<xsl:if test="$idnoticia!=''">
		   <xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
        </xsl:if>	    
    </xsl:variable>
    <div class="col-sm-3">
      <div class="intbox box-destaque clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="''"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
        <div class="box-destaque-cont">
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
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>