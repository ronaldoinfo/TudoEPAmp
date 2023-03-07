<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- NOTA_A - Assunto + Manchete - Ivan: ok revisado micro-codigos e classes css | Thiago OK -->
  <xsl:template name="bc_nota_a">
    <xsl:param name="idnoticia" />
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <div id="bc_nota_a" class="bc_nota_a bc-nota d-block position-relative border-bottom pb-3 mb-3" itemscope="" itemtype="https://schema.org/NewsArticle">
      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">				 
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
      <div class="ps-3" style="border-inline-start: 2px solid var(--bs-primary);">
      <label class="d-flex m-0 p-0">
        <span class="chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
          </xsl:call-template>
        </span>
      </label>

      <div class="d-block pt-2">
        <xsl:call-template name="linkmanchete">
          <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'h4 stretched-link d-block lh-2'"/>
        </xsl:call-template>
      </div>
      
      </div>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
      <xsl:value-of select="@publicacao" />
      <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      <xsl:value-of select="$author" disable-output-escaping="yes"/>     
      
      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">
         </xsl:text>
      </xsl:if>
    </div>
  </xsl:template>

  <!-- NOTA_B (Compatibilidade) - Manchete -->
  <xsl:template name="bc_nota_b">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />

    <div class="intbox box-notas clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box-notas-item">
        <div class="info-box">
          <h2 itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
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
      </div>
    </div>
  </xsl:template>

  <!-- NOTA_C (Compatibilidade) - Manchete -->
  <xsl:template name="bc_nota_c">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="position" />

    <div class="intbox box-notas clearfix" itemscope="" itemtype="https://schema.org/NewsArticle">
      <div class="box-notas-item">
        <div class="info-box">
          <h2 itemprop="headline">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
        <h3 itemprop="description">
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>

        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      </div>
    </div>
  </xsl:template>

  <!-- NOTA_D - Data Publicação + Manchete - Ivan: ok revisado micro-codigos e classes css | Thiago OK -->
  <xsl:template name="bc_nota_d">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;ul class="schedule" id="bc_nota_d" &gt;
      </xsl:text>
    </xsl:if>
    <ul class="headline">
      <li itemscope="" itemtype="https://schema.org/NewsArticle">
        <div class="col-3 col-lg-3 h4 date align-middle ">
          <time itemprop="datePublished" datetime="{@publicacao}">
            <xsl:call-template name="formatahora-extenso">
              <xsl:with-param name="data" select="@publicacao">
              </xsl:with-param>
            </xsl:call-template>
          </time>
        </div>
        <div class="col-9 col-lg-9 align-sub no-padding-right">
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

        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      </li>
    </ul>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/ul&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- NOTA_E - Traço + Manchete - Ivan: ok revisado micro-codigos e classes css | Thiago OK -->
  <xsl:template name="bc_nota_e">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;ul class="list-border" id="bc_nota_e" &gt;
      </xsl:text>
    </xsl:if>
    <!-- <ul class="headline"> -->
      <li class="mg-tp-20" itemscope="" itemtype="https://schema.org/NewsArticle">
        <h5 class="no-margin-bottom" itemprop="headline">
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
      </li>
    <!-- </ul> -->
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/ul&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- NOTA_G - Bullet + Manchete - Ivan: ok revisado micro-codigos e classes css | Thiago OK -->
  <xsl:template name="bc_nota_g">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
        &lt;ul class="headline" id="bc_nota_g"&gt;
      </xsl:text>
    </xsl:if>
    <ul class="headline bcotagclass">
      <li itemscope="" itemtype="https://schema.org/NewsArticle">
        <span itemprop="headline">
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
      </li>
    </ul>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">    
          &lt;/ul&gt;
      </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- NOTA_H - Bullet + Manchete + Linha Fina - Ivan: revisado micro-codigos  | Thiago OK -->
  <xsl:template name="bc_nota_h">
    <xsl:param name="idnoticia" />  
    <xsl:param name="destaque" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;ul class="headline" id="bc_nota_h" &gt;
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
    <ul class="headline">
      <li itemscope="" itemtype="https://schema.org/NewsArticle">
        <h5 itemprop="headline">
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h5>
        <h6 itemprop="description">
          <span class="mg-tp-10 text-left">
            <xsl:call-template name="get-destaque">
              <xsl:with-param name="conteudo" select="translate($destaque, $quot, $apos)"/>
            </xsl:call-template>
          </span>
        </h6>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
        <xsl:value-of select="@publicacao" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

		<xsl:value-of select="@author" />
      </li>
    </ul>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/ul&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
