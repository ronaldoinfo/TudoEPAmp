﻿<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:include href="funcoes_comuns.xsl"/>
  <xsl:include href="funcoes_emc.xsl"/>
  <xsl:include href="url-amigavel.xsl"/>
  <xsl:variable name="imagens" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />

  <xsl:template name="cria-link">
    <xsl:param name="conteudo" />
    <xsl:param name="prefixo" />
    <xsl:if test="$conteudo = ''">
      <xsl:value-of select="@url"/>
    </xsl:if>
    <xsl:if test="$conteudo != ''">
      <xsl:variable name="prefixo_">
        <xsl:value-of select="concat('NOT,',//noticia[@idnoticia=current()/@idnoticia]/cidade/@idregiao,',',//noticia[@idnoticia=current()/@idnoticia]/cidade/@idcidade,',',$prefixo)"/>
      </xsl:variable>
      <xsl:call-template name="cria-url-amigavel">
        <xsl:with-param name="conteudo" select="$conteudo" />
        <xsl:with-param name="prefixo" select="$prefixo_" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="cria-link-diretorio">
    <xsl:variable name="diretorio">
      <xsl:call-template name="descobre-diretorio"/>
    </xsl:variable>
    <a class="d-block lh-1" href="{$diretorio}/{@url}" data-track-category="Notícias" data-track-event="click" data-track-label="Link: Notícia: {@manchete}">
      <span class="h6 fw-normal" itemprop="name">
        <xsl:value-of select="@manchete"/>
      </span>
    </a>
  </xsl:template>

  <!-- Ivan: revisado - cria link diretorio Agência - com manchete e destaque-->
  <xsl:template name="cria-link-diretorio-agencia">
    <xsl:variable name="diretorio">
      <xsl:call-template name="descobre-diretorio" />
    </xsl:variable>
    <h2>
      <a href="{$diretorio}/{@url}" title="{@manchete}" data-track-category="Notícias - Agência" data-track-event="click" data-track-label="Link: Notícia: {@manchete}">
        <xsl:value-of select="@manchete"/>
      </a>
    </h2>
    <p>
      <a href="{$diretorio}/{@url}" title="{@destaque}" data-track-category="Notícias - Agência" data-track-event="click" data-track-label="Link: Notícia: {@manchete}">
        <xsl:value-of select="@destaque"/>
      </a>
    </p>
  </xsl:template>

  <!-- Ivan: revisado - cria link diretorio para mobile -->
  <xsl:template name="cria-link-diretorio-mobile">
    <xsl:variable name="diretorio">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="mobile" select="'S'"/>
      </xsl:call-template>
    </xsl:variable>
    <a href="{$diretorio}/{@url}" title="{@manchete}" data-track-category="Notícias" data-track-event="click" data-track-label="Link: Notícia: {@manchete}">
      <xsl:value-of select="@manchete"/>
    </a>
  </xsl:template>

  <xsl:template name="descobre-diretorio">
    <xsl:param name="no" select="./.."></xsl:param>
    <xsl:param name="mobile"/>
    <xsl:param name="idcidade"/>

    <xsl:variable select="name($no)" name="nameNo" />
    <xsl:choose>
      <xsl:when test="$nameNo = 'secao' or name(.)='resultado'">
        <xsl:variable name="diretorio">
          <xsl:choose>
            <xsl:when test="name(.)='resultado'">
              <xsl:value-of select="@diretorio" />
            </xsl:when>
            <xsl:when test="normalize-space($no/@diretorio) = '' or normalize-space($no/@diretorio) = '/'">
              <xsl:value-of select="$no/../@diretorio" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$no/@diretorio" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="host" select="xsl-extensoes:GetSiteById(./@idportal)" />
        <xsl:variable name="canal">
          <xsl:choose>
            <xsl:when test="$no/../@canal = 2 and ./@idportal=1">
              <xsl:value-of select="'epnoticia/'"/>
            </xsl:when>
            <xsl:when test="$no/../@canal != '/' and $no/../@canal != '0' and $no/../@canal != '1' and $no/../@canal != '2' ">
              <xsl:value-of select="$no/../@canal" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="''" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="dir-mobile">
          <xsl:if test="$mobile='S'">
            <xsl:value-of select="'mobile/'"/>
          </xsl:if>
        </xsl:variable>
        <xsl:value-of select="concat($host,$canal,$dir-mobile,$diretorio)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="recursive_result">
          <xsl:choose>
            <xsl:when test="$nameNo = 'subsecao' or $nameNo = 'noticia'">
              <xsl:call-template name="descobre-diretorio">
                <xsl:with-param name="idcidade" select="$idcidade"/>
                <xsl:with-param name="mobile" select="$mobile"/>
                <xsl:with-param name="no" select="$no/.."></xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="''" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$recursive_result" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-diretorio-noticia">
    <xsl:value-of select="concat(../../../@diretorio,@diretorio)" />
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-diretorio-interna">
    <xsl:value-of select="//noticia[@idnoticia=current()/@idnoticia]/../../../../canal/@diretorio" />
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-diretorio-por-idsecao">
    <xsl:param name="idsecao" />
    <xsl:variable name="diretorio">
      <xsl:value-of select="//editoria[@idsecao=$idsecao]/canal/@diretorio"/>
    </xsl:variable>
    <xsl:value-of select="$diretorio"/>
    <xsl:if test="$diretorio=''">
      <xsl:value-of select="//*[@idsecao=$idsecao]/../canal/@diretorio"/>
      <xsl:value-of select="//*[@idsecao=$idsecao]/../../canal/@diretorio"/>
      <xsl:value-of select="//*[@idsecao=$idsecao]/../../../canal/@diretorio"/>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-idsecao">
    <xsl:param name="diretorio" />
    <xsl:value-of select="//canal[@diretorio=$diretorio]/../@idsecao"/>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-idsecao-canal">
    <xsl:param name="diretorio" />
    <xsl:value-of select="//canal[@diretorio=$diretorio]/../@idsecao"/>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-idsecao-editoria">
    <xsl:param name="diretorio" />
    <xsl:value-of select="//editoria[@diretorio=$diretorio]/../@idsecao"/>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-editoria-idnoticia">
    <xsl:param name="idnoticia" />
    <xsl:variable name="editoria">
      <xsl:value-of select="//noticia[@idnoticia=$idnoticia]/../../@diretorio" />
    </xsl:variable>
    <xsl:if test="$editoria!=''">
      <xsl:value-of select="concat($editoria,'/')"/>
    </xsl:if>
    <xsl:if test="$editoria=''">
      <xsl:value-of select="'noticias/'"/>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: revisado -->
  <xsl:template name="descobre-canal-idnoticia">
    <xsl:param name="idnoticia" />
    <xsl:variable name="canal">
      <xsl:value-of select="//noticia[@idnoticia=$idnoticia]/../../@diretorio" />
    </xsl:variable>
    <xsl:if test="$canal!=''">
      <xsl:value-of select="$canal"/>
    </xsl:if>
    <xsl:if test="$canal=''">
      <xsl:value-of select="'noticias'"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkfoto_assunto_destaque_manchete_v5">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tipo" />
    <xsl:param name="tamanho" />
    <xsl:param name="link" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="larguraimagem">
      <xsl:choose>
        <xsl:when test="$tamanho!=''">
          <xsl:value-of select="$tamanho"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$tamanho=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="alturaimagem">
      <xsl:choose>
        <xsl:when test="$altura!=''">
          <xsl:value-of select="$altura"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="288"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <div>
        <a href="{$link}" title="$manchete" data-track-category="Notícias" data-track-event="click" data-track-label="Link: Notícia: {$manchete}">
          <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">
            
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img class="lazyload" data-src="{$nomeimagemtipojpg}" width="{$larguraimagem}" height="{$alturaimagem}" alt="{$manchete}" />
          </picture>
        </a>
        <figcaption class="legend">
          <label class="tag">
            <xsl:value-of select="translate($assunto, $quot, $apos)" />
          </label>
          <h2>
            <a href="{$link}" title="$manchete" data-track-category="Notícias" data-track-event="click" data-track-label="Link: Notícia: {$manchete}">
              <xsl:value-of select="translate($manchete, $quot, $apos)" />
            </a>
          </h2>
          <p class="mobile-none">
            <a href="{$link}" title="$manchete" data-track-category="Notícias" data-track-event="click" data-track-label="Link: Notícia: {$manchete}">
              <xsl:value-of select="translate($destaque, $quot, $apos)" />
            </a>
          </p>
        </figcaption>
      </div>
    </xsl:variable>

    <xsl:if test="$link!=''">
      <xsl:copy-of select="$_conteudo" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-assunto">
    <xsl:param name="conteudo" />
    <xsl:if test="$conteudo=''">
      <xsl:value-of select="@assunto" />
    </xsl:if>
    <xsl:if test="$conteudo!=''">
      <xsl:value-of select="$conteudo" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-idportal">
    <xsl:param name="conteudo" />
    <xsl:if test="$conteudo=''">
      <xsl:value-of select="@idportal" />
    </xsl:if>
    <xsl:if test="$conteudo!=''">
      <xsl:value-of select="$conteudo" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-manchete">
    <xsl:param name="conteudo" />
    <xsl:if test="$conteudo=''">
      <xsl:value-of select="@manchete" />
    </xsl:if>
    <xsl:if test="$conteudo!=''">
      <xsl:value-of select="$conteudo" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-destaque">
    <xsl:param name="conteudo" />
    <xsl:if test="$conteudo=''">
      <xsl:value-of select="@destaque" />
    </xsl:if>
    <xsl:if test="$conteudo!=''">
      <xsl:value-of select="$conteudo" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkmanchete">
    <xsl:param name="conteudo" />
    <xsl:param name="link" />
    <xsl:param name="cssclass" />
    <xsl:call-template name="fazlink">
      <xsl:with-param name="conteudo">
        <xsl:if test="$conteudo=''">
          <xsl:value-of select="@manchete" />
        </xsl:if>
        <xsl:if test="$conteudo!=''">
          <xsl:value-of select="$conteudo" />
        </xsl:if>
      </xsl:with-param>
      <xsl:with-param name="link">
        <xsl:value-of select="$link"/>
      </xsl:with-param>
      <xsl:with-param name="cssclass">
        <xsl:value-of select="$cssclass"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="linkassunto">
    <xsl:param name="conteudo" />
    <xsl:param name="link" />

    <xsl:call-template name="fazlink">
      <xsl:with-param name="conteudo">
        <xsl:if test="$conteudo=''">
          <xsl:value-of select="@assunto" />
        </xsl:if>
        <xsl:if test="$conteudo!=''">
          <xsl:value-of select="$conteudo" />
        </xsl:if>
      </xsl:with-param>
      <xsl:with-param name="link">
        <xsl:value-of select="$link"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="linkdestaque">
    <xsl:param name="conteudo" />
    <xsl:param name="link" />

    <xsl:call-template name="fazlink">
      <xsl:with-param name="conteudo">
        <xsl:if test="$conteudo=''">
          <xsl:value-of select="@destaque" />
        </xsl:if>
        <xsl:if test="$conteudo!=''">
          <xsl:value-of select="$conteudo" />
        </xsl:if>
      </xsl:with-param>
      <xsl:with-param name="link">
        <xsl:value-of select="$link"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="fazlink">
    <xsl:param name="conteudo" />
    <xsl:param name="link" />
    <xsl:param name="cssclass" />

    <xsl:if test="$link=''">
      <xsl:variable name="url-amigavel">
        <xsl:call-template name="cria-link">
          <xsl:with-param name="conteudo" select="''" />
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a itemprop="url" class="{$cssclass}" href="{$diretorio}/{$url-amigavel}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Notícia - {$conteudo}">
        <span class="no-margin-top">
          <xsl:copy-of select="$conteudo"/>
        </span>
      </a>
    </xsl:if>
    <xsl:if test="$link!=''">
      <a itemprop="url" class="{$cssclass}" href="{$link}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Notícia - {$conteudo}">
        <span>
          <xsl:copy-of select="$conteudo" />
        </span>
      </a>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: revisado - destaque com link para a notícia -->
  <xsl:template name="linksecao">
    <xsl:param name="nomesecao" />
    <xsl:param name="diretorio" />

    <xsl:variable name="linksecao">
      <!-- Agencia -->
      <xsl:if test="@modoexibicao=1">
        <xsl:value-of select="concat($diretorio,'/','agencia.aspx?',@idsecao)"/>
      </xsl:if>

      <!-- HotSite -->
      <xsl:if test="@modoexibicao=2">
        <xsl:value-of select="@pagina"/>
      </xsl:if>

      <!-- Personalizada -->
      <xsl:if test="@modoexibicao=3">
        <xsl:value-of select="concat($diretorio,'/','Default.aspx')"/>
      </xsl:if>

      <!-- Home e Editorias nÃ£o tem exibicao  -->
      <xsl:if test="not(@modoexibicao)">
        <xsl:value-of select="$diretorio"/>
      </xsl:if>
    </xsl:variable>

    <a itemprop="url" href="{$linksecao}">
      <xsl:value-of select="$nomesecao"/>
    </a>
  </xsl:template>

  <xsl:template name="linkfotodestaque">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tamanho" />
    <xsl:param name="altura" />
    <xsl:param name="tipo" />
    <xsl:param name="link" />
    <xsl:param name="cssclass" />
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="larguraimagem">
      <xsl:choose>
        <xsl:when test="$tamanho!=''">
          <xsl:value-of select="$tamanho"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$tamanho=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="alturaimagem">
      <xsl:choose>
        <xsl:when test="$altura!=''">
          <xsl:value-of select="$altura"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="288"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">

        <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
        <img data-src="{$nomeimagemtipojpg}" class="{concat('destaque',$tamanho,' lazyload')} {$cssclass}" width="{$larguraimagem}" height="{$alturaimagem}" alt="{@manchete}" />
      </picture>
    </xsl:variable>

    <xsl:if test="$link=''">
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a class="img-thumb-zoom" href="{$diretorio}/{@url}" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
        <figure>
          <xsl:copy-of select="$_conteudo"/>
        </figure>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a class="img-thumb-zoom" href="{$link}" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
        <figure>
          <xsl:copy-of select="$_conteudo" />
        </figure>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkfotomanchete">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tamanho" />
    <xsl:param name="link" />
    <xsl:param name="tipo" />
    <xsl:param name="cssclass" />
    <xsl:param name="legenda" />
    <xsl:param name="credito" />
    <xsl:param name="caption" />
    <xsl:param name="target" />

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="larguraimagem">
      <xsl:choose>
        <xsl:when test="$tamanho!=''">
          <xsl:value-of select="$tamanho"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$tamanho=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="alturaimagem">
      <xsl:choose>
        <xsl:when test="$larguraimagem='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="288"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_legenda">
      <xsl:if test="$legenda!=''">
        <xsl:value-of select="$legenda"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$legenda=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@legenda"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@legenda"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_credito">
      <xsl:value-of select="' - Foto: '"></xsl:value-of>
      <xsl:if test="$credito!=''">
        <xsl:value-of select="$credito"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$credito=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@credito"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@credito"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <xsl:choose>
        <xsl:when test="$caption=''">
          <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">
            
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$larguraimagem}" height="{$alturaimagem}" class="lazyload {$cssclass}" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
          </picture>
        </xsl:when>
        <xsl:otherwise>
          <picture>
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$larguraimagem}" height="{$alturaimagem}" class="lazyload {$cssclass}" alt="{$_legenda}{$_credito}" title="{$caption}" />
          </picture>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:if test="$link=''">
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a class="img-thumb-zoom" href="{$diretorio}/{@url}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}" target="{$target}">
        <figure>
          <xsl:copy-of select="$_conteudo"/>
        </figure>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a class="img-thumb-zoom" href="{$link}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}" target="{$target}">
        <xsl:copy-of select="$_conteudo" />
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkfoto">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tipo" />
    <xsl:param name="link" />
    <xsl:param name="legenda" />
    <xsl:param name="credito" />
    <xsl:param name="cssclass" />
    <xsl:param name="caption" />
    <xsl:param name="widthbox" />

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_widthbox">
      <xsl:choose>
        <xsl:when test="$widthbox!=''">
          <xsl:value-of select="$widthbox"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$widthbox=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_height">
      <xsl:choose>
		<xsl:when test="$_widthbox='636'">
          <xsl:value-of select="358"></xsl:value-of>
        </xsl:when>
		<xsl:when test="$_widthbox='576'">
          <xsl:value-of select="225"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>        
        <xsl:otherwise>
          <xsl:if test="$_widthbox='368'">
            <xsl:value-of select="207"></xsl:value-of>
          </xsl:if>
		  <xsl:if test="$_widthbox='473'">
            <xsl:value-of select="266"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$_widthbox='512'">
            <xsl:value-of select="288"></xsl:value-of>
          </xsl:if>          
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_legenda">
      <xsl:if test="$legenda!=''">
        <xsl:value-of select="$legenda"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$legenda=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@legenda"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@legenda"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_credito">
      <xsl:value-of select="' - Foto: '"></xsl:value-of>
      <xsl:if test="$credito!=''">
        <xsl:value-of select="$credito"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$credito=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@credito"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@credito"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <xsl:choose>
        <xsl:when test="$caption='' and $_widthbox!='100' ">
          <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">

            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
          </picture>
        </xsl:when>
        <xsl:when test="$caption='' and $_widthbox='100'">
          <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">

            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}%" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
          </picture>
        </xsl:when>
        <xsl:otherwise>
          <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">

            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$caption}" />
          </picture>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="diretorio">
      <xsl:call-template name="descobre-diretorio"/>
    </xsl:variable>

    <xsl:if test="$link=''">
      <a href="{$diretorio}/{@url}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo"/>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a href="{$link}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo" />
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-foto">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="legenda" />
    <xsl:param name="credito" />
    <xsl:param name="caption" />
    <xsl:param name="cssclass" />
    <xsl:param name="tipo" />
    <xsl:param name="widthbox" />

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_widthbox">
      <xsl:choose>
        <xsl:when test="$widthbox!=''">
          <xsl:value-of select="$widthbox"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$widthbox=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_height">
      <xsl:choose>
        <xsl:when test="$_widthbox='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>
		<xsl:when test="$_widthbox='92'">
          <xsl:value-of select="61"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="288"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_legenda">
      <xsl:if test="$legenda!=''">
        <xsl:value-of select="$legenda"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$legenda=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@legenda"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@legenda"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_credito">
      <xsl:value-of select="' - Foto: '"></xsl:value-of>
      <xsl:if test="$credito!=''">
        <xsl:value-of select="$credito"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$credito=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@credito"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@credito"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <xsl:choose>
        <xsl:when test="$caption='' and $_widthbox!='100' ">
          <picture>
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}" class="lazyload {$cssclass}" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
          </picture>
        </xsl:when>
        <xsl:when test="$caption='' and $_widthbox='100'">
          <picture>
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}%" class="lazyload {$cssclass}" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
          </picture>
        </xsl:when>
        <xsl:otherwise>
          <picture>
            <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
            <img data-src="{$nomeimagemtipojpg}" width="{$_widthbox}" class="lazyload {$cssclass}" alt="{$_legenda}{$_credito}" title="{$caption}" />
          </picture>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:copy-of select="$_conteudo"/>
  </xsl:template>

  <xsl:template name="get-meta-foto">
    <xsl:param name="tipo" />
    <xsl:param name="arquivo" />

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:choose>
        <xsl:when test="$tipo!='pq'">
          <xsl:if test="$arquivo!=''">
            <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($arquivo)"/>
          </xsl:if>
          <xsl:if test="$arquivo=''">
            <xsl:value-of select="https://www.tudoep.com/img/imagem_padrao_TudoEP.webp"/>
          </xsl:if>
        </xsl:when>
        <xsl:when test="$tipo='pq'">
          <xsl:if test="$arquivo!=''">
            <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($arquivo,'.jpg'),'_',$tipo,'.jpg'))"/>
          </xsl:if>
          <xsl:if test="$arquivo=''">
            <xsl:value-of select="https://www.tudoep.com/img/imagem_padrao_TudoEP.webp"/>
          </xsl:if>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_widthbox">
      <xsl:if test="$tipo='manchete'">
        <xsl:value-of select="368"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:value-of select="256"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="128"></xsl:value-of>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_height">
      <xsl:choose>
        <xsl:when test="$_widthbox='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <div style="display: none;">
        <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">
          <meta itemprop="url" content="https://www.tudoep.com/img/imagem_padrao_TudoEP.webp" />
          <meta itemprop="width" content="256" />
          <meta itemprop="height" content="144" />
          <img src="https://www.tudoep.com/img/imagem_padrao_TudoEP.webp" width="256" height="144" />
        </picture>
      </div>
    </xsl:variable>
    <xsl:copy-of select="$_conteudo" />
  </xsl:template>

  <xsl:template name="carregaImagensBoxes">
    <xsl:variable name="diretorio_url">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="no" select="."></xsl:with-param>
      </xsl:call-template>/<xsl:value-of select="@url" />
    </xsl:variable>
    <xsl:variable name="imagens_ep" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />
    <xsl:choose>
      <xsl:when test="fotodestaque/@arquivo!=''">
        <xsl:variable name="nomeimagematamanho">
          <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
          <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
          <xsl:value-of select="concat(substring-before(translate(fotodestaque/@arquivo, $ucletters, $lcletters),'.jpg'),'_pq',pq,'.jpg')"/>
        </xsl:variable>
        <a itemprop="url" href="{$diretorio_url}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem - Notícia - {@manchete}">
          <img class="img-fluid rounded-2 w-100" src="{$imagens_ep}/{$nomeimagematamanho}" alt="{@manchete}" width="129" height="99" align="left" />
        </a>
      </xsl:when>
      <xsl:otherwise>

      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="lista-noticias">
    <li>
      <div class="lista-data">
        <xsl:call-template name="formatadata-extenso">
          <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
        </xsl:call-template>
      </div>
      <div class="lista-hora">
        <xsl:call-template name="formatahora-extenso">
          <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
        </xsl:call-template>
      </div>
      <xsl:call-template name="cria-link-diretorio" />
    </li>
  </xsl:template>

  <xsl:template name="lista-noticias-agencia-padrao">
    <ul itemscope="" itemtype="http://schema.org/Periodical" class="schedule schedule-simple no-padding-top mg-bt-30">
      <li>
        <time itemprop="datePublished" class="col-lg-3 col-3 date align-middle h4 no-padding-left">
          <xsl:call-template name="formatahora-extenso">
            <xsl:with-param name="data" select="@publicacao" />
          </xsl:call-template> |
          <xsl:call-template name="formatasodata">
            <xsl:with-param name="data" select="@publicacao" />
          </xsl:call-template> -
          <xsl:value-of select="@assunto" disable-output-escaping="yes"/>
        </time>

        <xsl:call-template name="carregaImagensAgencia"/>
        <div class="col-md-11">
          <h2 itemprop="description">
            <xsl:call-template name="cria-link-diretorio-agencia" />
          </h2>
        </div>

      </li>
    </ul>
  </xsl:template>

  <xsl:template name="carregaImagens">
    <xsl:variable name="diretorio_url">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="no" select="."></xsl:with-param>
      </xsl:call-template>/<xsl:value-of select="@url" />
    </xsl:variable>
    <xsl:variable name="imagens_ep" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />
    <xsl:choose>
      <xsl:when test="fotodestaque/@arquivo!=''">
        <xsl:variable name="nomeimagematamanho">
          <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
          <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
          <xsl:value-of select="concat(substring-before(translate(fotodestaque/@arquivo, $ucletters, $lcletters),'.jpg'),'_pq',pq,'.jpg')"/>
        </xsl:variable>
        <div class="media-left">
          <a href="{$diretorio_url}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem - Notícia - {@manchete}">
            <img class="media-object" src="{$imagens_ep}/{$nomeimagematamanho}" alt="{@manchete}" width="96" height="68" />
          </a>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="media-left">
          <a href="{$diretorio_url}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem - Notícia - {@manchete}">
            <img class="media-object" src="/img/bg-semimg.jpg" />
          </a>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="carregaImagensAgencia">
    <xsl:variable name="diretorio_url">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="no" select="."></xsl:with-param>
      </xsl:call-template>/<xsl:value-of select="@url" />
    </xsl:variable>
    <xsl:variable name="imagens_ep" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />
    <xsl:choose>
      <xsl:when test="fotodestaque/@arquivo!=''">
        <xsl:variable name="nomeimagematamanho">
          <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
          <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
          <xsl:value-of select="concat(substring-before(translate(fotodestaque/@arquivo, $ucletters, $lcletters),'.jpg'),'_pq',pq,'.jpg')"/>
        </xsl:variable>
        <div class="col-md-1">
          <a href="{$diretorio_url}" title="{@manchete}">
            <img class="media-object agencia-img" src="{$imagens_ep}/{$nomeimagematamanho}" alt="{@manchete}" width="90" height="68" />
          </a>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="col-md-1">
          <a href="{$diretorio_url}" class="media-object agencia-img" title="{@manchete}">
            <img src="/img/bg-semimg.jpg" alt="{@manchete}" width="90" height="68" />
          </a>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="linkfoto_v6">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="link" />
    <xsl:param name="legenda" />
    <xsl:param name="credito" />
    <xsl:param name="cssclass" />
    <xsl:param name="caption" />
    <xsl:param name="tipo" />
    <xsl:param name="widthbox" />
    <xsl:param name="height" />
    <xsl:param name="widthboxPERC" />

    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_widthbox">
      <xsl:choose>
        <xsl:when test="$widthbox!=''">
          <xsl:value-of select="$widthbox"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$widthbox=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    	
	<xsl:variable name="_height">
      <xsl:choose>
		<xsl:when test="$_widthbox='636'">
          <xsl:value-of select="358"></xsl:value-of>
        </xsl:when>
		<xsl:when test="$_widthbox='576'">
          <xsl:value-of select="225"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$_widthbox='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>        
        <xsl:otherwise>
          <xsl:if test="$_widthbox='368'">
            <xsl:value-of select="207"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$_widthbox='512'">
            <xsl:value-of select="288"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$_widthbox='576'">
            <xsl:value-of select="225"></xsl:value-of>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_legenda">
      <xsl:if test="$legenda!=''">
        <xsl:value-of select="$legenda"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$legenda=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@legenda"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@legenda"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_credito">
      <xsl:value-of select="' - Foto: '"></xsl:value-of>
      <xsl:if test="$credito!=''">
        <xsl:value-of select="$credito"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$credito=''">
        <xsl:if test="$tipo='' or $tipo='manchete'">
          <xsl:value-of select="fotomanchete/@credito"></xsl:value-of>
        </xsl:if>
        <xsl:if test="$tipo='destaque'">
          <xsl:value-of select="fotodestaque/@credito"></xsl:value-of>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <picture itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">
        
        <source type="image/webp" data-srcset="{$nomeimagemtipo}" class="lazyload"/>
        <img class="lazyload" data-src="{$nomeimagemtipojpg}" width="{$_widthbox}" height="{$_height}" style="width:{$widthboxPERC}%" alt="{$_legenda}" />
      </picture>
    </xsl:variable>

    <xsl:if test="$link=''">
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a href="{$diretorio}/{@url}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo"/>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a href="{$link}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo" />
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkfotodestaquecbn">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tipo" />
    <xsl:param name="tamanho" />
    <xsl:param name="altura" />
    <xsl:param name="link" />
    <xsl:param name="cssclass" />
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' and substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP('$nomeimagem')"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="larguraimagem">
      <xsl:choose>
        <xsl:when test="$tamanho!=''">
          <xsl:value-of select="$tamanho"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$tamanho=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="alturaimagem">
      <xsl:choose>
        <xsl:when test="$altura!=''">
          <xsl:value-of select="$altura"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$altura=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="207"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="144"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="72"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$tamanho='100'">
            <xsl:value-of select="68"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tamanho=''">
            <xsl:value-of select="288"></xsl:value-of>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_conteudo">
      <img src="{$nomeimagemtipo}" class="{concat('destaque',$tamanho)} {$cssclass}" width="{$larguraimagem}" height="{$alturaimagem}" alt="{@manchete}" />
    </xsl:variable>

    <xsl:if test="$link=''">
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a class="img-thumb-zoom" href="{$diretorio}/{@url}" title="{@manchete}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo"/>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a class="img-thumb-zoom" href="{$link}" title="{@manchete}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
        <xsl:copy-of select="$_conteudo" />
      </a>
    </xsl:if>
    
  </xsl:template>

	<!--Versão dos boxes em AMP 2023 -->
	<!--Página para validações AMP https://search.google.com/test/rich-results-->

	<xsl:template name="link_amp_foto">
		<xsl:param name="arquivoimagem" />
		<xsl:param name="tipo" />
		<xsl:param name="link" />
		<xsl:param name="legenda" />
		<xsl:param name="credito" />
		<xsl:param name="cssclass" />
		<xsl:param name="caption" />
		<xsl:param name="widthbox" />

		<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

		<xsl:variable name="nomeimagem">
			<xsl:if test="$tipo='' or $tipo='manchete'">
				<xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
					<xsl:if test="$arquivoimagem=''">
						<xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
					</xsl:if>
					<xsl:if test="$arquivoimagem!=''">
						<xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
					<xsl:value-of select="$arquivoimagem"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$tipo='destaque'">
				<xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
					<xsl:if test="$arquivoimagem=''">
						<xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
					</xsl:if>
					<xsl:if test="$arquivoimagem!=''">
						<xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
					<xsl:value-of select="$arquivoimagem"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$tipo='pq'">
				<xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
					<xsl:if test="$arquivoimagem=''">
						<xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
					</xsl:if>
					<xsl:if test="$arquivoimagem!=''">
						<xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
					<xsl:value-of select="$arquivoimagem"/>
				</xsl:if>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="nomeimagemtipojpg">
			<xsl:if test="$tipo!='pq'">
				<xsl:value-of select="$nomeimagem"/>
			</xsl:if>
			<xsl:if test="$tipo='pq'">
				<xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="nomeimagemtipo">
			<xsl:if test="$tipo!='pq'">
				<xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
			</xsl:if>
			<xsl:if test="$tipo='pq'">
				<xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
			</xsl:if>
		</xsl:variable>
		
		<xsl:variable name="_widthbox">
			<xsl:choose>
				<xsl:when test="$widthbox!=''">
					<xsl:value-of select="$widthbox"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$widthbox=''">
					<xsl:if test="$tipo='manchete'">
						<xsl:value-of select="368"></xsl:value-of>
					</xsl:if>
					<xsl:if test="$tipo='destaque'">
						<xsl:value-of select="256"></xsl:value-of>
					</xsl:if>
					<xsl:if test="$tipo='pq'">
						<xsl:value-of select="128"></xsl:value-of>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="512"></xsl:value-of>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="_height">
			<xsl:choose>
				<xsl:when test="$_widthbox='636'">
					<xsl:value-of select="358"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$_widthbox='576'">
					<xsl:value-of select="225"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$_widthbox='368'">
					<xsl:value-of select="207"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$_widthbox='256'">
					<xsl:value-of select="144"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$_widthbox='128'">
					<xsl:value-of select="72"></xsl:value-of>
				</xsl:when>
				<xsl:when test="$_widthbox='100'">
					<xsl:value-of select="68"></xsl:value-of>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$_widthbox='368'">
						<xsl:value-of select="207"></xsl:value-of>
					</xsl:if>
					<xsl:if test="$_widthbox='473'">
						<xsl:value-of select="266"></xsl:value-of>
					</xsl:if>
					<xsl:if test="$_widthbox='512'">
						<xsl:value-of select="288"></xsl:value-of>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="_legenda">
			<xsl:if test="$legenda!=''">
				<xsl:value-of select="$legenda"></xsl:value-of>
			</xsl:if>
			<xsl:if test="$legenda=''">
				<xsl:if test="$tipo='' or $tipo='manchete'">
					<xsl:value-of select="fotomanchete/@legenda"></xsl:value-of>
				</xsl:if>
				<xsl:if test="$tipo='destaque'">
					<xsl:value-of select="fotodestaque/@legenda"></xsl:value-of>
				</xsl:if>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="_credito">
			<xsl:value-of select="' - Foto: '"></xsl:value-of>
			<xsl:if test="$credito!=''">
				<xsl:value-of select="$credito"></xsl:value-of>
			</xsl:if>
			<xsl:if test="$credito=''">
				<xsl:if test="$tipo='' or $tipo='manchete'">
					<xsl:value-of select="fotomanchete/@credito"></xsl:value-of>
				</xsl:if>
				<xsl:if test="$tipo='destaque'">
					<xsl:value-of select="fotodestaque/@credito"></xsl:value-of>
				</xsl:if>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="_conteudo">
			<xsl:choose>
				<xsl:when test="$caption='' and $_widthbox!='100' ">
					<amp-img src="{$nomeimagemtipojpg}" width="{$_widthbox}" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
				</xsl:when>
				<xsl:when test="$caption='' and $_widthbox='100'">
					<amp-img src="{$nomeimagemtipojpg}" width="{$_widthbox}%" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$_legenda}{$_credito}" />
				</xsl:when>
				<xsl:otherwise>
					<amp-img src="{$nomeimagemtipojpg}" width="{$_widthbox}" height="{$_height}" class="{$cssclass} lazyload" alt="{$_legenda}{$_credito}" title="{$caption}" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="diretorio">
			<xsl:call-template name="descobre-diretorio"/>
		</xsl:variable>

		<xsl:if test="$link=''">
			<a href="{$diretorio}/{@url}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
				<xsl:copy-of select="$_conteudo"/>
			</a>
		</xsl:if>

		<xsl:if test="$link!=''">
			<a href="{$link}" title="{$_legenda}{$_credito}" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Manchete - Notícia: {@manchete}">
				<xsl:copy-of select="$_conteudo" />
			</a>
		</xsl:if>
	</xsl:template>

    <xsl:template name="link_amp_fotodestaque">
    <xsl:param name="arquivoimagem" />
    <xsl:param name="tamanho" />
    <xsl:param name="altura" />
    <xsl:param name="tipo" />
    <xsl:param name="link" />
    <xsl:param name="cssclass" />
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		
    <xsl:variable name="nomeimagem">
      <xsl:if test="$tipo='' or $tipo='manchete'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotomanchete/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='destaque'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:if test="substring($arquivoimagem,1,7)!='http://' and substring($arquivoimagem,1,8)!='https://'">
          <xsl:if test="$arquivoimagem=''">
            <xsl:value-of select="translate(concat($imagens,'/',fotodestaque/@arquivo),$ucletters,$lcletters)"/>
          </xsl:if>
          <xsl:if test="$arquivoimagem!=''">
            <xsl:value-of select="translate(concat($imagens,'/',$arquivoimagem),$ucletters,$lcletters)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="substring($arquivoimagem,1,7)='http://' or substring($arquivoimagem,1,8)='https://'">
          <xsl:value-of select="$arquivoimagem"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipojpg">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="$nomeimagem"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg')"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagemtipo">
      <xsl:if test="$tipo!='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP($nomeimagem)"/>
      </xsl:if>
      <xsl:if test="$tipo='pq'">
        <xsl:value-of select="xsl-extensoes:RetornaIMGWebP(concat(substring-before($nomeimagem,'.jpg'),'_',$tipo,'.jpg'))"/>
      </xsl:if>
    </xsl:variable>
		
    <xsl:variable name="larguraimagem">
      <xsl:choose>
        <xsl:when test="$tamanho!=''">  
          <xsl:value-of select="$tamanho"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$tamanho=''">
          <xsl:if test="$tipo='manchete'">
            <xsl:value-of select="368"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='destaque'">
            <xsl:value-of select="256"></xsl:value-of>
          </xsl:if>
          <xsl:if test="$tipo='pq'">
            <xsl:value-of select="128"></xsl:value-of>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="512"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="alturaimagem">
      <xsl:choose>
        <xsl:when test="$altura!=''">
          <xsl:value-of select="$altura"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='368'">
          <xsl:value-of select="207"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='256'">
          <xsl:value-of select="144"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='128'">
          <xsl:value-of select="72"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$larguraimagem='100'">
          <xsl:value-of select="68"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="288"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="_conteudo">
	    <amp-img src="{$nomeimagemtipojpg}" width="{$larguraimagem}" height="{$alturaimagem}" class="{$cssclass} lazyload" alt="{@manchete}" title="{@manchete}" />
    </xsl:variable>

    <xsl:if test="$link=''">
      <xsl:variable name="diretorio">
        <xsl:call-template name="descobre-diretorio"/>
      </xsl:variable>
      <a class="img-thumb-zoom" href="{$diretorio}/{@url}" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
          <xsl:copy-of select="$_conteudo"/>
      </a>
    </xsl:if>

    <xsl:if test="$link!=''">
      <a class="img-thumb-zoom" href="{$link}" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Destaque - Notícia: {@manchete}">
          <xsl:copy-of select="$_conteudo" />
      </a>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
