<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />

  <xsl:variable name="videos" select="xsl-extensoes:GetXmlVideos()" />
  <xsl:variable name="videolink" select="xsl-extensoes:getValueAppSettings('EMC_Videos')" />

  <!-- Ivan: ok - 'bc_EMC_1'  - MediaCenter Modelo 1 -->
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

  <!-- Ivan: ok - 'bc_EMC_2'  - MediaCenter Modelo 2  -->
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

  <!-- Ivan: ok - 'bc_EMC_3'  - MediaCenter Modelo 3  -->
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

  <!-- Ivan: ok - 'bc_EMC_4'  - MediaCenter Modelo 4  -->
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

  <!-- Ivan: ok - 'bc_EMC_5'  - MediaCenter Modelo 5 - REVISAR POIS SÓ ESTÁ APARECENDO UM BOX E PRECISA INCLUIR AS TABS -->
  <xsl:template name="bc_EMC_5">
    <xsl:param name="secao_id" />
    <xsl:param name="link" />

    <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$secao_id]">
      <!--<xsl:sort select="../@idregiao" />-->
      <xsl:if test="position() &lt; 5">

        <xsl:variable name="position">
          <xsl:choose>
            <xsl:when test="position() = 4">ultimo</xsl:when>
            <xsl:when test="position() != 4">
              <xsl:value-of select="position()"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>        

        <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$secao_id]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','') &lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="position() = 1">
            <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
            <xsl:call-template name="EMC-Mod-Comum">
              <xsl:with-param name="link" select="$link"/>
              <xsl:with-param name="position" select="$position" />
              <xsl:with-param name="chapeu" select="../../@nomesecao" />
              <xsl:with-param name="arquivo" select="@arquivo" />
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!-- Ivan: ok - monta-aba para MediaCenter Modelo 5 -->
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

  <!-- Ivan: ok - 'bc_EMC_6'  - MediaCenter Modelo 6  -->
  <xsl:template name="bc_EMC_6">
    <xsl:param name="link" />
    <xsl:param name="descricao" />
    <xsl:variable name="_link">
      <xsl:value-of select="$link"/>
    </xsl:variable>
    <div class="intbox box-emc clearfix" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
      <div class="info-box">
        <h2 itemprop="name">
          <a href="{$_link}" itemprop="url">
            <xsl:value-of select="$descricao"/>
          </a>
        </h2>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - 'bc_EMC_7'  - MediaCenter Modelo 7  -->
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

  <!-- Ivan: ok - 'bc_EMC_8'  - MediaCenter Modelo 8 -->
  <xsl:template name="bc_EMC_8">
    <xsl:param name="secao_id" />
    <xsl:param name="position" />

    <xsl:variable name="nome-css-class-titbox">
      <xsl:value-of select="'box-duplo'"/>
      <xsl:if test="$position='ultimo'">
        <xsl:value-of select="''"/>
      </xsl:if>
    </xsl:variable>

    <div class="{$nome-css-class-titbox}">
      <xsl:variable name="titulo">
        <xsl:value-of select="$videos//midiaCenter//*[@idsecao=$secao_id]/@nomesecao" />
      </xsl:variable>
      <xsl:variable name="titbox">
        <xsl:call-template name="monta-titulo">
          <xsl:with-param name="titulo" select="$titulo"  />
        </xsl:call-template>
      </xsl:variable>

      <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$secao_id]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="position() &lt; 3">
          <xsl:variable name="nome-css-class">
            <xsl:value-of select="'box-duplo'"/>
            <xsl:if test="position()=2">
              <xsl:value-of select="''"/>
            </xsl:if>
          </xsl:variable>
          <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />
          <xsl:call-template name="EMC-Mod-Comum">
            <xsl:with-param name="nome-css-class" select="$nome-css-class" />
            <xsl:with-param name="position" select="position()+1" />
            <xsl:with-param name="chapeu" select="''" />
            <xsl:with-param name="diretorio" select="'campinas'" />
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </div>

  </xsl:template>

  <!-- Ivan: ok - 'bc_EMC_9'  - MediaCenter Modelo 9 -->
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

  <!-- Ivan: ok - BOX "ÚLTIMO VIDEO [LATERAL]"  -->
  <xsl:template name="bc_ultimo_video_lateral">
    <xsl:param name="secao_id" />
    <xsl:param name="idportal" />

    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/videos/boletim/VideoBoletim.ascx', concat('secao_id=&quot;',$secao_id,'&quot;',' idportal=&quot;',$idportal,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!-- Ivan: ok "  -->
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

  <!-- Ivan: ok "  -->
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

  <!-- Ivan: ok - BOX DE GALERIA DE FOTOS"  -->
  <xsl:template name="bc_galeria_rotativa">
    <xsl:param name="galeria_destaque" />
    <xsl:param name="galeria_id" />
    <xsl:param name="galeria_manchete" />
    <xsl:param name="galeria_resumo" />
    <xsl:param name="galeria_subpasta" />
    <xsl:param name="galeria_url" />
    <xsl:param name="position" />

    <xsl:if test="$galeria_manchete != ''">
      <xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />
      <xsl:if test="$position='1'">
        <link href="/css/pgwslider.min.css" rel="stylesheet" type="text/css" />
        <script src="/js/pgwslider.min.js">
          <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
        </script>
        <xsl:text disable-output-escaping="yes">
            &lt;div class="intbox clearfix"&gt;
          &lt;ul class="pgwSlider"&gt;
        </xsl:text>
      </xsl:if>
      <li>
        <a href="{$galeria_url}/{@url}" target="_blank">
          <img src="{concat($EMC_Fotos,'/', $galeria_resumo)}" />
          <span>
            <xsl:value-of select="$galeria_manchete" />
          </span>
        </a>
      </li>
      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">
               &lt;/ul&gt;
               &lt;/div&gt;

            </xsl:text>
        <script>
          $(document).ready(function () {
          $('.pgwSlider').pgwSlider({
          displayControls: true,
          maxHeight:400
          });
          })
        </script>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- box de galeria de fotos Rotativa TudoEP  -->
  <xsl:template name="bc_galeria_rotativa_acidadeon">
    <xsl:param name="galeria_destaque" />
    <xsl:param name="galeria_id" />
    <xsl:param name="galeria_manchete" />
    <xsl:param name="galeria_resumo" />
    <xsl:param name="galeria_subpasta" />
    <xsl:param name="galeria_url" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <link href="/comuns/boxes/galerias-rotativas/css/box-slider-galerias-rotativas.css" rel="stylesheet" type="text/css" />
      <script src="/comuns/boxes/galerias-rotativas/js/box-slider-galerias-rotativas.js" type="text/javascript">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
      </script>
      <script type="text/javascript">
        $(document).ready(document, function() {
        $("#bc_galeria_rotativa").box_slider_galerias_rotativas();
        });
      </script>
    </xsl:if>

    
      <xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />
      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
            &lt;div class="intbox clearfix"&gt;
            &lt;div id="jslidernews3" class="lof-slidecontent" style="display:none;height: 400px;"&gt;
            &lt;div class="preload"&gt;
            &lt;div&gt;
            &lt;/div&gt;
            &lt;/div&gt;
        </xsl:text>

        <xsl:text disable-output-escaping="yes">
               &lt;div class="main-slider-content" style="height: 400px;"&gt;
               &lt;ul class="sliders-wrap-inner"&gt;
            </xsl:text>

        <xsl:variable name="navigatorHeader" xml:space="preserve">
               &lt;div class="navigator-content"&gt;
               &lt;div class="navigator-wrapper"&gt;
               &lt;ul class="navigator-wrap-inner"&gt;
            </xsl:variable>
        <xsl:value-of select="xsl-extensoes:SetVar('navigator',$navigatorHeader)" />
      </xsl:if>
      <li>
        <a href="{$galeria_url}/{@url}">
          <figure>
            <img src="{concat($EMC_Fotos,'/', $galeria_resumo)}" class="destaque img-left" alt="{$galeria_destaque}" title="{$galeria_destaque}" />
          </figure>
        </a>
        <div class="slider-description">
          <h2 class="titulo-manchete-medio">
            <strong>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="$galeria_destaque"/>
                <xsl:with-param name="link" select="$galeria_url"/>
              </xsl:call-template>
            </strong>
          </h2>
        </div>
      </li>

      <xsl:variable name="navigator">
        &lt;li&gt;
        &lt;div&gt;
        &lt;h3&gt;<xsl:value-of select="$galeria_manchete" />&lt;/h3&gt;
        &lt;/div&gt;
        &lt;/li&gt;
      </xsl:variable>

      <xsl:value-of select="xsl-extensoes:SetVar('navigator',concat(xsl-extensoes:GetVar('navigator'),$navigator))">
      </xsl:value-of>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">
               &lt;/ul&gt;
               &lt;/div&gt;
            </xsl:text>

        <xsl:value-of select="xsl-extensoes:GetVar('navigator')" disable-output-escaping="yes">
        </xsl:value-of>

        <xsl:text disable-output-escaping="yes">
               &lt;/ul&gt;
               &lt;/div&gt;
               &lt;/div&gt;
               &lt;/div&gt;
            </xsl:text>


      </xsl:if>

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
    
    <xsl:if test="$position='1'">

    <xsl:text disable-output-escaping="yes">

      &lt;div class="box-onplay"&gt;   

      &lt;a href="onplay/"&gt;
        &lt;img src="/img/tit/tit-OnPlay.png" alt="OnPlay" /&gt;

      &lt;div class="play-manch"&gt;
   </xsl:text>

      <a href="{$link}">

        <xsl:variable name="imagem">
          <xsl:call-template name="imagem-emc">
            <xsl:with-param name="arquivo" select="$arquivo" />
            <xsl:with-param name="mod" select="1" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="newimagem">
          <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
        </xsl:variable>        
        
        <xsl:text disable-output-escaping="yes">
          &lt;i class="fa fa-play-circle-o"&gt;&lt;/i&gt;
        &lt;div class="img-box-play"&gt;
        </xsl:text>

        <img src="{$newimagem}" alt="OnPlay" />

        <xsl:text disable-output-escaping="yes">
          &lt;/div&gt;
          &lt;h2 class="txt-box-play-manch"&gt;
      </xsl:text>
        <xsl:value-of select="$descricao" />
        <xsl:text disable-output-escaping="yes">
          &lt;/h2&gt;
    </xsl:text>
      </a>

   <xsl:text disable-output-escaping="yes">    
      &lt;/div&gt;
     </xsl:text>  
    </xsl:if>

    <xsl:if test="$position&gt;1 or $position='ultimo' ">

      <xsl:variable name="imagem2">
        <xsl:call-template name="imagem-emc">
          <xsl:with-param name="arquivo" select="$arquivo" />
          <xsl:with-param name="mod" select="1" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="newimagem2">
        <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem2,'.mp4',''),'.flv','')" />
      </xsl:variable>

      <div class="play-dest">
        <a href="{$link}">
          <div class="img-box-play">
            <img src="{$newimagem2}" alt="OnPlay" />
          </div>
          <h3 class="txt-box-play-dest">
            <xsl:value-of select="$descricao" />
          </h3>
        </a>
      </div>
    </xsl:if>    
    
    <xsl:if test="$position='ultimo'">
      
      <xsl:text disable-output-escaping="yes">

          &lt;div class="box-veja-mais"&gt;
		        &lt;a href="onplay/"&gt;
  			      VEJA MAIS VÍDEOS &lt;i class="fa fa-plus"&gt; &lt;/i&gt;
	  	      &lt;/a&gt;
	        &lt;/div&gt;
  
        &lt;/div&gt;
      </xsl:text>
    </xsl:if>  
  
  </xsl:template>

  <!-- box videos ON PLAY Acidadeon Dinamico  -->
  <xsl:template name="bc_videos_onplay_dinamico">        
    <xsl:param name="idsecao" />    

        <xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
          <xsl:sort select="@publicacao" order="descending" />
          
          <xsl:if test="position() = 1">

            <xsl:text disable-output-escaping="yes">

                &lt;div class="box-onplay"&gt;   

                &lt;a href="onplay/"&gt;
                  &lt;img src="/img/tit/tit-OnPlay.png" alt="OnPlay" /&gt;

                &lt;div class="play-manch"&gt;
             </xsl:text>

            <a href="onplay/{@url}.aspx">

              <xsl:variable name="imagem">
                <xsl:call-template name="imagem-emc">
                  <xsl:with-param name="arquivo" select="@arquivo" />
                  <xsl:with-param name="mod" select="1" />
                </xsl:call-template>
              </xsl:variable>

              <xsl:variable name="newimagem">
                <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
              </xsl:variable>

              <xsl:text disable-output-escaping="yes">
                    &lt;i class="fa fa-play-circle-o"&gt;&lt;/i&gt;
                  &lt;div class="img-box-play"&gt;
               </xsl:text>

              <img src="{$newimagem}" alt="OnPlay" />

              <xsl:text disable-output-escaping="yes">
                    &lt;/div&gt;
                    &lt;h2 class="txt-box-play-manch"&gt;
                </xsl:text>

              <xsl:if test="string-length(@manchete) &lt;= 64">
                <xsl:value-of select="@manchete" />
              </xsl:if>

              <xsl:if test="string-length(@manchete) &gt; 64">
                <xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
              </xsl:if>
              
              <xsl:text disable-output-escaping="yes">
                    &lt;/h2&gt;
              </xsl:text>
            </a>

            <xsl:text disable-output-escaping="yes">    
                &lt;/div&gt;
               </xsl:text>
          </xsl:if>

          <xsl:if test="position()= 2 or position()=3 ">

            <xsl:variable name="imagem2">
              <xsl:call-template name="imagem-emc">
                <xsl:with-param name="arquivo" select="@arquivo" />
                <xsl:with-param name="mod" select="1" />
              </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="newimagem2">
              <xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem2,'.mp4',''),'.flv','')" />
            </xsl:variable>

            <div class="play-dest">
              <a href="onplay/{@url}.aspx">
                <div class="img-box-play">
                  <img src="{$newimagem2}" alt="OnPlay" />
                </div>
                <h3 class="txt-box-play-dest">

                  <xsl:if test="string-length(@manchete) &lt;= 81">
                    <xsl:value-of select="@manchete" />
                  </xsl:if>

                  <xsl:if test="string-length(@manchete) &gt; 81">
                    <xsl:value-of select="concat(substring(@manchete,1,78),'...')" />
                  </xsl:if>
                </h3>
              </a>
            </div>
          </xsl:if>

          <xsl:if test="position()='4'">
            <xsl:text disable-output-escaping="yes">
                &lt;div class="box-veja-mais"&gt;
		              &lt;a href="onplay/"&gt;
  			            VEJA MAIS VÍDEOS &lt;i class="fa fa-plus"&gt;&lt;/i&gt;
	  	            &lt;/a&gt;
	              &lt;/div&gt;  
              &lt;/div&gt;
            </xsl:text>
          </xsl:if>
          
        </xsl:for-each>
    
  </xsl:template>
  
</xsl:stylesheet>