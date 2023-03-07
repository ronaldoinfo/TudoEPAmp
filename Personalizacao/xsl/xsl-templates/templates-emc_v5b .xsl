<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />
  <xsl:variable name="videos" select="xsl-extensoes:GetXmlVideos()" />
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
        <h2 itemprop="description">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="concat(@descricao,$descricao)"/>
          </a>
        </h2>
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
        <h2 class="titulo-md" itemprop="name">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="concat(@descricao,$descricao)"/>
          </a>
        </h2>
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
    <div class="col-xs-6">
      <div class="intbox box-emc clearfix" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
        <div class="materia-assunto" itemprop="about">
          <span>
            <xsl:value-of select="concat(@assunto,$chapeu)"/>
          </span>
        </div>
        <div class="item-thumbnail">
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
        <h2 itemprop="description">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="concat(@descricao,$descricao)"/>
          </a>
        </h2>
      </div>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
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

  <!-- MediaCenter Modelo 7 (compatibilidade) - 'bc_EMC_7' -->
  <xsl:template name="bc_EMC_7">
    <xsl:param name="video_id" />
    <xsl:param name="diretorio" />
    <div class="boletim">
      <div class="tit-box cor-ref">Boletim</div>
      <xsl:if test="$video_id =''">

        <div class="intbox">
          <xsl:call-template name="monta-embed">
            <xsl:with-param name="diretorio" select="$diretorio" />
          </xsl:call-template>
          <xsl:call-template name="monta-noticias-relacionadas">
            <xsl:with-param name="video_id" select="@idvideo" />
            <xsl:with-param name="diretorio" select="$diretorio" />
          </xsl:call-template>
        </div>
        <!--</xsl:if>
        </xsl:for-each>-->
      </xsl:if>
      <xsl:if test="$video_id !=''">
        <xsl:for-each select="$videos//midiaCenter//*[@idvideo = $video_id]">
          <xsl:if test="position()=1">
            <div class="intbox">
              <xsl:call-template name="monta-embed">
                <xsl:with-param name="diretorio" select="$diretorio" />
              </xsl:call-template>
              <xsl:call-template name="monta-noticias-relacionadas">
                <xsl:with-param name="video_id" select="$video_id" />
                <xsl:with-param name="diretorio" select="$diretorio" />
              </xsl:call-template>
            </div>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </div>
  </xsl:template>

  <!-- MediaCenter Modelo 9 (compatibilidade) - 'bc_EMC_9' -->
  <xsl:template name="bc_EMC_9">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:param name="position" />

    <xsl:call-template name="EMC-Mod-Comum">
      <xsl:with-param name="arquivo" select="$arquivo" />
      <xsl:with-param name="link" select="$link" />
      <xsl:with-param name="subpasta" select="$subpasta" />
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
            <img src="https://statics.acidadeon.com/acidadeon/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
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
              <!--<i class="fa fa-play-circle"></i>-->
              <img src="{$newimagem}" alt=""/>
            
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
          <img src="https://statics.acidadeon.com/acidadeon/img/logos/onplay.svg" alt="ON Play" width="130px" height="23.81px"/>
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
                <!--<i class="fa fa-play-circle"></i>-->
                <img src="{$newimagem}" alt=""/>
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

  <xsl:template name="monta-embed">
    <xsl:param name="diretorio" />
    <xsl:param name="arquivo" />

    <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)&#xA;            " />
    <xsl:variable name="height">
      <xsl:if test="@wide != 'S'">
        <xsl:value-of select="'250'"/>
      </xsl:if>
      <xsl:if test="@wide = 'S'">
        <xsl:value-of select="'201'"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="width">
      <xsl:value-of select="'300'"/>
    </xsl:variable>
    <xsl:variable name="videolink_">
      <xsl:value-of select="$videolink" />
    </xsl:variable>

    <xsl:variable name="imagem">
      <xsl:call-template name="imagem-emc">
        <xsl:with-param name="arquivo" select="concat(@subpasta,@arquivo)" />
        <xsl:with-param name="mod" select="1" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="newimagem">
      <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
    </xsl:variable>

    <xsl:variable name="videotype">
      <xsl:choose>
        <xsl:when test="contains(@arquivo,'.mp4') or contains(@arquivo,'.MP4')">
          <xsl:value-of select="'video/mp4'" />
        </xsl:when>
        <xsl:when test="contains(@arquivo,'.flv')  or contains(@arquivo,'.FLV')">
          <xsl:value-of select="'video/x-flv'" />
        </xsl:when>
      </xsl:choose>
    </xsl:variable>


    <div id="player">
      <video id="player-video" class="video-js vjs-default-skin player-video" width="{$width}" height="{$height}" controls="" preload="none" poster="{$newimagem}" data-setup="{'{}'}">
        <source src="{$videolink_}/{@subpasta}{@arquivo}" type="{$videotype}" />
      </video>
    </div>

    <input id="hdId" type="hidden" value="{@idvideo}" />

  </xsl:template>

  <xsl:template name="monta-noticias-relacionadas">
    <xsl:param name="video_id"/>
    <xsl:param name="diretorio" />
    <xsl:if test="count(noticias/noticia_video) != 0">
      <ul>
        <xsl:for-each select="noticias/noticia_video">
          <xsl:variable name="link_noticia">
            <xsl:if test="$diretorio !='emc'">
              <xsl:variable name="link_temp">
                <xsl:variable name="idnoticia">
                  <xsl:value-of select="@idnoticia"/>
                </xsl:variable>
                <xsl:value-of select="@url"/>
              </xsl:variable>
              <xsl:variable name="editoria">
                <xsl:call-template name="descobre-editoria-idnoticia">
                  <xsl:with-param name="idnoticia" select="@idnoticia"/>
                </xsl:call-template>
              </xsl:variable>

              <xsl:if test="$diretorio=''">
                <xsl:value-of select="concat('/campinas','/',$editoria,$link_temp)"/>
              </xsl:if>
              <xsl:if test="$diretorio!=''">
                <xsl:value-of select="concat('/',$diretorio,'/',$editoria,$link_temp)"/>
              </xsl:if>
              <xsl:if test="$diretorio='emc'">
                <xsl:value-of select="concat($editoria,$link_temp)"/>
              </xsl:if>
            </xsl:if>

          </xsl:variable>
          <li class="bnot0{position()}">
            <h2 class="menor">
              <a href="{$link_noticia}">
                <xsl:value-of select="@manchete" disable-output-escaping="yes"/>
              </a>
            </h2>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>