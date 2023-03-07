<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucNoticia_Interna_AMP.ascx.cs" Inherits="CMS.Web.FrontEnd.TemplatesV55.Comuns.Noticias.ucNoticia_Interna_AMP" %>
<section id="noticia" class="news section">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="block">
                        <div class="post-content">
                            <header>
                                <% if (!string.IsNullOrEmpty(TituloNoticia))
                                    { %>
                                <div class="creditos-not mt4">
                                    <p class="font-weight-bolder p0 m0">
                                        <span class="font-weight-light"><time datetime="<%=DataPublicacaoNoticiaFormatada %>" itemprop="datePublished"><%=DataPublicacaoNoticiaFormatada %></time></span>
                                    </p>
                                </div>
                                
                                <script type="application/ld+json">
                                  {
                                            "@context": "http://schema.org",
                                            "@type": "NewsArticle",
                                            "mainEntityOfPage": "<%=this.Request.RawUrl.ToString() %>",
                                            "headline": "<%= (!string.IsNullOrWhiteSpace(TituloNoticia)) ? TituloNoticia.Trim() : string.Empty%>",
                                            "datePublished":"<%=DataPublicacaoNoticiaFormatada %>",
                                            "dateModified": "<%=DataAtualizacaoNoticia %>",
                                            "articleBody": "<%=(!string.IsNullOrWhiteSpace(TituloNoticia)) ? TituloNoticia.Trim() : string.Empty%>",
                                            "description": "<%=LinhafinaNoticia.Trim()%>",
                                            "url": "<%=this.Request.RawUrl.ToString() %>",
                                            "author": { "@type": "Person", "name": "<%=CreditoNoticia %>", "url": "<%=DestinoCredito %>"},
                                            "publisher":{"@type":"Organization", "name":"<%=SiteName %>", 
                                            "logo": {  "@type": "ImageObject", "url":"<%=UrlLogoSite%>" } },
                                            "image": { "@type": "ImageObject","url": "<%=ImagemNoticiaUrl%>" }
                                   }
                                </script>
                            </header>
                            <div class="clearfix"></div>
                            <hr class="my-2" />

                            <amp-ad id="SLB1" class="adunit" type='doubleclick' data-slot="/<%=DFP_Rede %>/SLB1" width='320' height='50' data-multi-size='300x50, 300x100, 320x50, 320x100'
                            json='{"targeting":{"dfp_Pos":"SLB1","dfp_Format": "SLB1","dfp_IDPagina":"1595446","dfp_pgCategoria" :"noticia","dfp_pgTipo"
                            :"interna","dfp_pgStr" :"tudoep","dfp_Page" :"~tudoep*","dfp_adUnitPage" :"tudoep>interna","isBrandedContent" :"0","isVerticalSite" :"0"}}' >
                            </amp-ad>

