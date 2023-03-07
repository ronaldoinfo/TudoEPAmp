<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:include href="/personalizacao/xsl/xsl-funcoes/funcoes_portal.xsl"/>
  <!-- formata data -->
  <xsl:template name="formatadatapromo">
    <xsl:param name="data" />
    <xsl:value-of select="concat(substring($data,7,2),'/',substring($data,5,2),'/',substring($data,1,4))" />
  </xsl:template>

  <!-- cria link -->
  <xsl:template name="cria-link-promocao">
    <xsl:param name="conteudo" />
    <xsl:param name="id" />
    <xsl:if test="$conteudo=''">
      <xsl:call-template name="cria-url-amigavel">
        <xsl:with-param name="conteudo" select="@titulo" />
        <xsl:with-param name="id" select="@idpromocao" />
        <xsl:with-param name="prefixo" select="'PROMO,0,0,'" />
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$conteudo != ''">
      <xsl:call-template name="cria-url-amigavel">
        <xsl:with-param name="conteudo" select="$conteudo" />
        <xsl:with-param name="id" select="$id" />
        <xsl:with-param name="prefixo" select="'PROMO,0,0,'" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- monta imagem manchete -->
  <xsl:template name="imagemmanchete">
    <xsl:param name="css" />
    <xsl:param name="url" />

    <xsl:variable name="url_">
      <xsl:if test="$url=''">
        <xsl:call-template name="cria-link-promocao" />
      </xsl:if>
      <xsl:if test="$url!=''">
        <xsl:value-of select="$url"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="imagem">
      <xsl:if test="@imagem=''">
          <xsl:value-of select="'promopadrao_1.jpg'" />
      </xsl:if>
      <xsl:if test="@imagem!=''">
          <xsl:value-of select="@imagem" />
      </xsl:if>
    </xsl:variable>
    
    <xsl:variable name="nomeimagem" select="concat($imagens,'/promocao/',$imagem)" />

    <a href="{$url_}">
      <xsl:if test="$css=''">
        <img src="{$nomeimagem}" alt="{@titulo}"/>
      </xsl:if>
      <xsl:if test="$css!=''">
        <img src="{$nomeimagem}" class="{$css}" alt="{@titulo}"/>
      </xsl:if>      
    </a>
  </xsl:template>

  <!-- monta imagem destaque -->
  <xsl:template name="imagemdestaque">
    <xsl:param name="css" />
    <xsl:param name="url" />

    <xsl:variable name="url_">
      <xsl:if test="$url=''">
        <xsl:call-template name="cria-link-promocao" />
      </xsl:if>
      <xsl:if test="$url!=''">
        <xsl:value-of select="$url"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="imagem">
      <xsl:if test="@imagem=''">
          <xsl:value-of select="'promopadrao_1.jpg'" />
      </xsl:if>
      <xsl:if test="@imagem!=''">
          <xsl:value-of select="@imagem" />
      </xsl:if>
    </xsl:variable>
    
    <xsl:variable name="nomeimagem" select="concat($imagens,'/promocao/',$imagem)" />
    <xsl:variable name="src" select="concat(substring-before($nomeimagem,'_1.jpg'),'_2','.jpg')"/>

    <a href="{$url_}">
      <xsl:if test="$css=''">
        <img src="{$src}" alt="{@titulo}"/>
      </xsl:if>
      <xsl:if test="$css!=''">
        <img src="{$src}" class="{$css}" alt="{@titulo}"/>
      </xsl:if>
    </a>
  </xsl:template>

  <!-- monta imagem menor -->
  <xsl:template name="imagemmenor">
    <xsl:param name="css" />
    <xsl:param name="url" />
    
    <xsl:variable name="url_">
      <xsl:if test="$url=''">
        <xsl:call-template name="cria-link-promocao" />
      </xsl:if>
      <xsl:if test="$url!=''">
        <xsl:value-of select="$url"/>
      </xsl:if>
    </xsl:variable>
    
    <xsl:variable name="imagem">
      <xsl:if test="@imagem=''">
          <xsl:value-of select="'promopadrao_1.jpg'" />
      </xsl:if>
      <xsl:if test="@imagem!=''">
          <xsl:value-of select="@imagem" />
      </xsl:if>
    </xsl:variable>
    
    <xsl:variable name="nomeimagem" select="concat($imagens,'/promocao/',$imagem)" />

    <a href="{$url_}">
      <img src="{concat(substring-before($nomeimagem,'_1.jpg'),'_3','.jpg')}" class="{$css}" alt="{@titulo}"/>
    </a>
  </xsl:template>

  <!-- monta imagem 600 x 260 -->
  <xsl:template name="imagemgrande">
    <xsl:param name="css" />
    <xsl:param name="url" />

    <xsl:variable name="url_">
      <xsl:if test="$url=''">
        <xsl:call-template name="cria-link-promocao" />
      </xsl:if>
      <xsl:if test="$url!=''">
        <xsl:value-of select="$url"/>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="imagem">
      <xsl:if test="@imagem=''">
        <xsl:value-of select="'promopadrao_1.jpg'" />
      </xsl:if>
      <xsl:if test="@imagem!=''">
        <xsl:value-of select="@imagem" />
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="nomeimagem" select="concat($imagens,'/promocao/',$imagem)" />

    <a href="{$url_}">
      <img src="{concat(substring-before($nomeimagem,'_1.jpg'),'_1','.jpg')}" class="{$css}" alt="{@titulo}"/>
    </a>
  </xsl:template>

  <!-- monta box comum para promo -->
  <xsl:template name="Promo-Comum">
    <xsl:param name="chapeu" />
    <xsl:param name="nome-css-class" />
    <xsl:param name="position" />
    <xsl:variable name ="url_">
      <xsl:call-template name="cria-link-promocao" />
    </xsl:variable>

    <div class="{$nome-css-class}">
      <xsl:call-template name="imagemmenor">
        <xsl:with-param name="css" select="'img-center'" />
        <xsl:with-param name="url" select="$url_" />
      </xsl:call-template>      
      <h2 class="menor">
        <a href="{$url_}">
          <xsl:value-of select="@titulo"/>
        </a>
      </h2>
    </div>

    <xsl:if test="$position='ultimo'">
      <div class="clear">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!-- limpar float-->]]></xsl:text>
      </div>
    </xsl:if>
  </xsl:template>
  
  <!-- monta box comum para depoimento-->
  <xsl:template name="Promo-Depoimento">
    <xsl:if test="@foto!=''">
      <xsl:if test="contains(@foto,'vd')">
        <img src="$imagens/{@foto}" alt="Ganhador" class="img-esquerda" />
      </xsl:if>
      <xsl:if test="contains(@foto,'vd') = false">
        <img src="$imagens/promocao/participante/{@foto}" alt="Ganhador" class="img-esquerda" />
      </xsl:if>
    </xsl:if>
    <div class="txt-ganhador">
      <h2 class="medio">
        <xsl:value-of select="../@nome"/>
      </h2>
      <xsl:value-of select="@descricao"/>
      <br />
      <!--<b>Promoção: </b> <xsl:value-of select="../../../../@titulo"/>
      <br />
      <b>Prêmio: </b> <xsl:value-of select="../../@descricao"/>
      <br />
      <b>Data do sorteio: </b> 
        <xsl:call-template name="formatadatapromo">
          <xsl:with-param name="data" select="../../@datasorteio" />
      </xsl:call-template>-->
    </div>
    <xsl:if test="@galeria!='' and @video!=''">
      <div class="ch-icone">
        <xsl:if test="@galeria!=''">
          <img src="img/ico-foto.gif" alt="Galeria de Fotos" class="icones" />
          <a class="fancy" href="{@galeria}">Galeria de Fotos</a>
          <br />
        </xsl:if>
        <xsl:if test="@video!=''">
          <img src="img/ico-video.gif" alt="Vídeo" class="icones" />
          <a href="/multimidia/{@video}" target="_blank">Vídeo</a>
        </xsl:if>
      </div>
    </xsl:if>      
  </xsl:template>
  
  <!-- lista promocoes sorteadas-->
  <xsl:template name="lista-promo-sorteadas">
    <xsl:param name="dataselecionada"/>
    <xsl:param name="idpromocao"/>
    <xsl:for-each select="//premio[count(premiacao)>0][@datasorteio &gt;= xsl-extensoes:GetDateMonth()]">
      <xsl:sort select="@datasorteio" order="descending" />
      <xsl:sort select="../../@idpromocao" order="ascending" />
      <xsl:if test="position() &lt; 40">
        <xsl:variable name="datasorteio">
          <xsl:value-of select="xsl-extensoes:ExtraiData(@datasorteio)"/>
        </xsl:variable>
        <xsl:variable name="valor">
          <xsl:value-of select="concat(../../@idpromocao,'d',$datasorteio)"/>
        </xsl:variable>
        <xsl:if test="xsl-extensoes:ExisteValorSelecionado($valor)=false">
          <xsl:value-of select="xsl-extensoes:SetValorSelecionado($valor)"/>
          <xsl:if test="concat($idpromocao,'d',$dataselecionada)=$valor">
            <option value="{$valor}" selected="selected">
              <xsl:call-template name="dados-promocao"/>
            </option>
          </xsl:if>
          <xsl:if test="concat($idpromocao,'d',$dataselecionada)!=$valor">
            <option value="{$valor}">
              <xsl:call-template name="dados-promocao"/>
            </option>
          </xsl:if>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="dados-promocao">
    <xsl:call-template name="formatadatapromo">
      <xsl:with-param name="data" select="@datasorteio" />
    </xsl:call-template>
    - <xsl:value-of select="../../@titulo" />    
  </xsl:template>
  
  <!-- lista sorteados-->
  <xsl:template name="lista-sorteados">
    <xsl:param name="idpromocao"/>
    <xsl:param name="dataselecionada"/>   
    <xsl:if test="$idpromocao!=''">
      <hr />
		<h3 class="vermelho2"><strong>Confira os sorteados da promoção: </strong></h3>
      <ul class="paginando">
	  <xsl:for-each select="//promocao[@idpromocao=$idpromocao]//premio[xsl-extensoes:ExtraiData(@datasorteio)=$dataselecionada]/premiacao">
        <xsl:sort select="@nome" order="ascending"/>
        <xsl:call-template name="mostra-sorteado"/>
      </xsl:for-each>
	    </ul>
    </xsl:if>
    <xsl:if test="$idpromocao=''">
		<hr />
		<p class="vermelho2"><strong>Confira os últimos sorteados das promoções: </strong></p>
		<ul class="paginando">	
			  <xsl:for-each select="//premiacao[@datapremiacao &gt;= xsl-extensoes:GetDateMonth()]">
				<xsl:sort select="@datapremiacao" order="descending"/>
				<xsl:sort select="@nome" order="ascending"/>
				<xsl:if test="position() &lt; 50">
				  <xsl:call-template name="mostra-sorteado"/>
				</xsl:if>
			  </xsl:for-each>
	  </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template name="mostra-sorteado">
    <li>
	   <div class="title">			   
		 <h4><xsl:value-of select="@nome"/></h4>		
		</div>
		<div class="content panel">
			<div class="row">
				<div class="col-sm-9">
					<ul class=" fonte-padrao">
						<li><strong>Partipante da promoção: </strong> <span><xsl:value-of select="../../../@titulo"/></span></li>
						<li><strong>Prêmio: </strong> <span><xsl:value-of select="../@descricao"/></span></li>
						<li><strong>Sorteio realizado em: </strong> <span><xsl:call-template name="formatadatapromo">
						<xsl:with-param name="data" select="../@datasorteio" />
						</xsl:call-template></span></li>
						<li><strong>Prazo máximo para retirada do prêmio: </strong> <span> <xsl:call-template name="formatadatapromo">
						<xsl:with-param name="data" select="../@dataprazoentrega" />
					  </xsl:call-template></span></li>
						<li>
							<h5>
								 <xsl:if test="@confirmacao='False'">
								  <span class="label"><xsl:value-of select="'Aguardando'"/></span>
								</xsl:if>
								<xsl:if test="@confirmacao!='False'">
								 <span class="success label"> <xsl:value-of select="'Confirmado'"/></span>
								</xsl:if>
							</h5>
						</li>
					</ul>			
				</div>
				<div class="three columns">
					<p><a href="depoimento.aspx" ><img src="img/bt-envie-seu-depoimento.jpg" alt="Envie seu depoimento" /></a></p>
				</div>
			</div>
		</div>
	</li>   
  </xsl:template>  
</xsl:stylesheet>