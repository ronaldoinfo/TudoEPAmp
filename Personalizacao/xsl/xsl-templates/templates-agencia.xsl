<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!--  'bc_agencia REVISAR COMO É ESTA AGÊNCIA-->
  <xsl:template name="bc_agencia">
    <xsl:param name="quantidade" />
    <xsl:param name="idsecao" />
    <xsl:param name="diretorio" />
    <xsl:param name="tipo" />
    <xsl:param name="img" />
    <xsl:param name="tipoOrdenacao" />

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="5"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <xsl:if test="$tipo='0'">
      <div id="agenda" class="f15">
        <div class="tit_lateral">
          <figure><img alt="Agência" src="img/tit_agencia.jpg" /></figure>
        </div>
        <div class="sagscroller h245" id="mysagscroller2">

          <ul class="lista-not-interna agencia">
            <xsl:call-template name="corpo-agencia">
              <xsl:with-param name="_qtd" select="$_qtd"/>
              <xsl:with-param name="idsecao" select="$idsecao"/>
              <xsl:with-param name="diretorio" select="$diretorio"/>
              <xsl:with-param name="tipo" select="$tipo"/>
              <xsl:with-param name="tipoOrdenacao" select="$tipoOrdenacao" />
            </xsl:call-template>
          </ul>
        </div>
      </div>
    </xsl:if>
    <xsl:if test="$tipo='1'">
      <div class="tit_internas">
        <figure><img alt="Agência" src="{$img}" /></figure>
      </div>

      <div class="f15" id="agenda">
        <ul class="lista-not-interna agencia">
          <xsl:call-template name="corpo-agencia">
            <xsl:with-param name="_qtd" select="$_qtd"/>
            <xsl:with-param name="idsecao" select="$idsecao"/>
            <xsl:with-param name="diretorio" select="$diretorio"/>
            <xsl:with-param name="tipo" select="$tipo"/>
            <xsl:with-param name="tipoOrdenacao" select="$tipoOrdenacao"/>
          </xsl:call-template>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok -->
  <xsl:template name="bc_agencia_eptv">
    <xsl:param name="quantidade" />
    <xsl:param name="assunto" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <h2 class="tit-box cor-ref">Últimas Notícias</h2>

    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <div class="intbox box-agencia clearfix">
      <xsl:for-each select="//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <div class="item-agencia intbox clearfix">
            <div class="row">
              <div class="col-xs-4 text-center">
                <time class="hora-gd" datetime="{@publicacao}">
                  <xsl:call-template name="formatahora-extenso">
                    <xsl:with-param name="data" select="@publicacao">
                    </xsl:with-param>
                  </xsl:call-template>
                </time>
              </div>
              <div class="col-xs-8">
                <div class="info-box">
                  <h2>
                    <xsl:call-template name="cria-link-diretorio" />
                  </h2>
                </div>
              </div>
            </div>
          </div>
        </xsl:if>
      </xsl:for-each>
	  <div class="box-veja-mais">
        <a itemprop="url" href="/noticias/">
          <i class="fa fa-plus">
            <xsl:comment>
            </xsl:comment>
          </i> MAIS NOTÍCIAS
        </a>
      </div>
    </div>

  </xsl:template>

  <!-- Ivan: ok - Agência com Imagens ( semelhante ao antigo Agência dos EP's ) -->
  <xsl:template name="bc_agencia_eptv_com_imagem">
    <xsl:param name="quantidade" />
    <xsl:param name="idsecao" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
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

    <h2 class="tit-box cor-ref">Últimas Notícias</h2>
    <div class="intbox box-agencia">
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <article class="item-agencia clearfix">
            <div class="item-thumbnail-float">
              <xsl:call-template name="carregaImagensBoxes" />
            </div>
            <div class="info-box">
              <time class="hora-pq" datetime="{@publicacao}">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </time>
              <h2>
                <xsl:call-template name="cria-link-diretorio" />
              </h2>
            </div>
          </article>
        </xsl:if>
      </xsl:for-each>
	  <div class="box-veja-mais">
        <a itemprop="url" href="/noticias/">
          <i class="fa fa-plus">
            <xsl:comment>
            </xsl:comment>
          </i> MAIS NOTÍCIAS
        </a>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - Agência com Imagens 600 ( semelhante ao antigo Agência dos EP's ) -->

  <xsl:template name="bc_agencia_eptv_com_imagem_600">
    <xsl:param name="quantidade" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="idsecao" />
    <xsl:param name="assunto" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
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

    <h2 class="tit-box cor-ref">Últimas Notícias</h2>
    <div class="intbox box-agencia">
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <article class="item-agencia clearfix">
            <div class="item-thumbnail-float">
              <xsl:call-template name="carregaImagensBoxes" />
            </div>
            <div class="info-box">
              <div>
                <div class="materia-assunto pull-left" itemprop="about">
                  <span>
                    <xsl:call-template name="get-assunto">
                      <xsl:with-param name="conteudo" select="$assunto"/>
                    </xsl:call-template>
                  </span>
                </div>
                <time class="hora-pq" datetime="{@publicacao}">
                  <xsl:call-template name="formatahora-extenso">
                    <xsl:with-param name="data" select="@publicacao">
                    </xsl:with-param>
                  </xsl:call-template> |
                  <xsl:call-template name="formatadata-extenso">
                    <xsl:with-param name="data" select="@publicacao">
                    </xsl:with-param>
                  </xsl:call-template>
                </time>
              </div>

              <h2>
                <xsl:call-template name="cria-link-diretorio" />
              </h2>
              <h3 itemprop="description">
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
          </article>
        </xsl:if>
      </xsl:for-each>
	  <div class="box-veja-mais">
        <a itemprop="url" href="/noticias/">
          <i class="fa fa-plus">
            <xsl:comment>
            </xsl:comment>
          </i> MAIS NOTÍCIAS
        </a>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - Agência com Imagens 600 ( semelhante ao antigo Agência dos EP's ) -->

  <xsl:template name="bc_agencia_rodape_imagem">
    <xsl:param name="quantidade" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="idsecao" />
    <xsl:param name="assunto" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
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
    <h2 class="tit-box cor-ref">Últimas Notícias</h2>
    <div class="intbox box-agencia">      
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$_idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:variable name="url-amigavel">
            <xsl:call-template name="cria-link" />
          </xsl:variable>
          <article class="item-agencia clearfix">
            <div class="item-thumbnail-float">
              <xsl:call-template name="carregaImagensBoxes" />
            </div>
            <div class="info-box">
              <time class="hora-pq" datetime="{@publicacao}">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template> |
                <xsl:call-template name="formatadata-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </time>
              <h2>
                <xsl:call-template name="cria-link-diretorio" />
              </h2>
            </div>
          </article>
        </xsl:if>
      </xsl:for-each>
      <p class="mais-noticias text-right">
        <a itemprop="url" href="/noticias/">
          <i class="fa fa-plus-square">
            <xsl:comment>
              <!---->
            </xsl:comment>
          </i> mais notícias
        </a>
      </p>
    </div>
  </xsl:template>

  <!-- Ivan: ok - bc_agencia_generica -->
  <xsl:template name="bc_agencia_generica">
    <xsl:param name="quantidade" />
    <xsl:param name="link" />
    <xsl:param name="secaoid" />

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <div id="noticias-chamada">
      <ul class="notas">
        <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
        <xsl:for-each select="//*[@idsecao=$secaoid]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('todas', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
            <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)"/>
            <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
            <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>

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
              <h2 class="menor-not">
                <xsl:variable name="link_">
                  <!--<xsl:call-template name="cria-url-amigavel">
                    <xsl:with-param name="conteudo" select="@manchete" />
                    <xsl:with-param name="prefixo" select="concat('NOT,',cidade/@idregiao,',',cidade/@idcidade,',')" />
                  </xsl:call-template>-->
                  <xsl:value-of select="@url"/>
                </xsl:variable>
                <a href="{$link_}">
                  <xsl:value-of select="@manchete" />
                </a>
              </h2>
            </li>
          </xsl:if>
        </xsl:for-each>
      </ul>
      <div class="mais-noticias">
        <h3>
          <a href="{$link}">Veja mais notícias</a>
        </h3>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - 'bc_agencia_modC -->
  <xsl:template name="bc_agencia_modC">
    <xsl:param name="quantidade" />
    <xsl:param name="link" />
    <xsl:param name="secaoid" />

    <xsl:variable name="_secaoid">
      <xsl:if test="$secaoid=''">
        <xsl:value-of select="1"/>
      </xsl:if>
      <xsl:if test="$secaoid!=''">
        <xsl:value-of select="$secaoid"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="9"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>
    <h2 class="tit-box">Últimas Notícias</h2>
    <div class="intbox box-agencia">
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      <xsl:for-each select="//*[@idsecao=$_secaoid]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
          <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <article class="item-agencia clearfix">
           
            <div class="info-box">
              <time class="hora-pq" datetime="{@publicacao}">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template> |
                <xsl:call-template name="formatadata-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </time>
              <h2 class="titulo-pq">
                <xsl:variable name="link_">
                  <xsl:value-of select="@url"/>
                </xsl:variable>
                <a href="{$link_}">
                  <xsl:value-of select="@manchete" />
                </a>
              </h2>
            </div>
          </article>
        </xsl:if>
      </xsl:for-each>
      <p class="mais-noticias text-right">
        <a itemprop="url" href="/noticias/">
          <i class="fa fa-plus-square">
            <xsl:comment>
              <!---->
            </xsl:comment>
          </i> mais notícias
        </a>
      </p>
    </div>
  </xsl:template>

  <!-- Ivan: ok - 'bc_agencia_mod2 -->
  <xsl:template name="bc_agencia_mod_2">
    <xsl:param name="quantidade" />
    <xsl:param name="link" />
    <xsl:param name="secaoid" />

    <xsl:variable name="_secaoid">
      <xsl:if test="$secaoid=''">
        <xsl:value-of select="1"/>
      </xsl:if>
      <xsl:if test="$secaoid!=''">
        <xsl:value-of select="$secaoid"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="4"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <div id="noticias-chamada">
      <div class="ultimas-noticias">
        <h3>
          <p>Últimas notícias ></p>
        </h3>
      </div>
      <ul class="notas">
        <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
        <xsl:for-each select="//*[@idsecao=$_secaoid]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('todas', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $_qtd) and xsl-extensoes:NaoSelecionada(@idnoticia)">
            <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)"/>
            <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
            <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
            <li>
              <div class="lista-hora">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
                </xsl:call-template>
              </div>
              <h2 class="menor-not">
                <xsl:variable name="link_">
                  <xsl:value-of select="@url"/>
                </xsl:variable>
                <a href="{$link_}">
                  <xsl:value-of select="@manchete" />
                </a>
              </h2>
            </li>
          </xsl:if>
        </xsl:for-each>
      </ul>
      <div class="mais-noticias">
        <h3>
          <a href="{$link}">Veja mais notícias >></a>
        </h3>
      </div>
    </div>
  </xsl:template>

  <!--  Ivan: ok - 'bc_agencia_mod3   -->
  <xsl:template name="bc_agencia_mod_3">
    <xsl:param name="quantidade" />
    <xsl:param name="idsecao" />
    <xsl:param name="diretorio" />
    <xsl:param name="tipo" />
    <xsl:param name="img" />
    <xsl:param name="tipoOrdenacao" />
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/agencias/ucAgencia.ascx', concat('quantidade=&quot;',$quantidade,'&quot;',' idsecao=&quot;',$idsecao,'&quot;',' diretorio=&quot;',$diretorio,'&quot;',' tipo=&quot;',$tipo,'&quot;',' img=&quot;',$img,'&quot;',' tipoOrdenacao=&quot;',$tipoOrdenacao,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!--  Ivan: ok - 'bc_agencia_ep    -->
  <xsl:template name="bc_agencia_ep">
    <xsl:param name="quantidade" />
    <xsl:param name="idsecao" />
    <xsl:param name="diretorio" />
    <xsl:param name="foto" />
    <xsl:param name="ep" select="'campinas'" />
    <xsl:variable name="cidade" select="$ep"/>

    <xsl:variable name="_qtd">
      <xsl:if test="$quantidade=''">
        <xsl:value-of select="5"/>
      </xsl:if>
      <xsl:if test="$quantidade!=''">
        <xsl:value-of select="$quantidade"/>
      </xsl:if>
    </xsl:variable>

    <xsl:if test="$foto='0'">
      <div class="{concat('agencia_ep',$cidade)}">
        <div class="tit-box cor-ref">
          Agência EP <xsl:value-of select="$cidade"/>
        </div>
        <div class="box">
          <xsl:call-template name="corpo-agencia">
            <xsl:with-param name="_qtd" select="$_qtd"/>
            <xsl:with-param name="idsecao" select="$idsecao"/>
            <xsl:with-param name="diretorio" select="$diretorio"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </div>
        <div class="veja-noticias">
          <xsl:variable name="dir-vejamais">
            <xsl:if test="$diretorio!=''">
              <xsl:value-of select="concat($diretorio,'/')"/>
            </xsl:if>
          </xsl:variable>
          <a href="/{$cidade}/{$dir-vejamais}agencia.aspx" class="mais">
            <figure><img src="/{$cidade}/img/bt-veja-noticias.gif" alt="Ver mais notícias" /></figure>
          </a>
        </div>
      </div>
    </xsl:if>
    <xsl:if test="$foto='1'">
      <div class="intbox">
        <ul class="lista-not-interna agencia">
          <xsl:call-template name="corpo-agencia">
            <xsl:with-param name="_qtd" select="$_qtd"/>
            <xsl:with-param name="idsecao" select="$idsecao"/>
            <xsl:with-param name="diretorio" select="$diretorio"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - bc_agencia_comimagem   -->
  <xsl:template name="bc_agencia_comimagem">
    <xsl:param name="idsecao"/>
    <xsl:param name="quantidade"/>
    <xsl:param name="link"/>
    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>

    <div id="noticias-chamada">
      <ul class="notas">

        <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('todas', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete"/>
          <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;            " />
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
          <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt;= $quantidade)">
            <xsl:variable name="url-amigavel">
              <xsl:call-template name="cria-link" />
            </xsl:variable>
            <li>
              <div class="data-hora">
                <div class="data">
                  <xsl:call-template name="formatadata-extenso">
                    <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="hora">
                  <xsl:call-template name="formatahora-extenso">
                    <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <div class="not-agencia">
                <h4>
                  <a class="cor-ref" href="{$url-amigavel}">
                    <xsl:value-of select="@assunto" disable-output-escaping="yes"/>
                  </a>
                </h4>

                <xsl:if test="fotodestaque/@arquivo!=''">
                  <xsl:variable name="nomeimagematamanho">
                    <xsl:value-of select="concat(substring-before(fotodestaque/@arquivo,'.jpg'),'_pq',pq,'.jpg')"/>
                  </xsl:variable>

                  <a href="{$url-amigavel}">
                    <figure><img src="$imagens/{$nomeimagematamanho}" /></figure>
                  </a>
                </xsl:if>
                <h2>
                  <a href="{$url-amigavel}">
                    <xsl:value-of select="@manchete" disable-output-escaping="yes" />
                  </a>
                </h2>
                <h3>
                  <a href="{$url-amigavel}">
                    <xsl:value-of select="@destaque" disable-output-escaping="yes" />
                  </a>
                </h3>
              </div>
            </li>
          </xsl:if>
        </xsl:for-each>

      </ul>
      <div class="mais-noticias">
        <h3>
          <a href="{$link}">Veja mais notícias</a>
        </h3>
      </div>

    </div>
  </xsl:template>

  <!-- Ivan: ok - corpo-agencia original -->
  <xsl:template name="corpo-agencia">
    <xsl:param name="_qtd" />
    <xsl:param name="idsecao" />
    <xsl:param name="diretorio" />
    <xsl:param name="tipo" />
    <xsl:param name="tipoOrdenacao" />

    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <xsl:if test="$tipoOrdenacao=0">
      <xsl:for-each select="//*/noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][../../@idsecao=$idsecao]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:sort select="@manchete" />
        <xsl:call-template name="lista-noticias-agencia">
          <xsl:with-param name="quantidade" select="$_qtd"/>
          <xsl:with-param name="tipo" select="$tipo"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="$tipoOrdenacao=1">
      <xsl:for-each select="//*/noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][../../@idsecao=$idsecao]">
        <xsl:sort select="@publicacao" order="descending" />
        <xsl:sort select="@manchete"/>
        <xsl:call-template name="lista-noticias-agencia">
          <xsl:with-param name="quantidade" select="$_qtd"/>
          <xsl:with-param name="tipo" select="$tipo"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - corpo-agencia ep -->
  <xsl:template name="corpo-agencia-ep">
    <xsl:param name="_qtd" />
    <xsl:param name="idsecao" />
    <xsl:param name="diretorio" />
    <xsl:param name="foto" />
    <xsl:param name="cidade" select="'campinas'" />

    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <xsl:value-of select="xsl-extensoes:ZeraPosicao()"/>
    <xsl:if test="$idsecao='' and $diretorio=''">
      <xsl:if test="$foto=0">
        <xsl:for-each select="//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete" />
          <xsl:call-template name="lista-noticias-ep-agencia">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$foto!=0">
        <xsl:for-each select="//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete" />
          <xsl:call-template name="lista-noticias-ep">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$diretorio!=''">
      <xsl:if test="$foto=0">
        <xsl:for-each select="//editoria[@diretorio=$diretorio]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete"/>
          <xsl:call-template name="lista-noticias-ep-agencia">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$foto!=0">
        <xsl:for-each select="//editoria[@diretorio=$diretorio]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete"/>
          <xsl:call-template name="lista-noticias-ep">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$idsecao!=''">
      <xsl:if test="$foto=0">
        <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete"/>
          <xsl:call-template name="lista-noticias-ep-agencia">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$foto!=0">
        <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:sort select="@manchete"/>
          <xsl:call-template name="lista-noticias-ep">
            <xsl:with-param name="quantidade" select="$_qtd"/>
            <xsl:with-param name="foto" select="$foto"/>
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="lista-noticias-agencia">
    <xsl:param name="quantidade" />
    <xsl:param name="tipo" />
    <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $quantidade)">
      <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;            " />
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:if test="$tipo='0'">
        <li>
          <xsl:call-template name="conteudo-agencia-simples"/>
        </li>
      </xsl:if>
      <xsl:if test="$tipo!='0'">
        <li>
          <xsl:call-template name="conteudo-agencia-completo"/>
        </li>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="lista-noticias-ep">
    <xsl:param name="quantidade" />
    <xsl:param name="foto" />
    <xsl:param name="cidade" select="'campinas'"/>
    <xsl:if test="(xsl-extensoes:Posicao($quantidade,@idnoticia))">
      <xsl:variable name="impar">
        <xsl:value-of select="xsl-extensoes:Posicao() mod 2"/>
      </xsl:variable>
      <xsl:if test="$impar = 1">
        <xsl:if test="$foto='0'">
          <div class="box-agencia-ep1">
            <xsl:call-template name="conteudo-agencia-simples">
              <xsl:with-param name="cidade" select="$cidade"/>
            </xsl:call-template>
          </div>
        </xsl:if>
        <xsl:if test="$foto!='0'">
          <xsl:call-template name="conteudo-agencia-completo">
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$impar != 1">
        <xsl:if test="$foto='0'">
          <div class="box-agencia-ep2">
            <xsl:call-template name="conteudo-agencia-simples">
              <xsl:with-param name="cidade" select="$cidade"/>
            </xsl:call-template>
          </div>
        </xsl:if>
        <xsl:if test="$foto!='0'">
          <xsl:call-template name="conteudo-agencia-completo">
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="lista-noticias-ep-agencia">
    <xsl:param name="quantidade" />
    <xsl:param name="foto" />
    <xsl:param name="cidade" select="'campinas'" />
    <xsl:if test="(xsl-extensoes:GetVar('posicao') &lt; $quantidade) and xsl-extensoes:NaoSelecionada(@idnoticia)">
      <xsl:value-of select="xsl-extensoes:SelecionaUltima(@idnoticia)"/>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:variable name="impar">
        <xsl:value-of select="xsl-extensoes:GetVar('posicao') mod 2"/>
      </xsl:variable>
      <xsl:if test="$impar = 1">
        <div class="box-agencia-ep1">
          <xsl:call-template name="conteudo-agencia-simples">
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </div>
      </xsl:if>
      <xsl:if test="$impar != 1">
        <div class="box-agencia-ep2">
          <xsl:call-template name="conteudo-agencia-simples">
            <xsl:with-param name="cidade" select="$cidade"/>
          </xsl:call-template>
        </div>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="conteudo-agencia-simples">
    <xsl:param name="cidade" select="'campinas'"/>
    <div class="data-hora tamanho12">
      <p>
        <span class="data negrito">
          <xsl:call-template name="formatadata-extenso">
            <xsl:with-param name="data" select="@publicacao"/>
          </xsl:call-template>
        </span>
      </p>
      <p>
        <span class="hora">
          <xsl:call-template name="formatahora-extenso">
            <xsl:with-param name="data" select="@publicacao"/>
          </xsl:call-template>
        </span>
      </p>
    </div>
    <xsl:variable name="diretorio_url">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="no" select="."></xsl:with-param>
        <xsl:with-param name="idcidade" select="$cidade"></xsl:with-param>
      </xsl:call-template>/<xsl:value-of select="@url" />
    </xsl:variable>
    <div class="menor">
      <a class="link-agencia-ep" href="{$diretorio_url}">
        <xsl:value-of select="@manchete" />
      </a>
    </div>
  </xsl:template>

  <xsl:template name="conteudo-agencia-completo">
    <xsl:param name="cidade" select="'campinas'"/>
    <xsl:variable name="diretorio_url">
      <xsl:call-template name="descobre-diretorio">
        <xsl:with-param name="no" select="."></xsl:with-param>
        <xsl:with-param name="idcidade" select="$cidade"></xsl:with-param>
      </xsl:call-template>/<xsl:value-of select="@url" />
    </xsl:variable>
    <li>
      <div class="data-hora">
        <div class="data">
          <xsl:call-template name="formatadata-extenso">
            <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
          </xsl:call-template>
        </div>
        <div class="hora">
          <xsl:call-template name="formatahora-extenso">
            <xsl:with-param name="data" select="@publicacao"></xsl:with-param>
          </xsl:call-template>
        </div>
      </div>
      <div class="not-agencia">
        <h4>
          <a class="cor-ref" href="{$diretorio_url}">
            <xsl:value-of select="@assunto" disable-output-escaping="yes"/>
          </a>
        </h4>

        <xsl:if test="fotodestaque/@arquivo!=''">
          <xsl:variable name="nomeimagematamanho">
            <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
            <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
            <xsl:value-of select="concat(substring-before(translate(fotodestaque/@arquivo, $ucletters, $lcletters),'.jpg'),'_pq',pq,'.jpg')"/>
          </xsl:variable>
			<xsl:variable name="imagens_ep" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />
          <a href="{$diretorio_url}">
            <figure><img src="{$imagens_ep}/{$nomeimagematamanho}" /></figure>
          </a>
        </xsl:if>
        <h2>
          <a href="{$diretorio_url}">
            <xsl:value-of select="@manchete" disable-output-escaping="yes" />
          </a>
        </h2>
        <h3>
          <a href="{$diretorio_url}">
            <xsl:value-of select="@destaque" disable-output-escaping="yes" />
          </a>
        </h3>
      </div>
    </li>
  </xsl:template>

</xsl:stylesheet>
