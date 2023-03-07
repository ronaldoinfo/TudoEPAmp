﻿<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
	<xsl:import href="../../xsl/xsl-funcoes/funcoes_portal_v6.xsl" />

	<xsl:template name="bc_v6_manchete_a">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div id="bc_v6_manchete_a" data-tb-region-item="">
			<h3 class="h2 manchete-home mb-4">
				<xsl:call-template name="linkmanchete">
					<xsl:with-param name="conteudo" select="$manchete"/>
					<xsl:with-param name="link" select="$link"/>
					<xsl:with-param name="cssclass" select="'display'"/>
				</xsl:call-template>
			</h3>
		</div>
	</xsl:template>

	<xsl:template name="bc_v6_manchete_b">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<style type="text/css">
			#bc_v6_manchete_b a {display: block;}
		</style>
		<div id="bc_v6_manchete_b" itemscope="" itemtype="https://schema.org/NewsArticle">
			<div class="destaque-item-imagem">
				<figure>
					<xsl:call-template name="linkfoto">
						<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
						<xsl:with-param name="tipo" select="'manchete'"/>
						<xsl:with-param name="widthbox" select="'636'"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="cssclass" select="'img-fluid w-100 rounded-3'"/>
						<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
						<xsl:with-param name="credito" select="$imagemmanchetecredito"/>              
					</xsl:call-template>
				</figure>
			</div>
			<div class="destaque-item-cont">
				<h2 class="display-5 fw-bolder lh-1 mb-4">					
					<span class="no-margin-top" itemprop="headline">
						<xsl:call-template name="linkmanchete">
							<xsl:with-param name="conteudo" select="$manchete"/>
							<xsl:with-param name="link" select="$link"/>
							<xsl:with-param name="cssclass" select="'display'"/>
						</xsl:call-template>
					</span>					
				</h2>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
				<xsl:call-template name="get-destaque">
					<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="bc_v6_publion">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>
		<xsl:param name="chapeu" />

		<div id="bc_v6_publion" itemscope="" itemtype="https://schema.org/NewsArticle">
			<span class="sub-logo">
				<xsl:value-of select="$chapeu" />
			</span>
			<div class="destaque-item-imagem">
				<a itemprop="url" class="img-thumb-zoom" href="{$link}" title="{$manchete}">
					<figure>
						<xsl:call-template name="linkfoto">
							<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
							<xsl:with-param name="link" select="$link"/>
							<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
							<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
							<xsl:with-param name="tipo" select="'destaque'"/>
						</xsl:call-template>
					</figure>
				</a>
			</div>
			<div class="destaque-item-cont">
				<h4>
					<a itemprop="url" href="{$link}" title="{$manchete}">
						<span class="no-margin-top" itemprop="headline">
							<xsl:if test="string-length($manchete) &lt;= 64">
								<xsl:value-of select="$manchete" />
							</xsl:if>
							<xsl:if test="string-length($manchete) &gt; 64">
								<xsl:value-of select="concat(substring($manchete,1,61),'...')" />
							</xsl:if>
						</span>
					</a>
				</h4>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
				<xsl:call-template name="get-destaque">
					<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="bc_v6_SlideHome">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="link" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
       &lt;div id="bc_v6_SlideHome"&gt;
       &lt;div class="slideshow-container"&gt;

       &lt;div class="bullets"&gt;
					&lt;span class="dot" onclick="currentSlide(1)">&lt;/span&gt;
					&lt;span class="dot" onclick="currentSlide(2)">&lt;/span&gt;
					&lt;span class="dot" onclick="currentSlide(3)">&lt;/span&gt;
	  	 &lt;/div&gt;
      </xsl:text>
		</xsl:if>

		<div class="SlideNoticiasHome fadebox">
			<xsl:call-template name="linkfoto_v6">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="tipo" select="'manchete'"/>
				<xsl:with-param name="widthbox" select="'550'" />
				<xsl:with-param name="height" select="'310'" />
				<xsl:with-param name="widthboxPERC" select="'100'" />
			</xsl:call-template>
			<div class="descricao">
				<div class="chapeu">
					<xsl:call-template name="get-assunto">
						<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)" />
					</xsl:call-template>
				</div>
				<div class="manchete">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)" />
						<xsl:with-param name="link" select="$link"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<xsl:if test="$position='ultimo'">
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</xsl:if>
		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;              
            &lt;/div&gt;              
        </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template name="bc_v6_colunistas_acidadeon">
		<xsl:param name="chapeu"></xsl:param>
		<xsl:param name="imagem_id"></xsl:param>
		<xsl:param name="url"></xsl:param>
		<xsl:param name="urlvertodos"></xsl:param>
		<xsl:param name="idsecao"></xsl:param>
		<xsl:param name="position" />

		<xsl:if test="$position='1'">

			<h4 class="card-header no-padding-right">
				Blogs
				<a href="{$urlvertodos}" class="link link-access right pt-10">Ver todos</a>
			</h4>
			<div class="col-lg-12 no-padding float-left carel-ts" />
			<div class="slider-column col-12 no-padding-left" />
			<div class="carousel-column col-lg-12 no-padding" />

		</xsl:if>
		<div class="bc_colunistas_acidadeon">
			<a href="{$url}">
				<figure class="col-lg-4 float-left no-padding-left">
					<img class="lazyload" data-src="{$imagem_id}" alt="{$chapeu}"/>
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
						<xsl:if test="position()&lt;=3">
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
          &lt;button type="button" class="bt-prev"&gt; 
            &lt;svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16"&gt;
              &lt;path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/&gt;
            &lt;/svg&gt;
          &lt;/button&gt;
          
          &lt;button type="button" class="bt-next"&gt;
            &lt;svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16"&gt;
              &lt;path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/&gt;
            &lt;/svg&gt;
          &lt;/button&gt;

        &lt;/div&gt;
        &lt;/div&gt;
        &lt;/div&gt;
		</xsl:text>
		</xsl:if>
	</xsl:template>

	<!--News_v6 - Manch_M - Foto + Assunto + Manchete -->
	<xsl:template name="bc_v6_manchete_m">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="destaque" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<span itemscope="" itemtype="https://schema.org/NewsArticle">
			<section class="full mg-bt-30">
				<figure class="col-md-6 float-left no-padding pd-lt-0 pd-rt-0">
					<xsl:call-template name="linkfoto">
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
						<xsl:with-param name="tipo" select="'destaque'"/>
						<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
						<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
						<xsl:with-param name="widthbox" select="'100%'" />
					</xsl:call-template>
				</figure>
				<figcaption class="col-md-6 float-right pd-lt-0 pd-rt-0">
					<h1 class="h4" itemprop="headline">
						<xsl:call-template name="linkmanchete">
							<xsl:with-param name="conteudo" select="$manchete"/>
							<xsl:with-param name="link" select="$link"/>
						</xsl:call-template>
					</h1>
					<ul class="headline">
						<li itemprop="description">
							<xsl:call-template name="linkdestaque">
								<xsl:with-param name="conteudo" select="$destaque"/>
								<xsl:with-param name="link" select="$link"/>
							</xsl:call-template>
						</li>
					</ul>
				</figcaption>
			</section>
		</span>
	</xsl:template>

	<xsl:template name="bc_v6_Nichos">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="link" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
        &lt;div id="bc_v6_Nichos"&gt; <!--bc_v6_SlideHome -->
       &lt;div class="slideshow-container-nichos"&gt;

       &lt;div class="bullets-nichos"&gt;
					&lt;span class="dot-nichos" onclick="currentSlideNichos(1)">&lt;/span&gt;
					&lt;span class="dot-nichos" onclick="currentSlideNichos(2)">&lt;/span&gt;
	  	 &lt;/div&gt;
      </xsl:text>
		</xsl:if>

		<div class="SlideNoticiasHomeNichos fadebox">
			<!--SlideNoticiasHome-->
			<xsl:call-template name="linkfoto_v6">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="tipo" select="'macnhete'"/>
				<xsl:with-param name="widthbox" select="'550'" />
				<xsl:with-param name="height" select="'190'" />
				<xsl:with-param name="widthboxPERC" select="'100'" />
			</xsl:call-template>
		</div>
		<xsl:if test="$position='ultimo'">
			<a class="prev-nichos" onclick="plusSlidesNichos(-1)">&#10094;</a>
			<a class="next-nichos" onclick="plusSlidesNichos(1)">&#10095;</a>
		</xsl:if>
		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;              
            &lt;/div&gt;              
        </xsl:text>
		</xsl:if>
	</xsl:template>

	<!--SlideNoticiasHomePaiNichos-->
	<xsl:template name="bc_v6_SlidePaiNichos">
		<xsl:param name="idportal" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="link" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
        &lt;div id="bc_v6_SlidePaiNichos"&gt;
       &lt;div class="slideshow-container-slidepainichos"&gt;

       &lt;div class="bullets-slidepainichos"&gt;
					&lt;span class="dot-slidepainichos" onclick="currentSlidePaiNichos(1)">&lt;/span&gt;
					&lt;span class="dot-slidepainichos" onclick="currentSlidePaiNichos(2)">&lt;/span&gt;
          &lt;span class="dot-slidepainichos" onclick="currentSlidePaiNichos(3)">&lt;/span&gt;
          &lt;span class="dot-slidepainichos" onclick="currentSlidePaiNichos(4)">&lt;/span&gt;
	  	 &lt;/div&gt;
      </xsl:text>
		</xsl:if>

		<div class="SlideNoticiasHomePaiNichos fadebox">
			<div class="idportal" style="background: #ff8600;">
				<xsl:variable name="idSite">
					<xsl:call-template name="get-idportal">
						<xsl:with-param name="idportal" select="translate($idportal, $quot, $apos)" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$idSite = 3">Ribeirão Preto</xsl:when>
					<xsl:when test="$idSite = 4">Araraquara</xsl:when>
					<xsl:when test="$idSite = 5">Campinas</xsl:when>
					<xsl:when test="$idSite = 6">São Carlos</xsl:when>
					<xsl:when test="$idSite = 9">Virando Bixo</xsl:when>
					<xsl:otherwise>
						ACidade ON
					</xsl:otherwise>
				</xsl:choose>
			</div>

			<xsl:call-template name="linkfoto_v6">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="tipo" select="'manchete'"/>
				<xsl:with-param name="widthbox" select="'550'" />
				<xsl:with-param name="height" select="'330'" />
				<xsl:with-param name="widthboxPERC" select="'100'" />
			</xsl:call-template>
			<div class="descricao">
				<div class="chapeu">
					<xsl:call-template name="get-assunto">
						<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)" />
					</xsl:call-template>
				</div>
				<div class="manchete">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)" />
						<xsl:with-param name="link" select="$link"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<xsl:if test="$position='ultimo'">
			<a class="prev-slidepainichos" onclick="plusSlidePaiNichos(-1)">&#10094;</a>
			<a class="next-slidepainichos" onclick="plusSlidePaiNichos(1)">&#10095;</a>
		</xsl:if>
		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;              
            &lt;/div&gt;              
        </xsl:text>
		</xsl:if>
	</xsl:template>

	<!--News_v6 - Manch_M - Foto + Assunto + Manchete -->
	<xsl:template name="bc_v6_manchete_m_lateral">
		<xsl:param name="chapeu" />
		<xsl:param name="manchete" />
		<xsl:param name="destaque" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="bc_v6_manchete_m_lateral d-block position-relative" itemscope="" itemtype="https://schema.org/NewsArticle">
			<div class="row gy-3">
				<figure class="col-md no-padding pd-lt-0 pd-rt-0">
					<div class="d-block w-100 mb-0 position-relative">
						<xsl:call-template name="linkfoto">
							<xsl:with-param name="link" select="$link"/>
							<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
							<xsl:with-param name="tipo" select="'destaque'"/>
							<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
							<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
							<xsl:with-param name="cssclass" select="'img-fluid w-100 rounded-3'"/>
							<xsl:with-param name="widthbox" select="'100%'" />
						</xsl:call-template>
					</div>
				</figure>
				<figcaption class="col-md-6">
					<div class="d-flex flex-column w-100">
						<div class="fw-bolder small d-inline-flex align-items-center text-uppercase mb-2" style="color: var(--bs-primary);">
							<span class="chapeu">
								<xsl:call-template name="linkassunto">
									<xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
									<xsl:with-param name="link" select="$link"/>
								</xsl:call-template>
							</span>
						</div>
						<h3 class="h1 fw-bolder mb-0" style="line-height: 1.05;">
							<xsl:call-template name="linkmanchete">
								<xsl:with-param name="conteudo" select="$manchete"/>
								<xsl:with-param name="link" select="$link"/>
								<xsl:with-param name="cssclass" select="'display letter-s0 d-block'"/>
							</xsl:call-template>
						</h3>
						<p class="linhafina h5 fw-normal mt-3">
							<xsl:call-template name="linkdestaque">
								<xsl:with-param name="conteudo" select="$destaque"/>
								<xsl:with-param name="link" select="$link"/>
							</xsl:call-template>
						</p>
					</div>
				</figcaption>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="bc_slider_carousel">
		<xsl:param name="titulo" />
		<xsl:param name="idsecao1" />
		<xsl:param name="qtd1" />
		<xsl:param name="idsecao2" />
		<xsl:param name="qtd2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="qtd3" />
		<xsl:param name="idsecao4" />
		<xsl:param name="qtd4" />
		<xsl:param name="idsecao5" />
		<xsl:param name="qtd5" />
		<xsl:param name="idsecao6" />
		<xsl:param name="qtd6" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<section class="jupiter">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>
								<xsl:value-of select="$titulo" />
							</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="jupiter_slider owl-carousel owl-loaded">

						<div class="owl-stage-outer">
							<div class="owl-stage">
								<xsl:for-each select="//*[@idsecao=$idsecao1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd1">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupiter_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd2">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupitert_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd3">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupitert_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//*[@idsecao=$idsecao4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd4">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupitert_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//*[@idsecao=$idsecao5]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd5">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupitert_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//*[@idsecao=$idsecao6]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$qtd6">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="owl-item">
											<div class="col-lg-4">
												<div class="jupitert_item">
													<div class="jupiter_item_pic set-bg">
														<xsl:call-template name="linkfotomanchete">
															<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
															<xsl:with-param name="tamanho" select="'100'"/>
														</xsl:call-template>
														<div class="tag-date">
															<span>
																<xsl:call-template name="linkassunto">
																	<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
																	<xsl:with-param name="link" select="@link"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
													<div class="jupitert_item_text">
														<h4>
															<xsl:call-template name="linkmanchete">
																<xsl:with-param name="conteudo" select="@manchete"/>
																<xsl:with-param name="link" select="@link"/>
															</xsl:call-template>
														</h4>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>

						<div class="owl-nav">
							<button type="button" role="presentation" class="owl-prev">
								<i class="fa fa-angle-left">
									<div style="display:none">.</div>
								</i>
							</button>
							<button type="button" role="presentation" class="owl-next">
								<i class="fa fa-angle-right">
									<div style="display:none">.</div>
								</i>
							</button>
						</div>
						<div class="owl-dots disabled"></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<!--SlideFotoLivre-->

	<xsl:template name="bc_v6_SlideFotoLivre">

		<xsl:param name="manchete" />
		<xsl:param name="imgbackground" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="link" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
       &lt;div class="clearfix"&gt;&lt;div&gt;
       &lt;section id="slider-EPNegocios" class="container-fluid mx-0 px-0 banner-two mt-lg-5"&gt;
       &lt;div class="banner-home slider mb-0"&gt;
      </xsl:text>
		</xsl:if>
		<!-- <a href="#" class="" target="_blank"> -->
		<a href="/tv/" class="">
			<img src="{$imgbackground}" alt="" class="banner-img img-fluid cover" />
			<div class="slide-caption position-absolute">
				<div class="caption-ajuste row px-0">
					<div class="animaEsquerda col-md-6 d-flex flex-column justify-content-center text-right px-5 pr-lg-5">
						<h1 class="principal text-white text-uppercase ml-auto w-80">
							<xsl:value-of select="$manchete" />
						</h1>
						<!-- <p class="complemento text-white">Nulla vitae elit libero, a pharetra augue mollis interdum.</p> -->
					</div>
					<img src="/img/logo_ep-negocios_branco-banner.svg" alt="" class="animaDireita objeto img-fluid col-md-6 px-0 d-none d-md-block" />
				</div>
			</div>
		</a>
		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;
            &lt;/section&gt; 
        </xsl:text>
		</xsl:if>

	</xsl:template>

	<!--SlideShowNoticias-->

	<xsl:template name="bc_slideshow_noticias55">

		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="cor" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="clearfix"></div>
		<div class="speakers-full-width bg-gray-imgfx">
			<div class="container-fluid p-0">
				<div class="row">
					<div class="col-12">
						<!-- Speaker Slider -->
						<div class="speaker-slider">

							<xsl:if test="$idsecao != '' and (//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
								<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="speaker-image">

											<xsl:call-template name="linkfoto">
												<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
												<xsl:with-param name="cssclass" select="'img-fluid'"/>
											</xsl:call-template>

											<div class="primary-overlay {$cor} text-center px-5">
												<h5 class="font-weight-bolder">
													<xsl:call-template name="linkmanchete">
														<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
													</xsl:call-template>
												</h5>
												<p class="font-italic">
													<xsl:call-template name="linkdestaque">
														<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
													</xsl:call-template>
												</p>
												<hr class="bg-white"> </hr>
											</div>

										</div>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<!--SlideShowNoticias-->

	<xsl:template name="bc_pills_noticias55">


		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="idsecaoaba2" />
		<xsl:param name="quantidadeaba2" />
		<xsl:param name="idsecaoaba3" />
		<xsl:param name="quantidadeaba3" />
		<xsl:param name="idsecaoaba4" />
		<xsl:param name="quantidadeaba4" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>


		<div class="clearfix"></div>
		<section id="portfolio">
			<div class="container block pb-2">
				<div class="row mt-lg-5 border-bottom mb-5">
					<div class="titulo-homecategoria col-9 col-md-3 h1 d-block text-uppercase text-lg-right text-grad-tv font-weight-bolder pb-2"
								   style="line-height: 1;">
						<!-- <span class="d-table w-25"> -->
						Portfólio de Projetos
						<!-- </span> -->
					</div>
					<div class="col-md-9 mx-auto d-flex  justify-content-center align-items-center py-4 py-lg-0">
						<ul class="nav nav-pills" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active px-4 py-3 mr-3" id="pills-campinas-tab" data-toggle="pill"
												   href="#pills-campinas" role="tab" aria-controls="pills-campinas"
												   aria-selected="true">Campinas</a>
							</li>
							<li class="nav-item">
								<a class="nav-link px-4  py-3 mr-3" id="pills-ribeirao-tab" data-toggle="pill"
												   href="#pills-ribeirao" role="tab" aria-controls="pills-ribeirao"
												   aria-selected="false">Ribeirão</a>
							</li>
							<li class="nav-item">
								<a class="nav-link px-4  py-3 mr-3" id="pills-central-tab" data-toggle="pill"
												   href="#pills-central" role="tab" aria-controls="pills-central"
												   aria-selected="false">Central</a>
							</li>

							<li class="nav-item">
								<a class="nav-link px-4  py-3 mr-3" id="pills-suldeminas-tab" data-toggle="pill"
												   href="#pills-suldeminas" role="tab" aria-controls="pills-suldeminas"
												   aria-selected="false">Sul de Minas</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="full tab-content editorials">
					<xsl:if test="$idsecao != '' and (//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
						<div class="tab-pane fade show active" id="pills-campinas" role="tabpanel" aria-labelledby="pills-campinas-tab">
							<div class="news row">
								<xsl:for-each select="//*[@idsecao=$idsecao]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="col-lg-3 col-md-6 col-sm-8 col-6">
											<div class="blog-post border transicao">
												<div class="post-thumb bg-gray-imgfx imgfx2">


													<xsl:call-template name="linkfoto">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="cssclass" select="'img-fluid'"/>
													</xsl:call-template>
												</div>
												<div class="post-content">
													<div class="chapeu px-3 py-1">
														<h4 class="text-uppercase">
															<xsl:call-template name="get-assunto">
																<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
															</xsl:call-template>
														</h4>
													</div>
													<div class="post-title">
														<h2>
															<span class="title-link">
																<xsl:call-template name="linkmanchete">
																	<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
																</xsl:call-template>
															</span>
														</h2>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$idsecaoaba2 != '' and (//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
						<div class="tab-pane fade" id="pills-ribeirao" role="tabpanel" aria-labelledby="pills-ribeirao-tab">
							<div class="news row">
								<xsl:for-each select="//*[@idsecao=$idsecaoaba2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="col-lg-3 col-md-6 col-sm-8 col-6">
											<div class="blog-post border transicao">
												<div class="post-thumb bg-gray-imgfx imgfx2">


													<xsl:call-template name="linkfoto">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="cssclass" select="'img-fluid'"/>
													</xsl:call-template>
												</div>
												<div class="post-content">
													<div class="chapeu px-3 py-1">
														<h4 class="text-uppercase">
															<xsl:call-template name="get-assunto">
																<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
															</xsl:call-template>
														</h4>
													</div>
													<div class="post-title">
														<h2>
															<span class="title-link">
																<xsl:call-template name="linkmanchete">
																	<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
																</xsl:call-template>
															</span>
														</h2>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$idsecaoaba3 != '' and (//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
						<div class="tab-pane fade" id="pills-central" role="tabpanel" aria-labelledby="pills-central-tab">
							<div class="news row">
								<xsl:for-each select="//*[@idsecao=$idsecaoaba3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="col-lg-3 col-md-6 col-sm-8 col-6">
											<div class="blog-post border transicao">
												<div class="post-thumb bg-gray-imgfx imgfx2">


													<xsl:call-template name="linkfoto">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="cssclass" select="'img-fluid'"/>
													</xsl:call-template>
												</div>
												<div class="post-content">
													<div class="chapeu px-3 py-1">
														<h4 class="text-uppercase">
															<xsl:call-template name="get-assunto">
																<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
															</xsl:call-template>
														</h4>
													</div>
													<div class="post-title">
														<h2>
															<span class="title-link">
																<xsl:call-template name="linkmanchete">
																	<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
																</xsl:call-template>
															</span>
														</h2>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$idsecaoaba4 != '' and (//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)])">
						<div class="tab-pane fade" id="pills-suldeminas" role="tabpanel" aria-labelledby="pills-suldeminas-tab">
							<div class="news row">
								<xsl:for-each select="//*[@idsecao=$idsecaoaba4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
									<xsl:sort select="@publicacao" order="descending"/>
									<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
										<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
										<div class="col-lg-3 col-md-6 col-sm-8 col-6">
											<div class="blog-post border transicao">
												<div class="post-thumb bg-gray-imgfx imgfx2">


													<xsl:call-template name="linkfoto">
														<xsl:with-param name="arquivoimagem" select="/fotodestaque/@arquivo" />
														<xsl:with-param name="cssclass" select="'img-fluid'"/>
													</xsl:call-template>
												</div>
												<div class="post-content">
													<div class="chapeu px-3 py-1">
														<h4 class="text-uppercase">
															<xsl:call-template name="get-assunto">
																<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
															</xsl:call-template>
														</h4>
													</div>
													<div class="post-title">
														<h2>
															<span class="title-link">
																<xsl:call-template name="linkmanchete">
																	<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
																</xsl:call-template>
															</span>
														</h2>
													</div>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</section>
	</xsl:template>

	<!-- Inicio bc_ep_tabs CBN + Especiais + Patrocinados -->
	<xsl:template name="bc_ep_tabs">
		<xsl:param name="titulo1" />
		<xsl:param name="idsecao1" />
		<xsl:param name="qtd1" />
		<xsl:param name="url1" />
		<xsl:param name="titulo2" />
		<xsl:param name="idsecao2" />
		<xsl:param name="qtd2" />
		<xsl:param name="url2" />
		<xsl:param name="titulo3" />
		<xsl:param name="idsecao3" />
		<xsl:param name="qtd3" />
		<xsl:param name="url3" />
		<xsl:param name="titulo4" />
		<xsl:param name="idsecao4" />
		<xsl:param name="qtd4" />
		<xsl:param name="url4" />
		<xsl:param name="ordem" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="ordembox">
			<xsl:if test="$ordem = ''">
				<xsl:value-of select="1"></xsl:value-of>
			</xsl:if>
			<xsl:if test="$ordem != ''">
				<xsl:value-of select="$ordem"></xsl:value-of>
			</xsl:if>
		</xsl:variable>

		<div id="bc_tabs" class="bc_tabs d-block position-relative">
			<div class="nav btn-group" id="myTab{$ordembox}" role="tablist">				
				<button class="btn btn-outline-primary cor-ref-podcasts nav-link fw-bold active" id="tab{$ordembox}_1-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_1" type="button" role="tab" aria-controls="tab{$ordembox}_1" aria-selected="true">
					<xsl:value-of select="$titulo1" />
				</button>
				
				<button class="btn btn-outline-primary nav-link fw-bold" id="tab{$ordembox}_2-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_2" type="button" role="tab" aria-controls="tab{$ordembox}_2" aria-selected="false">
					<xsl:value-of select="$titulo2" />
				</button>
				
				<button class="btn btn-outline-primary nav-link fw-bold" id="tab{$ordembox}_3-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_3" type="button" role="tab" aria-controls="tab{$ordembox}_3" aria-selected="false">
					<xsl:value-of select="$titulo3" />
				</button>
				
			</div>
			<br />
			<div class="tab-content" id="myTabContent{$ordembox}">
				<div class="tab-pane cor-ref-podcasts fade show active" id="tab{$ordembox}_1" role="tabpanel" aria-labelledby="tab{$ordembox}_1-tab">
					<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao1]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="get-foto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'pq'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
											
										<xsl:variable name="idSite">
											<xsl:value-of select="@idportal"/>
										</xsl:variable>

										<xsl:variable name="urlsite">
											<xsl:choose>
												<xsl:when test="$idSite = 12">https://www.cbnribeirao.com.br/podcasts</xsl:when>
												<xsl:when test="$idSite = 14">https://www.cbnararaquara.com.br/podcasts</xsl:when>
												<xsl:when test="$idSite = 19">https://www.cbnsaocarlos.com.br/podcasts</xsl:when>
												<xsl:otherwise>
													CBN
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>

										<div class="d-block pt-2">
											<a href="{$urlsite}/{@url}" class="stretched-link d-block h5 lh-1">
												<xsl:call-template name="get-manchete">
													<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												</xsl:call-template>
											</a>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>




					<div class="cor-ref-">
						<a href="{$url1}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
				<div class="tab-pane fade" id="tab{$ordembox}_2" role="tabpanel" aria-labelledby="tab{$ordembox}_2-tab">
					<xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd2">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="linkfoto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'destaque'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
										<div class="d-block pt-2">
											<!-- <a href="#" class="stretched-link d-block lh-1"> -->
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												<xsl:with-param name="cssclass" select="'stretched-link d-block h5 lh-1'"/>
											</xsl:call-template>
											<!-- </a> -->
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="cor-ref-">
						<a href="{$url2}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
				<div class="tab-pane fade" id="tab{$ordembox}_3" role="tabpanel" aria-labelledby="tab{$ordembox}_3-tab">
					<xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd3">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="linkfoto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'destaque'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
										<div class="d-block pt-2">
											<!-- <a href="#" class="stretched-link d-block lh-1"> -->
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												<xsl:with-param name="cssclass" select="'stretched-link d-block h5 lh-1'"/>
											</xsl:call-template>
											<!-- </a> -->
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="cor-ref-">
						<a href="{$url3}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
			</div>

		</div>
	</xsl:template>
	<!-- Fim bc_ep_tabs CBN + Especiais + Patrocinados -->

	<!-- Inicio bc_ep_tabs Notícias -->
	<xsl:template name="bc_ep_tabs_noticias">
		<xsl:param name="titulo1" />
		<xsl:param name="idsecao1" />
		<xsl:param name="qtd1" />
		<xsl:param name="url1" />
		<xsl:param name="titulo2" />
		<xsl:param name="idsecao2" />
		<xsl:param name="qtd2" />
		<xsl:param name="url2" />
		<xsl:param name="titulo3" />
		<xsl:param name="idsecao3" />
		<xsl:param name="qtd3" />
		<xsl:param name="url3" />
		<xsl:param name="titulo4" />
		<xsl:param name="idsecao4" />
		<xsl:param name="qtd4" />
		<xsl:param name="url4" />
		<xsl:param name="ordem" />
		<xsl:param name="corref1" />
		<xsl:param name="corref2" />
		<xsl:param name="corref3" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="ordembox">
			<xsl:if test="$ordem = ''">
				<xsl:value-of select="1"></xsl:value-of>
			</xsl:if>
			<xsl:if test="$ordem != ''">
				<xsl:value-of select="$ordem"></xsl:value-of>
			</xsl:if>
		</xsl:variable>

		<div id="bc_tabs" class="bc_tabs d-block position-relative">
			<div class="nav btn-group" id="myTab{$ordembox}" role="tablist">				
				<button class="btn btn-outline-primary cor-ref-{$corref1} nav-link fw-bold active" id="tab{$ordembox}_1-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_1" type="button" role="tab" aria-controls="tab{$ordembox}_1" aria-selected="true">
					<xsl:value-of select="$titulo1" />
				</button>
				
				<button class="btn btn-outline-primary cor-ref-{$corref2} nav-link fw-bold" id="tab{$ordembox}_2-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_2" type="button" role="tab" aria-controls="tab{$ordembox}_2" aria-selected="false">
					<xsl:value-of select="$titulo2" />
				</button>

				<button class="btn btn-outline-primary cor-ref-{$corref3} nav-link fw-bold" id="tab{$ordembox}_3-tab" data-bs-toggle="tab" data-bs-target="#tab{$ordembox}_3" type="button" role="tab" aria-controls="tab{$ordembox}_3" aria-selected="false">
					<xsl:value-of select="$titulo3" />
				</button>

			</div>
			<br />
			<div class="tab-content" id="myTabContent{$ordembox}">
				<div class="tab-pane cor-ref-{$corref1} fade show active" id="tab{$ordembox}_1" role="tabpanel" aria-labelledby="tab{$ordembox}_1-tab">
					<xsl:for-each select="//*[@idsecao=$idsecao1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd2">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="linkfoto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'pq'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
										<div class="d-block pt-2">
											<!-- <a href="#" class="stretched-link d-block lh-1"> -->
											<!-- <span class="h6 fw-normal"> -->
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												<xsl:with-param name="cssclass" select="'stretched-link d-block lh-1'"/>
											</xsl:call-template>
											<!-- </span> -->
											<!-- </a> -->
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>

					<div class="cor-ref-">
						<a href="{$url1}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
				<div class="tab-pane fade cor-ref-{$corref2}" id="tab{$ordembox}_2" role="tabpanel" aria-labelledby="tab{$ordembox}_2-tab">
					<xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd2">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="linkfoto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'pq'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
										<div class="d-block pt-2">
											<!-- <a href="#" class="stretched-link d-block lh-1"> -->
											<!-- <span class="h6 fw-normal"> -->
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												<xsl:with-param name="cssclass" select="'stretched-link d-block lh-1'"/>
											</xsl:call-template>
											<!-- </span> -->
											<!-- </a> -->
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="cor-ref-">
						<a href="{$url2}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
				<div class="tab-pane fade cor-ref-{$corref3}" id="tab{$ordembox}_3" role="tabpanel" aria-labelledby="tab{$ordembox}_3-tab">
					<xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
						<xsl:sort select="@publicacao" order="descending"/>
						<xsl:if test="position()&gt;=1 and position()&lt;=$qtd3">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
							<div class="bc-nota-tabs d-flex flex-column w-100 align-items-start position-relative pb-3 mb-3 border-bottom">
								<div class="row gx-3">
									<div class="col">
										<xsl:call-template name="linkfoto">
											<xsl:with-param name="arquivoimagem" select="fotodestaque/@arquivo" />
											<xsl:with-param name="cssclass" select="'img-fluid rounded-2'"/>
											<xsl:with-param name="tipo" select="'pq'"/>
											<xsl:with-param name="widthbox" select="'128'"/>
										</xsl:call-template>
									</div>
									<div class="col-8">
										<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
											</xsl:call-template>
										</span>
										<div class="d-block pt-2">
											<xsl:call-template name="linkmanchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												<xsl:with-param name="cssclass" select="'stretched-link d-block lh-1'"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="cor-ref-">
						<a href="{$url3}" class="btn btn-outline-primary d-block fw-bolder text-lowercase" title="">
							Ver mais
						</a>
					</div>
				</div>
			</div>

		</div>
	</xsl:template>
	<!-- Fim bc_ep_tabs Notícias -->

	<!-- Inicio bc_ep_5_noticias -->
	<xsl:template name="bc_ep_5_noticias">
		<xsl:param name="idsecao1" />
		<xsl:param name="idsecao2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="idsecao4" />
		<xsl:param name="idsecao5" />
		<xsl:param name="corref1" />
		<xsl:param name="corref2" />
		<xsl:param name="corref3" />
		<xsl:param name="corref4" />
		<xsl:param name="corref5" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:for-each select="//*[@idsecao=$idsecao1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
			<xsl:sort select="@publicacao" order="descending"/>
			<xsl:if test="position()&gt;=1 and position()&lt;=1">
				<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

				<div class="bc-nota cor-ref-{$corref1} d-flex flex-column w-100 align-items-start position-relative border-bottom pb-3 mb-3">
					<div class="ps-3" style="border-inline-start: 2px solid var(--bs-primary);">
						<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
							</xsl:call-template>
						</span>
						<div class="d-block pt-1">
							<span class="fw-normal">
								<xsl:call-template name="linkmanchete">
									<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									<xsl:with-param name="cssclass" select="'h4 stretched-link d-block lh-2'"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//*[@idsecao=$idsecao2]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
			<xsl:sort select="@publicacao" order="descending"/>
			<xsl:if test="position()&gt;=1 and position()&lt;=1">
				<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

				<div class="bc-nota cor-ref-{$corref2} d-flex flex-column w-100 align-items-start position-relative border-bottom pb-3 mb-3">
					<div class="ps-3" style="border-inline-start: 2px solid var(--bs-primary);">
						<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
							</xsl:call-template>
						</span>
						<div class="d-block pt-2">
							<span class="fw-normal">
								<xsl:call-template name="linkmanchete">
									<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									<xsl:with-param name="cssclass" select="'h4 stretched-link d-block lh-2'"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//*[@idsecao=$idsecao3]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
			<xsl:sort select="@publicacao" order="descending"/>
			<xsl:if test="position()&gt;=1 and position()&lt;=1">
				<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

				<div class="bc-nota cor-ref-{$corref3} d-flex flex-column w-100 align-items-start position-relative border-bottom pb-3 mb-3">
					<div class="ps-3" style="border-inline-start: 2px solid var(--bs-primary);">
						<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
							</xsl:call-template>
						</span>
						<div class="d-block pt-2">
							<span class="fw-normal">
								<xsl:call-template name="linkmanchete">
									<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									<xsl:with-param name="cssclass" select="'h4 stretched-link d-block lh-2'"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//*[@idsecao=$idsecao4]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
			<xsl:sort select="@publicacao" order="descending"/>
			<xsl:if test="position()&gt;=1 and position()&lt;=1">
				<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />

				<div class="bc-nota cor-ref-{$corref4} d-flex flex-column w-100 align-items-start position-relative border-bottom pb-3 mb-3">
					<div class="ps-3" style="border-inline-start: 2px solid var(--bs-primary);">
						<span class="d-flex chapeu fw-bolder small text-uppercase" style="color: var(--bs-primary);">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)" />
							</xsl:call-template>
						</span>
						<div class="d-block pt-2">
							<span class="fw-normal">
								<xsl:call-template name="linkmanchete">
									<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									<xsl:with-param name="cssclass" select="'h4 stretched-link d-block lh-2'"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>

	</xsl:template>
	<!-- Fim bc_ep_5_noticias -->

	<!--Versão dos boxes em AMP 2023 -->
	<!--Página para validações AMP https://search.google.com/test/rich-results-->

	<!-- AMP MANCHETE_A -->
	<xsl:template name="bc_amp_manchete_a">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>
		
		<div id="noticiaPrincipal">
			<div class="img-Destaque">
				<xsl:call-template name="link_amp_foto">
					<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
					<xsl:with-param name="tipo" select="'manchete'"/>
					<xsl:with-param name="widthbox" select="'731'"/>
					<xsl:with-param name="link" select="$link"/>
					<xsl:with-param name="cssclass" select="'408'"/>
					<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
					<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
				</xsl:call-template>
			</div>
			<div class="manchete">
				<h2>
					<span>
						<xsl:call-template name="linkmanchete">
							<xsl:with-param name="conteudo" select="$manchete"/>
							<xsl:with-param name="link" select="$link"/>
							<xsl:with-param name="cssclass" select="'display'"/>
						</xsl:call-template>
					</span>
				</h2>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
				<xsl:call-template name="get-destaque">
					<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			</div>
		</div>
	</xsl:template>

	<!-- AMP MANCHETE_ROTATIVAS_300 -->
	<xsl:template name="bc_amp_manchete_rotativas_300" class="amp-carousel">
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="link" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="nome-css-class">
			<xsl:choose>
				<xsl:when test="contains(@url,'PUBE,') or contains(@url,'BRND,')">
					<xsl:value-of select="'informepublicitario'" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
				&lt;amp-carousel width="416" height="353" type="slides" autoplay delay="5000" role="tablist" id="bc_amp_manchete_rotativas_300" class="amp-carousel" &gt;
			</xsl:text>
		</xsl:if>  

		<div class="card cardCarousel">

			<!-- IMAGENS DO CAROUSEL -->
			<xsl:call-template name="link_amp_foto" type="amp-carousel">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="cssclass" select="'imgCarousel'"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="tipo" select="'destaque'"/>
				<xsl:with-param name="widthbox" select="'576'" />
			</xsl:call-template>
			
			<!-- CHAMADA DA NOTICIA -->
			<figcaption class="{$nome-css-class} boxManchete">
				<!-- Chapeu -->
				<label class="chapeu">
					<span>
						<xsl:call-template name="get-assunto">
							<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)" />
						</xsl:call-template>
					</span>
				</label>
				<!-- Noticia -->
				<span class="manchete">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)" />
						<xsl:with-param name="link" select="$link" />
						<xsl:with-param name="cssclass" select="'stretched-link'"/>
					</xsl:call-template>
				</span>
			</figcaption>

		</div>

		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">  
				&lt;/amp-carousel&gt;
			</xsl:text>
		</xsl:if>

	</xsl:template>


	<!-- AMP MANCHETE_G -->
	<xsl:template name="bc_amp_manchete_g">
		<xsl:param name="idnoticia" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
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
		
		<xsl:variable name="author">
			<xsl:if test="$idnoticia=''">
				<xsl:value-of select="xsl-extensoes:BuscaAutorNoticia(@idnoticia)"/>
			</xsl:if>
			<xsl:if test="$idnoticia!=''">
				<xsl:value-of select="xsl-extensoes:BuscaAutorNoticia($idnoticia)"/>            
			</xsl:if>	    
		</xsl:variable>

		<div id="bc_manchete_g" class="bc_manchete_g d-block position-relative" itemscope="" itemtype="https://schema.org/NewsArticle">
			<xsl:call-template name="link_amp_foto">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="cssclass" select="'amp-img-fluid w-100 rounded-3'"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
				<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
				<xsl:with-param name="tipo" select="'destaque'"/>
				<xsl:with-param name="widthbox" select="'512'" />
			</xsl:call-template>
			<div class="d-block w-100">
				<div class="fw-bolder small chapeu d-inline-flex align-items-center text-uppercase mb-2 mt-3">
					<xsl:call-template name="linkassunto">
						<xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
						<xsl:with-param name="link" select="$link"/>
					</xsl:call-template>
				</div>
				<h3 class="h3 fw-bolder" itemprop="headline">
					<xsl:call-template name="linkmanchete">
						<xsl:with-param name="conteudo" select="$manchete"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="cssclass" select="'display'"/>
					</xsl:call-template>
				</h3>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="description" content="</xsl:text>
				<xsl:call-template name="get-destaque">
					<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="datePublished" content="</xsl:text>
				<xsl:value-of select="@publicacao" />
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;meta itemprop="dateModified" content="</xsl:text>
				<xsl:value-of select="@publicacao" />
				<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
				<xsl:value-of select="$author" disable-output-escaping="yes"/>							
			</div>
		</div>
	</xsl:template>




</xsl:stylesheet>

