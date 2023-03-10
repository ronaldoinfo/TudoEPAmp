<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTA_A - Assunto + Manchete -->
  <xsl:template name="bc_nota_a">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
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
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_B - Manchete -->
  <xsl:template name="bc_nota_b">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_C - Manchete -->
  <xsl:template name="bc_nota_c">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <div class="info-box">
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
        <h3>
          <xsl:call-template name="linkdestaque">
            <xsl:with-param name="conteudo" select="$destaque"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h3>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_D - Data publica????o + manchete -->
  <xsl:template name="bc_nota_d">
    <xsl:param name="datapublicacao" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <div class="info-box">
          <div class="data-nota">
            <time class="data" itemprop="datePublished" datetime="{@publicacao}">
              <xsl:call-template name="formatadata-extenso">
                <xsl:with-param name="data" select="@publicacao">
                </xsl:with-param>
              </xsl:call-template>
            </time>
            <br />
            <time class="hora" itemprop="datePublished" datetime="{@publicacao}">
              <xsl:call-template name="formatahora-extenso">
                <xsl:with-param name="data" select="@publicacao">
                </xsl:with-param>
              </xsl:call-template>
            </time>
          </div>
          <h2>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_E -->
  <xsl:template name="bc_nota_e">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <h2>
          <span class="list-style-type">
            <i class="fa fa-fw fa-stop">
              <xsl:comment></xsl:comment>
            </i>
          </span>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_F -->
  <xsl:template name="bc_nota_f">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <h2>
          <span class="list-style-type">
            <i class="fa fa-fw fa-circle">
              <xsl:comment></xsl:comment>
            </i>
          </span>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_G -->
  <xsl:template name="bc_nota_g">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <h2>          
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="$manchete"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_H -->
  <xsl:template name="bc_nota_h">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="position" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <h2>
           <span class="list-style-type">
            <i class="fa fa-fw fa-stop">
              <xsl:comment></xsl:comment>
            </i>
          </span>
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
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_I_310 - 3 Assuntos + Manchetes -->
  <xsl:template name="bc_nota_i">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
            </xsl:call-template>
          </span>
        </div>
        <h2>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </article>
    </div>
  </xsl:template>

  <!-- NOTA_J_310 - 3 Assuntos + Manchetes -->
  <xsl:template name="bc_nota_j">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
        <div class="info-box">
          <h2>
            <time class="hora" itemprop="datePublished" datetime="{@publicacao}">
              <span class="label label-default">
                <xsl:call-template name="formatahora-extenso">
                  <xsl:with-param name="data" select="@publicacao">
                  </xsl:with-param>
                </xsl:call-template>
              </span>
            </time>
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
          </h2>
        </div>
      </article>
    </div>
  </xsl:template>

  <!--Vers??o dos boxes em AMP 2023 -->
	<!--P??gina para valida????es AMP https://search.google.com/test/rich-results-->
  <xsl:template name="bc_amp_nota_a">
    <xsl:param name="assunto" />
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:param name="position" />
    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <div class="intbox box-notas clearfix">
      <article class="box-notas-item">
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
      </article>
    </div>
  </xsl:template>

</xsl:stylesheet>