<%--                            <amp-ad id="<%=Propriedades["position"]%>" style="max-width: 320px; width: 320px;overflow-x: hidden;margin-right: auto;margin-left: auto;min-height: 285px;text-align: center;" layout="fixed" 
                            type='doubleclick' data-slot="/<%=DFP_Rede %>/<%=Position %>" data-multi-size='<%=dimensao %>' data-multi-size-validation="false" 
                            json='{"targeting":{"dfp_Pos":"<%=Propriedades["position"]%>"}}' >
                            </amp-ad>--%>

                            <div itemprop="articleBody" class="post-details text-justify">
                                <%=HtmlToAMPHelper.CommonHtmlToAMPHelper.RemoveAttribute(HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpAudio(HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpVideo( HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpIframe(HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpYoutube(HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpImages(ConteudoNoticia))))),"amp-img","onerror") %>
                                <%=ConteudoArquivos %>
                                <%=HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpVideo(ConteudoVideos) %>
                                <%=HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpAudio(ConteudoPodcasts) %>
                            </div>
                            <%}%>
                        </div>

                        <!-- Publicidade -->
                        <div class="container">
                            <amp-ad width="320" height="50" type="doubleclick" data-slot='/43785210/SLB1' data-targeting='{"dfp_Pos":"SLB1"}'></amp-ad>
                        </div>

                    <div class="start-socialbar content content-md-width flex py0 bg-light">
                        <div class="flex col-8">
                            <div class="botao bg-facebook">
                                <amp-social-share class="my-auto bg-facebook facebook" type="facebook" width="37" height="26" aria-label="Share on Facebook" data-param-app_id="254325784911610"></amp-social-share>
                            </div>
                            <div class="botao bg-twitter">
                                <amp-social-share class="my-auto bg-twitter twitter" type="twitter" width="37" height="26" aria-label="Share on Twitter"></amp-social-share>
                            </div>
                            <div class="botao bg-linkedin">
                                <amp-social-share class="my-auto bg-linkedin linkedin" type="linkedin" width="37" height="26" aria-label="Share on LinkedIn"></amp-social-share>
                            </div>
                            <div class="botao bg-whatsapp">
                                <amp-social-share class="my-auto bg-whatsapp whatsapp bg-whatsapp" type="whatsapp" width="37" height="26" aria-label="Share on WhatsApp"></amp-social-share>
                            </div>
                            <div class="botao bg-gray">
                                <amp-social-share class="my-auto bg-gray email" type="email" width="37" height="26" aria-label="Share by email"></amp-social-share>
                            </div>
                            <div class="botao bg-acon">
                                <amp-social-share class="my-auto bg-acon devicesystem" type="system" width="37" height="26" aria-label="Share"></amp-social-share>
                            </div>
                        </div>
                    </div>

                    <div class="publicidade-comentario">
                    </div>

                    <!-- AMP Analytics UA, video tracker, galery tracker, audio tracker -->
                    <%=GeracaoAnalytics(HtmlToAMPHelper.AmpTypes.Carousel, HtmlToAMPHelper.AmpTypes.Youtube, HtmlToAMPHelper.AmpTypes.Video, HtmlToAMPHelper.AmpTypes.Audio) %>

                    <div>
                        <%=SaibaMais != "0" ? SaibaMais : string.Empty %>
                    </div>

                    <div>
                    <% if (ativarModuloCXENSE)
                        { %>
                        <%--CXENSE client--%>
                        <amp-iframe id="amp-cxense-client" width="640" height="1878"
                            sandbox="allow-top-navigation allow-scripts allow-popups allow-popups-to-escape-sandbox"
                            layout="responsive"
                            frameborder="0"
                            resizable
                            src="/comuns/widgets/cxense/amp-template.aspx?widgetId=92c3bfd8219a5c364fc142aa983e96cd2ef59960&ctx='<%=HttpContext.Current.Request.Url.AbsoluteUri %>'"
                            style="height: 5px;"> 
                            <div overflow="" placeholder="" tabindex="0" role="button" class="amp-hidden">
                                <amp-img width="50" height="50" layout="fixed" src="/img/loading_alt.svg" alt=""></amp-img>
                            </div>
                        </amp-iframe>

                        <%--CXENSE server--%>
                        <amp-iframe id="amp-cxense-server" width="640" height="1878"
                            sandbox="allow-top-navigation allow-scripts allow-popups allow-popups-to-escape-sandbox"
                            layout="responsive"
                            frameborder="0"
                            resizable
                            src="/comuns/widgets/cxense/amp-template-server.aspx?idmidia=<%=idnoticia %>&ativarcxense=<%=ativarModuloCXENSE %>&nivelrestricao=<%=NivelRestricao %>"
                            style="height: 5px;"> 
                            <div overflow="" placeholder="" tabindex="0" role="button" class="amp-hidden">
                                <amp-img width="50" height="50" layout="fixed" src="/img/loading_alt.svg" alt=""></amp-img>
                            </div>
                        </amp-iframe>
                    <% } %>
                    </div>

                    <div class="content content-width">
                        <% if (ativarModuloTABULA)
                            { %>
                            <%--Taboola--%>
                            <amp-embed id="amp-taboola" type="taboola" width="400" height="300" layout="responsive" data-publisher="acidadeon" data-mode="thumbnails-a" data-placement="Below Article Thumbnails AMP" data-article="auto" />
                        <% } %>
                    </div>

                </div>
            </div>
        </div>
</section>