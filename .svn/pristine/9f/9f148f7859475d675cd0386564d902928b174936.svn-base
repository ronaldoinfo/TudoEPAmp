<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />
  <xsl:variable name="videolink" select="xsl-extensoes:getValueAppSettings('EMC_Videos')" />
  <!-- MediaCenter Modelo 1 (compatibilidade) - 'bc_EMC_1' -->
  <xsl:template name="bc_EMC_1">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:variable name="_link">
      <xsl:value-of select="$link"/>
    </xsl:variable>
    <xsl:variable name="imagem">
      <xsl:call-template name="imagem-emc">
        <xsl:with-param name="arquivo" select="concat($arquivo,@arquivo)" />
        <xsl:with-param name="mod" select="1" />
      </xsl:call-template>
    </xsl:variable>
    <div class="intbox box-emc clearfix" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
      <div class="item-thumbnail">
        <a class="img-thumb-zoom" href="{$_link}" itemprop="thumbnailUrl">
          <figure>
            <img alt="{concat(@descricao,$descricao)}" title="{concat(@descricao,$descricao)}" src="{$imagem}" itemprop="thumbnail" />
            <span class="icon-midia">
              <i class="fa fa-play fa-3x">
                <xsl:comment></xsl:comment>
              </i>
            </span>
          </figure>
        </a>
      </div>
      <div class="info-box">
        <div class="materia-assunto" itemprop="about">
          <span>
            <xsl:value-of select="concat(@assunto,$chapeu)"/>
          </span>
        </div>
        <h3 itemprop="description">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="concat(@descricao,$descricao)"/>
          </a>
        </h3>
      </div>
    </div>
  </xsl:template>

  <!-- MediaCenter Modelo 2 (compatibilidade) - 'bc_EMC_2' -->
  <xsl:template name="bc_EMC_2">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:variable name="_link">
      <xsl:value-of select="$link"/>
    </xsl:variable>
    <xsl:variable name="imagem">
      <xsl:call-template name="imagem-emc">
        <xsl:with-param name="arquivo" select="concat($arquivo,@arquivo)" />
        <xsl:with-param name="mod" select="2" />
      </xsl:call-template>
    </xsl:variable>
    <div class="intbox box-emc emc-pq clearfix" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
      <div class="item-thumbnail-float">
        <a class="img-thumb-zoom" href="{$_link}" itemprop="thumbnailUrl">
          <figure>
            <img alt="{concat(@descricao,$descricao)}" title="{concat(@descricao,$descricao)}" src="{$imagem}" itemprop="thumbnail"  width="140" height="105" />
            <span class="icon-midia">
              <i class="fa fa-play fa-lg">
                <xsl:comment></xsl:comment>
              </i>
            </span>
          </figure>
        </a>
      </div>
      <div class="info-box">
        <div class="materia-assunto" itemprop="about">
          <span>
            <a href="{$_link}" itemprop="url">
              <xsl:value-of select="concat(@assunto,$chapeu)"/>
            </a>
          </span>
        </div>
        <h3 class="titulo-md" itemprop="name">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="concat(@descricao,$descricao)"/>
          </a>
        </h3>
      </div>
    </div>
  </xsl:template>

  <!-- MediaCenter Modelo 3 (compatibilidade) - 'bc_EMC_3' -->
  <xsl:template name="bc_EMC_3">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>


    <xsl:variable name="_link">
      <xsl:value-of select="$link"/>
    </xsl:variable>
    <xsl:variable name="imagem">
      <xsl:call-template name="imagem-emc">
        <xsl:with-param name="arquivo" select="$arquivo" />
        <xsl:with-param name="mod" select="2" />
      </xsl:call-template>
    </xsl:variable>

    <div id="bc_EMC_3" class="col col-md-6" itemscope="" itemtype="http://schema.org/Periodical">
        <div class="materia-assunto" itemprop="about" style="display: none">
          <span>
            <xsl:value-of select="concat(@assunto,$chapeu)"/>
          </span>
        </div>
        <div class="destaque-item-imagem">
           <a class="img-thumb-zoom" href="{$_link}" itemprop="thumbnailUrl">
              <figure>
                <img alt="{concat(@descricao,$descricao)}" title="{concat(@descricao,$descricao)}" src="{$imagem}" itemprop="thumbnail"  width="150" height="114" />
                <span class="icon-midia">
                  <i class="fa fa-play fa-lg">
                    <xsl:comment></xsl:comment>
                  </i>
                </span>
              </figure>
            </a>
        </div>
        <div class="destaque-item-cont">
            <h5>
              <a href="{$_link}" itemprop="url">
                <span class="no-margin-top" itemprop="name">
                  <xsl:value-of select="concat(@descricao,$descricao)"/>
                </span>
              </a>
            </h5>
          </div>
    </div>

    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- MediaCenter Modelo 3 (compatibilidade) - 'bc_EMC_3_Dinamico' -->
  <xsl:template name="bc_EMC_3_Dinamico">
    <xsl:param name="idsecao" />

    <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    
    <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
      <xsl:sort select="@publicacao" order="descending" />
      <xsl:if test="position() &lt;= 2">
        <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
        <xsl:variable name="link">
          <xsl:value-of select="concat(@url,'.aspx')"/>
        </xsl:variable>
        <xsl:variable name="imagem">
          <xsl:call-template name="imagem-emc">
            <xsl:with-param name="arquivo" select="@arquivo" />
            <xsl:with-param name="mod" select="1" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="manchete">
          <xsl:value-of select="@manchete"/>
        </xsl:variable>

        <xsl:variable name="newimagem">
          <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
        </xsl:variable>

        <div id="bc_EMC_3" class="col col-md-6" itemscope="" itemtype="http://schema.org/Periodical">
          <div class="materia-assunto" itemprop="about" style="display: none">
            <span>              
              <xsl:value-of select="@manchete"/>
            </span>
          </div>
          <div class="destaque-item-imagem">
            <a class="img-thumb-zoom" href="{$link}" itemprop="thumbnailUrl">
              <figure>
                <img alt="{$manchete}" title="{$manchete}" src="{$newimagem}" itemprop="thumbnail"  width="150" height="114" />
                <span class="icon-midia">
                  <i class="fa fa-play fa-lg">
                    <xsl:comment></xsl:comment>
                  </i>
                </span>
              </figure>
            </a>
          </div>
          <div class="destaque-item-cont">
            <h5>
              <a href="{$link}" itemprop="url">
                <span class="no-margin-top" itemprop="name">
                  <xsl:value-of select="@manchete"/>
                </span>
              </a>
            </h5>
          </div>
        </div>
      
      </xsl:if>
    </xsl:for-each>
    <xsl:text disable-output-escaping="yes">
			&lt;/div&gt;
    </xsl:text>
  </xsl:template>

  <!-- MediaCenter Modelo 4 (compatibilidade) - 'bc_EMC_4' -->
  <xsl:template name="bc_EMC_4">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:param name="position" />

    <xsl:call-template name="EMC-Mod-Comum">
      <xsl:with-param name="arquivo" select="concat($arquivo,@arquivo)" />
      <xsl:with-param name="link" select="$link" />
      <xsl:with-param name="descricao" select="$descricao" />
      <xsl:with-param name="chapeu" select="$chapeu" />
      <xsl:with-param name="position" select="$position" />
    </xsl:call-template>

  </xsl:template>

  <!-- MediaCenter ÚLTIMO VIDEO SECAO (compatibilidade) - 'bc_ultimo_video_lateral' -->
  <xsl:template name="bc_ultimo_video_secao">
    <xsl:param name="secao_id" />
    <xsl:param name="idportal" />
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/videos/ucBoxUltimoVideoSecao.ascx', concat('secao_id=&quot;',$secao_id,'&quot;',' idportal=&quot;',$idportal,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!-- box videos ON PLAY Acidadeon  -->
  <xsl:template name="bc_videos_on_play">
    <xsl:param name="video_id"/>
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:param name="position" />

    <xsl:variable name="data">
      <xsl:call-template name="formatasodata">
        <xsl:with-param name="data" select="$videos//*[@idvideo=$video_id]//@publicacao" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="$position='ultimo'">

      <section class="col-12 float-left mg-bt-30 mobile-margin-0" id="bc_videos_on_play">
        <h4 class="card-header no-padding-right">
          <a href="onplay/" title="ON Play">
            <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
          </a>
          <a href="onplay/" class="link link-access right pt-10">Ver todos</a>
        </h4>

        <xsl:variable name="imagem">
          <xsl:call-template name="imagem-emc">
            <xsl:with-param name="arquivo" select="$arquivo" />
            <xsl:with-param name="mod" select="1" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="newimagem">
          <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />                              
        </xsl:variable>


        <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
          <a href="{$link}" class="cover">
            <figure>
              <img src="{$newimagem}" alt=""/>
              <span class="fa fa-play-circle"></span>    
            </figure>

            <figcaption class="full p-t-10">
              <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                <span class="tag" itemprop="name">
                  <xsl:value-of select="$data" />
                </span>
                <p class="semiBold" itemprop="description">
                  <xsl:value-of select="$descricao" />
                </p>
              </div>
            </figcaption>
          </a>
        </div>        
        
      </section>
    </xsl:if>   

  </xsl:template>

  <!-- box videos ON PLAY Acidadeon Dinamico  -->
  <xsl:template name="bc_videos_onplay_dinamico">
    <xsl:param name="idsecao" />


    <section class="col-12 float-left mg-bt-30 mobile-margin-0" id="bc_videos_onplay_dinamico">
      <h4 class="card-header no-padding-right">
        <a href="onplay/" title="ON Play">
          <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
        </a>
        <a href="onplay/" class="link link-access right pt-10">Ver todos</a>
      </h4>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
        <xsl:sort select="@publicacao" order="descending" />

        <xsl:if test="position() = 1">

          <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>
        </xsl:if>

      </xsl:for-each>

    </section>
  </xsl:template>
  
    <!-- Monta aba  -->
  <xsl:template name="monta-aba">
    <xsl:param name="secao_id" />
    <xsl:param name="pos" />

    <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$secao_id]">
      <xsl:if test="position() = 1">
        <li>
          <a href="#aba{$pos}" class="aba-desativa">
            <xsl:value-of select="@nomesecao" />
          </a>
        </li>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="bc_videos_dinamico_2_ultimos">
      
	  <xsl:if test="position() = 1">
        <h4 class="card-header no-padding-right">
          <a href="onplay/" title="ON Play">
            <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
          </a>
          <a href="onplay/" class="link link-access right pt-10">Ver todos</a>
        </h4>
      </xsl:if>
	  
    <section class="col-12 col-lg-12 col-xl-6  float-left mg-bt-30 mobile-margin-0" id="bc_videos_dinamico_2_ultimos">
         <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>

    </section>
  </xsl:template>

  <xsl:template name="bc_videos_estatico_4_videos">
    <xsl:param name="idsecao" />
    <xsl:param name="idsecao2" />
    <xsl:param name="idsecao3" />
    <xsl:param name="idsecao4" />

    <section class="float-left mg-bt-30 mobile-margin-0" id="bc_videos_estatico_4_videos">
      <h4 class="card-header no-padding-right">
        <a href="onplay/" title="ON Play">
          <img src="https://statics.tudoep.com/tudoep.v56/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
        </a>
        <a href="onplay/" class="link link-access right pt-10">Ver todos</a>
      </h4>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
        <xsl:sort select="@publicacao" order="descending" />

        <xsl:if test="position() = 1">
         <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
          <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="col-12 col-lg-12 col-xl-3 video video-card  no-padding pull-left" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>
        </xsl:if>

      </xsl:for-each>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao2]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
        <xsl:sort select="@publicacao" order="descending" />

        <xsl:if test="position() = 1">
          <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
          <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="col-12 col-lg-12 col-xl-3 video video-card  no-padding pull-left" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>
        </xsl:if>

      </xsl:for-each>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao3]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
        <xsl:sort select="@publicacao" order="descending" />

        <xsl:if test="position() = 1">
          <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
          <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="col-12 col-lg-12 col-xl-3 video video-card  no-padding pull-left" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>
        </xsl:if>

      </xsl:for-each>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao4]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
        <xsl:sort select="@publicacao" order="descending" />

        <xsl:if test="position() = 1">
        <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
          <xsl:variable name="imagem">
            <xsl:call-template name="imagem-emc">
              <xsl:with-param name="arquivo" select="@arquivo" />
              <xsl:with-param name="mod" select="1" />
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="newimagem">
            <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
          </xsl:variable>

          <xsl:variable name="data">
            <xsl:call-template name="formatasodata">
              <xsl:with-param name="data" select="@publicacao" />
            </xsl:call-template>
          </xsl:variable>

          <div class="col-12 col-lg-12 col-xl-3 video video-card  no-padding pull-left" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
            <a href="onplay/{@url}.aspx" class="cover">
              <figure>
                <img src="{$newimagem}" alt=""/>
                <span class="fa fa-play-circle"></span>
              </figure>

              <figcaption class="full p-t-10">
                <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                  <span class="tag" itemprop="name">
                    <xsl:value-of select="$data" />
                  </span>
                  <p class="semiBold" itemprop="description">

                    <xsl:if test="string-length(@manchete) &lt;= 64">
                      <xsl:value-of select="@manchete" />
                    </xsl:if>

                    <xsl:if test="string-length(@manchete) &gt; 64">
                      <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                    </xsl:if>
                  </p>
                </div>
              </figcaption>
            </a>
          </div>
        </xsl:if>

      </xsl:for-each>

    </section>
  </xsl:template>

  <xsl:template name="bc_ultimos_videos_abas_estatico">
    <xsl:param name="idsecao" />
    <xsl:param name="quantidade" />
    <xsl:param name="idsecaoaba2" />
    <xsl:param name="quantidadeaba2" />
    <xsl:param name="idsecaoaba3" />
    <xsl:param name="quantidadeaba3" />
    <xsl:param name="idsecaoaba4" />
    <xsl:param name="quantidadeaba4" />
    <xsl:param name="idsecaoaba5" />
    <xsl:param name="quantidadeaba5" />
    <xsl:param name="idsecaoaba6" />
    <xsl:param name="quantidadeaba6" />

    <xsl:variable name="NomeAba1">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecao]//@nomesecao" />
    </xsl:variable>
    <xsl:variable name="NomeAba2">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecaoaba2]//@nomesecao" />
    </xsl:variable>
    <xsl:variable name="NomeAba3">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecaoaba3]//@nomesecao" />
    </xsl:variable>
    <xsl:variable name="NomeAba4">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecaoaba4]//@nomesecao" />
    </xsl:variable>
    <xsl:variable name="NomeAba5">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecaoaba5]//@nomesecao" />
    </xsl:variable>
    <xsl:variable name="NomeAba6">
      <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$idsecaoaba6]//@nomesecao" />
    </xsl:variable>

    <div id="BoxEditoriais">
      <div class="full h4 card-header no-padding-right no-margin-bottom no-padding-bottom">
        editorias
        <div class="right mobile-nav-scroll no-padding">
          <ul class="nav nav-pills">
            <xsl:if test="$idsecao != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecao]//video)>0  and ($videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba1" data-toggle="pill" class="link nav-link active show">
                    <xsl:value-of select="$NomeAba1"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$idsecaoaba2 != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecaoaba2]//video)>0 and ($videos//midiaCenter//*[@idsecao=$idsecaoaba2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba2" data-toggle="pill" class="link nav-link">
                    <xsl:value-of select="$NomeAba2"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$idsecaoaba3 != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecaoaba3]//video)>0 and ($videos//midiaCenter//*[@idsecao=$idsecaoaba3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba3" data-toggle="pill" class="link nav-link">
                    <xsl:value-of select="$NomeAba3"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$idsecaoaba4 != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecaoaba4]//video)>0 and ($videos//midiaCenter//*[@idsecao=$idsecaoaba4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba4" data-toggle="pill" class="link nav-link">
                    <xsl:value-of select="$NomeAba4"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$idsecaoaba5 != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecaoaba5]//video)>0 and ($videos//midiaCenter//*[@idsecao=$idsecaoaba5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba5" data-toggle="pill" class="link nav-link">
                    <xsl:value-of select="$NomeAba5"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$idsecaoaba6 != ''">
              <xsl:if test="count($videos//midiaCenter//*[@idsecao=$idsecaoaba6]//video)>0 and ($videos//midiaCenter//*[@idsecao=$idsecaoaba6]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
                <li class="nav-item">
                  <a href="#NomeAba6" data-toggle="pill" class="link nav-link">
                    <xsl:value-of select="$NomeAba6"/>
                  </a>
                </li>
              </xsl:if>
            </xsl:if>
          </ul>
        </div>
      </div>
      <div class="full tab-content editorials">
        <xsl:if test="$idsecao != '' and ($videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade show active" id="NomeAba1">
            <div class="col-9">
              <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>
                  
                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" /></span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>

                </xsl:if>
              </xsl:for-each>
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-3 pull-right">
                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                </div>
              </xsl:if>
            </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:if test="$idsecaoaba2 != '' and ($videos//midiaCenter//*[@idsecao=$idsecaoaba2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade" id="NomeAba2">
            <div class="col-9">
              <xsl:for-each select="//*[@idsecao=$idsecaoaba2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>

                </xsl:if>
              </xsl:for-each>
              
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba2">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-3 pull-right">
                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                </div>
                
              </xsl:if>
            </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:if test="$idsecaoaba3 != '' and ($videos//midiaCenter//*[@idsecao=$idsecaoaba3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade" id="NomeAba3">
            <div class="col-9">
              <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>

                </xsl:if>
              </xsl:for-each>
              
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba3">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-3 pull-right">
                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                </div>

              </xsl:if>
            </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:if test="$idsecaoaba4 != '' and ($videos//midiaCenter//*[@idsecao=$idsecaoaba4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade" id="NomeAba4">
            <div class="col-9">
              <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                  
                </xsl:if>
              </xsl:for-each>
              
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba4">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-3 pull-right">
                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                </div>
                
              </xsl:if>
            </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:if test="$idsecaoaba5 != '' and ($videos//midiaCenter//*[@idsecao=$idsecaoaba5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade" id="NomeAba5">
            <div class="col-9">
              <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>
                  
                </xsl:if>
              </xsl:for-each>
              
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba5">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="col-3 pull-right">
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </div>

                </xsl:if>
              </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:if test="$idsecaoaba6 != '' and ($videos//midiaCenter//*[@idsecao=$idsecaoaba6]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
          <div class="row tab-pane fade" id="NomeAba6">
            <div class="col-9">
              <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba6]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()=1">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
                  <xsl:variable name="imagem">
                    <xsl:call-template name="imagem-emc">
                      <xsl:with-param name="arquivo" select="@arquivo" />
                      <xsl:with-param name="mod" select="1" />
                    </xsl:call-template>
                  </xsl:variable>

                  <xsl:variable name="newimagem">
                    <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                  </xsl:variable>

                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                    <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                      <figure>
                        <img src="{$newimagem}" alt="" />
                        <span class="fa fa-play-circle"></span>
                      </figure>
                      <figcaption class="full p-t-10">
                        <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                          <span class="tag" itemprop="name">
                            <xsl:value-of select="$data" />
                          </span>
                          <p class="semiBold" itemprop="description">
                            <xsl:if test="string-length(@manchete) &lt;= 64">
                              <xsl:value-of select="@manchete" />
                            </xsl:if>

                            <xsl:if test="string-length(@manchete) &gt; 64">
                              <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                            </xsl:if>
                          </p>
                        </div>
                      </figcaption>
                    </a>
                  </div>

                </xsl:if>
              </xsl:for-each>
              
            </div>
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecaoaba6]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
                <xsl:sort select="@publicacao" order="descending"/>
                <xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba6">
                  <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
                  <xsl:variable name="data">
                    <xsl:call-template name="formatasodata">
                      <xsl:with-param name="data" select="@publicacao" />
                    </xsl:call-template>
                  </xsl:variable>

                  <div class="col-3 pull-right">
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover" style="height: auto;">
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <img src="/img/icons/video.jpg" alt="Vídeo" width="20" style="width: 16px;margin-top: -4px;"></img>
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </div>

                </xsl:if>
              </xsl:for-each>
          </div>
        </xsl:if>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_videos_estatico_5_videos">
    <xsl:param name="idsecao" />
    <xsl:param name="idsecao2" />
    <xsl:param name="idsecao3" />
    <xsl:param name="idsecao4" />
    <xsl:param name="idsecao5" />

    <div id="NovoBox5Videos">
      <h4 class="card-header no-padding-right">
        <a href="onplay/" title="ON Play">
          <img src="https://statics.acidadeon.com/acidadeon/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"></img>
        </a>
        <a href="onplay/" class="link link-access right pt-10">Ver todos</a>
      </h4>

      <div class="row">

        <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
          <xsl:sort select="@publicacao" order="descending"/>
          <xsl:if test="position()=1">
            <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

            <xsl:variable name="imagem">
              <xsl:call-template name="imagem-emc">
                <xsl:with-param name="arquivo" select="@arquivo" />
                <xsl:with-param name="mod" select="1" />
              </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="newimagem">
              <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
            </xsl:variable>

            <xsl:variable name="data">
              <xsl:call-template name="formatasodata">
                <xsl:with-param name="data" select="@publicacao" />
              </xsl:call-template>
            </xsl:variable>

            <section class="col-xs-12 col-md-6 video-coluna-1">
              <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                <a href="onplay/{@url}.aspx" class="cover">
                  <figure>
                    <img src="{$newimagem}" alt=""></img>
                    <span class="fa fa-play-circle"></span>
                  </figure>
                  <figcaption class="full p-t-10">
                    <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                      <span class="tag" itemprop="name">
                        <xsl:value-of select="$data" />
                      </span>
                      <p class="semiBold" itemprop="description">
                        <xsl:if test="string-length(@manchete) &lt;= 64">
                          <xsl:value-of select="@manchete" />
                        </xsl:if>

                        <xsl:if test="string-length(@manchete) &gt; 64">
                          <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                        </xsl:if>
                      </p>
                    </div>
                  </figcaption>
                </a>
              </div>
            </section>
          </xsl:if>
        </xsl:for-each>

        <section class="col-xs-12 col-md-6 video-coluna-2">
          <div class="row">
            <!--fazer dois foreachs separados, 1 com cada seção específica-->
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()=1">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="imagem">
                  <xsl:call-template name="imagem-emc">
                    <xsl:with-param name="arquivo" select="@arquivo" />
                    <xsl:with-param name="mod" select="1" />
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="newimagem">
                  <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                </xsl:variable>

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-xs-12 col-md-6 video-coluna-2-box-01">
                  <section>
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover">
                        <figure>
                          <img src="{$newimagem}" alt=""></img>
                          <span class="fa fa-play-circle"></span>
                        </figure>
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </section>
                </div>
              </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()=1">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="imagem">
                  <xsl:call-template name="imagem-emc">
                    <xsl:with-param name="arquivo" select="@arquivo" />
                    <xsl:with-param name="mod" select="1" />
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="newimagem">
                  <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                </xsl:variable>

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-xs-12 col-md-6 video-coluna-2-box-02">
                  <section>
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover">
                        <figure>
                          <img src="{$newimagem}" alt=""></img>
                          <span class="fa fa-play-circle"></span>
                        </figure>
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </section>
                </div>
              </xsl:if>
            </xsl:for-each>
          </div>

          <div class="row">
            <!--fazer dois foreachs separados, 1 com cada seção específica-->
            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()=1">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="imagem">
                  <xsl:call-template name="imagem-emc">
                    <xsl:with-param name="arquivo" select="@arquivo" />
                    <xsl:with-param name="mod" select="1" />
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="newimagem">
                  <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                </xsl:variable>

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-xs-12 col-md-6 video-coluna-2-box-03">
                  <section>
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover">
                        <figure>
                          <img src="{$newimagem}" alt=""></img>
                          <span class="fa fa-play-circle"></span>
                        </figure>
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </section>
                </div>
              </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
              <xsl:sort select="@publicacao" order="descending"/>
              <xsl:if test="position()=1">
                <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

                <xsl:variable name="imagem">
                  <xsl:call-template name="imagem-emc">
                    <xsl:with-param name="arquivo" select="@arquivo" />
                    <xsl:with-param name="mod" select="1" />
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="newimagem">
                  <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
                </xsl:variable>

                <xsl:variable name="data">
                  <xsl:call-template name="formatasodata">
                    <xsl:with-param name="data" select="@publicacao" />
                  </xsl:call-template>
                </xsl:variable>

                <div class="col-xs-12 col-md-6 video-coluna-2-box-04">
                  <section>
                    <div class="video video-card  no-padding" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
                      <a href="onplay/{@url}.aspx" class="cover">
                        <figure>
                          <img src="{$newimagem}" alt=""></img>
                          <span class="fa fa-play-circle"></span>
                        </figure>
                        <figcaption class="full p-t-10">
                          <div itemprop="description" class="col-lg-12 align-middle float-left alpha">
                            <span class="tag" itemprop="name">
                              <xsl:value-of select="$data" />
                            </span>
                            <p class="semiBold" itemprop="description">
                              <xsl:if test="string-length(@manchete) &lt;= 64">
                                <xsl:value-of select="@manchete" />
                              </xsl:if>

                              <xsl:if test="string-length(@manchete) &gt; 64">
                                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
                              </xsl:if>
                            </p>
                          </div>
                        </figcaption>
                      </a>
                    </div>
                  </section>
                </div>
              </xsl:if>
            </xsl:for-each>
          </div>
        </section>

      </div>

    </div>
  </xsl:template>

</xsl:stylesheet>