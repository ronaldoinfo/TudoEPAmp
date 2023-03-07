<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- Ivan: ok - MANCHETE_A - Big Box - Manchete + Foto Gigante  -->
  <xsl:template name="bc_manchete_a">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="tamanho" select="'gd'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_B - Big Box - Manchete + Texto Destaque + Foto Gigante   -->
  <xsl:template name="bc_manchete_b">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3>
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="$destaque"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="tamanho" select="'gd'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_C - Big Box - Somente Manchete   -->
  <xsl:template name="bc_manchete_c">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="info-box">
          <h2 class="super">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_D - Manchete + Destaque   -->
  <xsl:template name="bc_manchete_d">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="info-box">
          <h2 class="super">
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3>
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="translate($destaque, $quot, $apos)"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_E - Manchete + Foto Manchete -->
  <xsl:template name="bc_manchete_e">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <!--<xsl:with-param name="arquivoimagem" select="replace($imagemmanchete,'.jpg', '_p.jpg')"/>-->
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_F - Manchete + Texto Destaque + Foto Manchete -->
  <xsl:template name="bc_manchete_f">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3>
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="$destaque"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <!--<xsl:with-param name="arquivoimagem" select="replace($imagemmanchete,'.jpg', '_p.jpg')"/>-->
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_G - Assunto + Manchete + Foto Manchete -->
  <xsl:template name="bc_manchete_g">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
        <div class="box300-cont">
          <div class="materia-assunto">
            <span>
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
              </xsl:call-template>
            </span>
          </div>
          <div class="info-box">
            <h2>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h2>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  MANCHETE_NOTA - Manchete + Notas -->
	
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
	
	<xsl:text disable-output-escaping="yes">
	
	&lt;a href="/onlist/"&gt;
        &lt;img src="/img/tit/tit-OnList.png" alt="OnList" /&gt;
    &lt;/a&gt;
	</xsl:text>
	
	<div class="bc_manchete_notas-300">

    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
      <xsl:sort select="@publicacao" order="descending" />
      <xsl:sort select="@tiponoticia" order="ascending" />

      <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;            " />
      <xsl:if test="position() &lt;= $quantidade">
        <xsl:if test="@tiponoticia='1' and xsl-extensoes:GetVar('posicao') = 0">
          <xsl:value-of select="xsl-extensoes:SetVar('posicao',1)"/>
          <article class="intbox box-manchete box-manchete clearfix">
            <div class="box300">
              <div class="item-thumbnail">
                
                <xsl:call-template name="linkfotomanchete">
                  <xsl:with-param name="cssclass" select="'img-center'"/>
                  <xsl:with-param name="legenda" select="a"/>
                  <xsl:with-param name="credito" select="@credito"/>
                </xsl:call-template>
              </div>
              <div class="box300-cont">
                <div class="info-box">
                  <h2>
                    <xsl:call-template name="cria-link-diretorio" />
                  </h2>
                </div>
              </div>
            </div>
          </article>
        </xsl:if>
        <xsl:if test="xsl-extensoes:GetVar('posicao') = 1 and position() &gt; 1">
          <article class="item-agencia intbox clearfix" itemscope="" itemtype="http://schema.org/NewsArticle">
            <div class="row">
              <div class="col-xs-12">
                <div class="info-box">
                  <h3 itemprop="name">
                    <xsl:call-template name="cria-link-diretorio" />
                  </h3>
                </div>
              </div>
            </div>
          </article>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
	  <div class="box-veja-mais">
        <a itemprop="relatedLink" href="/onlist/">
          VEJA MAIS 
		   <i class="fa fa-plus">
            <xsl:comment>
            </xsl:comment>
          </i>
        </a>
      </div>
	 
	 </div>
	 
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_H - Assunto + Manchete + Texto Destaque + Foto Manchete -->
  <xsl:template name="bc_manchete_h">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="$assunto"/>
            </xsl:call-template>
          </span>
        </div>
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3>
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="$destaque"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
      </div>
    </article>
  </xsl:template>

  <!--  Ivan: ok - MANCHETE_I - Foto Manchete + Manchete -->
  <xsl:template name="bc_manchete_i">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_J - Foto + Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_j">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="row">
          <div class="col-sm-4 col-md-5">
            <div class="item-thumbnail">
              <xsl:call-template name="linkfotomanchete">
                <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                <xsl:with-param name="link" select="$link"/>
                <xsl:with-param name="cssclass" select="'img-left'"/>
                <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="col-sm-5 col-md-6">
            <div class="info-box">
              <h2 class="super">
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
              <h3 class="hidden-sm">
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_K_310 - Foto + Assunto + Manchete -->
  <xsl:template name="bc_manchete_k_310">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="box-overlay">
          <div class="item-thumbnail">
            <xsl:call-template name="linkfotomanchete">
              <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
              <xsl:with-param name="tamanho" select="''"/>
              <xsl:with-param name="link" select="$link"/>
              <xsl:with-param name="cssclass" select="''"/>
              <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
              <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            </xsl:call-template>
          </div>
          <div class="box-overlay-item">
            <div class="box-overlay-texto">
              <div class="materia-assunto">
                <span>
                  <xsl:value-of select="@assunto"/>
                </span>
              </div>
              <div class="info-box">
                <h2 class="small-title">
                  <xsl:call-template name="linkmanchete">
                    <xsl:with-param name="conteudo" select="$manchete"/>
                    <xsl:with-param name="link" select="$link"/>
                  </xsl:call-template>
                </h2>
              </div>
            </div>
            <div class="overlay"></div>
          </div>
        </div>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_L - BIG BOX - Foto Manchete vertical + Assunto + Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_l">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
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
              <h2>
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
              <h3>
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
          </div>
        </div>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_M - Dois box contendo foto Manchete vertical + Assunto + Manchete -->
  <xsl:template name="bc_manchete_m" xml:space="preserve">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
        <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    
  <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-xs-6">
      <article class="intbox box-manchete clearfix">    
        <div class="box300">
          <div class="materia-assunto">
              <span>
                  <xsl:value-of select="@assunto" />
		          </span>
          </div>
          <div class="item-thumbnail">
                <xsl:call-template name="linkfotomanchete">
                  <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                  <xsl:with-param name="tamanho" select="'vl'"/>
                  <xsl:with-param name="link" select="$link"/>
                  <xsl:with-param name="cssclass" select="'img-center'"/>
                  <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                  <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
                </xsl:call-template>    
          </div>
          <div class="info-box">
            <h2>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="$manchete"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h2>
          </div>  
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_N - Dois box contendo Manchete + Foto Manchete vertical -->
  <xsl:template name="bc_manchete_n" xml:space="preserve">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-xs-6">
      <article class="intbox box-manchete clearfix">  
        <div class="box300">
          <div class="item-thumbnail">
                <xsl:call-template name="linkfotomanchete">
                  <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                  <xsl:with-param name="tamanho" select="'vl'"/>
                  <xsl:with-param name="link" select="$link"/>
                  <xsl:with-param name="cssclass" select="'img-center'"/>
                  <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                  <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
                </xsl:call-template>    
            </div>
            <div class="info-box">
              <h2>
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
           </div> 
          </div>
        </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_N_640 - Foto + Assunto + Manchete -->
  <xsl:template name="bc_manchete_n_640">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="row">
          <div class="col-sm-6">
            <div class="item-thumbnail">
              <xsl:call-template name="linkfotomanchete">
                <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                <xsl:with-param name="tamanho" select="''"/>
                <xsl:with-param name="link" select="$link"/>
                <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="info-box">
              <div class="materia-assunto">
                <span>
                  <xsl:value-of select="@assunto" />
                </span>
              </div>
              <h2>
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
              <h3>
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
          </div>
        </div>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_O - Manchete + Texto Destaque -->
  <xsl:template name="bc_manchete_o">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
          <h3>
            <xsl:call-template name="linkdestaque">
              <xsl:with-param name="conteudo" select="$destaque"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h3>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_P - Big Box - Foto Gigante + Manchete -->
  <xsl:template name="bc_manchete_p">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="tamanho" select="'gd'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_Q_640 - Foto + Assunto + Manchete -->
  <xsl:template name="bc_manchete_q_640">
    <xsl:param name="assunto" />
    <xsl:param name="idnoticia" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="link" />
    <xsl:param name="manchete" />

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <div class="box-overlay">
          <div class="item-thumbnail">
            <xsl:call-template name="linkfotomanchete">
              <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
              <xsl:with-param name="tamanho" select="'gd'"/>
              <xsl:with-param name="link" select="$link"/>
              <xsl:with-param name="cssclass" select="'img-center'"/>
              <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
              <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            </xsl:call-template>
          </div>
          <div class="box-overlay-item">
            <div class="box-overlay-texto">
              <div class="materia-assunto">
                <span>
                  <xsl:value-of select="$assunto"/>
                </span>
              </div>
              <div class="info-box">
                <h2>
                  <xsl:call-template name="linkmanchete">
                    <xsl:with-param name="conteudo" select="$manchete"/>
                    <xsl:with-param name="link" select="$link"/>
                  </xsl:call-template>
                </h2>
              </div>
            </div>
            <div class="overlay"></div>
          </div>
        </div>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_R_640 - 2 box c/ Assunto + Foto + Manchete ( 2 colunas ) -->
  <xsl:template name="bc_manchete_r_640">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-sm-6">
      <article class="intbox box-manchete clearfix">
        <div class="box300">
          <div class="materia-assunto">
            <span>
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="$assunto"/>
              </xsl:call-template>
            </span>
          </div>

          <div class="box-overlay">
            <div class="item-thumbnail">
              <xsl:call-template name="linkfotomanchete">
                <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                <xsl:with-param name="link" select="$link"/>
                <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
              </xsl:call-template>
            </div>
            <div class="box-overlay-item">
              <div class="box-overlay-texto">
                <div class="info-box">
                  <h2>
                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="$link"/>
                    </xsl:call-template>
                  </h2>
                </div>
              </div>
              <div class="overlay"></div>
            </div>
          </div>
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_S_640 - 2 box s/ Assunto + Foto + Manchete ( 2 colunas ) -->
  <xsl:template name="bc_manchete_s_640">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-sm-6">
      <article class="intbox box-manchete clearfix">
        <div class="box300">
          <div class="item-thumbnail">
            <xsl:call-template name="linkfotomanchete">
              <xsl:with-param name="arquivoimagem" select="$imagemmanchete" />
              <xsl:with-param name="link" select="$link"/>
              <xsl:with-param name="cssclass" select="'img-center'"/>
              <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
              <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
            </xsl:call-template>
          </div>
          <div class="info-box">
            <h2>
              <xsl:call-template name="linkmanchete">
                <xsl:with-param name="conteudo" select="$manchete"/>
                <xsl:with-param name="link" select="$link"/>
              </xsl:call-template>
            </h2>
          </div>
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_T_640 - 2 box + Assunto + Destaque + Manchete + Foto ( 2 colunas ) -->
  <xsl:template name="bc_manchete_t_640">
    <xsl:param name="assunto" />
    <xsl:param name="destaque" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
      <div class="col-sm-6">
        <article class="intbox box-manchete clearfix">
          <div class="box300">
            <div class="row">
              <div class="col-xs-6">
                <div class="info-box">
                  <div class="materia-assunto">
                    <span>
                      <xsl:value-of select="@assunto" />
                    </span>
                  </div>
                  <h2>
                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="$link"/>
                    </xsl:call-template>
                  </h2>
                  <h3>
                    <xsl:call-template name="linkdestaque">
                      <xsl:with-param name="conteudo" select="$destaque"/>
                      <xsl:with-param name="link" select="$link"/>
                    </xsl:call-template>
                  </h3>
                </div>
              </div>
              <div class="col-xs-6">
                <div class="item-thumbnail">
                  <xsl:call-template name="linkfotomanchete">
                    <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                    <xsl:with-param name="tamanho" select="'vl'"/>
                    <xsl:with-param name="link" select="$link"/>
                    <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                    <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </xsl:if>
    <xsl:if test="$position='ultimo'">
      <div class="col-sm-6">
        <article class="intbox box-manchete clearfix">
          <div class="box300">
            <div class="row">
              <div class="col-xs-6">
                <div class="item-thumbnail">
                  <xsl:call-template name="linkfotomanchete">
                    <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                    <xsl:with-param name="tamanho" select="'vl'"/>
                    <xsl:with-param name="link" select="$link"/>
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
                  <h2>
                    <xsl:call-template name="linkmanchete">
                      <xsl:with-param name="conteudo" select="$manchete"/>
                      <xsl:with-param name="link" select="$link"/>
                    </xsl:call-template>
                  </h2>
                  <h3>
                    <xsl:call-template name="linkdestaque">
                      <xsl:with-param name="conteudo" select="$destaque"/>
                      <xsl:with-param name="link" select="$link"/>
                    </xsl:call-template>
                  </h3>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_U_310 - Destaque + Manchete + Foto -->
  <xsl:template name="bc_manchete_u_310">
    <xsl:param name="destaque" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="row">
          <div class="col-xs-6">
            <div class="info-box">
              <div class="materia-assunto">
                <span>
                  <xsl:value-of select="@assunto" />
                </span>
              </div>
              <h2>
                <xsl:call-template name="linkmanchete">
                  <xsl:with-param name="conteudo" select="$manchete"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h2>
              <h3>
                <xsl:call-template name="linkdestaque">
                  <xsl:with-param name="conteudo" select="$destaque"/>
                  <xsl:with-param name="link" select="$link"/>
                </xsl:call-template>
              </h3>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="item-thumbnail">
              <xsl:call-template name="linkfotomanchete">
                <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
                <xsl:with-param name="tamanho" select="'vl'"/>
                <xsl:with-param name="link" select="$link"/>
                <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
                <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_V_310 - Destaque + Manchete + Foto   -->
  <xsl:template name="bc_manchete_v_310">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />

    <article class="intbox box-manchete clearfix">
      <div class="box300">
        <div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="$assunto"/>
            </xsl:call-template>
          </span>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'dir'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
        <h2>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_X_640 - Destaque + Manchete + Foto -->
  <xsl:template name="bc_manchete_x_640">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />

    <xsl:variable name="clearfix">
      <xsl:choose>
        <xsl:when test="$position='1'">&lt;div class="intbox box-manchete clearfix"&gt;</xsl:when>
        <xsl:when test="$position='ultimo'">&lt;/div&gt;</xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:if test="$position='1'">
      <xsl:value-of select="$clearfix" disable-output-escaping="yes"/>
    </xsl:if>

    <xsl:variable name="nome-css-class" xml:space="default">
      <xsl:choose>
        <xsl:when test="$position='1'">l200 esq md20</xsl:when>
        <xsl:when test="$position='2'">l200 esq</xsl:when>
        <xsl:when test="$position='ultimo'">l200 dir me20</xsl:when>
      </xsl:choose>
    </xsl:variable>

    <div class="{$nome-css-class}">
      <xsl:call-template name="linkfotodestaque">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete" />
        <xsl:with-param name="tamanho" select="''"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
      </xsl:call-template>

      <h3>
        <xsl:call-template name="linkmanchete">
          <xsl:with-param name="conteudo" select="$manchete"/>
          <xsl:with-param name="link" select="$link"/>
        </xsl:call-template>
      </h3>
    </div>

    <xsl:if test="$position='ultimo'">
      <xsl:value-of select="$clearfix" disable-output-escaping="yes"/>
    </xsl:if>

    <xsl:if test="$position='ultimo'">
      <div class="clear">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- limpar float-->]]></xsl:text>
      </div>
    </xsl:if>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE_Y_640 - Destaque + Foto + Manchete  -->
  <xsl:template name="bc_manchete_y_640">
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="link" />
    <xsl:param name="manchete" />

    <article class="intbox box-manchete clearfix">
      <div class="box600">
        <h2>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
            <xsl:with-param name="tamanho" select="'gd'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
            <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
          </xsl:call-template>
        </div>
        <h3>
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - MANCHETE_W_640 - mini fotos na esquerda, quando clicar na foto abrirá a foto grande na direita com manchete e assunto -->
  <xsl:template name="bc_manchete_w_640">
    <xsl:param name="idsecao" />

    <script type="text/javascript" src="https://statics.tudoep.com/tudoep.v56/jquery/dist/jquery.js">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
    </script>
    <script type="text/javascript" src="/js/jMancheteW.js">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
    </script>

    <div>
      <h2>Imagens Campeãs</h2>
    </div>

    <xsl:variable name="abre-tag-ul" xml:space="default">
      &lt;ul id="abas"&gt;
    </xsl:variable>

    <xsl:variable name="fecha-tag-ul" xml:space="default">
      &lt;/ul&gt;
    </xsl:variable>

    <xsl:value-of select="$abre-tag-ul" disable-output-escaping="yes"/>
    <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
    <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado','')"/>

    <xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
      <xsl:sort select="@publicacao" order="descending" />
      <xsl:if test="position() &lt;= 5">
        <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;            " />
        <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
        <li>
          <a itemprop="relatedLink" href="#tab{xsl-extensoes:GetVar('posicao')}">

            <xsl:call-template name="linkfotomanchete">
              <xsl:with-param name="tamanho" select="'pq'"/>
              <xsl:with-param name="cssclass" select="'img-center'"/>
            </xsl:call-template>
          </a>
        </li>

        <!-- contém a foto grande -->
        <xsl:variable name="conteudo-temp-a" xml:space="default">
          <xsl:call-template name="linkfotomanchete">
            <xsl:with-param name="tamanho" select="'gd'"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
          </xsl:call-template>
        </xsl:variable>

        <!-- coloca a foto grande dentro de um div com um link -->
        <!--<xsl:variable name="conteudo-temp" xml:space="default">
          &lt;div id="tab<xsl:value-of select="xsl-extensoes:GetVar('posicao')" /> class="contaba">
          &lt;a name="tab<xsl:value-of select="xsl-extensoes:GetVar('posicao')" /> />
          <xsl:value-of select="$conteudo-temp-a" />
          &lt;/div>
        </xsl:variable>

        -->
        <!-- concatena o resultado para ser impresso somente fora do for-each -->
        <!--
        <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado',concat(xsl-extensoes:GetVar('conteudo-concatenado'),$conteudo-temp))"/>-->
      </xsl:if>

    </xsl:for-each>

    <!-- fecha a <UL> -->
    <xsl:value-of select="$fecha-tag-ul" disable-output-escaping="yes"/>

    <!-- imprime o resultado -->
    <!--<xsl:value-of select="xsl-extensoes:GetVar('conteudo-concatenado')" disable-output-escaping="yes" />-->

  </xsl:template>

  <!-- Ivan: ok - IMAGENS ROTATIVAS - SERÁ SUBSTITUIDO PELO BOX MANCHETE IMAGENS ROTATIVAS 600-->
  <xsl:template name="bc_imagens_rotativas">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />

    <xsl:variable name="numero_img">
      <xsl:value-of select="position()" />
    </xsl:variable>

    <!-- QUANDO BOX DINÂMICO -->
    <xsl:if test="@manchete != ''" >
      <xsl:if test="$position='1'">
        <link href="/js/jImageRotator.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/js/jImageRotator.js">
          <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
        </script>
        <xsl:text disable-output-escaping="yes">
          &lt;div class="image-rotator">
          &lt;div class="album">
          &lt;div class="imagens">
      </xsl:text>
      </xsl:if>
      <div class="img-manchete-{$numero_img}">
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="tamanho" select="'gd'"/>
          <xsl:with-param name="cssclass" select="'img-center'"/>
        </xsl:call-template>

        <xsl:variable name="diretorio">
          <xsl:call-template name="descobre-diretorio">
            <xsl:with-param name="idcidade" select="//noticia[@idnoticia=current()/@idnoticia]/@idcidade"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="link_noticia">
          <xsl:call-template name="link"/>
        </xsl:variable>
        <div class="bg-rotator">
          <a itemprop="relatedLink" href="/{$diretorio}/{@url}">
            <h3>
              <xsl:value-of select="@assunto" disable-output-escaping="yes"/>
            </h3>
            <h2>
              <xsl:value-of select="@manchete" disable-output-escaping="yes" />
            </h2>
          </a>
        </div>
        <xsl:if test="$position='ultimo'">
          <xsl:text disable-output-escaping="yes">
             &lt;/div>
             &lt;/div>
             &lt;/div>
          </xsl:text>
        </xsl:if>
        <xsl:if test="$position='ultimo'">
          <div class="paginas">
            <xsl:call-template name="paginas">
              <xsl:with-param name="total" select="$numero_img" />
            </xsl:call-template>
          </div>
        </xsl:if>
      </div>
    </xsl:if>

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <link href="/js/jImageRotator.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/js/jImageRotator.js">
          <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
        </script>
        <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
          &lt;div class="image-rotator">
          &lt;div class="album">
          &lt;div class="imagens">
      </xsl:text>
      </xsl:if>

      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <div class="img-manchete-{xsl-extensoes:GetVar('posicao')}">
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="tamanho" select="'gd'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-center'"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        </xsl:call-template>
        <xsl:variable name="link_noticia">
          <xsl:call-template name="link"/>
        </xsl:variable>
        <div class="bg-rotator">
          <a itemprop="relatedLink" href="{$link}">
            <h3>
              <xsl:value-of select="$assunto" disable-output-escaping="yes"/>
            </h3>
            <h2>
              <xsl:value-of select="$manchete" disable-output-escaping="yes" />
            </h2>
          </a>
        </div>
        <xsl:if test="$position='ultimo'">
          <xsl:text disable-output-escaping="yes">
             &lt;/div>
             &lt;/div>
             &lt;/div>
          </xsl:text>
        </xsl:if>

        <xsl:if test="$position='ultimo'">
          <div class="paginas">
            <xsl:call-template name="paginas">
              <xsl:with-param name="total" select="xsl-extensoes:GetVar('posicao')"/>
            </xsl:call-template>
          </div>
        </xsl:if>
      </div>
    </xsl:if>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE IMAGENS ROTATIVAS  -->
  <xsl:template name="bc_manchete_imagens_rotativas">
    <xsl:param name="manchete" />
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

    <!-- QUANDO BOX DINÂMICO -->

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          head.ready(function () {
          $("#bc_manchete_imagens_rotativas").box_manchete_imagens_rotativas();
          });
        </script>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
          &lt;article class="intbox box300 clearfix"&gt;				
                &lt;div class="slider-conteudo clearfix" style="display:none"&gt;
                &lt;div id="slider" class="boxSlider"&gt;
               </xsl:text>
      </xsl:if>

      <xsl:variable name="caption">
        &lt;h2&gt;
        &lt;a itemprop="url" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($assunto, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h2&gt;
        &lt;h3&gt;
        &lt;a itemprop="url" class="legend" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($manchete, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h3&gt;
      </xsl:variable>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <!--<xsl:with-param name="tamanho" select="'gd'"/>-->
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="caption" select="$caption"/>
      </xsl:call-template>
      <xsl:variable name="link_noticia">
        <xsl:call-template name="link"/>
      </xsl:variable>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">                 
                  &lt;/div&gt;              
                &lt;/div&gt;              
            &lt;/article&gt;
          </xsl:text>
      </xsl:if>
    </xsl:if>

  </xsl:template>

  <!-- Ivan: ok - MANCHETE IMAGENS ROTATIVAS 600  -->
  <xsl:template name="bc_manchete_imagens_rotativas_600">
    <xsl:param name="manchete" />
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

    <!-- QUANDO BOX DINÂMICO -->

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          head.ready(function () {
          $("#bc_manchete_imagens_rotativas_600").box_manchete_imagens_rotativas();
          });
        </script>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
         
			&lt;article class="intbox box600 clearfix"&gt;		
                &lt;div class="slider-conteudo clearfix" style="display:none"&gt;
                &lt;div id="slider" class="boxSlider"&gt;
               </xsl:text>
      </xsl:if>

      <xsl:variable name="caption">
        &lt;h2&gt;
        &lt;a itemprop="url" class="super" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($assunto, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h2&gt;
        &lt;h3&gt;
        &lt;a itemprop="url" class="legend" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($manchete, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h3&gt;
      </xsl:variable>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <xsl:with-param name="tamanho" select="'gd'"/>
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="caption" select="$caption"/>
      </xsl:call-template>
      <xsl:variable name="link_noticia">
        <xsl:call-template name="link"/>
      </xsl:variable>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">
               &lt;/div&gt;              
            &lt;/div&gt;
            &lt;/article&gt;
            </xsl:text>
      </xsl:if>
    </xsl:if>

  </xsl:template>
  
  

<!-- NOVO MANCHETE IMAGENS ROTATIVAS 900 -->
  <xsl:template name="bc_manchete_imagens_rotativas_big">
    <xsl:param name="manchete" />
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

    <!-- QUANDO BOX DINÂMICO -->

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          head.ready(function () {
          $("#bc_manchete_imagens_rotativas_big").box_manchete_imagens_rotativas();
          });
        </script>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
          &lt;article class="intbox box300 clearfix"&gt;				
                &lt;div class="slider-conteudo clearfix" style="display:none"&gt;
                &lt;div id="slider" class="boxSlider"&gt;
               </xsl:text>
      </xsl:if>

      <xsl:variable name="caption">
        &lt;h2&gt;
        &lt;a itemprop="url" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($assunto, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h2&gt;
        &lt;h3&gt;
        &lt;a itemprop="url" class="legend" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($manchete, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h3&gt;
      </xsl:variable>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <!--<xsl:with-param name="tamanho" select="'gd'"/>-->
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="caption" select="$caption"/>
      </xsl:call-template>
      <xsl:variable name="link_noticia">
        <xsl:call-template name="link"/>
      </xsl:variable>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">                 
                  &lt;/div&gt;              
                &lt;/div&gt;              
            &lt;/article&gt;
          </xsl:text>
      </xsl:if>
    </xsl:if>

  </xsl:template>  
  
  
<!-- NOVO MANCHETE IMAGENS ROTATIVAS 900 - Versão Mobile -->
  <xsl:template name="bc_manchete_imagens_rotativas_big_v_mobile">
    <xsl:param name="manchete" />
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

    <!-- QUANDO BOX DINÂMICO -->

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          head.ready(function () {
          $("#bc_manchete_imagens_rotativas_big_v_mobile").bc_manchete_imagens_rotativas_big_v_mobile();
          });
        </script>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
          &lt;article class="intbox box300 clearfix"&gt;				
                &lt;div class="slider-conteudo clearfix" style="display:none"&gt;
                &lt;div id="slider" class="boxSlider"&gt;
               </xsl:text>
      </xsl:if>

      <xsl:variable name="caption">
        &lt;h2&gt;
        &lt;a itemprop="url" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($assunto, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h2&gt;
        &lt;h3&gt;
        &lt;a itemprop="url" class="legend" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($manchete, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h3&gt;
      </xsl:variable>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <!--<xsl:with-param name="tamanho" select="'gd'"/>-->
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="caption" select="$caption"/>
      </xsl:call-template>
      <xsl:variable name="link_noticia">
        <xsl:call-template name="link"/>
      </xsl:variable>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">                 
                  &lt;/div&gt;              
                &lt;/div&gt;              
            &lt;/article&gt;
          </xsl:text>
      </xsl:if>
    </xsl:if>

  </xsl:template>  
    
  

  <!-- Ivan: ok - BOX URGENTE  -->
  <xsl:template name="bc_urgente_ep">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <xsl:param name="link"/>
    <article class="intbox box-manchete clearfix">
      <div class="box900">
        <div id="box-urgente" class="clearfix">
          <div class="tit-urgente">URGENTE</div>
          <div class="txt-urgente">
            <h2 class="super">
              <a itemprop="relatedLink" href="{$link}">
                <span class="destaque-urgente">
                  <xsl:value-of select="$destaque" disable-output-escaping="yes" />
                </span>
              </a>
            </h2>
            <h3>
              <a itemprop="relatedLink" href="{$link}">
				<span class="manchete-urgente">
                  <xsl:value-of select="$manchete" disable-output-escaping="yes"/>
                </span>
              </a>
            </h3>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <!-- BOX AOVIVO  -->
  <xsl:template name="bc_aovivo">
    <xsl:param name="idnoticia"/>
    <xsl:param name="manchete"/>
    <xsl:param name="destaque"/>
    <article class="intbox box-manchete clearfix">
      <div class="box900">
        <div id="box-urgente" class="clearfix">
          <div class="tit-urgente">AO VIVO</div>
          <div class="txt-urgente">
            <h2 class="super">
              <a itemprop="relatedLink" href="/onplay/ao-vivo/">
                <span class="destaque-urgente">
                  <xsl:value-of select="$destaque" disable-output-escaping="yes" />
                </span>
              </a>
            </h2>
            <h3>
              <a itemprop="relatedLink" href="/onplay/ao-vivo/">
                <span class="manchete-urgente">
                  <xsl:value-of select="$manchete" disable-output-escaping="yes"/>
                </span>
              </a>
            </h3>
          </div>
        </div>
      </div>
    </article>
  </xsl:template>

  <xsl:template name="bc_manchete_imagens_rotativas_900">
    <xsl:param name="manchete" />
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

    <!-- QUANDO BOX DINÂMICO -->

    <!-- QUANDO BOX ESTÁTICO -->
    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          head.ready(function () {
          $("#bc_manchete_imagens_rotativas_900").box_manchete_imagens_rotativas();
          });
        </script>
      </xsl:if>

      <xsl:if test="$position='1'">
        <xsl:text disable-output-escaping="yes">
         
			&lt;article class="intbox box600 clearfix"&gt;		
                &lt;div class="slider-conteudo clearfix" style="display:none"&gt;
                &lt;div id="slider" class="boxSlider"&gt;
               </xsl:text>
      </xsl:if>

      <xsl:variable name="caption">
        &lt;h2&gt;
        &lt;a itemprop="url" class="super" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($assunto, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h2&gt;
        &lt;h3&gt;
        &lt;a itemprop="url" class="legend" href="<xsl:value-of select="$link" />"&gt;
        <xsl:value-of select="translate($manchete, $quot, $apos)" />
        &lt;/a&gt;
        &lt;/h3&gt;
      </xsl:variable>
      <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <xsl:with-param name="tamanho" select="''"/>
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="caption" select="$caption"/>
      </xsl:call-template>
      <xsl:variable name="link_noticia">
        <xsl:call-template name="link"/>
      </xsl:variable>

      <xsl:if test="$position='ultimo'">
        <xsl:text disable-output-escaping="yes">
               &lt;/div&gt;              
            &lt;/div&gt;
            &lt;/article&gt;
            </xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- MANCHETE IMAGENS ROTATIVAS 900 com Bullets 15/02/2016 por Ronaldo Sampaio -->
  <xsl:template name="bc_manchete_imagens_rotativas_900_bullets">
    <xsl:param name="idnoticia" />
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    <xsl:param name="tipoImagem" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:param name="facebook">"</xsl:param>
    <xsl:param name="twitter">"</xsl:param>
    <xsl:param name="gplus">"</xsl:param>
    <xsl:param name="publicacao" />
    <xsl:param name="quantidade" />

    <xsl:if test="$position='1'">
      <!--chamada de scripts para o box-->
      <!--[if lte IE 9]><script type="text/javascript" src="/js/slider-ie.js"><xsl:text disable-output-escaping="yes"><![CDATA[]]></xsl:text></script><![endif]-->

      <script src="/js/gestures.js" type="text/javascript">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
      </script>
      <script src="/js/BoxSliderGaleria.js" type="text/javascript">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
      </script>
    </xsl:if>

    <xsl:variable name="numero_img">
      <xsl:value-of select="position()" />
    </xsl:variable>

    <xsl:variable name="abre-tag-ul" xml:space="default">
      &lt;ul&gt;
    </xsl:variable>

    <xsl:variable name="fecha-tag-ul" xml:space="default">
      &lt;/ul&gt;
    </xsl:variable>

    <xsl:if test="$manchete != ''">
      <xsl:if test="$position='1'">
        <script>
          $(document).ready(function() {
          $('.BoxSliderGaleria').BoxSliderGaleria();
          });
        </script>

        <xsl:value-of select="xsl-extensoes:SetVar('posicao',0)"/>
        
        <xsl:variable name="conteudo-bullets-dinamicos" xml:space="default">

               &lt;div class="box-slider autoplay cs_handle" style="display: block;"&gt;
       
              <xsl:value-of select="xsl-extensoes:SetVar('posicaoBullet1',0)"/>
          
              <xsl:for-each select="//*[xsl-extensoes:GetVar('posicaoBullet1') &lt; $quantidade]">    
                  &lt;input type="radio" class="cs_anchor slide" id="slider-0<xsl:value-of select="xsl-extensoes:GetVar('posicaoBullet1')" />" name="cs_anchor1"&gt;
                  <xsl:value-of select="xsl-extensoes:SetVar('posicaoBullet1',xsl-extensoes:GetVar('posicaoBullet1')+1)"/>
              </xsl:for-each>
                
                &lt;input type="radio" checked="" class="cs_anchor" id="cs_play1" name="cs_anchor1"&gt;

              <xsl:value-of select="xsl-extensoes:SetVar('posicaoBullet2',0)"/>
              <xsl:for-each select="//*[xsl-extensoes:GetVar('posicaoBullet2') &lt; $quantidade]">
                  &lt;input type="radio" class="cs_anchor pause" id="cs_pause1_<xsl:value-of select="xsl-extensoes:GetVar('posicaoBullet2')" />" name="cs_anchor1"&gt;
                  <xsl:value-of select="xsl-extensoes:SetVar('posicaoBullet2',xsl-extensoes:GetVar('posicaoBullet2')+1)"/>
              </xsl:for-each>
        </xsl:variable>


        <xsl:value-of select="concat('',$conteudo-bullets-dinamicos)" disable-output-escaping="yes"/>
        <xsl:value-of select="$abre-tag-ul" disable-output-escaping="yes"/>
      </xsl:if>

      <li class="num{xsl-extensoes:GetVar('posicao')} img">

        <!-- Link da Notícia 01 -->
        <xsl:call-template name="linkfotomanchete">
          <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
          <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        </xsl:call-template>

        <xsl:variable name="conteudo-temp-link-noticia" xml:space="default">
          <xsl:value-of select="$link" />
        </xsl:variable>

        <xsl:variable name="conteudo-temp" xml:space="default">
          &lt;label class="num<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />"&gt;
          <!-- Chapéu da Notícia 01 -->
          &lt;span class="box-slider-chapeu"&gt;
          <xsl:value-of select="$assunto" />&lt;/span&gt;
          &lt;span class="box-slider-manch"&gt;

          <!-- Link da Notícia 01 -->
          &lt;a href="<xsl:value-of select="$link" />" class="lnk-manch"&gt;
          <!-- Manchete da Notícia 01 -->
          <xsl:value-of select="$manchete" />
          &lt;/a&gt;

          <!-- Data da Notícia 01 -->
          <!--&lt;span class="box-slider-data"&gt;
            &lt;i class="fa fa-clock-o fa-flip-horizontal"&gt;&lt;/i&gt; idnoticia <xsl:value-of  select="$idnoticia" />   publicacao <xsl:value-of  select="$publicacao" />-->
          &lt;/span&gt;
          &lt;/label&gt;
        </xsl:variable>

        <xsl:variable name="conteudo-temp2" xml:space="default">
          &lt;label for="slider-0<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />" class="num<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />"&gt;
          &lt;span&gt;
          &lt;i class="fa fa-chevron-left"&gt; &lt;/i&gt;
          &lt;/span&gt;
          &lt;/label&gt;
        </xsl:variable>

        <xsl:variable name="conteudo-temp3" xml:space="default">
          &lt;label for="slider-0<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />" class="num<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />"&gt;
          &lt;span&gt;
          &lt;i class="fa fa-chevron-right"&gt;&lt;/i&gt;
          &lt;/span&gt;
          &lt;/label&gt;
        </xsl:variable>

        <!--bullets-->
        <xsl:variable name="conteudo-temp4" xml:space="default">
          &lt;label for="slider-0<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />" class="num<xsl:value-of select="xsl-extensoes:GetVar('posicao')" />"&gt;
          &lt;span class="cs_point"&gt;&lt;/span&gt;
          &lt;/label&gt;
        </xsl:variable>


        <!-- concatena o resultado para ser impresso somente depois do UL -->
        <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado',concat(xsl-extensoes:GetVar('conteudo-concatenado'),$conteudo-temp))"/>

        <!-- concatena o resultado 2 -->
        <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado2',concat(xsl-extensoes:GetVar('conteudo-concatenado2'),$conteudo-temp2))"/>

        <!-- concatena o resultado 3 -->
        <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado3',concat(xsl-extensoes:GetVar('conteudo-concatenado3'),$conteudo-temp3))"/>

        <!-- concatena o resultado 4 -->
        <xsl:value-of select="xsl-extensoes:SetVar('conteudo-concatenado4',concat(xsl-extensoes:GetVar('conteudo-concatenado4'),$conteudo-temp4))"/>

        <!--INCREMENTA VARIAVEL POSICAO-->
        <xsl:value-of select="xsl-extensoes:SetVar('posicao',xsl-extensoes:GetVar('posicao')+1)"/>

      </li>

      <xsl:if test="$position='ultimo'">

        <xsl:value-of select="$fecha-tag-ul" disable-output-escaping="yes"/>

        <div class="box-slider-desc">
          <!-- imprime o resultado -->
          <xsl:value-of select="xsl-extensoes:GetVar('conteudo-concatenado')" disable-output-escaping="yes" />
        </div>

        <!-- imprime o resultado 2-->
        <div class="cs_arrowprev">
          <xsl:value-of select="xsl-extensoes:GetVar('conteudo-concatenado2')" disable-output-escaping="yes" />
        </div>

        <!-- imprime o resultado 3-->
        <div class="cs_arrownext">
          <xsl:value-of select="xsl-extensoes:GetVar('conteudo-concatenado3')" disable-output-escaping="yes" />
        </div>

        <!--imprime o resultado 4 que são os bullets-->
        <div class="cs_bullets">
          <xsl:value-of select="xsl-extensoes:GetVar('conteudo-concatenado4')" disable-output-escaping="yes" />
        </div>

        <xsl:text disable-output-escaping="yes">                 
			&lt;/div&gt;      
		</xsl:text>

      </xsl:if>

    </xsl:if>

  </xsl:template>

  <!--
  *************************************************************************************************************************************
  Criado por: Carlos Ronaldo Sampaio Coletti
  Data Início: 14/11/2016
  Objetivo: O usuário pode selecionar as notícias desejadas bem como alterar os nomes das imagens, url, manchete e assunto, 
            o box irá exibir as notícias selecionadas pelo usuário de forma rotativa como se fosse um carrossel e com imagem menor a direita.
  Projeto: A Cidade ON Pai
  Tipo: Estático
  ************************************************************************************************************************************* 
  -->

  <xsl:template name="bc_noticias_rotativas_900_thumb_a_direita">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemmanchete" />
    <xsl:param name="imagemmanchetelegenda" />
    <xsl:param name="imagemmanchetecredito" />
    <xsl:param name="position" />
    <xsl:param name="tipoImagem" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:if test="$position='1'">
      <link href="/css/pgwslider.min.noticia.css" rel="stylesheet" type="text/css" />
      <script src="/js/pgwslider.min.noticia.js">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- javascript-->]]></xsl:text>
      </script>
      <xsl:text disable-output-escaping="yes">
           &lt;div class="intbox clearfix"&gt;
           &lt;ul class="pgwSliderNoticia"&gt;
        </xsl:text>
    </xsl:if>
    <li>
      <xsl:call-template name="linkfotomanchete_com_assunto">
        <xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
        <xsl:with-param name="link" select="$link"/>
        <xsl:with-param name="cssclass" select="'img-center'"/>
        <xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
        <xsl:with-param name="credito" select="$imagemmanchetecredito"/>
        <xsl:with-param name="assunto" select="$assunto"/>
        <xsl:with-param name="manchete" select="$manchete"/>
      </xsl:call-template>
    </li>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
            &lt;/ul&gt;
            &lt;/div&gt;
          </xsl:text>
      <script>
        $(document).ready(function () {
        $('.pgwSliderNoticia').pgwSliderNoticia({
        displayControls: true,
        maxHeight:400,
        intervalDuration : 9000
        });
        });
      </script>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>