<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />

  <!-- Ivan: ok - BOX "EDIÇÃO DIGITAL A CIDADE"  -->
  <xsl:template name="bc_edicao_digital_acidade">
    <div class="box-edicao-digital intbox">

      <div class="advertising block mg-bt-30  jornal-a-cidade">
        <div class="jornal-a-cidade-content">
          
          <div class="col-lg-6 col-4 float-left">
            <h3 class="extraBold">
              JORNAL <br/>A CIDADE
            </h3>
            <b>DE HOJE</b>
            <p class="p-t-10">
              Tenha acesso a
              todo o conteúdo
              do jornal impresso.
              <br/><br/>
              <a href="http://assine.jornalacidade.com.br/assinatura.aspx" class="btn btn-blue btn-transparent no-margin">ASSINAR</a>
            </p>
          </div>

          <figure class="col-lg-6 no-padding jornal-a-cidade-image">
            <img src="http://assinantes.jornalacidade.com.br/edicao-online/thumb/001_00.jpg" alt="" title="" width="100%" style="max-width:160px"/>
			    </figure>
        </div>
      </div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>