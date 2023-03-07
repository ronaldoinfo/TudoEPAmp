<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:include href="funcoes_comuns.xsl"/>
  <xsl:include href="funcoes_emc.xsl"/>
  <xsl:include href="url-amigavel.xsl"/>
  <xsl:variable name="imagens" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />

  <!-- Os boxes abaixo serão mantidos no XSL por questão de compatibilidade e reaproveitamento futuro de codigo -->

  <!-- BOX Manchete Carrossel Dinâmica e Estático (antigo Araraquara) -->
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
          <xsl:call-template name="fazlink"/>
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
          <xsl:call-template name="fazlink"/>
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

  <!-- BOX MANCHETE IMAGENS ROTATIVAS ESTATICO (Compatibilidade)  -->
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
        <xsl:call-template name="fazlink"/>
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

  <!-- BOX MANCHETE IMAGENS ROTATIVAS 600  (Compatibilidade)  -->
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
        <xsl:call-template name="fazlink"/>
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

  <!-- BOX Manchete Carrossel 900px com Thumb a direita (Compatibilidade) -->
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