<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <xsl:template name="barra-compartilha">
    <xsl:param name="twitter"/>
    <xsl:variable name="twitter_">
      <xsl:if test="$twitter=''">
        <xsl:value-of select="'eptvnoticias'"/>
      </xsl:if>
      <xsl:if test="$twitter!=''">
        <xsl:value-of select="$twitter"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="url">
      <xsl:value-of select="concat(xsl-extensoes:DiretorioAtualCodificado(),xsl-extensoes:URLEncode(@url))"/>
    </xsl:variable>
    <xsl:variable name="diretorio">
      <xsl:value-of select="xsl-extensoes:GetDiretorioNoticia(@idnoticia)"/>
    </xsl:variable>
    <xsl:variable name="manchete">
      <xsl:value-of select="xsl-extensoes:URLEncode(@manchete)"/>
    </xsl:variable>

    <div id="barra-compartilha">
      <div class="row">
        <div class="col-sm-7 col-md-8">
          <div class="redes-sociais flat-btn" data-twitter="true" data-facebook="true" data-gplus="true">
            <xsl:text disable-output-escaping="yes"><![CDATA[<!-- REDES SOCIAS-->]]></xsl:text>
          </div>
        </div>
        <div class="col-sm-5 col-md-4">
          <ul class="flat-btn list-inline lista-btn-interacao">
            <li>
              <a class="share-default" href="/rss/rss.aspx?diretorio={$diretorio}" target="_blank">
                <span class="icon">
                  <i class="fa fa-rss"></i>
                </span>
              </a>
            </li>
            <li>
              <a class="share-default" onclick="enviarMensagemAmigo('{$idnoticia}')" title="Enviar para um amigo">
                <span class="icon">
                  <i class="fa fa-user"></i>
                </span>
              </a>
            </li>
            <li>
              <a class="share-default" href="javascript:self.print();" target="_blank"  title="Imprimir esta página">
                <span class="icon">
                  <i class="fa fa-print"></i>
                </span>
              </a>
            </li>
            <li>
              <a class="share-default" onclick="reportarErro('{$idnoticia}')" target="_blank"  title="Reportar erro">
                <span class="icon">
                  <i class="fa fa-file-text-o"></i>
                </span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
