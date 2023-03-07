<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:include href="funcoes_portal.xsl"/>
  
  <xsl:template name="saiba-mais">
    <xsl:param name="url-saibamais"/>
    <xsl:param name="descricao-url"/>
    <xsl:variable name="nrelacionadas" select="count(relacionadas/relacionada)"/>
    <div class="box pad bgbox">
      <div class="tit-box-sbg">
        <div class="tit-box">SAIBA MAIS</div>
        <xsl:if test="$nrelacionadas > 0">
          <ul class="relacionados-interna">
            <xsl:for-each select="./relacionadas/relacionada">
              <xsl:variable name="noticia" select="//noticia[@idnoticia=current()/@idnoticia]/detalhe/@manchete"/>
              <xsl:if test="$noticia!=''">
                <xsl:value-of select="//noticia[@idnoticia=current()/@idnoticia]//canal/@diretorio" />
                <xsl:variable name="url">
                  <xsl:if test="@url=''">
                    <xsl:variable name="url-amigavel">
                      <xsl:value-of select="//noticia[@idnoticia=current()/@idnoticia]/detalhe/@url"/>
                    </xsl:variable>
                    <xsl:variable name="diretorio">
                      <xsl:call-template name="descobre-diretorio" />
                    </xsl:variable>
                    <xsl:value-of select ="concat($diretorio,'/',$url-amigavel)"/>
                  </xsl:if>
                  <xsl:if test="@url!=''">
                    <xsl:value-of select="@url" />
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="classicone">
                  <xsl:if test="@destaqueemc=1">fot</xsl:if>
                  <xsl:if test="@destaqueemc=2">vid</xsl:if>
                  <xsl:if test="@destaqueemc='' or @destaqueemc=0">
                    not
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="titulomontado">
                  <a href="{$url}" target="_blank" class="{$classicone}">
                    <xsl:if test="@titulo=''">
                      <xsl:value-of select="//noticia[@idnoticia=current()/@idnoticia]/detalhe/@manchete" />
                    </xsl:if>

                    <xsl:if test="@titulo!=''">
                      <xsl:value-of select="@titulo" />
                    </xsl:if>
                  </a>
                </xsl:variable>

                <li>
                  <xsl:copy-of select="$titulomontado" />
                </li>
              </xsl:if>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <ul class="relacionados-cidade">
          <xsl:if test="cidade/@idregiao=0 or cidade/@idregiao=''">
            <xsl:if test="$descricao-url=''">
              <li>
                <a href="/epnoticia/brasilmundo.aspx">
                  Mais notícias Brasil/Mundo
                </a>
              </li>
            </xsl:if>
            <xsl:if test="$descricao-url!=''">
              <li>
                <a href="{$url-saibamais}">
                  <xsl:value-of select="$descricao-url"/>
                </a>
              </li>
            </xsl:if>
          </xsl:if>

          <xsl:if test="cidade/@idregiao = 1">
            <li>
              <a href="/epnoticia/regiao_campinas.aspx">Mais Notícias da Região de Campinas</a>
            </li>
            <li>
              <a href="/epnoticia/campinas/">
                Mais Notícias de <xsl:value-of select="cidade/@nomecidade" />
              </a>
            </li>
          </xsl:if>

          <xsl:if test="cidade/@idregiao = 2">
            <li>
              <a href="/epnoticia/regiao_ribeirao.aspx">Mais Notícias da Região de Ribeirão Preto</a>
            </li>
            <li>
              <a href="/epnoticia/ribeiraopreto/">
                Mais Notícias de <xsl:value-of select="cidade/@nomecidade" />
              </a>
            </li>
          </xsl:if>

          <xsl:if test="cidade/@idregiao = 3">
            <li>
              <a href="/epnoticia/regiao_central.aspx">Mais Notícias da Região Central</a>
            </li>
            <li>
              <a href="/epnoticia/regiao_central.aspx">
                Mais Notícias de <xsl:value-of select="cidade/@nomecidade" />
              </a>
            </li>
          </xsl:if>

          <xsl:if test="cidade/@idregiao = 4">
            <li>
              <a href="/epnoticia/regiao_sulminas.aspx">Mais Notícias da Região Sul de Minas</a>
            </li>
            <li>
              <a href="/epnoticia/regiao_sulminas.aspx">
                Mais Notícias de <xsl:value-of select="cidade/@nomecidade" />
              </a>
            </li>
          </xsl:if>
        </ul>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
