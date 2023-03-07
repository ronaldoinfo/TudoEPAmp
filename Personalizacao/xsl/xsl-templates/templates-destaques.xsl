<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Ivan: ok - DESTAQUE_A - Assunto + Manchete + Foto destaque -->
  <xsl:template name="bc_destaque_a">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
       <div class="box300-cont">
		<div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select='translate($assunto, $quot, $apos)'/>
            </xsl:call-template>
          </span>
        </div>
      <div class="info-box">
        <h2>
          <xsl:call-template name="linkmanchete">
            <xsl:with-param name="conteudo" select='translate($manchete, $quot, $apos)'/>
            <xsl:with-param name="link" select="$link"/>
          </xsl:call-template>
        </h2>
      </div>
	  </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_B - Manchete + Foto  destaque pequena -->
  <xsl:template name="bc_destaque_b">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_C - Assunto + Manchete + Foto destaque pequena -->
  <xsl:template name="bc_destaque_c">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-destaque clearfix">
      <div class="materia-assunto">
        <span>
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
      </div>
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
    </article>

  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_D - Assunto + Manchete -->
  <xsl:template name="bc_destaque_d">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-destaque clearfix">
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
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_E - Dois box contendo Assunto + Manchete -->
  <xsl:template name="bc_destaque_e">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
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
      <article class="intbox box-destaque clearfix">
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
        </div>
      </article>
    </div>
   <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_F - Dois box contendo Manchete + Foto destaque -->
  <xsl:template name="bc_destaque_f">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_G - Dois Box contendo Assunto + Manchete + Foto Destaque -->
  <xsl:template name="bc_destaque_g">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
      <article class="intbox box-destaque clearfix">
        <div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="$assunto"/>
            </xsl:call-template>
          </span>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
      </article>
    </div>

    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_H - Dois box contendo Manchete + Foto Destaque pequena -->
  <xsl:template name="bc_destaque_h">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>

    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>

    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
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
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_I - Dois box contendo Assunto + Manchete + Foto destaque - IDENTICO AO G -->
  <xsl:template name="bc_destaque_i">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
		
		<div class="box-bc_destaque_i">
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

  <!--  DESTAQUE_J - Três box contendo Assunto + Manchete + Foto destaque pequena -->
  <xsl:template name="bc_destaque_j">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
    <div class="col-xs-4 col-sm-12 col-md-4">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="tamanho" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
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
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_K - [4 fotos] + [4 destaques (abaixo de cada foto) ] -->
  <xsl:template name="bc_destaque_k">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
    <div class="col-sm-3">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_L - Dois Box contendo Manchete + Foto Destaque -->
  <xsl:template name="bc_destaque_l">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_M - Três box contendo Manchete + Foto destaque pequena -->
  <xsl:template name="bc_destaque_m">
    <xsl:param name="manchete" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
    <div class="col-xs-4 col-sm-12 col-md-4">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="tamanho" select="'pq'"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_N   -->
  <xsl:template name="bc_destaque_n">
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
    <div class="col-sm-3">
      <article class="intbox box-destaque clearfix">
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
  
<!-- Ivan: ok - DESTAQUE_N SEM ASSUNTO  -->
  <xsl:template name="bc_destaque_n_sem_assunto">
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
    <div class="col-sm-3">
      <article class="intbox box-destaque clearfix">
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
  
  

  <!-- Ivan: ok - DESTAQUE_O -->
  <xsl:template name="bc_destaque_o">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />

    <article class="intbox box-destaque clearfix">
      <div class="materia-assunto">
        <span>
          <xsl:call-template name="get-assunto">
            <xsl:with-param name="conteudo" select="$assunto"/>
          </xsl:call-template>
        </span>
      </div>
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
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
    </article>

  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_P -->
  <xsl:template name="bc_destaque_p">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />

    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
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
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_Q -->
  <xsl:template name="bc_destaque_q">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />

    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="tamanho" select="'pq'"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
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
      </div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_R  -->
  <xsl:template name="bc_destaque_r">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-sm-3">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-left'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
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
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_R - [4 fotos] + [4 assuntos + destaques (abaixo de cada foto) ] - IGUAL AO R -->
  <xsl:template name="bc_destaque_r_640">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
    <div class="col-sm-3">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'img-center'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
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
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_S - [2 fotos] + [2 assuntos] + [2 manchetes/destaque] -->
  <xsl:template name="bc_destaque_s">
    <xsl:param name="manchete" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
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
    <div class="col-sm-6">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail-float">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'esq md10'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
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
        </div>
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>
 
<!-- Ivan: ok - DESTAQUE_T - Manchete + Foto destaque --> 
  <xsl:template name="bc_destaque_t">
    <xsl:param name="manchete" />    
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />

    <xsl:param name="apos">'</xsl:param>
    <xsl:param name="quot">"</xsl:param>
	
    <xsl:call-template name="titulo-vceptv">
      <xsl:with-param name="vceptv_nome" select="$vceptv_nome" />
      <xsl:with-param name="vceptv_cidade" select="$vceptv_cidade" />
    </xsl:call-template>
    <article class="intbox box-destaque clearfix">
      <div class="item-thumbnail-float">
        <xsl:call-template name="linkfotodestaque">
          <xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="cssclass" select="'img-left'"/>
          <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
          <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
        </xsl:call-template>
      </div>
       <div class="box300-cont">		
		<div class="info-box">
			<h2>
				<xsl:call-template name="linkmanchete">
				<xsl:with-param name="conteudo" select='translate($manchete, $quot, $apos)'/>
				<xsl:with-param name="link" select="$link"/>
				</xsl:call-template>
			</h2>
		</div>
		</div>
    </article>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_U - [2 fotos] + [2 assuntos] + [2 manchetes + destaque] -->
  <xsl:template name="bc_destaque_u">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-xs-6">
      <article class="intbox box-destaque clearfix">
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'esq md10'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
        </div>
        <div class="info-box">
          <div class="materia-assunto">
            <span>
              <xsl:call-template name="get-assunto">
                <xsl:with-param name="conteudo" select="$assunto"/>
              </xsl:call-template>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE_V - assunto + foto + destaque + manchete -->
  <xsl:template name="bc_destaque_v">
    <xsl:param name="manchete" />
    <xsl:param name="destaque" />
    <xsl:param name="assunto" />
    <xsl:param name="link" />
    <xsl:param name="imagemdestaque" />
    <xsl:param name="imagemdestaquelegenda" />
    <xsl:param name="imagemdestaquecredito" />
    <xsl:param name="position" />
    <xsl:param name="vceptv_nome" />
    <xsl:param name="vceptv_cidade" />    
    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-xs-6">
      <article class="intbox box-destaque clearfix">
        <div class="materia-assunto">
          <span>
            <xsl:call-template name="get-assunto">
              <xsl:with-param name="conteudo" select="$assunto"/>
            </xsl:call-template>
          </span>
        </div>
        <div class="item-thumbnail">
          <xsl:call-template name="linkfotodestaque">
            <xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
            <xsl:with-param name="link" select="$link"/>
            <xsl:with-param name="cssclass" select="'esq md10'"/>
            <xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
            <xsl:with-param name="credito" select="$imagemdestaquecredito"/>
          </xsl:call-template>
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
      </article>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>