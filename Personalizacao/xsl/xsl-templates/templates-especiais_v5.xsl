<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
	<xsl:key name="todas" match="/" use="todas" />
	<xsl:variable name="prefixo" select="xsl-extensoes:getValueAppSettings('PrefixoSite')" />


	<xsl:template name="bc_youtube_embeed_v55">
		<xsl:param name="link" />
		<xsl:param name="manchete" />
		<xsl:param name="altura" />
		<xsl:param name="largura" />
		<xsl:param name="urlmanchete" />
		<div class="container-iframe" style="margin-top: -10px;margin-bottom: 10px;">
			<iframe class="responsive-iframe" width="{$largura}" height="{$altura}" src="{$link}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="1">
				<span class="d-none"></span>
			</iframe>
			<h4>
				<span class="no-margin-top">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="$manchete"/>
						<xsl:with-param name="link" select="$urlmanchete"/>
					</xsl:call-template>
				</span>
			</h4>
		</div>
	</xsl:template>

	<!-- Ivan: ok - BOX "HORÓSCOPO"   -->
	<xsl:template name="bc_horoscopo">
		<!-- MONTA IMAGENS  -->
		<div class="intbox" id="bc_horoscopo">
			<div class="box-horoscopo clearfix">
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#aries" title="Áries">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-aries.gif" alt="Áries" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#touro" title="Touro">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-touro.gif" alt="Touro" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#gemeos" title="Gêmeos">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-gemeos.gif" alt="Gêmeos" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#cancer" title="Câncer">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-cancer.gif" alt="Câncer" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#leao" title="Leão">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-leao.gif" alt="Leão" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#virgem" title="Virgem">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-virgem.gif" alt="Virgem" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#libra" title="Libra">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-libra.gif" alt="Libra" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#escorpiao" title="Escorpião">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-escorpiao.gif" alt="Escorpião" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#capricornio" title="Capricórnio">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-capricornio.gif" alt="Capricórnio" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#aquario" title="Aquário">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-aquario.gif" alt="Aquário" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#peixes" title="Peixes">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-peixes.gif" alt="Peixes" />
					</figure>
				</a>
				<a class="item-horoscopo" href="{$prefixo}/lazerecultura/horoscopo/#sagitario" title="Sagitário">
					<figure>
						<img width="88" height="74" src="{$prefixo}/comuns/boxes/horoscopo/icon-signsmall-sagitario.gif" alt="Sagitário" />
					</figure>
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

		<div id="box-310" class="clearfix bc_blogueiros">
			<div class="box-cabecalho">
				<h2 class="cor-ref">Blogueiros</h2>
			</div>
			<div class="box-lista clearfix">
				<ul class="box-blogueiros">
					<li>
						<div class="img-esq">
							<a href="{$_url_blog}" target="_blank" title="{$nome_blog}">
								<figure>
									<img src="{$_url_imagem}" alt="{$nome_blog}" />
								</figure>
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

	<xsl:template name="bc_colunistas_acidadeon">
		<xsl:param name="chapeu"></xsl:param>
		<xsl:param name="imagem_id"></xsl:param>
		<xsl:param name="url"></xsl:param>
		<xsl:param name="idsecao"></xsl:param>
		<xsl:param name="position" />
		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
        &lt;h4 class="card-header no-padding-right"&gt;Colunistas e blog
          &lt;a href="/blogs/" class="link link-access right pt-10">Ver todos&lt;/a&gt;
        &lt;/h4&gt;
        &lt;div class="col-lg-12 no-padding float-left carel-ts"&gt;
        &lt;div class="slider-column col-12 no-padding-left"&gt;
        &lt;div class="carousel-column col-lg-12 no-padding"&gt;
		</xsl:text>
		</xsl:if>
		<div class="bc_colunistas_acidadeon">
			<a href="{$url}">
				<figure class="col-lg-4 float-left no-padding-left">
					<img src="{$imagem_id}" alt="{$chapeu}"/>
				</figure>
			</a>
			<div class="column col-lg-8 float-left columnist">
				<a href="{$url}">
					<div class="caption">
						<b>
							<xsl:value-of select="$chapeu" />
						</b>
					</div>
				</a>
				<p>
					<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)&#xA;" />
						<xsl:if test="position()=1">
							<xsl:call-template name="linkmanchete">
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
				</p>
			</div>
		</div>
		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">
        &lt;/div&gt;
        &lt;div class="ctrl-buttons"&gt;
        &lt;button type="button" class="bt-prev"&gt;&lt;i class="fa fa-chevron-left"&gt;&lt;/i&gt;&lt;/button&gt;
        &lt;button type="button" class="bt-next"&gt;&lt;i class="fa fa-chevron-right"&gt;&lt;/i&gt;&lt;/button&gt;
        &lt;/div&gt;
        &lt;/div&gt;
        &lt;/div&gt;
		</xsl:text>
		</xsl:if>
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
				   &lt;div class="tit-box cor-ref" id="bc_selo_lateral" &gt;                   
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

		<article class="intbox box-destaque" id="bc_selo_lat_s_tit_300">
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

	<!--  BOX - SEPARADOR LINHA BOX -->
	<xsl:template name="bc_separador_linha">
		<hr class="bc_separador_linha" />
	</xsl:template>

	<!-- Ivan: ok - DESTAQUE ESPECIAL PUBLICITÁRIO -->
	<xsl:template name="bc_destaque_informepublicitario">
		<xsl:param name="manchete" />
		<xsl:param name="assunto" />
		<xsl:param name="link" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="imagemdestaquelegenda" />
		<xsl:param name="imagemdestaquecredito" />

		<article class="intbox box-destaque clearfix" id="bc_destaque_informepublicitario">

			<div class="col-6 col-sm-6 pull-left">
				<div class="destaque-item-imagem">
					<xsl:call-template name="linkfotodestaque">
						<xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
						<xsl:with-param name="tamanho" select="'150'"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="cssclass" select="'img-left'"/>
						<xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
						<xsl:with-param name="credito" select="$imagemdestaquecredito"/>
					</xsl:call-template>
				</div>
			</div>

			<div class="col-6 col-sm-6 pull-right">
				<span class="tag">Especial Publicitário</span>
				<h5 class="informepublicitariotitle">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="$manchete"/>
						<xsl:with-param name="link" select="$link"/>
					</xsl:call-template>
				</h5>
			</div>

		</article>
	</xsl:template>

	<!--  BOX - TÍTULO DA LINHA -->
	<xsl:template name="bc_titulo_linha">
		<xsl:param name="titulo_linha" />
		<xsl:param name="urleditoria" />
		<div class="d-block w-100 mb-4 position-relative">
			<div class="head-dash">
				<h2 class="cabecalho2 fw-bolder mb-0 pb-2" style="font-size: clamp(.5rem, 3.2rem + -0.2vw, 2.25rem);">
					<xsl:choose>
						<xsl:when test="$urleditoria != ''">
							<a class="head-link d-flex align-items-center" href="{$urleditoria}">
								<svg class="img-fluid me-1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="95" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 342 120" style="enable-background:new 0 0 342 120;" xml:space="preserve">
                    <g>
                        <path fill="currentColor" d="M274.4,95c-11.5,0-23.1,0-34.6,0c-8,0-15.1-2.7-21.2-7.8c-5.9-5-9.4-11.4-11-18.9c-1.4-6.6-1.2-13.1,0.8-19.5   c3.8-12.1,11.9-19.8,24.3-22.8c2.6-0.6,5.2-0.9,7.8-0.9c22.6,0,45.2,0,67.8,0c10.9,0,19.8,4.3,26.6,12.9c3.6,4.6,5.7,10,6.6,15.8   c1,5.8,0.6,11.6-1,17.3c-2.3,8.1-7,14.5-14.2,18.9c-5.7,3.5-11.9,5.1-18.6,5.1C296.7,94.9,285.6,95,274.4,95z M322.5,60.3   c0.1-5.3-1.7-9.5-5.8-12.7c-3-2.4-6.6-3.2-10.4-3.3s-7.4,0.7-10.5,2.9c-5,3.6-7,8.7-6.4,14.7c0.6,5.6,3.5,9.8,8.8,12.2   c3.2,1.5,6.6,1.7,10.1,1.4C316.3,74.9,322.8,68.5,322.5,60.3z"></path>
                        <path d="M178.5,90.3c-0.6,0.4-0.9,0.6-1.3,0.9c-13.5,10-33,7.1-43-6.4c-4.2-5.8-6.7-12.2-7.4-19.3c-1-8.6,0-17,3.9-24.8   c5.2-10.3,13.4-16.5,25.1-17.8c6.5-0.7,12.7,0.3,18.4,3.6c1.4,0.8,2.7,1.8,4.3,2.8c0.1-0.7,0.1-1.3,0.1-1.9c0-5.8,0-11.5,0-17.3   c0-0.7,0-1.4,0.1-2.1c0.1-1.1,0.7-2,1.8-2.4c4.8-1.8,9.7-3.6,14.5-5.4c2.3-0.8,3.9,0.4,4,2.8c0,0.5,0,1,0,1.5c0,28.6,0,57.3,0,85.9   c0,0.5,0,1,0,1.5c0,2.1-1,3.1-3,3.1c-4.7,0-9.4,0-14.1,0c-2.1,0-3-0.9-3.2-3C178.6,91.5,178.6,91,178.5,90.3z M178.6,59.9   c0-3.2,0-6.4,0-9.6c0-0.9-0.2-1.7-0.9-2.3c-2.8-3-6.1-5.1-10.2-6c-6.9-1.5-13.9,1.3-17.4,7.3c-3,5.1-3.4,10.7-2,16.4   c1.1,4.2,3.3,7.7,7.2,9.9c7.1,4.1,16.5,2.7,22.6-4.4c0.4-0.5,0.6-1.3,0.6-1.9C178.7,66.2,178.6,63.1,178.6,59.9z"></path>
                        <path d="M99.3,90.1c-2.1,1.4-3.9,2.9-5.9,3.9c-10,5-19.9,4.6-29.1-1.8c-5.9-4.1-8.9-10.1-9.7-17.2c-0.2-1.5-0.2-3-0.2-4.5   c0-13.8,0-27.6,0-41.4c0-0.6,0-1.2,0.1-1.8c0.2-1.4,1.1-2.2,2.5-2.2c5.1,0,10.1,0,15.2,0c1.5,0,2.4,1,2.5,2.5c0,0.5,0,1,0,1.5   c0,12,0,24.1,0,36.1c0,1.7,0.1,3.5,0.5,5.1c1.2,5.1,5.4,8.2,10.9,8.3c5.2,0,9.2-2.3,12.4-6.3c0.4-0.6,0.5-1.5,0.5-2.3   c0-13.5,0.1-26.9,0-40.4c0-3.3,0.4-4.8,4.7-4.7c4.1,0.2,8.3,0,12.4,0c2.4,0,3.3,0.9,3.3,3.3c0,21.1,0,42.3,0,63.4   c0,2.3-0.9,3.2-3.2,3.2c-4.6,0-9.1,0-13.7,0c-2.2,0-3.1-0.9-3.2-3.1C99.3,91.3,99.3,90.8,99.3,90.1z"></path>
                        <path d="M32.2,41.8c0,0.8,0,1.3,0,1.8c0,8.6,0,17.2,0,25.8c0,1.3,0.1,2.7,0.5,4c0.9,3.1,3.7,5.1,7.2,5.3c1.5,0.1,3,0,4.5-0.1   c2.1-0.1,3.2,0.8,3.2,2.8c0,3.9,0,7.8,0,11.7c0,1.7-0.7,2.6-2.3,2.9c-6.6,1.3-13.2,1.7-19.8-0.5c-7.2-2.5-11.5-7.6-13.1-15   c-0.5-2.2-0.6-4.4-0.6-6.6c-0.1-10.1,0-20.1,0-30.2c0-1.9,0-1.9-1.9-1.9c-2.2,0-4.5,0-6.7,0S0,40.8,0,38.7c0-3.5,0-7,0-10.5   C0.1,25.9,1,25,3.3,25c2.5,0,5.1,0,7.6,0c1.7,0,1.7,0,1.7-1.7c0-4.7,0-9.4,0-14.1c0-2.7,0.3-3.2,2.8-4.1c4.1-1.6,8.2-3.1,12.4-4.6   c0.3-0.1,0.6-0.2,0.9-0.3c2-0.5,3.5,0.6,3.5,2.7c0,3.4,0,6.8,0,10.2c0,3.5,0,7,0,10.5c0,1.5,0,1.5,1.5,1.5c3.6,0,7.2,0,10.8,0   c2.3,0,3.2,0.9,3.2,3.2c0,3.4,0,6.9,0,10.3c0,2.4-1,3.3-3.3,3.3c-3.4,0-6.9,0-10.3,0C33.5,41.8,33,41.8,32.2,41.8z"></path>
                    </g>
                </svg>
								<span class="text-lowercase mb-2">
									<xsl:value-of select="$titulo_linha"/>
								</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$titulo_linha"/>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
			</div>
		</div>
	</xsl:template>

	<!-- BOX "PARTICIPE "  -->
	<xsl:template name="bc_participe_acidade">
		<xsl:param name="urlimagens" />
		<div class="intbox">
			<div class="box-participe">
				<div class="col-12">
					<div class="row">

						<div class="col-12 col-md-6">
							<div class="row">
								<img src="/img/modelo/img-box2.jpg" alt="Box Participe" class="imagem-participe img-fluid" />
							</div>

							<div class="row">
								<div class="btn-group text-center" role="group" aria-label="Default button group">
									<a href="https://www.tudoep.com/institucional/empresa/facebook.aspx">
										<button type="button" class="btn btn-secondary botao-participe icon-participe">
											<span class="fa fa-2x  fa-facebook"></span>
										</button>
									</a>
									<a href="https://www.instagram.com/acidadeon/">
										<button type="button" class="btn btn-secondary botao-participe icon-participe">
											<span class="fa fa-2x fa-instagram"></span>
										</button>
									</a>
									<a href="https://twitter.com/acidadeon">
										<button type="button" class="btn btn-secondary botao-participe icon-participe">
											<span class="fa fa-2x fa-twitter-square"></span>
										</button>
									</a>
								</div>
							</div>
						</div>

						<div class="col-12 col-md-6">
							<div class="row card-participe-1">
								<a href="faleconosco/">
									<img src="/img/modelo/faleconosco1.png" alt="Fale Conosco" class="imagem-participe img-fluid" />
								</a>
							</div>
							<div class="row card-participe-1">
								<img src="{$urlimagens}" alt="Fale Conosco" class="imagem-participe img-fluid" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- DESTAQUE PUBLIEDITORIAL -->
	<xsl:template name="bc_destaque_publieditorial">
		<xsl:param name="manchete" />
		<xsl:param name="assunto" />
		<xsl:param name="link" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="imagemdestaquelegenda" />
		<xsl:param name="imagemdestaquecredito" />

		<div id="bc_destaque_publieditorial">
			<figure class="col-lg-5 col-sm-3 col-3 publieditorial-img">
				<xsl:call-template name="get-foto">
					<xsl:with-param name="arquivoimagem" select="$imagemdestaque"/>
					<xsl:with-param name="legenda" select="$imagemdestaquelegenda"/>
					<xsl:with-param name="credito" select="$imagemdestaquecredito"/>
				</xsl:call-template>
			</figure>
			<figcaption class="col-lg-7 col-sm-8 col-9 publieditorial-headline">
				<label class="tag">Publieditorial</label>
				<xsl:call-template name="linkmanchete">
					<xsl:with-param name="conteudo" select="$manchete"/>
					<xsl:with-param name="link" select="$link"/>
				</xsl:call-template>
			</figcaption>
		</div>

	</xsl:template>

	<xsl:template name="bc_ultimas_noticias_editorias_dinamico">
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="idsecaoaba2" />
		<xsl:param name="quantidadeaba2" />
		<xsl:param name="idsecaoaba3" />
		<xsl:param name="quantidadeaba3" />
		<xsl:param name="idsecaoaba4" />
		<xsl:param name="quantidadeaba4" />
		<xsl:param name="idsecaoaba5" />
		<xsl:param name="quantidadeaba5" />
		<xsl:param name="idsecaoaba6" />
		<xsl:param name="quantidadeaba6" />

		<xsl:variable name="NomeAba1">
			<xsl:value-of select="//*[@idsecao=$idsecao]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="NomeAba2">
			<xsl:value-of select="//*[@idsecao=$idsecaoaba2]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="NomeAba3">
			<xsl:value-of select="//*[@idsecao=$idsecaoaba3]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="NomeAba4">
			<xsl:value-of select="//*[@idsecao=$idsecaoaba4]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="NomeAba5">
			<xsl:value-of select="//*[@idsecao=$idsecaoaba5]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="NomeAba6">
			<xsl:value-of select="//*[@idsecao=$idsecaoaba6]//@nomesecao" />
		</xsl:variable>
		<xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />

		<div id="BoxEditoriais">
			<div class="full h4 card-header no-padding-right no-margin-bottom no-padding-bottom">
				editorias
				<div class="right mobile-nav-scroll no-padding">
					<ul class="nav nav-pills">
						<xsl:if test="$idsecao != ''">
							<xsl:if test="count(//*[@idsecao=$idsecao]//noticia)>0  and (//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba1" data-toggle="pill" class="link nav-link active show">
										<xsl:value-of select="$NomeAba1"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$idsecaoaba2 != ''">
							<xsl:if test="count(//*[@idsecao=$idsecaoaba2]//noticia)>0 and (//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba2" data-toggle="pill" class="link nav-link">
										<xsl:value-of select="$NomeAba2"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$idsecaoaba3 != ''">
							<xsl:if test="count(//*[@idsecao=$idsecaoaba3]//noticia)>0 and (//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba3" data-toggle="pill" class="link nav-link">
										<xsl:value-of select="$NomeAba3"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$idsecaoaba4 != ''">
							<xsl:if test="count(//*[@idsecao=$idsecaoaba4]//noticia)>0 and (//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba4" data-toggle="pill" class="link nav-link">
										<xsl:value-of select="$NomeAba4"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$idsecaoaba5 != ''">
							<xsl:if test="count(//*[@idsecao=$idsecaoaba5]//noticia)>0 and (//*[@idsecao=$idsecaoaba5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba5" data-toggle="pill" class="link nav-link">
										<xsl:value-of select="$NomeAba5"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$idsecaoaba6 != ''">
							<xsl:if test="count(//*[@idsecao=$idsecaoaba6]//noticia)>0 and (//*[@idsecao=$idsecaoaba6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<li class="nav-item">
									<a href="#NomeAba6" data-toggle="pill" class="link nav-link">
										<xsl:value-of select="$NomeAba6"/>
									</a>
								</li>
							</xsl:if>
						</xsl:if>
					</ul>
				</div>
			</div>
			<div class="full tab-content editorials">
				<xsl:if test="$idsecao != '' and (//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade show active" id="NomeAba1">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$idsecaoaba2 != '' and (//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade" id="NomeAba2">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba2">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$idsecaoaba3 != '' and (//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade" id="NomeAba3">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba3">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$idsecaoaba4 != '' and (//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade" id="NomeAba4">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba4">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$idsecaoaba5 != '' and (//*[@idsecao=$idsecaoaba5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade" id="NomeAba5">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecaoaba5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecaoaba5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba5">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="$idsecaoaba6 != '' and (//*[@idsecao=$idsecaoaba6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
					<div class="row tab-pane fade" id="NomeAba6">
						<div class="full">
							<xsl:for-each select="//*[@idsecao=$idsecaoaba6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()=1">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding content-pane">
										<figure>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
											<figcaption>
												<xsl:call-template name="cria-link-diretorio" />
											</figcaption>
										</figure>
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[@idsecao=$idsecaoaba6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
								<xsl:sort select="@publicacao" order="descending"/>
								<xsl:if test="position()&gt;=1 and position()&lt;=$quantidadeaba6">
									<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
									<div class="col-lg-6 float-left no-padding-right">
										<ul>
											<li>
												<div class="col-lg-4 col-4 align-middle">
													<xsl:call-template name="linkfotodestaque">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="tamanho" select="'pq'"/>
													</xsl:call-template>
												</div>
												<div class="col-lg-8 col-8 align-top">
													<b>
														<xsl:call-template name="cria-link-diretorio" />
													</b>
												</div>
											</li>
										</ul>
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="bc_eleicoes_candidatos">
		<xsl:param name="prefixopraca" />
		<div class="lnk-candidatos">
			<h1 class="card-header no-padding-right h4">Candidatos</h1>
			<a href="/{$prefixopraca}/politica/eleicoes/candidatos/presidentes.aspx">
				<img src="/{$prefixopraca}/politica/eleicoes/img/banner-presidente.jpg" alt="Candidatos a Presidente"/>
			</a>
			<a href="/{$prefixopraca}/politica/eleicoes/candidatos/governadores.aspx">
				<img src="/{$prefixopraca}/politica/eleicoes/img/banner-governador.jpg" alt="Candidatos a Governador"/>
			</a>
			<a href="/{$prefixopraca}/politica/eleicoes/candidatos/senadores.aspx">
				<img src="/{$prefixopraca}/politica/eleicoes/img/banner-senador.jpg" alt="Candidatos a Senador"/>
			</a>
			<a href="/{$prefixopraca}/politica/eleicoes/candidatos/deputado-federal.aspx">
				<img src="/{$prefixopraca}/politica/eleicoes/img/banner-depfederal.jpg" alt="Candidatos a Deputado Federal"/>
			</a>
			<a href="/{$prefixopraca}/politica/eleicoes/candidatos/deputado-estadual.aspx">
				<img src="/{$prefixopraca}/politica/eleicoes/img/banner-depestadual.jpg" alt="Candidatos a Deputado Estadual"/>
			</a>
		</div>
	</xsl:template>

	<!-- BOX "ASSINE "  -->
	<xsl:template name="bc_assine_acidade">
		<div id="box-assine">
			<h2 class="tit-padrao-docon">ASSINE</h2>
			<a target="_blank" href="https://assine.acidadeon.com/">
				<img src="/ribeiraopreto/docon/img/banner-assine.png" alt="Assine" />
			</a>
		</div>
	</xsl:template>

	<!--  BOX - TÍTULO DA COLUNA -->
	<xsl:template name="bc_titulo_coluna">
		<xsl:param name="titulo_coluna" />
		<div class="text-left">
			<h2 class="tit-padrao-docon">
				<xsl:value-of select="$titulo_coluna"/>
			</h2>
		</div>
	</xsl:template>

	<xsl:template name="bc_wrapper_55">
		<xsl:param name="titulo" />
		<xsl:param name="imagem" />
		<xsl:param name="link" />

		<div class="bstn-hls model-2" style="margin-bottom:11px">
			<div class="_l">

				<div class="bstn-hl-wrapper">

					<div class="bstn-hl type-materia with-photo is-half-size" style="--bstn-hl-cover:url({$imagem})">
						<a href="{$link}" class="bstn-hl-link">
							<ul class="bstn-hl-list">

								<li class="bstn-hl-spaceritem" style="color: transparent!important;">
								</li>
								<li class="bstn-hl-playbutton" style="color: transparent!important;">
								</li>
								<li class="bstn-hl-mainitem" style="color: transparent!important;">
									<div>
										<div class="_b">
											<span class="bstn-hl-title gui-color-primary gui-color-hover gui-color-primary-bg-after">
												<xsl:value-of select="$titulo" ></xsl:value-of>
											</span>
										</div>
									</div>
								</li>
							</ul>
						</a>
					</div>
				</div>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="bc_v6_ultimas_editorias">
		<xsl:param name="idsecao" />
		<xsl:param name="idsecao2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="idsecao4" />
		<xsl:param name="idsecao5" />
		<xsl:param name="idsecao6" />
		<xsl:param name="idsecao7" />
		<xsl:param name="idsecao8" />
		<xsl:param name="idsecao9" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />

		<div id="bc_v6_OnPlay" itemscope="" itemtype="https://schema.org/Periodical">
			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			<span class="sub-logo">
				<a href="{$urlvertodos}" title="Especiais">
					<img src="https://statics.acidadeon.com/acidadeon/img/logos/svg/onnichos.svg" alt="Especiais" width="130px" height="23.81px" />
				</a>
				<!--<a href="{$urlvertodos}" class="vertodos">› Ver todos</a>-->
			</span>

			<div class="row">
				<div class="col-12 col-md-6 col-xl-6">
					<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">

						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()=1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="col-12 col-md-12 col-xl-12">
								<div class="nicho-g">
									<img>
										<xsl:call-template name="linkfotomanchete">
											<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
											<xsl:with-param name="tamanho" select="'100'"/>
										</xsl:call-template>
									</img>

									<div class="descricao">
										<div class="manchete">
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="@manchete"/>
												<xsl:with-param name="link" select="@link"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()=1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

							<div class="col-12 col-md-6 col-xl-6">
								<div class="nicho-p">
									<img>
										<xsl:call-template name="linkfotomanchete">
											<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
											<xsl:with-param name="tamanho" select="'100'"/>
										</xsl:call-template>
									</img>
									<div class="descricao">
										<div class="manchete">
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="@manchete"/>
												<xsl:with-param name="link" select="@link"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()=1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />


							<div class="col-12 col-md-6 col-xl-6">
								<div class="nicho-p">
									<img>
										<xsl:call-template name="linkfotomanchete">
											<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
											<xsl:with-param name="tamanho" select="'100'"/>
										</xsl:call-template>
									</img>
									<div class="descricao">
										<div class="manchete">
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="@manchete"/>
												<xsl:with-param name="link" select="@link"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>

				<!--inicio coluna 2-->
				<div class="col-12 col-md-6">

					<div class="row no-gutters">
						<!--fazer dois foreachs separados, 1 com cada seção específica-->
						<xsl:for-each select="//*[@idsecao=$idsecao4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//*[@idsecao=$idsecao5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//*[@idsecao=$idsecao6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//*[@idsecao=$idsecao7]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//*[@idsecao=$idsecao8]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//*[@idsecao=$idsecao9]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

								<div class="col-12 col-md-6 col-xl-6">
									<div class="nicho-p">
										<img>
											<xsl:call-template name="linkfotomanchete">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="tamanho" select="'100'"/>
											</xsl:call-template>
										</img>
										<div class="descricao">
											<div class="manchete">
												<xsl:call-template name="linkmanchete">
													<xsl:with-param name="conteudo" select="@manchete"/>
													<xsl:with-param name="link" select="@link"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>


					</div>
				</div>
				<!--final coluna 2-->
			</div>
		</div>
	</xsl:template>

	<!-- Boxe especiais | verticais CCE -->
	<xsl:template name="bc_cxense_especiais">
		<xsl:param name="script" />

		<!-- <h2>Especiais</h2> -->
		<div id="cx_74bf1f1ebe947b3bfc99c5b848f158617a308129">
			<span class="d-none">Teste</span>
		</div>

		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '74bf1f1ebe947b3bfc99c5b848f158617a308129',
			targetElementId: 'cx_74bf1f1ebe947b3bfc99c5b848f158617a308129'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe linha - araraquara | CCE -->
	<xsl:template name="cxense_texto_ara">
		<xsl:param name="script" />

		<div id="cx_8815a9c15174aa29dbd6474f0876328c933c6418">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '8815a9c15174aa29dbd6474f0876328c933c6418',
			targetElementId: 'cx_8815a9c15174aa29dbd6474f0876328c933c6418'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe linha - campinas | CCE -->
	<xsl:template name="cxense_texto_camp">
		<xsl:param name="script" />

		<div id="cx_b262ae77b6da54f6edbfd7de9a9b030587ac8f1a">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'b262ae77b6da54f6edbfd7de9a9b030587ac8f1a',
			targetElementId: 'cx_b262ae77b6da54f6edbfd7de9a9b030587ac8f1a'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe linha - circuito das aguas | CCE -->
	<xsl:template name="cxense_texto_circ">
		<xsl:param name="script" />

		<div id="cx_faa9055efe2ac1c734a1935d064c3a9ea9f1b407">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'faa9055efe2ac1c734a1935d064c3a9ea9f1b407',
			targetElementId: 'cx_faa9055efe2ac1c734a1935d064c3a9ea9f1b407'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe linha - ribeirao preto | CCE -->
	<xsl:template name="cxense_texto_rp">
		<xsl:param name="script" />

		<div id="cx_fc496660cb979c5fea858df1c4ef1ee3bad413f2">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'fc496660cb979c5fea858df1c4ef1ee3bad413f2',
			targetElementId: 'cx_fc496660cb979c5fea858df1c4ef1ee3bad413f2'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe linha - sao carlos | CCE -->
	<xsl:template name="cxense_texto_sc">
		<xsl:param name="script" />

		<div id="cx_f1e787aecc47ed5a274517ef6840b2692a3bdc57">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'f1e787aecc47ed5a274517ef6840b2692a3bdc57',
			targetElementId: 'cx_f1e787aecc47ed5a274517ef6840b2692a3bdc57'
			}]);
		</script>
	</xsl:template>


	<!-- Boxe 2 fotos - Game ON | CCE -->
	<xsl:template name="cce_2_fotos_gameon">
		<xsl:param name="script" />

		<div id="cx_be2605c5b55541b38ad8550521dd3818b1298a9c">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'be2605c5b55541b38ad8550521dd3818b1298a9c',
			targetElementId: 'cx_be2605c5b55541b38ad8550521dd3818b1298a9c'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - Auto ON | CCE -->
	<xsl:template name="cce_2_fotos_autoon">
		<xsl:param name="script" />

		<div id="cx_21e6ea343000eac9a2381987ec61b93ed1d783d2">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '21e6ea343000eac9a2381987ec61b93ed1d783d2',
			targetElementId: 'cx_21e6ea343000eac9a2381987ec61b93ed1d783d2'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - Adestramento | CCE -->
	<xsl:template name="cce_2_fotos_adestramento">
		<xsl:param name="script" />

		<div id="cx_ce002cd107bdf81a89355f8d8d7714c8ac4496b1">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'ce002cd107bdf81a89355f8d8d7714c8ac4496b1',
			targetElementId: 'cx_ce002cd107bdf81a89355f8d8d7714c8ac4496b1'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - Churrasqueadas | CCE -->
	<xsl:template name="cce_2_fotos_churrasqueadas">
		<xsl:param name="script" />

		<div id="cx_9b2af7573f7388408ece7daa83a5acfc2c72ce4f">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '9b2af7573f7388408ece7daa83a5acfc2c72ce4f',
			targetElementId: 'cx_9b2af7573f7388408ece7daa83a5acfc2c72ce4f'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - Curadoria Hislt | CCE -->
	<xsl:template name="cce_2_fotos_curadoria">
		<xsl:param name="script" />

		<div id="cx_d36874039ff4fc4fa3d0fbde41738e11ee630684">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'd36874039ff4fc4fa3d0fbde41738e11ee630684',
			targetElementId: 'cx_d36874039ff4fc4fa3d0fbde41738e11ee630684'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - Mundo dos Bichos | CCE -->
	<xsl:template name="cce_2_fotos_mdb">
		<xsl:param name="script" />

		<div id="cx_cbd2b74f540d11957537e0a65ba4893500efa4f8">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'cbd2b74f540d11957537e0a65ba4893500efa4f8',
			targetElementId: 'cx_cbd2b74f540d11957537e0a65ba4893500efa4f8'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - ON Adventure | CCE -->
	<xsl:template name="cce_2_fotos_adventure">
		<xsl:param name="script" />

		<div id="cx_b621610750ab87fe91c5a13541c6d169acbd80f9">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'b621610750ab87fe91c5a13541c6d169acbd80f9',
			targetElementId: 'cx_b621610750ab87fe91c5a13541c6d169acbd80f9'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe 2 fotos - ON Run | CCE -->
	<xsl:template name="cce_2_fotos_run">
		<xsl:param name="script" />

		<div id="cx_a441aa540ce483cccc3764626a3bb8247f62c683">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'a441aa540ce483cccc3764626a3bb8247f62c683',
			targetElementId: 'cx_a441aa540ce483cccc3764626a3bb8247f62c683'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe especiais | GAME ON CCE -->
	<xsl:template name="bc_cxense_gameon">
		<xsl:param name="script" />

		<div id="cx_ffc451b50de3e697e0901c1072c747fa3ba58f87">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'ffc451b50de3e697e0901c1072c747fa3ba58f87',
			targetElementId: 'cx_ffc451b50de3e697e0901c1072c747fa3ba58f87'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe chamadas home praças | CCE -->
	<xsl:template name="bc_cxense_hpraca">
		<xsl:param name="script" />

		<div id="cx_239d210cacc1bc38d263e2e184e0d16fd3353be9">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '239d210cacc1bc38d263e2e184e0d16fd3353be9',
			targetElementId: 'cx_239d210cacc1bc38d263e2e184e0d16fd3353be9'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe chamadas home praças 2 fotos softnews | CCE -->
	<xsl:template name="bc_cxense_hpraca_soft">
		<xsl:param name="script" />

		<div id="cx_fbe839b3c9c16cf626ecb3e353a3652f081a724b">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'fbe839b3c9c16cf626ecb3e353a3652f081a724b',
			targetElementId: 'cx_fbe839b3c9c16cf626ecb3e353a3652f081a724b'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe Chamada - praças Viu essa? 5 fotos softnews | CCE -->
	<xsl:template name="bc_cxense_soft_5">
		<xsl:param name="script" />

		<div id="cx_0499a771f39b42bd92116b924386121459cc53bb">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '0499a771f39b42bd92116b924386121459cc53bb',
			targetElementId: 'cx_0499a771f39b42bd92116b924386121459cc53bb'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe Chamada - praças Viagem 5 fotos softnews | CCE -->
	<xsl:template name="bc_cxense_viagem_5">
		<xsl:param name="script" />

		<div id="cx_37d35d099c6d5c998b176ea23066294417870a87">
			<span class="d-none">Boxe</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '37d35d099c6d5c998b176ea23066294417870a87',
			targetElementId: 'cx_37d35d099c6d5c998b176ea23066294417870a87'
			}]);
		</script>
	</xsl:template>

	<!-- Cxense Module: 5 Chamadas - praças Verticais -->
	<xsl:template name="bc_cxense_verticais_5">
		<xsl:param name="script" />

		<div id="cx_d782693769daa53da617969bf4a082b387ea9154">
			<span class="d-none">Boxe</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'd782693769daa53da617969bf4a082b387ea9154',
			targetElementId: 'cx_d782693769daa53da617969bf4a082b387ea9154'
			}]);
		</script>
	</xsl:template>
	<!--FIM - Cxense Module: 5 Chamadas - praças Verticais -->

	<!-- Boxe especiais | ON Run topo - site CCE -->
	<xsl:template name="bc_cxense_onrun">
		<xsl:param name="script" />

		<div id="cx_5379590fe64923254299987b980ec9c3d2f798bb">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '5379590fe64923254299987b980ec9c3d2f798bb',
			targetElementId: 'cx_5379590fe64923254299987b980ec9c3d2f798bb'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe especiais | Auto ON topo - site CCE -->
	<xsl:template name="bc_cxense_autoon">
		<xsl:param name="script" />

		<div id="cx_89948411f4b2710e9aaf7c0dc524c13a7c3e39b9">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '89948411f4b2710e9aaf7c0dc524c13a7c3e39b9',
			targetElementId: 'cx_89948411f4b2710e9aaf7c0dc524c13a7c3e39b9'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe especiais | Viu essa? - 1 foto-->
	<xsl:template name="bc_cxense_viuessa_1_foto">
		<xsl:param name="script" />

		<div id="cx_add76e73f6c56320a76e1e4f1a92a8bf21870942">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: 'add76e73f6c56320a76e1e4f1a92a8bf21870942',
			targetElementId: 'cx_add76e73f6c56320a76e1e4f1a92a8bf21870942'
			}]);
		</script>
	</xsl:template>

	<!-- Boxe especiais | Viu essa? - 1 v2 foto-->
	<xsl:template name="bc_cxense_viuessa_1_foto2">
		<xsl:param name="script" />

		<div id="cx_427fc4aa924146dbdf79c2da73d3713d390f6aee">
			<span class="d-none">Teste</span>
		</div>
		<script type="text/javascript">
			var cX = window.cX = window.cX || {}; cX.callQueue = cX.callQueue || [];
			cX.CCE = cX.CCE || {}; cX.CCE.callQueue = cX.CCE.callQueue || [];
			cX.CCE.callQueue.push(['run',{
			widgetId: '427fc4aa924146dbdf79c2da73d3713d390f6aee',
			targetElementId: 'cx_427fc4aa924146dbdf79c2da73d3713d390f6aee'
			}]);
		</script>
	</xsl:template>

	<!--  BOX - TÍTULO DA LINHA - TUDO EP -->
	<xsl:template name="bc_titulo_linha_ultimasnoticias">
		<xsl:param name="titulo_linha" />
		<xsl:param name="urleditoria" />
		<div class="d-block w-100 mb-4 position-relative linha_ultimasnoticias">
			<div class="head-dash">
				<h2 class="cabecalho2 fw-bolder mb-0 pb-2" style="font-size: clamp(.5rem, 3.2rem + -0.2vw, 2.25rem);">
					<xsl:choose>
						<xsl:when test="$urleditoria != ''">
							<a class="head-link d-flex align-items-center" href="{$urleditoria}">
								<svg class="img-fluid me-1 isotipo" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="37" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 134.9 120" style="enable-background:new 0 0 134.9 120;" xml:space="preserve">
                    <g>
                        <path fill="currentColor" d="M67.6,95c-11.5,0-23.1,0-34.6,0c-8,0-15.1-2.7-21.2-7.8c-5.9-5-9.4-11.4-11-18.9c-1.4-6.6-1.2-13.1,0.8-19.5		C5.5,36.6,13.6,28.9,26,25.8c2.6-0.6,5.2-0.9,7.8-0.9c22.6,0,45.2,0,67.8,0c10.9,0,19.8,4.3,26.6,12.9c3.6,4.6,5.7,10,6.6,15.8		c1,5.8,0.6,11.6-1,17.3c-2.3,8.1-7,14.5-14.2,18.9c-5.7,3.5-11.9,5.1-18.6,5.1C89.9,94.9,78.8,95,67.6,95z M50.7,60.3		c0.1-5.3-1.7-9.5-5.8-12.7c-3-2.4-6.6-3.2-10.4-3.3c-3.8-0.1-7.4,0.7-10.5,2.9c-5,3.6-7,8.7-6.4,14.7c0.6,5.6,3.5,9.8,8.8,12.2		c3.2,1.5,6.6,1.7,10.1,1.4C44.5,74.9,51,68.5,50.7,60.3z"/>
                    </g>
                </svg>
								<span class="text-lowercase mb-2">
									<xsl:value-of select="$titulo_linha"/>
								</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$titulo_linha"/>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
			</div>
		</div>
	</xsl:template>

	<!--  BOX - TÍTULO DA LINHA Patrocínio -->
	<xsl:template name="bc_titulo_linha_patrocinio">
		<xsl:param name="titulo_linha" />
		<xsl:param name="urleditoria" />
		<xsl:param name="urlimagem" />
		<xsl:param name="position" />
		
		<div class="cabecalho-alt row align-items-end mb-4 pb-3 gx-0">			
			<div class="col head-dash">
				<h3 class="fw-bolder mb-0" style="font-size: clamp(.5rem, 3.2rem + -0.2vw, 2.25rem); line-height: .6;">
					<a class="head-link d-flex-block align-items-center" href="{$urleditoria}">
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="95" class="bi tudoep-design img-fluid" viewBox="0 0 342 120">
							<use xlink:href="/img/bootstrap-icons/bootstrap-icons.svg#tudoep-design" />
						</svg>
						<span class="text-lowercase mb-2">
							<xsl:value-of select="$titulo_linha"/>
						</span>
					</a>
				</h3>
			</div>

			<div class="col-md-2">
				<div id="opec" class="{$position} border-0" style="min-height: 75px;">
					<div id="{$position}" class="adunit" data-dimensions="120x50" data-size-mapping="{$position}" data-targeting="'dfp_Pos':'{$position}'" itemscope="" itemtype="https://schema.org/WPAdBlock" style="display:none">
					</div>
				</div>
			</div>

		</div>
	</xsl:template>

	<!-- Inicio bc_ep_especiais -->
	<xsl:template name="bc_ep_especiais">

		<xsl:param name="idnoticia" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="urlvermais" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="chapeu">
			<xsl:if test="$assunto!=''">
				<xsl:value-of select="$assunto"/>
			</xsl:if>
			<xsl:if test="$assunto=''">
				<xsl:value-of select="@assunto"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="vermais">
			<xsl:if test="$urlvermais!=''">
				<xsl:value-of select="$urlvermais"/>
			</xsl:if>
			<xsl:if test="$urlvermais=''">
				<xsl:value-of select="concat(./../../../@canal,./../../../@diretorio)"/>
			</xsl:if>
		</xsl:variable>

		<div class="box-nicho vertical p-3 rounded-3" style="border: 1px solid var(--bs-primary);">
			<div class="row gy-3 g-md-3 position-relative">
				<div class="col-md-5">
					<div class="d-flex flex-column h-100">

						<h3 class="h5 fw-bolder lh-1 mt-2" style="color: var(--bs-primary);">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
							</xsl:call-template>
						</h3>
						<p class="h3 mt-2">
							<xsl:call-template name="linkmanchete">
								<xsl:with-param name="conteudo" select="$manchete"/>
								<xsl:with-param name="link" select="$link"/>
								<xsl:with-param name="cssclass" select="'display stretched-link'"/>
							</xsl:call-template>
						</p>
						<span class="btn btn-outline-primary mt-auto rounded-2 fw-bolder text-lowercase">
							Veja mais
						</span>

					</div>
				</div>
				<div class="col-md">
					<xsl:call-template name="linkfoto">
						<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
						<xsl:with-param name="cssclass" select="'img-fluid rounded-3 overflow-hidden'"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
						<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
						<xsl:with-param name="tipo" select="'destaque'"/>
						<xsl:with-param name="widthbox" select="473"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- Fim bc_ep_especiais -->

	<!--  BOX - TÍTULO DA LINHA -->
	<xsl:template name="bc_titulo_linha_v55">
		<xsl:param name="titulo_linha" />
		<xsl:param name="urleditoria" />
		<div class="d-block w-100 mb-4 position-relative">
			<div class="head-dash">
				<h2 class="cabecalho2 fw-bolder mb-0 pb-2" style="font-size: clamp(.5rem, 3.2rem + -0.2vw, 2.25rem);">
					<xsl:choose>
						<xsl:when test="$urleditoria != ''">
							<a class="head-link d-flex align-items-center" href="{$urleditoria}">
								<span class="mb-2">
									<xsl:value-of select="$titulo_linha"/>
								</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$titulo_linha"/>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
			</div>
		</div>
	</xsl:template>


	<!--Versão dos boxes em AMP 2023 -->
	<!--Página para validações AMP https://search.google.com/test/rich-results-->

	<xsl:template name="bc_amp_ep_especiais">

		<xsl:param name="idnoticia" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="urlvermais" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="chapeu">
			<xsl:if test="$assunto!=''">
				<xsl:value-of select="$assunto"/>
			</xsl:if>
			<xsl:if test="$assunto=''">
				<xsl:value-of select="@assunto"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="vermais">
			<xsl:if test="$urlvermais!=''">
				<xsl:value-of select="$urlvermais"/>
			</xsl:if>
			<xsl:if test="$urlvermais=''">
				<xsl:value-of select="concat(./../../../@canal,./../../../@diretorio)"/>
			</xsl:if>
		</xsl:variable>

		<div class="box-amp_ep_especiais">
			<div class="amp_ep_especiais">
				<div class="box_conteudo">
					<div class="conteudo">

						<h3 class="chapeu">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
							</xsl:call-template>
						</h3>
						<p class="chamada">
							<xsl:call-template name="linkmanchete">
								<xsl:with-param name="conteudo" select="$manchete"/>
								<xsl:with-param name="link" select="$link"/>
								<xsl:with-param name="cssclass" select="'display stretched-link'"/>
							</xsl:call-template>
						</p>
						<span class="btn-outline-primary">
							Veja mais
						</span>

					</div>
				</div>
				<div class="img_amp-especiais">
					<xsl:call-template name="link_amp_foto">
						<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
						<xsl:with-param name="cssclass" select="'img-fluid rounded-3 overflow-hidden'"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
						<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
						<xsl:with-param name="tipo" select="'destaque'"/>
						<xsl:with-param name="widthbox" select="473"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>