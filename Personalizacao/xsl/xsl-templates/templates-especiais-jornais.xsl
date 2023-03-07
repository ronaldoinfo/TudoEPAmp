<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl-extensoes="urn:xsl-extensoes" exclude-result-prefixes="xsl-extensoes">
  <xsl:key name="todas" match="/" use="todas" />

  <!-- Ivan: ok - BOX "PARTICIPE - ARARAQUARA"  -->
  <xsl:template name="bc_participe_araraquara">
    <div class="intbox">
      <div class="box-participe">
        <p>
          <a href="http://www.araraquara.com/participe/suanoticia/default.aspx" title="Participe..." class="lnk-topo">
            <figure><img src="/img/araraquara/interatividade-topo.jpg" alt="Participe Araraquara" /></figure>
          </a>
        </p>
        <div class="row">
          <div class="col-xs-7">
            <a href="https://www.facebook.com/AraraquaraPortal?fref=ts" title="Curta nossa Fan Page" class="lnk-fb" target="_blank">
              <figure><img src="/img/araraquara/interatividade-fp.jpg" alt="Curta nossa Fan Page" /></figure>
            </a>
          </div>
          <div class="col-xs-5">
            <a href="https://twitter.com/araraquaracom" title="Siga nosso Twitter" class="lnk-tw" target="_blank">
              <figure><img src="/img/araraquara/interatividade-tw.jpg" alt="Siga nosso Twitter" /></figure>
            </a>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <!-- BOX "PARTICIPE - A CIDADE ON"  -->
  <xsl:template name="bc_participe_acidade">
    <div class="intbox">
      <div class="box-participe">
        <p>
          <a href="#" title="Participe do A Cidade On" class="lnk-topo">
            <figure><img src="/img/participe/Box-Participe_Envie.jpg" alt="Participe do A Cidade On" /></figure>
          </a>
        </p>
        <div class="row">
          <div class="col-xs-6">
            <a href="http://www.facebook.com/tudoep" title="Curta nossa Fan Page" class="lnk-fb" target="_blank">
              <figure><img src="/img/participe/Box-Particpe_FB.jpg" alt="Curta nossa Fan Page" /></figure>
            </a>
          </div>
          <div class="col-xs-6">
            <a href="https://twitter.com/tudoep" title="Siga nosso Twitter" class="lnk-tw" target="_blank">
              <figure><img src="/img/participe/Box-Particpe_TW.jpg" alt="Siga nosso Twitter" /></figure>
            </a>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <a href="http://www.instagram.com/acidadeon" title="Siga nossos Instagram" class="lnk-fb" target="_blank">
              <figure><img src="/img/participe/Box-Particpe_INST.jpg" alt="Siga nossos Instagram" /></figure>
            </a>
          </div>
          <div class="col-xs-6">
            <a href="#" title="Nosso Snapchat" class="lnk-tw" target="_blank">
              <figure><img src="/img/participe/Box-Particpe_SNAP.jpg" alt="Nosso Snapchat" /></figure>
            </a>
          </div>
        </div>	
		<div class="row">
          <div align="center" class="col-xs-12">
            <a title="Siga nossos Whatsapp" class="lnk-fb" target="_blank">
              <figure><img src="/ribeiraopreto/img/participe/Box-Particpe_WHATS.jpg" alt="Siga nossos Whatsapp" /></figure>
            </a>
          </div>
        </div>		
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "EDIÇÃO DIGITAL ARARAQUARA"  -->
  <xsl:template name="bc_edicao_digital_araraquara">
    <div class="box-edicao-digital intbox">
      <h2 class="tit-box">
        <strong>Edição Digital</strong>
      </h2>
      <div>
        <a href="http://assinantes.araraquara.com/edicao-online/flippage.aspx" target="_blank" title="Clique e confira">
          <figure><img src="http://assinantes.araraquara.com/edicao-online/thumb/001_01.jpg" width="145" height="207" alt="Edição Online" /></figure>
        </a>
      </div>
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX "EDIÇÃO DIGITAL A CIDADE"  -->
  <xsl:template name="bc_edicao_digital_acidade">
    <div class="box-edicao-digital intbox">
      <h2 class="tit-box">
        <strong>Edição Digital</strong>
      </h2>
      <div class="row">
        <div class="col-xs-7">
          <p class="fonte-padrao">Tenha acesso a todo o conteúdo do jornal impresso.</p>
          <p class="titulo-pq">
            <a href="http://assinantes.jornalacidade.com.br/edicao-online" target="_blank" title="Folher Edição de Hoje...">
              Edição de Hoje
              <span class="pull-right">
                <i class="fa fa-angle-right">
                  <xsl:comment>
                    <!---->
                  </xsl:comment>
                </i>
              </span>
            </a>
          </p>
          <p class="titulo-pq">
            <a href="http://assinantes.jornalacidade.com.br/assinatura/" target="_blank" title="Clique aqui para fazer sua assinatura...">
              Assinar
              <span class="pull-right">
                <i class="fa fa-angle-right">
                  <xsl:comment>
                    <!---->
                  </xsl:comment>
                </i>
              </span>
            </a>
          </p>
        </div>
        <div class="col-xs-5">
          <a href="http://assinantes.jornalacidade.com.br/edicao-online" target="_blank" title="Clique e confira">
            <figure><img src="http://assinantes.jornalacidade.com.br/edicao-online/thumb/001_00.jpg" width="145" height="207" alt="Edição Online" /></figure>
          </a>
        </div>
      </div>
      <hr />
    </div>
  </xsl:template>

  <!-- Ivan: ok - BOX CENTRAL - CINEMA - EMPREGOS - PROMOÇÕES -->
  <xsl:template name="bc_cinema_empregos_promocoes">
    <div id="box-310" class="clearfix">
      <div class="box-lista clearfix">
        <ul class="box-cinema-empregos-promocoes">
          <li>
            <div>
              <h2>
                <a href="http://www.araraquara.com/lazerecultura/cinema/" title="Confira os filmes que estão em cartaz na cidade...">Programe-se</a>
              </h2>
              <a href="http://www.araraquara.com/lazerecultura/cinema/" title="Confira os filmes que estão em cartaz na cidade...">
                <img src="/img/icon-cinema-home.jpg" alt="Confira os filmes que estão em cartaz na cidade..." />
              </a>
              <h2>
                <a href="http://www.araraquara.com/lazerecultura/cinema/" title="Confira os filmes que estão em cartaz na cidade...">Cinema</a>
              </h2>
              <p>
                <a href="http://www.araraquara.com/lazerecultura/cinema/" title="Confira os filmes que estão em cartaz na cidade...">Confira os filmes que estão em cartaz na cidade.</a>
              </p>
            </div>
          </li>
          <li>
            <div>
              <h2>
                <a href="http://empregos.araraquara.com/" title="Confira todas as vagas que estão disponíveis...">Concursos</a>
              </h2>
              <a href="http://empregos.araraquara.com/" title="Confira todas as vagas que estão disponíveis...">
                <figure><img src="/img/icon-empregos-home.jpg" alt="Confira todas as vagas que estão disponíveis..." /></figure>
              </a>
              <h2>
                <a href="http://empregos.araraquara.com/" title="Confira todas as vagas que estão disponíveis...">Empregos</a>
              </h2>
              <p>
                <a href="http://empregos.araraquara.com/" title="Confira todas as vagas que estão disponíveis...">Confira todas as vagas que estão disponíveis.</a>
              </p>
            </div>
          </li>
          <li>
            <div>
              <h2>
                <a href="http://www.araraquara.com/promocao/" title="Confira todas as promoções do portal e participe...">Oportunidade</a>
              </h2>
              <a href="http://www.araraquara.com/promocao/" title="Confira todas as promoções do portal e participe...">
                <figure><img src="/img/icon-promocoes-home.jpg" alt="Confira todas as promoções do portal e participe..." /></figure>
              </a>
              <h2>
                <a href="http://www.araraquara.com/promocao/" title="Confira todas as promoções do portal e participe...">Promoções</a>
              </h2>
              <p>
                <a href="http://www.araraquara.com/promocao/" title="Confira todas as promoções do portal e participe...">Confira todas as promoções do portal e participe.</a>
              </p>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>