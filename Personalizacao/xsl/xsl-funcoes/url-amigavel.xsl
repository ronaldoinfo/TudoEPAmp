<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">

  <xsl:template name="cria-url-amigavel">
    <xsl:param name="conteudo" />
    <xsl:param name="prefixo" />
    <xsl:param name="id" />
      <xsl:variable name="base" select="concat($prefixo,@idnoticia,$id,',')" />
    
      <xsl:variable name="conteudo-formatado">        
          <xsl:variable name="caracteres-invalidos">!"'#$%()*,./:;=>?@[\]^`{|}~÷´</xsl:variable>        
          <xsl:variable name="caract"> .ªº²³µ¹ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüýÿ</xsl:variable>
          <xsl:variable name="scaract">+-ao23u1AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeiiiinooooouuuuyy</xsl:variable>          
          <xsl:value-of select="translate(translate($conteudo,$caract,$scaract),$caracteres-invalidos,'')" />                  
      </xsl:variable>
      
      <xsl:variable name="desc" >
        <xsl:value-of select="translate($conteudo-formatado,'&amp;','')" />
      </xsl:variable>
      
      <xsl:value-of select="concat($base,$desc,'.aspx')" />

  </xsl:template>
  
</xsl:stylesheet>
