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
<xsl:key name="bc_amp_manchete_a_2957860" match="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1']" use="@idnoticia"/>
<xsl:key name="bc_amp_destaque_a_42331983" match="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][(@tiponoticia='1' or @tiponoticia='2')]" use="@idnoticia"/>
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
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;RM1&quot; ')" />
</div>
</div>
</section>
<section id='section3' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:comment>bc_amp_manchete_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][@tiponoticia='1'][generate-id(.) = generate-id(key('bc_amp_manchete_a_2957860', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_amp_manchete_a">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section4' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;MEIAPAGINA&quot; ')" />
</div>
</div>
</section>
<section id='section5' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:comment>bc_amp_destaque_a</xsl:comment>
<xsl:for-each select="//*[@idsecao=1]//noticia[xsl-extensoes:verificadatahora(@publicacao,@expiracao)][(@tiponoticia='1' or @tiponoticia='2')][generate-id(.) = generate-id(key('bc_amp_destaque_a_42331983', @idnoticia)[1])][xsl-extensoes:ExisteValorSelecionado(@idnoticia)=false]">
<xsl:sort select="@publicacao" order="descending" />
<xsl:if test="position()=1">
<xsl:value-of select="xsl-extensoes:SetValorSelecionado(@idnoticia)" />
<xsl:call-template name="bc_amp_destaque_a">
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</div>
</div>
</section>
<section id='section6' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;RM2&quot; ')" />
</div>
</div>
</section>
<section id='section7' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;SLB2&quot; ')" />
</div>
</div>
</section>
<section id='section8' class="container pt-3">
<div class="row gy-3">
<div class="col-12 cor-ref-home">
<xsl:value-of disable-output-escaping="yes" select="xsl-extensoes:CarregarUserControl('~/comuns/publicidade/ucPublicidade.ascx', 'widthbox=&quot;200&quot; position=&quot;SLB3&quot; ')" />
</div>
</div>
</section>
</xsl:template>
</xsl:stylesheet>