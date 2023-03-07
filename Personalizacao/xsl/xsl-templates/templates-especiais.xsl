<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />

  <!--  BOX DE RESULTADOS"  -->
  <!--  Ivan: ok - bc_resultado_mod1 -->
  <xsl:template name="bc_resultado_mod1">
    <xsl:param name="idpartida" />
    <xsl:param name="exibecampeonato" />
    <!--<xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/resultados/placaraovivo.ascx', 'descricao=&quot;teste 1&quot; idpartida=&quot;666&quot; link=&quot;http://&quot; ')" disable-output-escaping="yes" />-->
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/resultados/placaraovivo.ascx', concat('idpartida=&quot;',$idpartida,'&quot;',' exibecampeonato=&quot;',$exibecampeonato,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!--  Ivan: ok - bc_resultado_mod3  -->
  <xsl:template name="bc_resultado_mod3">
    <xsl:param name="idpartida" />
    <xsl:param name="tempo" />
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/resultados/Lances.ascx', concat('idpartida=&quot;',$idpartida,'&quot;',' tempo=&quot;',$tempo,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!-- Ivan: ok - BOX "FACEBOOK LIKEBOX"   -->
  <xsl:template name="bc_facebook_likebox">
    <xsl:param name="url" />

    <!-- MONTA LINK  -->
    <xsl:variable name="_link">
      <xsl:value-of select="$url" />
    </xsl:variable>
    <div class="intbox">
      <!-- CHAMA FUNCÃO QUE ESTÁ NO APP.JS  -->
      <script>
        head.ready(function () {
        $("#bc_facebook_likebox").box_facebook_likebox({
        url:"<xsl:value-of select="$_link" disable-output-escaping="yes" />"
        });
        });
      </script>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "HORÓSCOPO"   -->
  <xsl:template name="bc_horoscopo">
    <!-- MONTA IMAGENS  -->
    <div class="intbox">
      <div class="box-horoscopo clearfix">
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#aries" title="Áries">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-aries.gif" alt="Áries" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#touro" title="Touro">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-touro.gif" alt="Touro" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#gemeos" title="Gêmeos">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-gemeos.gif" alt="Gêmeos" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#cancer" title="Câncer">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-cancer.gif" alt="Câncer" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#leao" title="Leão">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-leao.gif" alt="Leão" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#virgem" title="Virgem">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-virgem.gif" alt="Virgem" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#libra" title="Libra">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-libra.gif" alt="Libra" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#escorpiao" title="Escorpião">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-escorpiao.gif" alt="Escorpião" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#capricornio" title="Capricórnio">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-capricornio.gif" alt="Capricórnio" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#aquario" title="Aquário">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-aquario.gif" alt="Aquário" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#peixes" title="Peixes">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-peixes.gif" alt="Peixes" /></figure>
        </a>
        <a class="item-horoscopo" href="/lazerecultura/horoscopo/#sagitario" title="Sagitário">
          <figure><img width="88" height="74" src="/comuns/boxes/horoscopo/icon-signsmall-sagitario.gif" alt="Sagitário" /></figure>
        </a>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "BLOGUEIROS" - REVER A UTILIZAÇÃO E VALIDADE COM O IVAN -->
  <xsl:template name="bc_blogueiros">

    <xsl:param name="nome_blog" />
    <xsl:param name="autor_blog" />
    <xsl:param name="url_imagem" />
    <xsl:param name="url_blog" />
    <xsl:param name="destaque_blog" />

    <!-- MONTA LINK IMAGEM -->
    <xsl:variable name="_url_imagem">
      <xsl:value-of select="$url_imagem" />
    </xsl:variable>

    <!-- MONTA LINK DO BLOG -->
    <xsl:variable name="_url_blog">
      <xsl:value-of select="$url_blog" />
    </xsl:variable>

    <div id="box-310" class="clearfix">
      <div class="box-cabecalho">
        <h2 class="cor-ref">Blogueiros</h2>
      </div>
      <div class="box-lista clearfix">
        <ul class="box-blogueiros">
          <li>
            <div class="img-esq">
              <a href="{$_url_blog}" target="_blank" title="{$nome_blog}">
                <figure><img src="{$_url_imagem}" alt="{$nome_blog}" /></figure>
              </a>
            </div>
            <div class="box-blogueiros-conteudo">
              <a href="{$_url_blog}" target="_blank" title="{$nome_blog}">
                <h2>{$nome_blog}</h2>
                <h3 class="cor-ref">{$autor_blog}</h3>
                <h4>{$destaque_blog}</h4>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "SELO LATERAL HOME"  -->
  <xsl:template name="bc_selo_lateral">
    <xsl:param name="titulo" />
    <xsl:param name="imagem_id" />
    <xsl:param name="descricao" />
    <xsl:param name="url" />

    <!-- TITULO  -->
    <xsl:variable name="_titulo">
      <xsl:if test="$titulo != ''">
          <xsl:text disable-output-escaping="yes">
				   &lt;div class="tit-box cor-ref"&gt;                   
          </xsl:text>
          <xsl:value-of select="$titulo"/>
          <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;                   
          </xsl:text>
      </xsl:if>      
    </xsl:variable>
   
    <div class="intbox box-destaque">
      <!-- MONTA LINK  -->
      <xsl:variable name="_link">
        <xsl:value-of select="$url"/>
      </xsl:variable>

      <!-- LINK + IMAGEM  -->
      <div class="item-thumbnail">
        <a class="img-thumb-zoom" href="{$_link}" data-track-category="Box - Especiais" data-track-event="click" data-track-label="Selo Lateral com Título">
          <figure>
            <img alt="{$titulo}" class="img-center" src="{$imagem_id}" />
          </figure>
        </a>
      </div>

      <!-- LINK + DESCRICAO  -->
      <div class="info-box">
        <h2>
          <a class="vid" href="{$_link}">
            <xsl:value-of select="$descricao"/>
          </a>
        </h2>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "SELO LATERAL HOME SEM TITULO"   -->
  <xsl:template name="bc_selo_lat_s_tit_300">
    <xsl:param name="titulo" />
    <xsl:param name="imagem_id" />
    <xsl:param name="url" />

    <article class="intbox box-destaque">
      <!-- MONTA LINK  -->
      <xsl:variable name="_link">
        <xsl:value-of select="$url"/>
      </xsl:variable>
      <!-- LINK + IMAGEM  -->
      <div class="item-thumbnail">
        <a class="img-thumb-zoom" href="{$_link}" data-track-category="Box - Especiais" data-track-event="click" data-track-label="Selo Lateral">
          <figure>
            <img alt="{$titulo}" class="img-center" src="{$imagem_id}" />
          </figure>
        </a>
      </div>
    </article>

  </xsl:template>

  <!-- Ivan: ok - BOX BOLETIM LATERAL  [Box para recebimento de boletim ]    - REVER PROGRAMAÇÃO -->
  <xsl:template name="bc_boletim_lateral">
    <div class="intbox">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h2 class="panel-title">Boletim</h2>
        </div>
        <div class="panel-body">
          <h3>
            Cadastre-se para receber nosso Boletim:
          </h3>
          <form id="email-boletim" action="comuns/boletim/procesemail.aspx" method="POST" role="form">
            <div class="form-group">
              <label for="boletimEmail">Email:</label>
              <div class="input-group">                
                <input type="email" class="form-control" id="boletimEmail" name="boletimEmail" placeholder="Digite seu Email" />
                <span class="input-group-btn">
                  <button class="btn btn-info" type="submit">Enviar</button>
                </span>
            </div>
            </div>
            <label class="radio-inline">
              <input value="S" name="boletimStatus" type="radio" checked="checked" /> Incluir
            </label>
            <label class="radio-inline">
              <input value="N" name="boletimStatus" type="radio" /> Excluir
            </label>
          </form>
        </div>
      </div>
    </div>
  </xsl:template>

  <!--  BOX "SELO LATERAL INTERATIVO JORNAL DA EPTV" - REVER A UTILIZAÇÃO E VALIDADE COM O IVAN -->
  <xsl:template name="bc_interativo_jornaldaeptv">

    <div id="box_laterais_interativo">
      <div class="intbox">
        <h2 class="mini">
          <a href="/televisao/jornaldaeptv/falecomagente.aspx">
            Reclamação, sugestão de reportagem ou qualquer outro assunto relacionado ao Jornalismo da EPTV.
          </a>
        </h2>
        <a href="/televisao/jornaldaeptv/falecomagente.aspx">
          <br />
          <figure><img src="/img/box-laterais/jornal-da-eptv.png" alt="Jornal da EPTV" align="right" class="off-img"  /></figure>
          <br />
          <figure><img src="/img/box-laterais/interativo-envie.png" alt="Envie sua mensagem" align="left" class="off-img"  /></figure>
        </a>
      </div>
    </div>

  </xsl:template>

  <!--  BOX "HTML" -->
  <xsl:template name="bc_html">
    <xsl:param name="codigo" />
    <div class="intbox clearfix">
      <xsl:value-of select="$codigo" />
    </div>
  </xsl:template>

  <!--  BOX "RSS" G1 ou outro passado na URL  - REVER A UTILIZAÇÃO E VALIDADE COM O IVAN -->
  <xsl:template name="bc_rssSimples">
    <xsl:param name="url" />
    <xsl:param name="quantidade" />
    <xsl:param name="categ" />
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/rss/ucRssSimples.ascx', concat('url=&quot;',$url,'&quot;',' quantidade=&quot;',$quantidade,'&quot;',' categoria=&quot;',$categ,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <xsl:template name="bc_rss">
    <xsl:param name="url" />
    <xsl:param name="quantidade" />
    <xsl:param name="categ" />
    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/rss/ucRss.ascx', concat('url=&quot;',$url,'&quot;',' quantidade=&quot;',$quantidade,'&quot;',' categoria=&quot;',$categ,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>

  <!--  BOX "RSS" G1 300, aparece somente uma div por vez - REVER A UTILIZAÇÃO E VALIDADE COM O IVAN -->
  <xsl:template name="bc_rss_300">
    <xsl:param name="url" />
    <xsl:param name="quantidade" />
    <xsl:param name="categ" />

    <xsl:param name="url2" />
    <xsl:param name="quantidade2" />
    <xsl:param name="categ2" />

    <xsl:param name="url3" />
    <xsl:param name="quantidade3" />
    <xsl:param name="categ3" />

    <xsl:param name="url4" />
    <xsl:param name="quantidade4" />
    <xsl:param name="categ4" />

    <xsl:param name="url5" />
    <xsl:param name="quantidade5" />
    <xsl:param name="categ5" />

    <xsl:param name="url6" />
    <xsl:param name="quantidade6" />
    <xsl:param name="categ6" />

    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/rss/ucRss_300.ascx', concat('url=&quot;',$url,'&quot;',' quantidade=&quot;',$quantidade,'&quot;',' categoria=&quot;',$categ,'&quot;',' url2=&quot;',$url2,'&quot;',' quantidade2=&quot;',$quantidade2,'&quot;',' categoria2=&quot;',$categ2,'&quot;',' url3=&quot;',$url3,'&quot;',' quantidade3=&quot;',$quantidade3,'&quot;',' categoria3=&quot;',$categ3,'&quot;',' url4=&quot;',$url4,'&quot;',' quantidade4=&quot;',$quantidade4,'&quot;',' categoria4=&quot;',$categ4,'&quot;',' url5=&quot;',$url5,'&quot;',' quantidade5=&quot;',$quantidade5,'&quot;',' categoria5=&quot;',$categ5,'&quot;',' url6=&quot;',$url6,'&quot;',' quantidade6=&quot;',$quantidade6,'&quot;',' categoria6=&quot;',$categ6,'&quot;'))" disable-output-escaping="yes" />

  </xsl:template>

  <!--  BOX "RSS" G1 600 c/ 6 abas sendo uma para cada RSS - REVER A UTILIZAÇÃO E VALIDADE COM O IVAN -->
  <!--
  G1 Araraquara => http://g1.globo.com/dynamo/sp/araraquara-regiao/rss2.xml
  G1 Campinas => http://g1.globo.com/dynamo/sp/campinas-regiao/rss2.xml
  G1 Piracicaba => http://g1.globo.com/dynamo/sp/piracicaba-regiao/rss2.xml
  G1 RIbeirao-Franca => http://g1.globo.com/dynamo/sp/ribeirao-preto-franca/rss2.xml
  G1 Sao Carlos => http://g1.globo.com/dynamo/sp/sao-carlos-regiao/rss2.xml
  G1 Sul de Minas => http://g1.globo.com/dynamo/mg/sul-de-minas/rss2.xml 
  -->
  <xsl:template name="bc_rss_600_Abas">
    <xsl:param name="url" />
    <xsl:param name="quantidade" />
    <xsl:param name="categ" />

    <xsl:param name="url2" />
    <xsl:param name="quantidade2" />
    <xsl:param name="categ2" />

    <xsl:param name="url3" />
    <xsl:param name="quantidade3" />
    <xsl:param name="categ3" />

    <xsl:param name="url4" />
    <xsl:param name="quantidade4" />
    <xsl:param name="categ4" />

    <xsl:param name="url5" />
    <xsl:param name="quantidade5" />
    <xsl:param name="categ5" />

    <xsl:param name="url6" />
    <xsl:param name="quantidade6" />
    <xsl:param name="categ6" />

    <xsl:value-of select="xsl-extensoes:CarregarUserControl('~/comuns/rss/ucRss_600.ascx', concat('url=&quot;',$url,'&quot;',' quantidade=&quot;',$quantidade,'&quot;',' categoria=&quot;',$categ,'&quot;',' url2=&quot;',$url2,'&quot;',' quantidade2=&quot;',$quantidade2,'&quot;',' categoria2=&quot;',$categ2,'&quot;',' url3=&quot;',$url3,'&quot;',' quantidade3=&quot;',$quantidade3,'&quot;',' categoria3=&quot;',$categ3,'&quot;',' url4=&quot;',$url4,'&quot;',' quantidade4=&quot;',$quantidade4,'&quot;',' categoria4=&quot;',$categ4,'&quot;',' url5=&quot;',$url5,'&quot;',' quantidade5=&quot;',$quantidade5,'&quot;',' categoria5=&quot;',$categ5,'&quot;',' url6=&quot;',$url6,'&quot;',' quantidade6=&quot;',$quantidade6,'&quot;',' categoria6=&quot;',$categ6,'&quot;'))" disable-output-escaping="yes" />
  </xsl:template>
  
  <!--  BOX - SEPARADOR LINHA BOX -->
  <xsl:template name="bc_separador_linha">
	<hr />
  </xsl:template>

  <!-- Ivan: ok - DESTAQUE ESPECIAL PUBLICITÁRIO -->
  <xsl:template name="bc_destaque_informepublicitario">
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
      <div class="materia-assunto" itemprop="about">
        <span>
          Especial Publicitário
        </span>
      </div>
      <div class="info-box">
        <h2 itemprop="name">
          
            <xsl:call-template name="linkmanchete">
              <xsl:with-param name="conteudo" select="$manchete"/>
              <xsl:with-param name="link" select="$link"/>
            </xsl:call-template>
         
        </h2>
      </div>
    </article>
  </xsl:template>

  <!--  BOX - TÍTULO DA LINHA -->
  <xsl:template name="bc_titulo_linha">
    <xsl:param name="titulo_linha" />
    <div class="text-center">
      <div class="tit-box">
        <xsl:value-of select="$titulo_linha"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="bc_colunistas_acidadeon">
	
	
    <xsl:param name="chapeu"></xsl:param>
    <xsl:param name="imagem_id"></xsl:param>
    <xsl:param name="url"></xsl:param>
    <xsl:param name="manchete"></xsl:param>
    <xsl:param name="position" />

	<xsl:if test="$position='1'">
		<xsl:text disable-output-escaping="yes">
		&lt;a href="http://blogs.acidadeon.com/"&gt;
			&lt;img src="/img/tit/tit-OnBlog.png" alt="OnBlog" class="tit-box-blog" /&gt;
		&lt;/a&gt;
		</xsl:text>
	</xsl:if>
	
    <div class="col-sm-3">
      <a href="{$url}">
        <img src="{$imagem_id}" alt="{$chapeu}"/>
      </a>
      <strong>
        <a href="{$url}">
          <xsl:value-of select="$chapeu" />
        </a>
      </strong>
      <span>
        <a href="{$url}">
          <xsl:value-of select="$manchete" />
        </a>
      </span>
    </div>

  </xsl:template>

</xsl:stylesheet>