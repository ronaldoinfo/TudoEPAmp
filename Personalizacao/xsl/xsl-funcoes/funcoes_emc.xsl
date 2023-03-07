  <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- Ivan: ok - imagem para emc -->
  <xsl:template name="imagem-emc">
    <xsl:param name="arquivo" />
    <xsl:param name="subpasta" />
    <xsl:param name="mod" />

    <xsl:variable name="videolink_" select="xsl-extensoes:getValueAppSettings('EMC_Videos')" />

    <xsl:if test="@subpasta">
      <xsl:value-of select="concat(concat($videolink_,'/',@subpasta),concat(@arquivo,'_',$mod,'.jpg'))" />
    </xsl:if>
    <xsl:if test="not(@subpasta)">
      <xsl:value-of select="concat(concat($videolink_,'/',$subpasta),concat($arquivo,'_',$mod,'.jpg'))" />
    </xsl:if>
  </xsl:template>

  <!-- Ivan: ok - monta box comum para emc -->
  <xsl:template name="EMC-Mod-Comum">
    <xsl:param name="arquivo" />
    <xsl:param name="link" />
    <xsl:param name="subpasta" />
    <xsl:param name="descricao" />
    <xsl:param name="chapeu" />
    <xsl:param name="nome-css-class" />
    <xsl:param name="position" />
    <xsl:param name="diretorio" />
    <xsl:variable name="_link">
      <xsl:if test="$diretorio=''">
        <xsl:if test="$link=''" >
          <xsl:value-of select="concat('/multimidia/',@link)"/>
        </xsl:if>
        <xsl:if test="$link!=''" >
          <!--<xsl:value-of select="concat('/',$link,'/',@link)"/>-->
          <xsl:value-of select="concat($link,'/',@link)"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$diretorio!=''">
        <xsl:value-of select="concat('/',$diretorio,'/',@link)"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="imagem">
      <xsl:call-template name="imagem-emc">
        <xsl:with-param name="arquivo" select="$arquivo" />
        <!--<xsl:with-param name="subpasta" select="$subpasta" />-->
        <xsl:with-param name="mod" select="2" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="imagem-barra-invertida">
      <xsl:value-of select="xsl-extensoes:ReplaceStr($imagem,'\','/')" />
    </xsl:variable>

    <xsl:variable name="newimagem">
      <xsl:value-of select="xsl-extensoes:ReplaceStr($imagem-barra-invertida,'.mp4','')" />
    </xsl:variable>

    <xsl:if test="$position='1'">
      <xsl:text disable-output-escaping="yes">
				 &lt;div class="row"&gt;
      </xsl:text>
    </xsl:if>
    <div class="col-xs-6 col-sm-3">
      <div class="intbox box-emc clearfix" itemprop="video" itemscope="" itemtype="http://schema.org/VideoObject">
        <xsl:if test="$chapeu!=''">
          <div class="materia-assunto" itemprop="about">
            <span>
              <xsl:value-of select="$chapeu"/>
            </span>
          </div>
        </xsl:if>
        <div class="item-thumbnail">
          <a class="img-thumb-zoom" href="{$_link}" itemprop="thumbnailUrl">
            <figure>
              <img alt="{concat(@descricao,$descricao)}" title="{concat(@descricao,$descricao)}" src="{$newimagem}" itemprop="thumbnail"  width="140" height="105" />
              <span class="icon-midia">
                <i class="fa fa-play fa-lg">
                  <xsl:comment></xsl:comment>
                </i>
              </span>
            </figure>
          </a>
        </div>
        <div class="info-box">
          <h2  itemprop="description">
            <a href="{$_link}" itemprop="url">
              <xsl:value-of select="concat(@manchete,$descricao)"/>
            </a>
          </h2>
        </div>
      </div>
    </div>
    <xsl:if test="$position='ultimo'">
      <xsl:text disable-output-escaping="yes">
				   &lt;/div&gt;
         </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>