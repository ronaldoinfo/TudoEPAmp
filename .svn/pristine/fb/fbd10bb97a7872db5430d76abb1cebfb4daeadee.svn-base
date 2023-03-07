<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
	<xsl:import href="../../xsl/xsl-funcoes/funcoes_portal_v6.xsl" />
	<xsl:import href="../../xsl/xsl-funcoes/funcoes_portal_v6.xsl" />

	<xsl:key name="todas" match="/" use="todas" />
	<xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />
	<xsl:variable name="galerias" select="xsl-extensoes:GetXmlGalerias()" />
	<xsl:variable name="sons" select="xsl-extensoes:GetXmlSons()" />
	<xsl:variable name="videos" select="xsl-extensoes:GetXmlVideos()" />

	<xsl:template name="bc_v6_minutoon">
		<xsl:param name="idsecao" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div id="bc_v6_minutoon" itemscope="" itemtype="http://schema.org/Periodical">

			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

			<span class="sub-logo">
				<a href="{$urlvertodos}" title="Minuto ON">
					<img src="https://statics.tudoep.com/tudoep.v56/img/logos/svg/minutoon.svg" alt="Minuto ON" width="130px" height="23.81px" />
				</a>

			</span>
			<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
				<xsl:sort select="@publicacao" order="descending" />

				<xsl:if test="position() = 1">

					<xsl:variable name="imagem">
						<xsl:call-template name="imagem-emc">
							<xsl:with-param name="arquivo" select="@arquivo" />
							<xsl:with-param name="mod" select="1" />
						</xsl:call-template>
					</xsl:variable>

					<xsl:variable name="newimagem">
						<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
					</xsl:variable>

					<div class="destaque-item-imagem">
						<a itemprop="relatedLink" class="img-thumb-zoom" href="onplay/{@url}.aspx" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Minuto ON - Notícia: {@manchete}">
							<figure>
								<img src="{$newimagem}" class="img-center" alt="" title="" />
							</figure>
						</a>
					</div>
					<div class="destaque-item-cont">
						<h4>
							<a itemprop="url" href="onplay/{@url}.aspx" data-track-category="Box - Minuto ON" data-track-event="click" data-track-label="Link: Minuto ON - {@manchete}">
								<span class="no-margin-top" itemprop="name">
									<xsl:call-template name="get-manchete">
										<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									</xsl:call-template>
								</span>
							</a>
						</h4>
					</div>
				</xsl:if>
			</xsl:for-each>

		</div>
	</xsl:template>

	<xsl:template name="bc_v6_onPlay_p">
		<xsl:param name="idsecao" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div id="bc_v6_onPlay_p" itemscope="" itemtype="http://schema.org/Periodical">

			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

			<span class="sub-logo">
				<a href="{$urlvertodos}" title="ON Play" >
					<img src="https://statics.tudoep.com/tudoep.v56/img/logos/svg/onplay.svg" alt="ON Play" width="130px" height="23.81px" />
				</a>
				<a href="{$urlvertodos}" class="vertodos">› Ver todos</a>
			</span>
			<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
				<xsl:sort select="@publicacao" order="descending" />

				<xsl:if test="position() = 1">

					<xsl:variable name="imagem">
						<xsl:call-template name="imagem-emc">
							<xsl:with-param name="arquivo" select="@arquivo" />
							<xsl:with-param name="mod" select="1" />
						</xsl:call-template>
					</xsl:variable>

					<xsl:variable name="newimagem">
						<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
					</xsl:variable>

					<div class="destaque-item-imagem">
						<a itemprop="relatedLink" class="img-thumb-zoom" href="onplay/{@url}.aspx" title="" data-track-category="Box - Notícias" data-track-event="click" data-track-label="Link: Imagem Minuto ON - Notícia: {@manchete}">
							<figure>
								<img src="{$newimagem}" class="img-center" alt="" title="" />
							</figure>
						</a>
					</div>
					<div class="destaque-item-cont">
						<h4>
							<a itemprop="url" href="onplay/{@url}.aspx" data-track-category="Box - Minuto ON" data-track-event="click" data-track-label="Link: Minuto ON - {@manchete}">
								<span class="no-margin-top" itemprop="name">
									<xsl:call-template name="get-manchete">
										<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
									</xsl:call-template>
								</span>
							</a>
						</h4>
					</div>
				</xsl:if>
			</xsl:for-each>

		</div>
	</xsl:template>

	<xsl:template name="bc_v6_OnPlay">
		<xsl:param name="idsecao" />
		<xsl:param name="idsecao2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="idsecao4" />
		<xsl:param name="idsecao5" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div id="bc_v6_OnPlay" itemscope="" itemtype="http://schema.org/Periodical">
			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			<span class="sub-logo">
				<a href="{$urlvertodos}" title="ON Play">
					<img src="https://statics.tudoep.com/tudoep.v56/img/logos/svg/onplay.svg" alt="ON Play" width="130px" height="23.81px" />
				</a>
				<a href="{$urlvertodos}" class="vertodos">› Ver todos</a>
			</span>

			<div class="row">
				<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
					<xsl:sort select="@publicacao" order="descending"/>
					<xsl:if test="position()=1">
						<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

						<xsl:variable name="imagem">
							<xsl:call-template name="imagem-emc">
								<xsl:with-param name="arquivo" select="@arquivo" />
								<xsl:with-param name="mod" select="1" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:variable name="newimagem">
							<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
						</xsl:variable>

						<xsl:variable name="data">
							<xsl:call-template name="formatasodata">
								<xsl:with-param name="data" select="@publicacao" />
							</xsl:call-template>
						</xsl:variable>

						<div class="col-12 col-md-6 col-xl-6">
							<div class="video-g">
								<a href="onplay/{@url}.aspx" class="cover">
									<img src="{$newimagem}"></img>
									<div class="descricao">
										<div class="manchete">
											<xsl:if test="string-length(@manchete) &lt;= 64">
												<xsl:value-of select="@manchete" />
											</xsl:if>
											<xsl:if test="string-length(@manchete) &gt; 64">
												<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
											</xsl:if>
										</div>
									</div>
								</a>
							</div>
						</div>
					</xsl:if>
				</xsl:for-each>

				<!--inicio coluna 2-->
				<div class="col-12 col-md-6">
					<div class="row no-gutters">
						<!--fazer dois foreachs separados, 1 com cada seção específica-->
						<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao2]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

								<xsl:variable name="imagem">
									<xsl:call-template name="imagem-emc">
										<xsl:with-param name="arquivo" select="@arquivo" />
										<xsl:with-param name="mod" select="1" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:variable name="newimagem">
									<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
								</xsl:variable>

								<xsl:variable name="data">
									<xsl:call-template name="formatasodata">
										<xsl:with-param name="data" select="@publicacao" />
									</xsl:call-template>
								</xsl:variable>
								<div class="col-6">
									<div class="video-p">
										<a href="onplay/{@url}.aspx" class="cover">
											<img src="{$newimagem}" alt=""></img>
											<div class="descricao">
												<div class="manchete">
													<xsl:if test="string-length(@manchete) &lt;= 64">
														<xsl:value-of select="@manchete" />
													</xsl:if>
													<xsl:if test="string-length(@manchete) &gt; 64">
														<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
													</xsl:if>
												</div>
											</div>
										</a>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao3]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

								<xsl:variable name="imagem">
									<xsl:call-template name="imagem-emc">
										<xsl:with-param name="arquivo" select="@arquivo" />
										<xsl:with-param name="mod" select="1" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:variable name="newimagem">
									<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
								</xsl:variable>

								<xsl:variable name="data">
									<xsl:call-template name="formatasodata">
										<xsl:with-param name="data" select="@publicacao" />
									</xsl:call-template>
								</xsl:variable>

								<div class="col-6">
									<div class="video-p">
										<a href="onplay/{@url}.aspx" class="cover">
											<img src="{$newimagem}" alt=""></img>
											<div class="descricao">
												<div class="manchete">
													<xsl:if test="string-length(@manchete) &lt;= 64">
														<xsl:value-of select="@manchete" />
													</xsl:if>
													<xsl:if test="string-length(@manchete) &gt; 64">
														<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
													</xsl:if>
												</div>
											</div>
										</a>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>

					<div class="row no-gutters">
						<!--fazer dois foreachs separados, 1 com cada seção específica-->
						<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao4]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

								<xsl:variable name="imagem">
									<xsl:call-template name="imagem-emc">
										<xsl:with-param name="arquivo" select="@arquivo" />
										<xsl:with-param name="mod" select="1" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:variable name="newimagem">
									<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
								</xsl:variable>

								<xsl:variable name="data">
									<xsl:call-template name="formatasodata">
										<xsl:with-param name="data" select="@publicacao" />
									</xsl:call-template>
								</xsl:variable>

								<div class="col-6">
									<div class="video-p">
										<a href="onplay/{@url}.aspx" class="cover">
											<img src="{$newimagem}" alt=""></img>
											<div class="descricao">
												<div class="manchete">
													<xsl:if test="string-length(@manchete) &lt;= 64">
														<xsl:value-of select="@manchete" />
													</xsl:if>
													<xsl:if test="string-length(@manchete) &gt; 64">
														<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
													</xsl:if>
												</div>
											</div>
										</a>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao5]//video[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idvideo)=false]">
							<xsl:sort select="@publicacao" order="descending"/>
							<xsl:if test="position()=1">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idvideo)" />

								<xsl:variable name="imagem">
									<xsl:call-template name="imagem-emc">
										<xsl:with-param name="arquivo" select="@arquivo" />
										<xsl:with-param name="mod" select="1" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:variable name="newimagem">
									<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
								</xsl:variable>

								<xsl:variable name="data">
									<xsl:call-template name="formatasodata">
										<xsl:with-param name="data" select="@publicacao" />
									</xsl:call-template>
								</xsl:variable>

								<div class="col-6">
									<div class="video-p">
										<a href="onplay/{@url}.aspx" class="cover">
											<img src="{$newimagem}" alt=""></img>
											<div class="descricao">
												<div class="manchete">
													<xsl:if test="string-length(@manchete) &lt;= 64">
														<xsl:value-of select="@manchete" />
													</xsl:if>
													<xsl:if test="string-length(@manchete) &gt; 64">
														<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
													</xsl:if>
												</div>
											</div>
										</a>
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

	<xsl:template name="bc_v6_OnClick">
		<xsl:param name="idsecao1" />
		<xsl:param name="idsecao2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<!--Trazer a última galeria de cada seção selecionada-->

		<div id="bc_v6_OnClick" itemscope="" itemtype="http://schema.org/Periodical">
			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			<span class="sub-logo">
				<a href="{$urlvertodos}" title="ON Click">
					<img src="https://statics.tudoep.com/tudoep.v56/img/logos/svg/onclick.svg" alt="ON Click" width="130px" height="23.81px" />
				</a>
				<a href="{$urlvertodos}" class="vertodos">› Ver todos</a>
			</span>
			<div class="row">
				<section role="complementary" class="simple white-back quotes no-fouc">
					<!--forsecao1-->
					<xsl:for-each select="$galerias//midiaCenter//*[@idsecao=$idsecao1]//galeria[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idgaleria != xsl-extensoes:ExisteValorSelecionado(@idgaleria)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:if test="position() = 1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idgaleria)" />
							<blockquote>
								<a href="onclick/{@url}">
									<img src="{$EMC_Fotos}/{@subPasta}{ xsl-extensoes:ReplaceStr(./fotos[1]/foto[last()]/@thumb, '_thumb', '' ) }" />
									<xsl:value-of select="@manchete" />
								</a>
							</blockquote>
						</xsl:if>
					</xsl:for-each>

					<!--forsecao2-->
					<xsl:for-each select="$galerias//midiaCenter//*[@idsecao=$idsecao2]//galeria[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idgaleria != xsl-extensoes:ExisteValorSelecionado(@idgaleria)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:if test="position() = 1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idgaleria)" />
							<blockquote>
								<a href="onclick/{@url}">
									<img src="{$EMC_Fotos}/{@subPasta}{ xsl-extensoes:ReplaceStr(./fotos[1]/foto[last()]/@thumb, '_thumb', '' ) }" />
									<xsl:value-of select="@manchete" />
								</a>
							</blockquote>
						</xsl:if>
					</xsl:for-each>

					<!--forsecao3-->
					<xsl:for-each select="$galerias//midiaCenter//*[@idsecao=$idsecao3]//galeria[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idgaleria != xsl-extensoes:ExisteValorSelecionado(@idgaleria)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:if test="position() = 1">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idgaleria)" />
							<blockquote>
								<a href="onclick/{@url}">
									<img src="{$EMC_Fotos}/{@subPasta}{ xsl-extensoes:ReplaceStr(./fotos[1]/foto[last()]/@thumb, '_thumb', '' ) }" />
									<xsl:value-of select="@manchete" />
								</a>
							</blockquote>
						</xsl:if>
					</xsl:for-each>

				</section>

			</div>
		</div>

	</xsl:template>

	<xsl:template name="bc_v6_Podcast">
		<xsl:param name="idsecao" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="quantidade" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div id="bc_v6_Podcast" itemscope="" itemtype="http://schema.org/Periodical">
			<xsl:text disable-output-escaping="yes">&lt;meta itemprop="alternateName" content="</xsl:text>
			<xsl:call-template name="get-manchete">
				<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
			<span class="sub-logo">
				<a href="{$urlvertodos}" title="Podcast">
					<img src="https://statics.tudoep.com/tudoep.v56/img/logos/tit-podcast.jpg" alt="Podcast" width="130px" height="23.81px" />
				</a>
			</span>
			<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
				<xsl:sort select="@publicacao" order="descending" />
				<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
					<ul>
						<li>
							<a href="podcasts/{@url}">
								<xsl:value-of select="@manchete" />
							</a>
						</li>
					</ul>
				</xsl:if>
			</xsl:for-each>
			<a href="{$urlvertodos}" class="lnk">[+] ouça mais</a>
		</div>
	</xsl:template>


	<xsl:template name="bc_v6_ultimos_podcasts">
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="idsecao2" />
		<xsl:param name="idsecao3" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:variable name="EMC_Fotos" select="xsl-extensoes:getValueAppSettings('EMC_Fotos')" />

		<div id="mosaico" class="welcome-blog-post-slide w-100 d-flex-sm-grid px-sm-3 op-alt op-ajuste ajuste2 bg-transparent row g-0 mx-auto" itemscope="" itemtype="http://schema.org/Periodical">

			<!-- = Início da Coluna 1 - Slider conforme quantidade = -->
			<div class="grid-col-1 pl-0 mb-2 mb-sm-0">
				<div class="d-flex align-items-stretch pr-md-1">
					<div id="cbn-slider-home" class="destaquescbn owl-carousel owl-loaded owl-drag h-100">
						<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
							<xsl:sort select="@publicacao" order="descending" />
							<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
								<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
								<div class="single-blog-post-slide bg-gray-imgfx background-overlay-5 ajustaoverlay d-flex align-items-stretch">
									<div class="icones-player position-absolute w-100 d-flex pt-2 mt-1 pr-2 align-items-center" style="top: 0;">
										<a href="#" class="pl-3 ml-auto" title="player" onclick="alterarPlay({@idsom})">
											<i class="bi bi-play-circle fa-lg">
												<span class="d-none"></span>
											</i>
										</a>
									</div>
									<a href="noticias/{@url}">
										<div class="single-blog-post-content d-flex flex-column justify-content-end align-items-start pl-1 pr-4">
											<div class="tags position-absolute mt-2 text-uppercase" style="top: 0;">
												<span class="tagspan p-1">
													<xsl:call-template name="get-assunto">
														<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
													</xsl:call-template>
												</span>
											</div>
											<h3 class="titulo-slide">
												<xsl:call-template name="get-manchete">
													<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												</xsl:call-template>
											</h3>
											<p class="linhafina font-italic text-dark mt-1 pb-0 mb-0">
												<xsl:call-template name="get-destaque">
													<xsl:with-param name="conteudo" select="translate(@destaque, $quot, $apos)"/>
												</xsl:call-template>
											</p>
										</div>
									</a>
									<xsl:call-template name="linkfotomanchete">
										<xsl:with-param name="arquivoimagem" select="''" />
										<xsl:with-param name="tipo" select="'manchete'"/>
										<xsl:with-param name="tamanho" select="'100'"/>
									</xsl:call-template>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</div>
			</div>
			<!-- = Início da Coluna 2 = Outros Destaques -->
			<div id="outros-destaques" class="grid-col-2 px-0">
				<div class="row gx-2 gy-0 pr-md-2 align-items-stretch h-100">

					<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao2]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:if test="position()&gt;=1 and position()&lt;=2">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
							<div class="noticia col-6 d-flex ">
								<div class="card text-white border-0 rounded-0 bg-gray-imgfx background-overlay-5 d-flex align-items-end flex-column-reverse flex-md-column w-100">
									<div class="icones-player position-absolute w-100 d-flex pt-sm-2 mt-1 pr-2 align-items-center" style="top: 0;">
										<a href="#" class="pl-3 ml-auto" title="player" onclick="alterarPlay({@idsom})" >
											<i class="bi bi-play-circle fa-lg">
												<span class="d-none"> </span>
											</i>
										</a>
									</div>
									<a href="/podcasts/{@url}" class="stretched-link w-100 d-flex flex-column-reverse">
										<div class="card-img-overlay d-flex flex-column justify-content-end text-left px-2 px-sm-3">
											<div class="cbnrb2020-post-tag position-absolute mt-2 pt-sm-1">
												<span class="tagspan p-1">
													<xsl:call-template name="get-assunto">
														<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
													</xsl:call-template>
												</span>
											</div>
											<p class="card-title font-weight-bold font-base">
												<xsl:call-template name="get-manchete">
													<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
												</xsl:call-template>
											</p>
										</div>
										<xsl:call-template name="linkfotomanchete">
											<xsl:with-param name="arquivoimagem" select="''" />
											<xsl:with-param name="tipo" select="'destaque'"/>
											<xsl:with-param name="tamanho" select="'100'"/>
										</xsl:call-template>
									</a>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao3]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
						<xsl:sort select="@publicacao" order="descending" />
						<xsl:if test="position()&gt;=1 and position()&lt;=2">
							<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
							<div class="colunista col-6 d-flex align-items-start">
								<div class="col background-overlay-alt">
									<div class="d-block bg-gray-imgfx imgfx-alt mr-2 mr-md-3 overflow-hidden">
										<xsl:call-template name="linkfotodestaque">
											<xsl:with-param name="arquivoimagem" select="''" />
											<xsl:with-param name="tipo" select="'destaque'"/>
											<xsl:with-param name="tamanho" select="'100'"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="col-8 pr-2 pt-md-3 d-flex flex-column h-100">
									<a href="/podcasts/{@url}" class="link d-flex flex-column">
										<p class="titulo h6 font-base text-primary font-italic font-weight-bolder">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
											</xsl:call-template>
										</p>
										<p class="linhafina small font-base mb-0">
											<xsl:call-template name="get-manchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
											</xsl:call-template>
										</p>
									</a>
									<div class="icones-player lista w-100 mt-auto mb-lg-2" style="margin-top: 2px;">
										<a href="#" class="pr-3" title="player" onclick="alterarPlay({@idsom})">
											<i class="bi bi-play-circle fa-lg text-dark">
												<span class="d-none"></span>
											</i>

										</a>
									</div>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>
			</div>



			<!-- = Início da Coluna 3 = Ao Vivo -->
			<div id="aovivo-widget" class="single-breaking-news-widget layout2 grid-col-3 pr-0 mb-0 mt-3 mt-sm-0 ajuste-ffx-1">
				<div class="w-100 cbn-widget p-2 p-xl-3 d-flex flex-column align-items-stretch h-100">
					<div class="d-flex flex-column align-items-center align-self-stretch justify-content-start ajuste-ffx-2" style="height: 40px;">
						<div class="cbnrb2020-post-tag row justify-content-start align-items-stretch align-items-md-start w-100 mx-auto" style="z-index: 1000;">
							<span class="col-3 col-md-5 col-lg tagspan tag-aovivo text-white my-auto mt-md-0">
								<i class="bi bi-circle-fill text-white pulse2">
									<span class="d-none">pulse</span>
								</i> AO VIVO
							</span>
							<a class="col-1 col-md-3 col-lg-1 tagspan falecom text-white p-1 my-auto mt-md-0" href="/faleconosco/faleconosco.aspx" title="Fale Conosco - CBN Ribeirão Preto">
								<i class="bi bi-envelope-fill text-white">
									<span class="d-none">envelope</span>
								</i>
							</a>

							<p id="nomeradiofiliada" class="col-8 col-md col-lg-8 d-flex align-items-center justify-content-end justify-content-md-start justify-content-lg-end px-0 pr-xl-0 ml-auto text-xl-right font-enfase text-dark py-0 mb-0 pt-md-4 pt-lg-0 my-xl-0" style="margin-top: -4px !important;">
								<span class="pr-2 mr-2 border-right ">Ribeirão Preto</span>
								<span class="">90,5FM</span>
								<!-- span class="text-dark px-2">-</span -->
								<span class="d-flex float-right p-2 border border-secondary rounded-circle align-items-center justify-content-center ml-2" style="width: 30px; height: 30px;">
									<i class="bi bi-building h5 my-0 p-0 text-secondary mx-auto">
										<span class="d-none">building</span>
									</i>
								</span>
							</p>
						</div>

						<div class="row my-auto justify-content-between g-0 mt-3 mt-xxl-5 w-100" style="max-height: 8.6rem;">
							<p class="col-5 col-md-12 col-lg-5 pr-0 my-auto d-flex align-items-center justify-content-center" id="CBNestudio">
								<span class="h3 text-dark mb-0 text-left">CBN Ribeirão</span>
							</p>
							<div class="col col-md-12 col-lg d-flex flex-wrap align-items-center">
								<!-- <div class="col text-center border-right position-relative"> -->
								<div class="col text-center position-relative">
									<a class="tagspan ouvir btn btn-lg d-block stretched-link text-dark mb-0 p-0" onclick="window.open('/aovivo/default.aspx', 'audio', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resisable=no, top=40, left=40, width=650, height=450');" title="Ouça a CBN Ribeirão Preto Ao Vivo">
										<i class="bi bi-headphones display-5 m-0 text-dark">
											<span class="d-none">headphones</span>
										</i>
									</a>
									<span class="text-dark font-base font-italic text-lowercase text-center mx-auto">
										<small class="">Ouvir</small>
									</span>
								</div>
								<!--  <div class="col text-center pr-0 position-relative">
                  <a class="tagspan assistir d-block stretched-link text-dark mb-0" href="#" title="Assistir à rádio CBN Ribeirão Preto">
                    <i class="fas fa-2x fa-video text-dark text-shadow">
                      <span class="d-none">video</span>
                    </i>
                  </a>
                  <span class="text-dark font-base font-italic text-lowercase text-center mx-auto">
                    <small class="">Assistir</small>
                  </span>
                </div> -->
							</div>
						</div>
					</div>
					<div id="filiadas" class="d-flex flex-column ml-md-auto col-12 px-0 mt-auto">
						<div class="custom-scroll sb-container sb-container-noscroll">

							<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
								<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnribeirao.com.br/">
									<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
										<i class="bi bi-building h5 my-0 p-0 text-dark mx-auto">
											<span class="d-none">building</span>
										</i>
									</span>
									<small class="col border-right line-height-normal text-dark text-break">Ribeirão Preto</small>
									<small class="col-4 col-md text-dark px-2">90,5FM</small>
								</a>
								<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16996439050" itemprop="url" title="Whatsapp da Rádio CBN Ribeirão Preto" alt="Whatsapp da Rádio CBN Ribeirão Preto">
									<i class="bi bi-whatsapp text-success small">
										<span class="d-none">phone</span>
									</i>
									<span class="numero small" itemprop="name"> (16) 99643-9050</span>
								</a>
							</span>

							<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
								<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnararaquara.com.br/" target="_blank">
									<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
										<i class="bi bi-building h5 my-0 p-0 text-dark mx-auto">
											<span class="d-none">building</span>
										</i>
									</span>
									<small class="col border-right line-height-normal text-dark text-break">Araraquara</small>
									<small class="col-4 col-md text-dark px-2">95,7FM</small>
								</a>
								<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16992874818" itemprop="url" title="Whatsapp da Rádio CBN Araraquara" alt="Whatsapp da Rádio CBN Araraquara">
									<i class="bi bi-whatsapp text-success small">
										<span class="d-none">phone</span>
									</i>
									<span class="numero small" itemprop="name"> (16) 99287-4818</span>
								</a>
							</span>

							<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
								<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnsaocarlos.com.br/" target="_blank">
									<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
										<i class="bi bi-building h5 my-0 p-0 text-dark mx-auto">
											<span class="d-none">building</span>
										</i>
									</span>
									<small class="col border-right line-height-normal text-dark text-break">São Carlos</small>
									<small class="col-4 col-md text-dark px-2">103,9FM</small>
								</a>
								<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16992924774" itemprop="url" title="Whatsapp da Rádio CBN São Carlos" alt="Whatsapp da Rádio CBN São Carlos">
									<i class="bi bi-whatsapp text-success small">
										<span class="d-none">phone</span>
									</i>
									<span class="numero small" itemprop="name"> (16) 99292-4774</span>
								</a>
							</span>

						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="bc_v6_SlideHomeVideos">
		<xsl:param name="idsecao" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="position()=1">
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

		<xsl:for-each select="$videos//midiaCenter//*[@idsecao=$idsecao]//video[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idvideo != xsl-extensoes:ExisteValorSelecionado(@idvideo)]">
			<xsl:sort select="@publicacao" order="descending" />
			<div class="SlideNoticiasHome fadebox">

				<xsl:variable name="imagem">
					<xsl:call-template name="imagem-emc">
						<xsl:with-param name="arquivo" select="@arquivo" />
						<xsl:with-param name="mod" select="1" />
					</xsl:call-template>
				</xsl:variable>

				<xsl:variable name="newimagem">
					<xsl:value-of select="xsl-extensoes:ReplaceStr(xsl-extensoes:ReplaceStr($imagem,'.mp4',''),'.flv','')" />
				</xsl:variable>

				<div class="destaque-item-imagem float-none overflow-hidden bg-black2">
					<a itemprop="relatedLink" class="img-thumb-zoom" href="estradeiros/{@url}.aspx" title="" data-track-category="Box - Vídeos" data-track-event="click" data-track-label="Vídeo: {@manchete}">
						<figure class="m-0">
							<img src="{$newimagem}" class="img-center img-fluid" alt="" title="" style="object-fit: none;" />
						</figure>
					</a>
				</div>

				<div class="descricao">
					<div class="chapeu">
						<xsl:if test="string-length(@assunto) &lt;= 64">
							<xsl:value-of select="@assunto" />
						</xsl:if>
						<xsl:if test="string-length(@assunto) &gt; 64">
							<xsl:value-of select="concat(substring(@assunto,1,61),'...')" />
						</xsl:if>
					</div>
					<div class="manchete">
						<xsl:if test="string-length(@manchete) &lt;= 64">
							<xsl:value-of select="@manchete" />
						</xsl:if>
						<xsl:if test="string-length(@manchete) &gt; 64">
							<xsl:value-of select="concat(substring(@manchete,1,61),'...')" />
						</xsl:if>
					</div>
				</div>

			</div>
		</xsl:for-each>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>

		<xsl:text disable-output-escaping="yes">    
            &lt;/div&gt;              
            &lt;/div&gt;              
     </xsl:text>

	</xsl:template>

	<xsl:template name="bc_podcasts_agencia">
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="url" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>
		<div id="bc_podcasts_agencia">
			<div class="cbnrb2020-todays-post">
				<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
					<xsl:sort select="@publicacao" order="descending" />
					<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
						<div class="cbnrb2020-single-todays-post d-flex align-items-stretch position-relative mb-4">
							<div class="todays-post-thumb bg-gray-imgfx">
								<a href="/noticias/{@url}" class="font-pt">
									<xsl:call-template name="get-foto">
										<xsl:with-param name="tipo" select="'destaque'"/>
										<xsl:with-param name="arquivoimagem" select="''" />
										<xsl:with-param name="tamanho" select="'100'"/>
									</xsl:call-template>
								</a>

								<!-- <div class="icones-player w-100 d-block d-sm-none" style="margin-top: 2px;"> -->
								<div class="icones-player w-100 d-flex d-sm-none" style="margin-top: 2px;">
									<!-- <a class="btn py-3 m-0 text-dark" title="player" onclick="">
                      <svg width="92%" height="65px" viewBox="0 0 16 16" class="bi bi-play-fill border border-dark rounded-circle d-flex mx-auto pl-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z" />
                      </svg>
                    </a> -->
									<a class="btn py-4 px-0 mx-auto text-dark" title="player" onclick="alterarPlay({@idsom})">
										<i class="bi bi-play-circle fa-lg play-2 text-dark">
											<span class="d-none">play</span>
										</i>
									</a>
								</div>
							</div>
							<div class="todays-post-content">
								<div class="d-flex justify-content-between">
									<!-- Post Tag -->
									<div class="cbnrb2020-post-tag">
										<a href="/noticias/{@url}" class="font-pt">
											<xsl:call-template name="get-assunto">
												<xsl:with-param name="conteudo" select="@assunto"/>
											</xsl:call-template>
										</a>
									</div>
									<div class="icones-player lista flex-fill d-none d-sm-flex pr-2" style="margin-top: 2px;">
										<a class="btn py-0 m-0 pl-3" title="player" onclick="alterarPlay({@idsom})">
											<i class="bi bi-play-circle fa-lg text-dark">
												<span class="d-none">play</span>
											</i>
										</a>
									</div>
								</div>
								<h3>
									<a href="/noticias/{@url}" class="font-pt">
										<xsl:call-template name="get-manchete">
											<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
										</xsl:call-template>
									</a>
								</h3>
								<p>
									<a href="/noticias/{@url}" class="font-pt">
										<xsl:call-template name="get-destaque">
											<xsl:with-param name="conteudo" select="@destaque"/>
										</xsl:call-template>
									</a>
								</p>

							</div>
						</div>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="bc_podcasts_programas">
		<xsl:param name="manchete" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="cbnrb2020-heading">
			<a href="/podcasts/programas/" class="h6 d-flex flex-wrap font-pt text-uppercase border-0 align-items-center mb-4" title="Podcasts - Programas" style="letter-spacing: 1px">
				<small class="my-auto mr-3" style="font-size: 0.5em !important">
					<i class="bi bi-circle-fill">
						<span class="d-none"></span>
					</i>
				</small>
				<strong>Programas</strong>
			</a>
		</div>

		<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
			<xsl:sort select="@publicacao" order="descending" />
			<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
				<div class="cbnrb2020-single-category-post row g-0 align-items-start pt-0 border-0">
					<div class="col-4 dont-miss-post-thumb">
						<xsl:call-template name="get-foto">
							<xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
							<xsl:with-param name="tipo" select="'pq'"/>
							<xsl:with-param name="tamanho" select="'116'"/>
							<xsl:with-param name="altura" select="'100'"/>
							<xsl:with-param name="cssclass" select="'img-fluid'"/>
						</xsl:call-template>
					</div>

					<div class="col-8 pl-3">
						<h6>
							<a href="/podcasts/{@url}" class="font-pt">
								<xsl:call-template name="get-manchete">
									<xsl:with-param name="conteudo" select="$manchete"/>
								</xsl:call-template>
							</a>
						</h6>
						<div class="icones-player sidebar w-100 d-flex pr-2">
							<a href="#" class="pr-3" title="player" onclick="alterarPlay({@idsom})">
								<i class="bi bi-play-circle color">
									<span class="d-none"></span>
								</i>
							</a>
							<span class="ml-auto mt-1 text-right">
								<xsl:call-template name="formatasodata">
									<xsl:with-param name="data" select="@publicacao" />
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="bc_podcasts_colunistas">
		<xsl:param name="manchete" />
		<xsl:param name="assunto" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="cbnrb2020-heading">
			<a href="/podcasts/colunistas/" class="h6 d-flex flex-wrap font-pt text-uppercase border-0 align-items-center mb-4" title="Podcasts - Colunistas" style="letter-spacing: 1px">
				<small class="my-auto mr-3" style="font-size: 0.5em !important">
					<i class="bi bi-circle-fill">
						<span class="d-none"></span>
					</i>
				</small>
				<strong>Colunistas</strong>
			</a>
		</div>

		<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
			<xsl:sort select="@publicacao" order="descending" />
			<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
				<div class="cbnrb2020-single-category-post row g-0 align-items-start pt-0 border-0">
					<div class="col-4 dont-miss-post-thumb">
						<xsl:call-template name="get-foto">
							<xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
							<xsl:with-param name="tipo" select="'pq'"/>
							<xsl:with-param name="tamanho" select="'116'"/>
							<xsl:with-param name="altura" select="'100'"/>
							<xsl:with-param name="cssclass" select="'img-fluid'"/>
						</xsl:call-template>
					</div>

					<div class="col-8 pl-3">
						<h6>
							<a href="/podcasts/{@url}" class="font-pt">
								<xsl:call-template name="get-manchete">
									<xsl:with-param name="conteudo" select="$manchete"/>
								</xsl:call-template>
							</a>
						</h6>
						<div class="icones-player sidebar w-100 d-flex pr-2">
							<a href="#" class="pr-3" title="player" onclick="alterarPlay({@idsom})">
								<i class="bi bi-play-circle color">
									<span class="d-none"></span>
								</i>
							</a>

							<div class="mat col2 last">
								<ul class="action abv pull-left">
									<li>
										<a class="share" href="#share" id="shareId" onclick="myCompartilha('{@url}')">
											<i class="fa fa-share-square fa-lg">
												<span class="d-none"></span>
											</i>
										</a>
									</li>
								</ul>
							</div>

							<span class="ml-auto mt-1 text-right">
								<xsl:call-template name="formatasodata">
									<xsl:with-param name="data" select="@publicacao" />
								</xsl:call-template>
							</span>
						</div>

					</div>
				</div>
			</xsl:if>
		</xsl:for-each>


	</xsl:template>

	<xsl:template name="bc_cbn_slide_rotativo">
		<xsl:param name="idpodcast" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="destaque" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<!-- = Início da Coluna 1 - Slider conforme quantidade = -->
		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
            &lt;div id="bc_cbn_slide_rotativo" class="mosaico welcome-blog-post-slide op-alt op-ajuste ajuste3 bg-transparent"&gt;
            &lt;div class="d-flex align-items-stretch pr-md-1"&gt;
            &lt;div id="cbn-slider-home" class="destaquescbn owl-carousel owl-loaded owl-drag h-100"&gt;
        </xsl:text>
		</xsl:if>

		<div class="single-blog-post-slide bg-gray-imgfx background-overlay-5 ajustaoverlay d-flex align-items-stretch" itemscope="" itemtype="http://schema.org/Periodical">
			<div class="icones-player position-absolute w-100 d-flex pt-2 mt-1 pr-2 align-items-center" style="top: 0;">
				<a href="#" class="pl-3 ml-auto" title="player" onclick="alterarPlay({$idpodcast})">
					<i class="bi bi-play-circle fa-lg">
						<span class="d-none"></span>
					</i>
				</a>
			</div>
			<a href="{$link}">
				<div class="single-blog-post-content d-flex flex-column justify-content-end align-items-start pl-1 pr-4">
					<div class="tags position-absolute mt-2 text-uppercase" style="top: 0;">
						<span class="tagspan p-1">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
							</xsl:call-template>
						</span>
					</div>
					<h3 class="titulo-slide">
						<xsl:call-template name="get-manchete">
							<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
						</xsl:call-template>
					</h3>
					<p class="linhafina font-italic text-dark mt-1 pb-0 mb-0">
						<xsl:call-template name="get-destaque">
							<xsl:with-param name="conteudo" select="translate($destaque, $quot, $apos)"/>
						</xsl:call-template>
					</p>
				</div>
			</a>
			<xsl:call-template name="linkfotomanchete">
				<xsl:with-param name="arquivoimagem" select="translate($imagemmanchete, $quot, $apos)" />
				<xsl:with-param name="tipo" select="'destaque'"/>
				<xsl:with-param name="tamanho" select="'100'"/>
			</xsl:call-template>
		</div>


		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
            &lt;/div&gt;
            &lt;/div&gt;
        </xsl:text>
		</xsl:if>

	</xsl:template>


	<xsl:template name="bc_cbn_programas_colunistas">
		<xsl:param name="idsecao" />
		<xsl:param name="idsecao1" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>


		<div id="outros-destaques" class="col-lg-6 col-xl-7 px-0">
			<div class="row gx-2 gy-0 pr-md-2 align-items-stretch h-100">

				<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
					<xsl:sort select="@publicacao" order="descending" />
					<xsl:if test="position()&gt;=1 and position()&lt;=2">
						<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
						<div class="noticia col-6 d-flex ">
							<div class="card text-white border-0 rounded-0 bg-gray-imgfx background-overlay-5 d-flex align-items-end flex-column-reverse flex-md-column w-100">
								<div class="icones-player position-absolute w-100 d-flex pt-sm-2 mt-1 pr-2 align-items-center" style="top: 0;">
									<a href="#" class="pl-3 ml-auto" title="player" onclick="alterarPlay({@idsom})" >
										<i class="bi bi-play-circle fa-lg">
											<span class="d-none"> </span>
										</i>
									</a>
								</div>
								<a href="/podcasts/{@url}" class="stretched-link w-100 d-flex flex-column-reverse">
									<div class="card-img-overlay d-flex flex-column justify-content-end text-left px-2 px-sm-3">
										<div class="cbnrb2020-post-tag position-absolute mt-2 pt-sm-1">
											<span class="tagspan p-1">
												<xsl:call-template name="get-assunto">
													<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
												</xsl:call-template>
											</span>
										</div>
										<p class="card-title font-weight-bold font-base">
											<xsl:call-template name="get-manchete">
												<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
											</xsl:call-template>
										</p>
									</div>
									<xsl:call-template name="linkfotomanchete">
										<xsl:with-param name="arquivoimagem" select="''" />
										<xsl:with-param name="tipo" select="'destaque'"/>
										<xsl:with-param name="tamanho" select="'100'"/>
									</xsl:call-template>
								</a>
							</div>
						</div>
					</xsl:if>


				</xsl:for-each>

				<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao1]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
					<xsl:sort select="@publicacao" order="descending" />
					<xsl:if test="position()&gt;=1 and position()&lt;=2">
						<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
						<div class="colunista col-6 d-flex align-items-start">
							<div class="col background-overlay-alt">
								<div class="d-block bg-gray-imgfx imgfx-alt mr-2 mr-md-3 overflow-hidden">
									<xsl:call-template name="linkfotodestaque">
										<xsl:with-param name="arquivoimagem" select="''" />
										<xsl:with-param name="tipo" select="'destaque'"/>
										<xsl:with-param name="tamanho" select="'100'"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="col-8 pr-2 pt-md-3 d-flex flex-column h-100">
								<a href="/podcasts/{@url}" class="link d-flex flex-column">
									<p class="titulo h6 font-base text-primary font-italic font-weight-bolder">
										<xsl:call-template name="get-assunto">
											<xsl:with-param name="conteudo" select="translate(@assunto, $quot, $apos)"/>
										</xsl:call-template>
									</p>
									<p class="linhafina small font-base mb-0">
										<xsl:call-template name="get-manchete">
											<xsl:with-param name="conteudo" select="translate(@manchete, $quot, $apos)"/>
										</xsl:call-template>
									</p>
								</a>
								<div class="icones-player lista w-100 mt-auto mb-lg-2" style="margin-top: 2px;">
									<a href="#" class="pr-3" title="player" onclick="alterarPlay({@idsom})">
										<i class="bi bi-play-circle fa-lg text-dark">
											<span class="d-none"></span>
										</i>

									</a>
								</div>
							</div>
						</div>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="bc_cbn_programas_estatico">
		<xsl:param name="idpodcast" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>


		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
            &lt;div id="bc_cbn_programas_estatico" class=""&gt;
            &lt;div id="outros-destaques" class=""&gt;
            &lt;div id="" class="mosaico row gx-2 gy-0 pr-md-2 align-items-stretch h-100"&gt;
        </xsl:text>
		</xsl:if>

		<div class="noticia col-6 d-flex ">
			<div class="card text-white border-0 rounded-0 bg-gray-imgfx background-overlay-5 d-flex align-items-end flex-column-reverse flex-md-column w-100">
				<div class="icones-player position-absolute w-100 d-flex pt-sm-2 mt-1 pr-2 align-items-center" style="top: 0;">
					<a href="#" class="pl-3 ml-auto" title="player" onclick="alterarPlay({$idpodcast})" >
						<i class="bi bi-play-circle fa-lg">
							<span class="d-none"> play icon </span>
						</i>
					</a>
				</div>
				<a href="{$link}" class="stretched-link w-100 d-flex flex-column-reverse">
					<div class="card-img-overlay d-flex flex-column justify-content-end text-left px-2 px-sm-3">
						<div class="cbnrb2020-post-tag position-absolute mt-2 pt-sm-1">
							<span class="tagspan p-1">
								<xsl:call-template name="get-assunto">
									<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
								</xsl:call-template>
							</span>
						</div>
						<p class="card-title font-weight-bold font-base">
							<xsl:call-template name="get-manchete">
								<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
							</xsl:call-template>
						</p>
					</div>
					<xsl:call-template name="linkfotomanchete">
						<xsl:with-param name="arquivoimagem" select="translate($imagemmanchete, $quot, $apos)" />
						<xsl:with-param name="tipo" select="'manchete'"/>
						<xsl:with-param name="tamanho" select="'100'"/>
					</xsl:call-template>
				</a>
			</div>
		</div>


		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
            &lt;/div&gt;
            &lt;/div&gt;
        </xsl:text>
		</xsl:if>


	</xsl:template>

	<xsl:template name="bc_cbn_colunistas_estatico">
		<xsl:param name="idpodcast" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="position" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<xsl:if test="$position='1'">
			<xsl:text disable-output-escaping="yes">
            &lt;div id="bc_cbn_colunistas_estatico" class=""&gt;
            &lt;div id="outros-destaques" class=""&gt;
            &lt;div id="" class="row gx-2 gy-0 pr-md-2 align-items-stretch h-100"&gt;
        </xsl:text>
		</xsl:if>

		<div class="colunista col-6 d-flex align-items-start">
			<div class="col background-overlay-alt">
				<div class="d-block bg-gray-imgfx imgfx-alt mr-2 mr-md-3 overflow-hidden">
					<xsl:call-template name="linkfotodestaque">
						<xsl:with-param name="arquivoimagem" select="translate($imagemmanchete, $quot, $apos)" />
						<xsl:with-param name="tipo" select="'destaque'"/>
						<xsl:with-param name="tamanho" select="'100'"/>
					</xsl:call-template>
				</div>
			</div>
			<div class="col-8 pr-2 pt-md-3 d-flex flex-column h-100">
				<a href="{$link}" class="link d-flex flex-column">
					<p class="titulo h6 font-base text-primary font-italic font-weight-bolder">
						<xsl:call-template name="get-assunto">
							<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
						</xsl:call-template>
					</p>
					<p class="linhafina small font-base mb-0">
						<xsl:call-template name="get-manchete">
							<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
						</xsl:call-template>
					</p>
				</a>
				<div class="icones-player lista w-100 mt-auto mb-lg-2" style="margin-top: 2px;">
					<a href="#" class="pr-3" title="player" onclick="alterarPlay({$idpodcast})">
						<i class="bi bi-play-circle fa-lg text-dark">
							<span class="d-none"></span>
						</i>

					</a>
				</div>
			</div>
		</div>

		<xsl:if test="$position='ultimo'">
			<xsl:text disable-output-escaping="yes">  
            &lt;/div&gt;
            &lt;/div&gt;
            &lt;/div&gt;
        </xsl:text>
		</xsl:if>


	</xsl:template>


	<xsl:template name="bc_ao_vivo_CBN">
		<div id="aovivo-widget" class="single-breaking-news-widget layout2 col pr-0 mb-0 mt-3 mt-sm-0 ajuste-ffx-1">
			<div class="w-100 cbn-widget p-2 p-xl-3 d-flex flex-column align-items-stretch ajuste3 h-100">
				<div class="d-flex flex-column align-items-center align-self-stretch justify-content-start ajuste-ffx-2" style="height: 40px;">
					<div class="cbnrb2020-post-tag row justify-content-start align-items-stretch align-items-md-start w-100 mx-auto" style="z-index: 1000;">
						<span class="col-3 col-md-5 col-lg tagspan tag-aovivo text-white my-auto mt-md-0">
							<i class="bi bi-circle-fill text-white pulse2">
								<span class="d-none">pulse</span>
							</i> AO VIVO
						</span>
						<a class="col col-md-3 col-lg-1 tagspan falecom text-white p-1 my-auto mt-md-0" href="/faleconosco/faleconosco.aspx" title="Fale Conosco - CBN Ribeirão Preto">
							<i class="bi bi-envelope-fill text-white">
								<span class="d-none">envelope</span>
							</i>
						</a>

						<p id="nomeradiofiliada" class="col-8 col-md col-lg-8 d-flex align-items-center justify-content-end justify-content-md-start justify-content-lg-end px-0 pr-xl-0 ml-auto text-xl-right font-enfase text-dark py-0 mb-0 pt-md-4 pt-lg-0 my-xl-0" style="margin-top: -4px !important;">
							<span class="pr-2 mr-2 border-right ">Ribeirão Preto</span>
							<span class="">90,5FM</span>
							<!-- span class="text-dark px-2">-</span -->
							<span class="d-flex float-right p-2 border border-secondary rounded-circle align-items-center justify-content-center ml-2" style="width: 30px; height: 30px;">
								<i class="bi bi-building h4 fa-lg text-secondary mx-auto">
									<span class="d-none">building</span>
								</i>
							</span>
						</p>
					</div>

					<div class="row my-auto justify-content-between g-0 mt-3 mt-xxl-5 w-100" style="max-height: 8.6rem;">
						<p class="col-5 col-md-12 col-lg-5 pr-0 my-auto d-flex align-items-center justify-content-center" id="CBNestudio">
							<span class="h4 text-dark mb-0 text-left">CBN Ribeirão</span>
						</p>
						<div class="col col-md-12 col-lg d-flex flex-wrap align-items-center">
							<!-- <div class="col text-center border-right position-relative"> -->
							<div class="col text-center position-relative">
								<a class="tagspan ouvir btn btn-lg d-block stretched-link text-dark mb-0 p-0" onclick="window.open('/aovivo/default.aspx', 'audio', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resisable=no, top=40, left=40, width=650, height=450');" title="Ouça a CBN Ribeirão Preto Ao Vivo">
									<i class="fas fa-2x fa-headphones text-dark text-shadow">
										<span class="d-none">headphones</span>
									</i>
								</a>
								<span class="text-dark font-base font-italic text-lowercase text-center mx-auto">
									<small class="">Ouvir</small>
								</span>
							</div>
							<!--  <div class="col text-center pr-0 position-relative">
                  <a class="tagspan assistir d-block stretched-link text-dark mb-0" href="#" title="Assistir à rádio CBN Ribeirão Preto">
                    <i class="fas fa-2x fa-video text-dark text-shadow">
                      <span class="d-none">video</span>
                    </i>
                  </a>
                  <span class="text-dark font-base font-italic text-lowercase text-center mx-auto">
                    <small class="">Assistir</small>
                  </span>
                </div> -->
						</div>
					</div>
				</div>
				<div id="filiadas" class="d-flex flex-column ml-md-auto col-12 px-0 mt-auto">
					<div class="custom-scroll sb-container sb-container-noscroll">

						<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
							<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnribeirao.com.br/">
								<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
									<i class="bi bi-building h6 text-dark mx-auto">
										<span class="d-none">building</span>
									</i>
								</span>
								<small class="col border-right line-height-normal text-dark text-break">Ribeirão Preto</small>
								<small class="col-4 col-md text-dark px-2">90,5FM</small>
							</a>
							<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16996439050" itemprop="url" title="Whatsapp da Rádio CBN Ribeirão Preto" alt="Whatsapp da Rádio CBN Ribeirão Preto">
								<i class="bi bi-whatsapp text-success small">
									<span class="d-none">phone</span>
								</i>
								<span class="numero small" itemprop="name"> (16) 99643-9050</span>
							</a>
						</span>

						<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
							<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnararaquara.com.br/" target="_blank">
								<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
									<i class="bi bi-building h6 text-dark mx-auto">
										<span class="d-none">building</span>
									</i>
								</span>
								<small class="col border-right line-height-normal text-dark text-break">Araraquara</small>
								<small class="col-4 col-md text-dark px-2">95,7FM</small>
							</a>
							<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16992874818" itemprop="url" title="Whatsapp da Rádio CBN Araraquara" alt="Whatsapp da Rádio CBN Araraquara">
								<i class="bi bi-whatsapp text-success small">
									<span class="d-none">phone</span>
								</i>
								<span class="numero small" itemprop="name"> (16) 99287-4818</span>
							</a>
						</span>

						<span class="item-radiofiliada d-flex flex-wrap align-items-center border border-secondary rounded text-left text-dark mb-2">
							<a class="col-7 col-md row g-0 align-items-center font-secondary px-2" href="https://www.cbnsaocarlos.com.br/" target="_blank">
								<span class="col-2 d-flex float-left py-2 align-items-center justify-content-center">
									<i class="bi bi-building h6 text-dark mx-auto">
										<span class="d-none">building</span>
									</i>
								</span>
								<small class="col border-right line-height-normal text-dark text-break">São Carlos</small>
								<small class="col-4 col-md text-dark px-2">103,9FM</small>
							</a>
							<a class="col-5 col-md-4 link whatsapp text-success font-secondary font-italic" href="https://wa.me/16992924774" itemprop="url" title="Whatsapp da Rádio CBN São Carlos" alt="Whatsapp da Rádio CBN São Carlos">
								<i class="bi bi-whatsapp text-success small">
									<span class="d-none">phone</span>
								</i>
								<span class="numero small" itemprop="name"> (16) 99292-4774</span>
							</a>
						</span>

					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="bc_podcasts_especiais">
		<xsl:param name="manchete" />
		<xsl:param name="imagemdestaque" />
		<xsl:param name="idsecao" />
		<xsl:param name="quantidade" />
		<xsl:param name="position" />
		<xsl:param name="urlvertodos" />
		<xsl:param name="titulo" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="cbnrb2020-heading">
			<a href="{$urlvertodos}" class="h6 d-flex flex-wrap font-pt text-uppercase border-0 align-items-center mb-4" title="Podcasts - Especiais" style="letter-spacing: 1px">
				<small class="my-auto mr-3" style="font-size: 0.5em !important">
					<i class="bi bi-circle-fill">
						<span class="d-none"></span>
					</i>
				</small>
				<strong>
					<xsl:value-of select="$titulo" />
				</strong>
			</a>
		</div>

		<xsl:for-each select="$sons//midiaCenter//*[@idsecao=$idsecao]//som[translate(translate(translate(translate(@publicacao,'-',''),'T',''),':',''),'.','')&lt;= xsl-extensoes:GetDate()][@idsom != xsl-extensoes:ExisteValorSelecionado(@idsom)]">
			<xsl:sort select="@publicacao" order="descending" />
			<xsl:if test="position()&gt;=1 and position()&lt;=$quantidade">
				<div class="cbnrb2020-single-category-post row g-0 align-items-start pt-0 border-0">
					<div class="col-4 dont-miss-post-thumb">
						<xsl:call-template name="get-foto">
							<xsl:with-param name="arquivoimagem" select="$imagemdestaque" />
							<xsl:with-param name="tipo" select="'pq'"/>
							<xsl:with-param name="tamanho" select="'116'"/>
							<xsl:with-param name="altura" select="'100'"/>
							<xsl:with-param name="cssclass" select="'img-fluid'"/>
						</xsl:call-template>
					</div>


					<xsl:variable name="diretorio">
						<xsl:value-of select="$sons//midiaCenter//*[@idsecao=$idsecao]/secao/@diretorio"/>
					</xsl:variable>


					<div class="col-8 pl-3">
						<h6>
							<a href="{$diretorio}/{@url}" class="font-pt">
								<xsl:call-template name="get-manchete">
									<xsl:with-param name="conteudo" select="$manchete"/>
								</xsl:call-template>
							</a>
						</h6>
						<div class="icones-player sidebar w-100 d-flex pr-2">
							<a href="#" class="pr-3" title="player" onclick="alterarPlay({@idsom})">
								<i class="bi bi-play-circle color">
									<span class="d-none"></span>
								</i>
							</a>
							<span class="ml-auto mt-1 text-right">
								<xsl:call-template name="formatasodata">
									<xsl:with-param name="data" select="@publicacao" />
								</xsl:call-template>
							</span>
						</div>
					</div>
				</div>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<!-- Inicio bc_ep_podcasts -->
	<xsl:template name="bc_ep_podcasts">

		<xsl:param name="idsom" />
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

		<xsl:variable name="idSite">
			<xsl:value-of select="@idportal"/>
		</xsl:variable>

		<xsl:variable name="urlsite">
			<xsl:choose>
				<xsl:when test="$idSite = 12">https://www.cbnribeirao.com.br/podcasts/</xsl:when>
				<xsl:when test="$idSite = 14">https://www.cbnararaquara.com.br/podcasts/</xsl:when>
				<xsl:when test="$idSite = 19">https://www.cbnsaocarlos.com.br/podcasts/</xsl:when>
				<xsl:otherwise>
					CBN
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="diretoriosom">
			<xsl:value-of select="../../@diretorio"/>
		</xsl:variable>

		<xsl:variable name="urlsom">
			<xsl:if test="$link!=''">
				<xsl:value-of select="$link"/>
			</xsl:if>
			<xsl:if test="$link=''">
				<xsl:value-of select="@url"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="urlcompleta">
			<xsl:value-of select="concat($urlsite,$diretoriosom,'/',@url)"/>
		</xsl:variable>

		<div class="card position-relative" style="background-color: var(--bs-primary);">		
			<xsl:call-template name="linkfoto">
				<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
				<xsl:with-param name="cssclass" select="'card-img-top img-fluid ls-is-cached lazyloaded'"/>
				<xsl:with-param name="link" select="$link"/>
				<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
				<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
				<xsl:with-param name="tipo" select="'destaque'"/>
				<xsl:with-param name="widthbox" select="'576'" />
				<xsl:with-param name="height" select="'288'" />
			</xsl:call-template>			

			<div class="card-body py-0 px-2 px-md-3">
				<div class="row gx-2">
					<div class="col-md col-2">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-circle img-fluid w-100 p-2 py-3" viewBox="0 0 16 16" style="color: var(--bs-white);">
							<path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z" />
							<circle xmlns="http://www.w3.org/2000/svg" cx="8" cy="8" r="7.4" style="fill: none; stroke: currentColor; stroke-width: 0.2; stroke-miterlimit: 10;" />
						</svg>
					</div>
					<div class="col-md-8 col py-3">
						<label class="d-flex tag mb-1">
							<span class="chapeu fw-bolder text-uppercase" style="color: var(--bs-white);">
								<xsl:call-template name="get-assunto">
									<xsl:with-param name="conteudo" select="translate($chapeu, $quot, $apos)"/>
								</xsl:call-template>
							</span>
						</label>
						<span class="h5 d-block card-title" itemprop="headline">
							<a itemprop="url" class="stretched-link" href="{$urlcompleta}" style="--bs-primary: var(--bs-white);">								
								<xsl:call-template name="get-manchete">
									<xsl:with-param name="conteudo" select="$manchete"/>
									<xsl:with-param name="link" select="$link"/>
									<xsl:with-param name="cssclass" select="'display'"/>
								</xsl:call-template>								
							</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- Fim bc_ep_podcasts -->

	<!-- Inicio bc_ep_videos -->
	<xsl:template name="bc_ep_videos">
		<xsl:param name="idnoticia" />
		<xsl:param name="assunto" />
		<xsl:param name="manchete" />
		<xsl:param name="destaque" />
		<xsl:param name="link" />
		<xsl:param name="imagemmanchete" />
		<xsl:param name="imagemmanchetelegenda" />
		<xsl:param name="imagemmanchetecredito" />
		<xsl:param name="apos">'</xsl:param>
		<xsl:param name="quot">"</xsl:param>

		<div class="row gy-3 position-relative">
			<div class="col-md">
				<picture class="d-block w-100 mb-0 position-relative">
					<!-- <div class="position-absolute top-50 start-50 translate-middle mx-auto text-white text-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill img-fluid" viewBox="0 0 16 16" style="width: 6rem;">
							<path d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
						</svg>
					</div> -->
					
					<xsl:call-template name="linkfoto">
						<xsl:with-param name="arquivoimagem" select="$imagemmanchete"/>
						<xsl:with-param name="cssclass" select="'img-fluid w-100 rounded-3'"/>
						<xsl:with-param name="link" select="$link"/>
						<xsl:with-param name="legenda" select="$imagemmanchetelegenda"/>
						<xsl:with-param name="credito" select="$imagemmanchetecredito"/>
						<xsl:with-param name="tipo" select="'destaque'"/>
						<xsl:with-param name="widthbox" select="'576'" />
						<xsl:with-param name="height" select="'350'" />
					</xsl:call-template>
				</picture>
			</div>
			<div class="col-md-6">
				<div class="d-block w-100">

					<div class="fw-bolder small d-inline-flex align-items-center text-uppercase mb-2" style="color: var(--bs-primary);">

						<span class="chapeu">
							<xsl:call-template name="get-assunto">
								<xsl:with-param name="conteudo" select="translate($assunto, $quot, $apos)"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- <a href="#" class="display d-block stretched-link"> -->
					<h2 class="h2 fw-bolder display d-block" style="line-height: 1.1;">
						<xsl:call-template name="linkmanchete">
							<xsl:with-param name="conteudo" select="translate($manchete, $quot, $apos)"/>
							<xsl:with-param name="link" select="$link"/>
							<xsl:with-param name="cssclass" select="'display d-block stretched-link'"/>
						</xsl:call-template>
					</h2>
					<!-- </a> -->
					<p class="linhafina h5 fw-normal mt-3">
						<xsl:call-template name="get-destaque">
							<xsl:with-param name="conteudo" select="translate($destaque, $quot, $apos)"/>
						</xsl:call-template>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- Fim bc_ep_videos -->


</xsl:stylesheet>