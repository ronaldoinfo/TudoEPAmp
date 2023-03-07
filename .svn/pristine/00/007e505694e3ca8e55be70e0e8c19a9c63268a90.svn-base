<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <!-- Ivan: OK; retorna o mes -->
  <xsl:template name="formatadata-extenso">
    <xsl:param name="data" />

    <xsl:variable name="mes">
      <xsl:value-of select="substring($data,6,2)" />
    </xsl:variable>

    <xsl:variable name="dia">
      <xsl:value-of select="substring($data,9,2)" />
    </xsl:variable>

    <xsl:value-of select="concat($dia,' ')"/>

    <xsl:choose>
      <xsl:when test="$mes = '1' or $mes = '01'">Jan</xsl:when>
      <xsl:when test="$mes = '2' or $mes = '02'">Fev</xsl:when>
      <xsl:when test="$mes = '3' or $mes = '03'">Mar</xsl:when>
      <xsl:when test="$mes = '4' or $mes = '04'">Abr</xsl:when>
      <xsl:when test="$mes = '5' or $mes = '05'">Mai</xsl:when>
      <xsl:when test="$mes = '6' or $mes = '06'">Jun</xsl:when>
      <xsl:when test="$mes = '7' or $mes = '07'">Jul</xsl:when>
      <xsl:when test="$mes = '8' or $mes = '08'">Ago</xsl:when>
      <xsl:when test="$mes = '9' or $mes = '09'">Set</xsl:when>
      <xsl:when test="$mes = '10'">Out</xsl:when>
      <xsl:when test="$mes = '11'">Nov</xsl:when>
      <xsl:when test="$mes = '12'">Dez</xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- Ivan: OK; retorna a hota -->
  <xsl:template name="formatahora-extenso">
    <xsl:param name="data" />
    <xsl:value-of select="concat(substring($data,12,2),'h',substring($data,15,2))" />
  </xsl:template>

  <!-- Ivan: OK; imprime somente data formatada -->
  <xsl:template name="formatasodata">
    <xsl:param name="data" />
    <xsl:value-of select="concat(substring($data,9,2),'/',substring($data,6,2),'/',substring($data,1,4))" />
  </xsl:template>

  <!-- Ivan: OK; imprime a data/hora formatada -->
  <xsl:template name="formatadatahora">
    <xsl:param name="data" />
    <xsl:value-of select="concat(substring($data,9,2),'/',substring($data,6,2),'/',substring($data,1,4),' - ',substring($data,12,5))" />
  </xsl:template>

  <!-- Ivan: OK; imprime o ano formatado -->
  <xsl:template name="formataano">
    <xsl:param name="data" />
    <xsl:value-of select="substring($data,1,4)" />
  </xsl:template>

  <!-- Ivan: OK -->
  <xsl:template name="monta-titulo">
    <xsl:param name="titulo" />
    <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

    <xsl:call-template name="replace">
      <xsl:with-param name="string" select="translate($titulo,$ucletters,$lcletters)" />
      <xsl:with-param name="search-for" select="' '" />
      <xsl:with-param name="replace-with" select="''" />
    </xsl:call-template>

  </xsl:template>

  <!-- Ivan: OK; gera paginacao -->
  <xsl:template name="paginas">
    <xsl:param name="num" select="1" />
    <xsl:param name="total" />
    <xsl:if test="$num &lt;= $total">
      <a href="#" rel="{$num}">
        <xsl:value-of select="$num"/>
      </a>
      <xsl:call-template name="paginas">
        <xsl:with-param name="num" select="$num + 1" />
        <xsl:with-param name="total" select="$total" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- Ivan: OK -->
  <xsl:template name="replace">
    <xsl:param name="string" />
    <xsl:param name="search-for" />
    <xsl:param name="replace-with" />
    <xsl:choose>
      <xsl:when test='contains($string,$search-for)'>
        <xsl:value-of select="substring-before($string,$search-for)"/>
        <xsl:value-of select="$replace-with"/>
        <xsl:call-template name="replace">
          <xsl:with-param
             name="string"
             select="substring-after($string,$search-for)" />
          <xsl:with-param name="search-for" select="$search-for" />
          <xsl:with-param name="replace-with" select="$replace-with" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--A pedido de Ivan: 07/11/2014 - Verifica tipo de mídia que foi embedado no corpo da notícia pelo jornalista e imprimi o ícone referente-->
  <xsl:template name="RetornaIconeTipoMidiaEmbedNoticia">
    <span>
      <xsl:choose>
        <xsl:when test="@tipoMidiaEmbed=0">
          <i class="fa fa-fw fa-youtube-play" title="Esta notícia possui vídeo">
            <xsl:comment></xsl:comment>
          </i>
        </xsl:when>
        <xsl:when test="@tipoMidiaEmbed=1">
          <i class="fa fa-fw fa-picture-o" title="Esta notícia possui imagem">
            <xsl:comment></xsl:comment>
          </i>
        </xsl:when>
        <xsl:when test="@tipoMidiaEmbed=2">
          <i class="fa fa-fw fa-music" title="Esta notícia possui áudio">
            <xsl:comment></xsl:comment>
          </i>
        </xsl:when>
        <xsl:otherwise>
          <i>
            <xsl:comment></xsl:comment>
          </i>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>
  
</xsl:stylesheet>
