<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:variable name="videolink" select="xsl-extensoes:getValueAppSettings('EMC_Videos')" />
  <xsl:variable name="fotolink" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />
  <xsl:variable name="imagens_funcoes_busca" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />

  <xsl:template name="cabecalho-busca">
    <xsl:param name="qtd"/>
    <xsl:param name="qtd_pagina"/>
    <xsl:param name="busca"/>
    <xsl:param name="posatual"/>
    <div class="busca-cabecalho">
      <h3 class="lead">
        <xsl:if test="$qtd &gt; 1">
          <strong class="text-danger">
            <xsl:value-of select="$qtd"/>
          </strong> resultados foram encontrados
        </xsl:if>
        <xsl:if test="$qtd = 1">
          <strong class="text-danger">
            1
          </strong> resultado foi encontrado
        </xsl:if>
        <xsl:if test="$qtd = 0">
          Não foram encontrados resultados
        </xsl:if>
        para a pesquisa: <strong class="text-danger">
          <xsl:value-of select="$busca"/>
        </strong>
      </h3>
      <xsl:if test="$qtd &gt; 1">
        <p>
          <strong>
            <!--<xsl:value-of select="xsl-extensoes:GeraPaginadorCabecalho($qtd_pagina,$posatual,$qtd)" disable-output-escaping="yes"/> resultado(s).-->
          </strong>
        </p>
      </xsl:if>
      <hr />
    </div>
  </xsl:template>

  <xsl:template name="resultado-busca">
    <xsl:variable name="link_">
      <xsl:call-template name="cria-link-busca" />
    </xsl:variable>

    <xsl:variable name="videolink_">
      <xsl:value-of select="$videolink" />
    </xsl:variable>

    <xsl:variable name="fotolink_">
      <xsl:value-of select="$fotolink" />
    </xsl:variable>

    <xsl:variable name="class">
      <xsl:if test="@tipo='N'">
        <xsl:value-of select="'lista-not'"/>
      </xsl:if>
      <xsl:if test="@tipo='V'">
        <xsl:value-of select="'lista-vid'"/>
      </xsl:if>
      <xsl:if test="@tipo='G'">
        <xsl:value-of select="'lista-galeria'"/>
      </xsl:if>
      <xsl:if test="@tipo='S'">
        <xsl:value-of select="'lista-som'"/>
      </xsl:if>
      <xsl:if test="@tipo='P'">
        <xsl:value-of select="'lista-programa'"/>
      </xsl:if>
    </xsl:variable>
    <article class="lista-noticias {$class}">
      <ul class="lista-noticias-header list-inline">
        <li>
          <time>

            <span>
              <xsl:call-template name="formatahora-extenso">
                <xsl:with-param name="data" select="@publicacao" />
              </xsl:call-template>
            </span>

            <span>
              <xsl:call-template name="formatasodata">
                <xsl:with-param name="data" select="@publicacao" />
              </xsl:call-template>
            </span>
          </time>
        </li>
        <li>
          <i class="fa fa-tags" />
          <span class="assunto">
            <xsl:value-of select="@assunto" disable-output-escaping="yes"/>
          </span>
        </li>
      </ul>
      <div class="media">
        <xsl:if test="@fotodestaque!=''">
          <xsl:variable name="imagem">
            <xsl:if test="@tipo='N'">
              <xsl:value-of select="concat($imagens_funcoes_busca,'/',substring-before(@fotodestaque,'.'),'_pq',pq,'.',substring-after(@fotodestaque,'.'))"/>
            </xsl:if>
            <xsl:if test="@tipo='V'">
              <xsl:value-of select="concat($videolink_, '/', @subPasta, substring-before(@fotodestaque, '.'), '_2.jpg')"/>
            </xsl:if>
            <xsl:if test="@tipo='G'">
              <xsl:value-of select="concat($fotolink_, '/', translate(@subPasta, '\', '/'), @fotodestaque)"/>
            </xsl:if>
            <xsl:if test="@tipo='P'">
              <xsl:value-of select="concat($fotolink_, '/', translate(@subPasta, '\', '/'), @fotodestaque)"/>
            </xsl:if>
          </xsl:variable>
          <div class="media-left pull-left">
            <a href="{$link_}" title="{@manchete}" data-track-category="Busca" data-track-event="click" data-track-label="Pag: Resultado de Busca, Link: Imagem - Notícia - {@manchete}">
              <xsl:choose>
                <xsl:when test="@tipo='S'">
                  <span class="media-object">
                    <i class="fa fa-volume-up">
                    </i>
                  </span>
                </xsl:when>
                <xsl:otherwise>
                  <img src="{$imagem}" alt="{@manchete}" class="thumbnail media-object" style="max-width:90px" />
                </xsl:otherwise>
              </xsl:choose>
            </a>
          </div>
        </xsl:if>

        <div class="media-body">
          <div class="resumo">
            <h2>
              <a itemprop="relatedLink" href="{$link_}" title="{@manchete}" target='_blank' data-track-category="Busca" data-track-event="click" data-track-label="Pag: Resultado de Busca, Notícia: {@manchete}">
                <xsl:value-of select="@manchete" disable-output-escaping="yes" />
              </a>
            </h2>
            <xsl:if test="@manchete!=@destaque">
              <p>
                <a itemprop="relatedLink" href="{$link_}" target='_blank' data-track-category="Busca" data-track-event="click" data-track-label="Pag: Resultado de Busca, Link: Notícia - {@manchete}">
                  <xsl:value-of select="@destaque" disable-output-escaping="yes" />
                </a>
              </p>
            </xsl:if>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: deve melhorar a função abaixo para permitir link para Galeria de Fotos e PodCast mas está igual comuns_ep -->
  <!-- Gustavo: melhorias realizadas para que a função permita link para Galeria de Fotos, Podcasts e Programas -->
  <xsl:template name="cria-link-busca">
    <xsl:if test="@tipo = 'N'">
      <xsl:value-of select="concat(@diretorio, '/', @url)"/>
    </xsl:if>
    <xsl:if test="@tipo = 'V'">
      <!-- Gustavo 31-10-2016: melhorias realizadas para que a função verifique se o Site for TudoEP a URL será (onplay) -->
      <xsl:choose>
        <xsl:when test="@idSite = '2'">
          <xsl:value-of select="concat('/onplay/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '3'">
          <xsl:value-of select="concat('/ribeiraopreto/onplay/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '4'">
          <xsl:value-of select="concat('/araraquara/onplay/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '5'">
          <xsl:value-of select="concat('/campinas/onplay/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '6'">
          <xsl:value-of select="concat('/saocarlos/onplay/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('/multimidia/videos/', @url, '.aspx')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="@tipo = 'G'">
      <xsl:choose>
        <xsl:when test="@idSite = '2'">
          <xsl:value-of select="concat('/onclick/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '3'">
          <xsl:value-of select="concat('/ribeiraopreto/onclick/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '4'">
          <xsl:value-of select="concat('/araraquara/onclick/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '5'">
          <xsl:value-of select="concat('/campinas/onclick/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:when test="@idSite = '6'">
          <xsl:value-of select="concat('/saocarlos/onclick/', @url, '.aspx')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('/multimidia/galeriadefotos/', @url, '.aspx')"/>
        </xsl:otherwise>
      </xsl:choose>
      <!--<xsl:value-of select="concat('/multimidia/galeriadefotos/', @url)"/>-->
    </xsl:if>
    <xsl:if test="@tipo = 'S'">
      <xsl:value-of select="concat('/multimidia/podcasts/SOM,0,1,', @id, ',', translate(@manchete,' ','+'), '.aspx')"/>
    </xsl:if>
    <xsl:if test="@tipo = 'P'">
      <xsl:value-of select="concat('/multimidia/programas/', @url)"/>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: feito para período em que lazerecultura era diferente -->
  <xsl:template name="cria-link-busca-v1">
    <xsl:variable name="diretorio">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="idcidade" select="@idcidade"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="@tipo = 'N'">
      <xsl:value-of select="concat($diretorio,'/',@url)"/>
    </xsl:if>

    <!-- revisar esta questão das seções 49 e 50 -->
    <xsl:if test="@tipo = 'V'">
      <xsl:if test="xsl-extensoes:estaem(@idsecao,'49,50')">
        <xsl:value-of select="concat('/campinas/multimidia/',@url)"/>
      </xsl:if>
      <xsl:if test="xsl-extensoes:estaem(@idsecao,'49,50')=false">
        <xsl:value-of select="concat('/multimidia/',@url)"/>
      </xsl:if>
    </xsl:if>

    <xsl:if test="@tipo = 'G'">
      <xsl:value-of select="concat($diretorio,'/',@url)"/>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>