<xsl:stylesheet version="2.0" exclude-result-prefixes="xsl-extensoes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes">
<xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-manchetes_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-destaques_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-notas_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-agencia_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-emc_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-especiais_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-especiais-jornais_v5.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-funcoes\funcoes_portal_v6.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-manchetes_v6.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-destaques_v6.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-notas_v6.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-emc_v6.xsl" />
<xsl:include href="C:\inetpub\wwwroot\Sites_v5.5\AMP.TudoEP\personalizacao\xsl\xsl-templates\templates-manchetes-podcasts.xsl" />
<xsl:key name="bc_separador_linha_16868352" match="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_rotativas_300_19420176" match="//*[@idsecao=1]//*[@idcanal=21]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_manchete_rotativas_300_26314214" match="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][xsl-extensoes:estaem(@idsites,1)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_ep_podcasts_24914721" match="$sons//midiaCenter//*[@idsecao=7243]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]" use="@idsom"/>
<xsl:key name="bc_manchete_g_51438283" match="//*[@idsecao=1]//*[@idcanal=13]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_15315213" match="//*[@idsecao=1]//*[@idcanal=13]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_g_41488021" match="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_separador_linha_62301924" match="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_nota_a_61925337" match="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_v6_manchete_m_lateral_51004322" match="//*[@idsecao=1]//*[@idcanal=14]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_2730334" match="//*[@idsecao=1]//*[@idcanal=14]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_12070837" match="//*[@idsecao=1]//*[@idcanal=20]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_14509978" match="//*[@idsecao=1]//*[@idcanal=20]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_18136189" match="//*[@idsecao=1]//*[@idcanal=8]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_56187442" match="//*[@idsecao=1]//*[@idcanal=8]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_18823110" match="//*[@idsecao=1]//*[@idcanal=24]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_8999294" match="//*[@idsecao=1]//*[@idcanal=24]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_g_59652943" match="//*[@idsecao=1]//*[@idcanal=9]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_52213762" match="//*[@idsecao=1]//*[@idcanal=9]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_g_37804102" match="//*[@idsecao=1]//*[@idcanal=10]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_22577141" match="//*[@idsecao=1]//*[@idcanal=10]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_g_50757320" match="//*[@idsecao=1]//*[@idcanal=17]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_62676156" match="//*[@idsecao=1]//*[@idcanal=17]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_separador_linha_5669220" match="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_30189679" match="//*[@idsecao=1]//*[@idcanal=23]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_3085464" match="//*[@idsecao=1]//*[@idcanal=23]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_22369618" match="//*[@idsecao=8003]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_nota_a_44739154" match="//*[@idsecao=8003]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_22367068" match="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:estaem(@idsites,1)]" use="@idnoticia"/>
<xsl:key name="bc_nota_a_44665200" match="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:estaem(@idsites,1)]" use="@idnoticia"/>
<xsl:key name="bc_separador_linha_20222386" match="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)]" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_49578303" match="//*[@idsecao=1]//*[@idcanal=7]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_manchete_h_28484652" match="//*[@idsecao=1]//*[@idcanal=19]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_ep_podcasts_20748542" match="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7235]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]" use="@idsom"/>
<xsl:key name="bc_ep_podcasts_64836814" match="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7238]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]" use="@idsom"/>
<xsl:key name="bc_ep_podcasts_1219419" match="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7243]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]" use="@idsom"/>
<xsl:template match="/">
<section id='section1' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;SLB1&quot; ')" />
</div>
</div>
</section>
<section id='section2' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-3 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/rss/uc_bc_ep_5_noticias_rss.ascx', 'widthbox=&quot;250&quot; quantidade=&quot;1&quot; url=&quot;https://www.acidadeon.com/campinas/rss/feed.xml&quot; ')" />
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/rss/uc_bc_ep_5_noticias_rss.ascx', 'widthbox=&quot;250&quot; quantidade=&quot;1&quot; url=&quot;https://www.acidadeon.com/ribeiraopreto/rss/feed.xml&quot; ')" />
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/rss/uc_bc_ep_5_noticias_rss.ascx', 'widthbox=&quot;250&quot; quantidade=&quot;1&quot; url=&quot;https://www.acidadeon.com/araraquara/rss/feed.xml&quot; ')" />
<xsl:comment>bc_ep_5_noticias</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_ep_5_noticias">
<xsl:with-param name="widthbox" select="'250'" />
<xsl:with-param name="corref1" select="'Sul de Minas'" />
<xsl:with-param name="corref2" select="'cotidiano'" />
<xsl:with-param name="corref3" select="'cotidiano'" />
<xsl:with-param name="corref4" select="'cotidiano'" />
<xsl:with-param name="corref5" select="'cotidiano'" />
<xsl:with-param name="idsecao1" select="'8293'" />
</xsl:call-template>
</xsl:if>
</div>
<div class="col-12 col-md-6 cor-ref-home">
<xsl:comment>bc_v6_manchete_b</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado('1838741')" />
<xsl:call-template name="bc_v6_manchete_b">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="assunto" select="'SUSPEITA DE GENOCÍDIO'" />
<xsl:with-param name="idnoticia" select="'1838741'" />
<xsl:with-param name="imagemmanchete" select="'yanomami_1200x675_25012023124632.jpg'" />
<xsl:with-param name="imagemmanchetecredito" select="'Agência Brasil'" />
<xsl:with-param name="imagemmanchetelegenda" select="'PF vai investigar crimes contra Yanomamis. (Foto: Marcelo Camargo/Agência Brasil)'" />
<xsl:with-param name="link" select="'https://www.tudoep.com/tudo-noticias//NOT,0,0,1838741,pf-abre-inquerito-para-apurar-genocidio-contra-yanomamis.aspx'" />
<xsl:with-param name="manchete" select="'PF abre inquérito para apurar genocídio contra Yanomamis'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_separador_linha_16868352', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:call-template name="bc_separador_linha">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/rss/uc_bc_manchete_a_rss.ascx', 'widthbox=&quot;300&quot; quantidade=&quot;1&quot; url=&quot;https://www.acidadeon.com/saocarlos/rss/feed.xml&quot; ')" />
</div>
<div class="col-12 col-md-3 cor-ref-home">
<xsl:comment>bc_ep_tabs</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_ep_tabs">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="idsecao1" select="'2'" />
<xsl:with-param name="idsecao2" select="'8294'" />
<xsl:with-param name="idsecao3" select="'1304'" />
<xsl:with-param name="ordem" select="'1'" />
<xsl:with-param name="qtd1" select="'3'" />
<xsl:with-param name="qtd2" select="'3'" />
<xsl:with-param name="qtd3" select="'3'" />
<xsl:with-param name="titulo1" select="'CBN'" />
<xsl:with-param name="titulo2" select="'Sul de Minas'" />
<xsl:with-param name="titulo3" select="'Especiais'" />
<xsl:with-param name="url1" select="'https://www.cbnribeirao.com.br'" />
<xsl:with-param name="url2" select="'https://www.tudoep.com/tudo-noticias/sul-de-minas'" />
<xsl:with-param name="url3" select="'https://www.tudoep.com/especiais/educa-mais-cast/'" />
</xsl:call-template>
</xsl:if>
</div>
</div>
</section>
<section id='section3' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-noticias">
<xsl:comment>bc_manchete_rotativas_300</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=21]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_rotativas_300_19420176', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="1" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=2">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="2" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=3">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;RM1&quot; ')" />
</div>
<div class="col-12 col-md-4 cor-ref-viuessa">
<xsl:comment>bc_manchete_rotativas_300</xsl:comment>
<xsl:for-each select="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_rotativas_300_26314214', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][xsl-extensoes:estaem(@idsites,1)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_rotativas_300_26314214', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="1" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=2">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="2" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=3">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_rotativas_300">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section4' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-8 cor-ref-tudo-viagens">
<xsl:comment>bc_ep_especiais</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado('1838724')" />
<xsl:call-template name="bc_ep_especiais">
<xsl:with-param name="widthbox" select="'600'" />
<xsl:with-param name="assunto" select="'SÉRIE'" />
<xsl:with-param name="idnoticia" select="'1838724'" />
<xsl:with-param name="imagemmanchete" select="'seria_da_1200x675_25012023113626.jpg'" />
<xsl:with-param name="imagemmanchetecredito" select="'(foto: reprodução/ Netflix)'" />
<xsl:with-param name="imagemmanchetelegenda" select="'Misséries rememoram a tragédia que completou uma década em casa de show gaúcha (foto: reprodução/ Netflix)'" />
<xsl:with-param name="link" select="'https://www.tudoep.com/tudo-cult/viu-essa/NOT,0,0,1838724,boate-kiss-conheca-a-serie-que-relembra-a-tragedia-em-santa-maria.aspx'" />
<xsl:with-param name="manchete" select="'Boate Kiss: Conheça a série que relembra a tragédia em Santa Maria'" />
</xsl:call-template>
</xsl:if>
</div>
<div class="col-12 col-md-4 cor-ref-podcasts-colunistas">
<xsl:comment>bc_ep_podcasts</xsl:comment>
<xsl:for-each select="$sons//midiaCenter//*[@idsecao=7243]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
<xsl:call-template name="bc_ep_podcasts">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section5' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-receitas">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' receitas'" />
<xsl:with-param name="urleditoria" select="'/tudo-receitas/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_g</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=13]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_g_51438283', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_g">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_separador_linha">
<xsl:with-param name="widthbox" select="'300'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=13]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_15315213', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-games">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'Games'" />
<xsl:with-param name="urleditoria" select="'/tudo-games/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_g</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_g_41488021', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_g">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_separador_linha_62301924', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:call-template name="bc_separador_linha">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=12]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_61925337', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;MEIAPAGINA&quot; ')" />
</div>
</div>
</section>
<section id='section6' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-tudoviagens">
<xsl:comment>bc_titulo_linha_patrocinio</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha_patrocinio">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="position" select="'PATROCINIO1'" />
<xsl:with-param name="titulo_linha" select="' viagem'" />
<xsl:with-param name="urleditoria" select="'https://www.tudoep.com/tudo-viagens'" />
</xsl:call-template>
</xsl:if>
</div>
</div>
</section>
<section id='section7' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-8 cor-ref-tudo-viagens">
<xsl:comment>bc_v6_manchete_m_lateral</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=14]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_v6_manchete_m_lateral_51004322', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_v6_manchete_m_lateral">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-viagens">
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=14]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_2730334', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section8' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;SLB2&quot; ')" />
</div>
</div>
</section>
<section id='section9' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-valor">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'valor'" />
<xsl:with-param name="urleditoria" select="'/tudo-valor/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=20]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_12070837', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=20]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_14509978', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="1" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=2">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-bebes">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'bebês'" />
<xsl:with-param name="urleditoria" select="'/tudo-bebes'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=8]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_18136189', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=8]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_56187442', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="1" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=2">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-pets">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' pets'" />
<xsl:with-param name="urleditoria" select="'https://www.tudoep.com/tudo-pets'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=24]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_18823110', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=24]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_8999294', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="1" />
</xsl:call-template>
</xsl:if>
<xsl:if test="position()=2">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section10' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_separador_linha">
<xsl:with-param name="widthbox" select="'300'" />
</xsl:call-template>
</xsl:if>
</div>
</div>
</section>
<section id='section11' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-corrida">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' corrida'" />
<xsl:with-param name="urleditoria" select="'/tudo-corrida'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_g</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=9]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_g_59652943', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_g">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=9]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_52213762', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-decor">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' decoração'" />
<xsl:with-param name="urleditoria" select="'/tudo-decor'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_g</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=10]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_g_37804102', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_g">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=10]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_22577141', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-esporte">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' esportes'" />
<xsl:with-param name="urleditoria" select="'/tudo-esporte'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_g</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=17]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_g_50757320', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_g">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=17]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_62676156', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section12' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;SLB3&quot; ')" />
</div>
</div>
</section>
<section id='section13' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-8 cor-ref-tudo-inovacao">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'Inovação'" />
<xsl:with-param name="urleditoria" select="'/tudo-inovacao/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_ep_videos</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado('1838589')" />
<xsl:call-template name="bc_ep_videos">
<xsl:with-param name="widthbox" select="'600'" />
<xsl:with-param name="assunto" select="'INOVAÇÃO'" />
<xsl:with-param name="destaque" select="'Pesquisa mostra que flexibilidade será requisito para a escolha uma nova vaga de emprego'" />
<xsl:with-param name="idnoticia" select="'1838589'" />
<xsl:with-param name="imagemmanchete" select="'homeoffice_modelo_1200x675_24012023152726.jpg'" />
<xsl:with-param name="imagemmanchetecredito" select="'Pixabay'" />
<xsl:with-param name="imagemmanchetelegenda" select="'Modelo híbrido de trabalho é o favorito dos brasileiros. (Foto: Pixabay)'" />
<xsl:with-param name="link" select="'https://www.tudoep.com/tudo-inovacao//NOT,0,0,1838589,quais-as-tendencias-de-modelos-de-trabalho-para-2023.aspx'" />
<xsl:with-param name="manchete" select="'Quais as tendências de modelos de trabalho para 2023?'" />
<xsl:with-param name="XMLVideos" select="'XMLVideos'" />
</xsl:call-template>
</xsl:if>
</div>
<div class="col-12 col-md-4 cor-ref-home">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'de tudo'" />
<xsl:with-param name="urleditoria" select="'/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_ep_tabs_noticias</xsl:comment>
<xsl:if test="1=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_ep_tabs_noticias">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="corref1" select="'Viu Essa'" />
<xsl:with-param name="corref2" select="'Virando Bixo'" />
<xsl:with-param name="corref3" select="'Viagens'" />
<xsl:with-param name="idsecao1" select="'8297'" />
<xsl:with-param name="idsecao2" select="'1374'" />
<xsl:with-param name="idsecao3" select="'8191'" />
<xsl:with-param name="ordem" select="'3'" />
<xsl:with-param name="qtd1" select="'2'" />
<xsl:with-param name="qtd2" select="'2'" />
<xsl:with-param name="qtd3" select="'2'" />
<xsl:with-param name="titulo1" select="'Horóscopo'" />
<xsl:with-param name="titulo2" select="'Virando Bixo'" />
<xsl:with-param name="titulo3" select="'Inovação'" />
<xsl:with-param name="url1" select="'https://www.tudoep.com/tudo-cult/viu-essa/'" />
<xsl:with-param name="url2" select="'https://www.virandobixo.com.br/'" />
<xsl:with-param name="url3" select="'https://www.tudoep.com/tudo-inovacao/'" />
</xsl:call-template>
</xsl:if>
</div>
</div>
</section>
<section id='section14' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_separador_linha_5669220', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:call-template name="bc_separador_linha">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section15' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-saude">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' saúde'" />
<xsl:with-param name="urleditoria" select="'https://www.tudoep.com/tudo-saude/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=23]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_30189679', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=23]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_3085464', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudoagro">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'agro'" />
<xsl:with-param name="urleditoria" select="'/tudo-agro'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=8003]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_22369618', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=8003]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_44739154', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-viuessa">
<xsl:comment>bc_titulo_linha_v55</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha_v55">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="'Viu essa?'" />
<xsl:with-param name="urleditoria" select="'/tudo-cult/viu-essa'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_manchete_h_22367068', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][xsl-extensoes:estaem(@idsites,1)][generate-id(.) = generate-id(key('bc_manchete_h_22367068', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
<xsl:comment>bc_nota_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=7758]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_nota_a_44665200', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false][xsl-extensoes:estaem(@idsites,1)][generate-id(.) = generate-id(key('bc_nota_a_44665200', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_nota_a">
<xsl:with-param name="position" select="'ultimo'" />
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section16' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:comment>bc_separador_linha</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][generate-id(.) = generate-id(key('bc_separador_linha_20222386', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:call-template name="bc_separador_linha">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section17' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-tudo-auto">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' auto'" />
<xsl:with-param name="urleditoria" select="'/tudo-auto/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=7]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_49578303', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudo-elas">
<xsl:comment>bc_titulo_linha</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="titulo_linha" select="' elas'" />
<xsl:with-param name="urleditoria" select="'/tudo-elas/'" />
</xsl:call-template>
</xsl:if>
<xsl:comment>bc_manchete_h</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//*[@idcanal=19]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_manchete_h_28484652', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_manchete_h">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-tudoeducaçao">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;rm2&quot; ')" />
</div>
</div>
</section>
<section id='section18' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-podcasts">
<xsl:comment>bc_titulo_linha_patrocinio</xsl:comment>
<xsl:if test="1=1">
<xsl:call-template name="bc_titulo_linha_patrocinio">
<xsl:with-param name="widthbox" select="'300'" />
<xsl:with-param name="position" select="'PATROCINIO1'" />
<xsl:with-param name="titulo_linha" select="'Podcast'" />
<xsl:with-param name="urleditoria" select="'/tudo-podcast'" />
</xsl:call-template>
</xsl:if>
</div>
</div>
</section>
<section id='section19' class="container pt-3">
<div class="row gy-3">
<div class="col-12 col-md-4 cor-ref-podcasts">
<xsl:comment>bc_ep_podcasts</xsl:comment>
<xsl:for-each select="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7235]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
<xsl:call-template name="bc_ep_podcasts">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-podcasts">
<xsl:comment>bc_ep_podcasts</xsl:comment>
<xsl:for-each select="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7238]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
<xsl:call-template name="bc_ep_podcasts">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
<div class="col-12 col-md-4 cor-ref-podcasts">
<xsl:comment>bc_ep_podcasts</xsl:comment>
<xsl:for-each select="$sons//midiaCenter//*[@idcanal=5]//*[@idsecao=7243]//som[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][xsl-extensoes:ExisteValorSelecionado(@idsom)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idsom)" />
<xsl:call-template name="bc_ep_podcasts">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
</xsl:template>
</xsl:stylesheet>