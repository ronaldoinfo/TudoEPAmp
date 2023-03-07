<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:variable name="imagens_ep" select="xsl-extensoes:getValueAppSettings('EMC_DBImagens')" />

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

  <xsl:template name="corpo-agencia">
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
  
  <!-- Ivan: ok - bc_ep_1 -->
  <xsl:template name="bc_ep_1">
    <xsl:param name="editoria" />
    <xsl:param name="idnoticia1" />
    <xsl:param name="idnoticia2" />
    <xsl:param name="idnoticia3" />
    <script type="text/javascript" src="https://statics.tudoep.com/tudoep.v56/jquery/dist/jquery.min.js">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!--js-->]]></xsl:text>
    </script>
    <script type="text/javascript" src="/js/jpag.js">
      <xsl:text disable-output-escaping="yes"><![CDATA[<!--js-->]]></xsl:text>
    </script>
    <div class="box-especial">

      <xsl:if test="$editoria!=''">
        <xsl:for-each select="//editoria[@diretorio=$editoria]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='1'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="position()=1">
            <xsl:call-template name="bc_ep_1-item">
              <xsl:with-param name="pos" select="1"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>

        <xsl:for-each select="//editoria[@diretorio=$editoria]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='5'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="position()=1">
            <xsl:call-template name="bc_ep_1-item">
              <xsl:with-param name="pos" select="2"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>

        <xsl:for-each select="//editoria[@diretorio=$editoria]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='2'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
          <xsl:sort select="@publicacao" order="descending" />
          <xsl:if test="position()=1">
            <xsl:call-template name="bc_ep_1-item">
              <xsl:with-param name="pos" select="3"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>

      <xsl:if test="$editoria=''">
        <xsl:if test="$idnoticia1='0' and $idnoticia2='0' and $idnoticia3='0'">
          <xsl:for-each select="//editoria[@diretorio='noticias']//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='1'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="1"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="//editoria[@diretorio='noticias']//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='5'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="2"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="//editoria[@diretorio='noticias']//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1' and @idcidade='2'][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
            <xsl:sort select="@publicacao" order="descending" />
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="3"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="$idnoticia1!='0' and $idnoticia2!='0' and $idnoticia3!='0'">
          <xsl:for-each select="//noticia[@idnoticia=$idnoticia1]">
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="1"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="//noticia[@idnoticia=$idnoticia2]">
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="2"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="//noticia[@idnoticia=$idnoticia3]">
            <xsl:if test="position()=1">
              <xsl:call-template name="bc_ep_1-item">
                <xsl:with-param name="pos" select="3"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
      </xsl:if>

      <ul class="lista-especial">
        <li>
          <a href="javascript:mostraAnt(-1)">
            <figure><img class="be-anterior" src="img/anterior.jpg" alt="Anterior" /></figure>
          </a>
        </li>
        <li style="float:right;">
          <a href="javascript:mostraProx(-1)">
            <figure><img class="be-proximo" src="img/proxima.jpg" alt="Próxima" /></figure>
          </a>
        </li>
      </ul>
    </div>
  </xsl:template>

  <!-- Ivan: ok - bc_ep_1 -->
  <xsl:template name="bc_ep_1-item">
    <xsl:param name="pos"/>
    <xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
    <xsl:variable name="style">
      <xsl:if test="$pos &gt; 1">
        <xsl:value-of select="'display:none'"/>
      </xsl:if>
    </xsl:variable>
    <div id="bc_ep_1_pos-{$pos}" style="{$style}">
      <h4>
        <xsl:if test="$pos=1">
          EP Campinas
        </xsl:if>
        <xsl:if test="$pos=2">
          EP Piracicaba
        </xsl:if>
        <xsl:if test="$pos=3">
          EP Ribeirão
        </xsl:if>
      </h4>
      <xsl:call-template name="linkfotomanchete">
        <xsl:with-param name="cssclass" select="'img-center'"/>
      </xsl:call-template>
      <!--<h4>
        <xsl:call-template name="get-assunto"/>
      </h4>-->
      <h2 class="medio">
        <xsl:call-template name="linkmanchete" />
      </h2>
    </div>
  </xsl:template>

</xsl:stylesheet>