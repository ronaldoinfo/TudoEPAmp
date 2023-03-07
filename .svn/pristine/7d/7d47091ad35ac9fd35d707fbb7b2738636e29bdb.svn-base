<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <xsl:template name="saiba-mais">
    <xsl:param name="url-saibamais"/>
    <xsl:param name="descricao-url"/>
    <xsl:param name="diretorio"/>

    <xsl:variable name="nrelacionadas" select="count(relacionadas/relacionada)"/>

    <xsl:if test="$nrelacionadas > 0">
      <div id="noticias-relacionadas"> 
		<h2 class="tit-box-int cor-ref tit-coment"><span>Notícias Relacionadas</span></h2>
        <ul class="list-unstyled">
          <xsl:for-each select="relacionadas/relacionada">
            <xsl:variable name="manchete" select="//noticia[@idnoticia=current()/@idnoticia]/@manchete"/>
            <xsl:if test="$manchete!='' or @titulo!=''">
              <xsl:variable name="classicone">
              </xsl:variable>

              <xsl:variable name="urlmontada">
                <!--NOTICIAS-->
                <xsl:if test="contains(@url,'NOT,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'1')"/>NOT<xsl:value-of select="substring-after(@url,'/NOT')" />
                </xsl:if>

                <!--PUBLIEDITORIAL-->
                <xsl:if test="contains(@url,'PUBE,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'1')"/>PUBE<xsl:value-of select="substring-after(@url,'/PUBE')" />
                </xsl:if>

                <!--BRANDED CONTENT-->
                <xsl:if test="contains(@url,'BRND,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'1')"/>BRND<xsl:value-of select="substring-after(@url,'/BRND')" />
                </xsl:if>

                <!--BLOG-->
                <xsl:if test="contains(@url,'BLOG,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'1')"/>BLOG<xsl:value-of select="substring-after(@url,'/BLOG')" />
                </xsl:if>

                <!--GALERIA-->
                <xsl:if test="contains(@url,'GFOT,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'2')"/>GFOT<xsl:value-of select="substring-after(@url,'/GFOT')" />
                </xsl:if>

                <!--VIDEO-->
                <xsl:if test="contains(@url,'VID,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'3')"/>VID<xsl:value-of select="substring-after(@url,'/VID')" />
                </xsl:if>

                <!--SOM-->
                <xsl:if test="contains(@url,'SOM,')">
                  <xsl:value-of select="xsl-extensoes:MontaPrefixoUrlPorTipoMidia(@idnoticia,'4')"/>SOM<xsl:value-of select="substring-after(@url,'/SOM')" />
                </xsl:if>
              </xsl:variable>

              <xsl:variable name="titulomontado">
                <a href="{$urlmontada}" target="_blank" class="{$classicone}">
                  <xsl:if test="contains(@url,'NOT,')">
                    <i class="fa fa-file-text-o fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="contains(@url,'PUBE,')">
                    <i class="fa fa-file-text-o fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="contains(@url,'BRND,')">
                    <i class="fa fa-file-text-o fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="contains(@url,'BLOG,')">
                    <i class="fa fa-file-text-o fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="contains(@url,'GFOT,')">
                    <i class="fa fa-camera fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="contains(@url,'VID,')">
                    <i class="fa fa-video-camera fa-fw"></i>
                  </xsl:if>

                  <xsl:if test="@titulo=''">
                    <xsl:value-of select="//noticia[@idnoticia=current()/@idnoticia]/@manchete" />
                  </xsl:if>

                  <xsl:if test="@titulo!=''">
                    <xsl:value-of select="@titulo" />
                  </xsl:if>
                </a>
              </xsl:variable>

              <li>
                <p>
                  <xsl:copy-of select="$titulomontado" />
                </p>
              </li>
            </xsl:if>
          </xsl:for-each>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
