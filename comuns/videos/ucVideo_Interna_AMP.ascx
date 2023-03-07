﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucVideo_Interna_AMP.ascx.cs" Inherits="CMS.Web.FrontEnd.TemplatesV55.Comuns.Videos.comuns_videos_ucVideo_Interna_AMP" %>

<section id="video" class="news section" itemscope itemtype="http://schema.org/Article">

        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="block">
                    <!-- Video -->
                    <article class="blog-post content content-width single mx-auto pt0">
                        <div class="post-content">
                            <header>
                                <div class="post-title pt0">
                                    <h2 itemprop="headline" class="h1 text-grad-sdigitais font-weight-bolder font-italic"><%=TituloVideo.Trim()%></h2>
                                    <h3 itemprop="description" class="h2 linhafina"><%=LinhaFinaVideo.Trim()%></h3>
                                    <meta itemprop="author" content="<%=Credito %>" />
                                     <meta itemprop="mainEntityOfPage" content="<%=this.Request.RawUrl.ToString() %>" />
                                    <meta itemprop="dateModified" content="<%=DataAtualizacao %>" />

                                    <div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
                                        <meta itemprop="name" content="<%=SiteName %>" />
                                        <div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
                                            <meta itemprop="url" content="<%=UrlLogoSite %>" />
                                        </div>
                                    </div>

                                    <div style="display: none;" itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
                                        <meta itemprop="url" content="<%=ImagemVideo %>" />
                                        <meta itemprop="width" content="100%" />
                                        <meta itemprop="height" content="100%" />
                                    </div>
                                    
                                </div>
                                <div class="creditos-not mt-4">
                                    <p class="font-weight-bolder p-0 m-0">
                                        <span class="font-weight-light"><time datetime="<%=DataPublicacaoFormatada %>" itemprop="datePublished"><%=DataPublicacaoFormatada %></time></span>
                                    </p>
                                </div>

                                 <script type="application/ld+json">
                                  {
                                            "@context": "http://schema.org",
                                            "@type": "NewsArticle",
                                            "mainEntityOfPage": "<%=this.Request.RawUrl.ToString() %>",
                                            "headline": "<%= (!string.IsNullOrWhiteSpace(TituloVideo)) ? TituloVideo.Trim() : string.Empty%>",
                                            "datePublished":"<%=DataPublicacaoFormatada %>",
                                            "dateModified": "<%=DataAtualizacao %>",
                                            "articleBody": "<%=(!string.IsNullOrWhiteSpace(TituloVideo)) ? TituloVideo.Trim() : string.Empty%>",
                                            "description": "<%=LinhaFinaVideo.Trim()%>",
                                            "url": "<%=this.Request.RawUrl.ToString() %>",
                                            "author": { "@type": "Person", "name": "<%=Credito %>"},
                                            "publisher":{"@type":"Organization", "name":"<%=SiteName %>", 
                                            "logo": {  "@type": "ImageObject", "url":"<%=UrlLogoSite%>" } },
                                            "image": { "@type": "ImageObject","url": "<%=ImagemVideo %>" }
                                   }
                                </script>
                                
                            </header>
                            <div class="clearfix"></div>
                            <hr class="my-2" />
                            <div itemprop="articleBody" class="post-details text-justify">
                                <div class="video-interna p-0 my-4" itemscope itemtype="http://schema.org/VideoObject">
                                    <meta itemprop="thumbnailUrl" content="<%=ImagemVideo %>">
                                    <meta itemprop="contentUrl" content="<%=UrlVideo%>">
                                    <meta itemprop="uploadDate" content="<%=DataPublic %>">

                                    <%=HtmlToAMPHelper.CommonHtmlToAMPHelper.HtmlToAmpVideo(HtmlVideo) %>

                                </div>
                                <p><%=ResumoVideo != "<p>.</p>" ? ResumoVideo : string.Empty%></p>
                            </div>
                        </div>
                    </article>
                    <!-- End Video -->

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
                    

                    <!-- AMP Analytics UA, video tracker -->
                    <%=GeracaoAnalytics() %>

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
                            <div overflow="" placeholder="" tabindex="0" role="button" class="amp-hidden"></div>
                        </amp-iframe>

                        <%--CXENSE server--%>
                        <amp-iframe id="amp-cxense-server" width="640" height="1878"
                            sandbox="allow-top-navigation allow-scripts allow-popups allow-popups-to-escape-sandbox"
                            layout="responsive"
                            frameborder="0"
                            resizable
                            src="/comuns/widgets/cxense/amp-template-server.aspx?idmidia=<%=idvideo %>&ativarcxense=<%=ativarModuloCXENSE %>&nivelrestricao=<%=NivelRestricaoVideo %>"
                            style="height: 5px;"> 
                            <div overflow="" placeholder="" tabindex="0" role="button" class="amp-hidden"></div>
                        </amp-iframe>
                    <% } %>

                    <div class="content content-width">
                        <% if (ativarModuloTABULA) { %>
                            <%--Taboola--%>
                            <amp-embed id="amp-taboola" type="taboola" width="400" height="300" layout="responsive" data-publisher="acidadeon" data-mode="thumbnails-a" data-placement="Below Article Thumbnails AMP" data-article="auto" />
                        <% } %>
                    </div>

                </div>
            </div>
        </div>

</section>