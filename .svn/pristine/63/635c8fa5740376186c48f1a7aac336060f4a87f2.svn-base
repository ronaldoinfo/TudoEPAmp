using System;
using System.Collections;
using System.Configuration;
using System.Linq;
using WebApi.NoticiaNoSQL.Controllers;
using WebApi.SiteNoSQL.Controllers;

/// <summary>
/// Descrição resumida de CommonNoSQL
/// </summary>
public class CommonNoSQL
{
    public CommonNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    public string MontaPrefixoUrlPorTipoMidiaNoSQL(string TipoMidia, int? IdSecaoInt = null, NoticiasModelsNoSQL.NoticiasBsonModel noticia = null, SonsModelsNoSQL.SonsBsonModel som = null,
        GaleriasModelsNoSQL.GaleriasBsonModel galeria = null, VideosModelsNoSQL.VideosBsonModel video = null)
    {
        string retorno = string.Empty;
        int siteWebConfig = int.Parse(((Hashtable)ConfigurationManager.GetSection("viaeptv.noticia"))["id_site"].ToString());
        SitesModelsNoSQL.SitesBsonModel site = new SitesModelsNoSQL.SitesBsonModel();

        int idSecao = 0;
        if (IdSecaoInt != null && IdSecaoInt > 0)
            idSecao = Convert.ToInt32(IdSecaoInt);

        int idsecaoeditoria = 0;
        int idsecaopai = 0;
        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secaoeditoria = null;
        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secaopai = null;
        NoticiasNoSQLController noticiasNoSQLController = new NoticiasNoSQLController();

        // tipoMidia = 1 -> Notícia
        if (TipoMidia == "1")
        {
            if (noticia != null)
            {
                // verifica se o site de contexto está nos sites da noticias secoes sites
                var secoessiteContexto = noticia.secoessites.Where(a => a.idsite == siteWebConfig && a.idconteudo == noticia.idnoticia);

                if (secoessiteContexto != null && secoessiteContexto.Any())
                {
                    foreach (var secoessite in secoessiteContexto)
                    {
                        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secao = noticiasNoSQLController.GetSecaoByIdNoSQL(secoessite.idsecao);

                        if (secao != null)
                        {
                            if (secao.IdSecao == idSecao || secao.IdSecaoPai == idSecao || secao.IdSecaoEditoria == idSecao || secao.IdSecaoSecao == idSecao)
                            {
                                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                                site = sitesNoSQLController.GetSiteByIdNoSQL(secoessite.idsite);
                                idSecao = secao.IdSecao;

                                idsecaoeditoria = secao.IdSecaoEditoria;
                                secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                                idsecaopai = secao.IdSecaoPai;
                                secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                                break;
                            }
                        }
                    }
                    if (site == null)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL(noticia.siteprincipal);
                        idSecao = noticia.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                    else if (site != null && site.idSite == 0)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL((int)noticia.siteprincipal);
                        idSecao = (int)noticia.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                }
                else
                {
                    // do contrário a url será baseada no site padrão marcado/selecionado no backend
                    SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                    site = sitesNoSQLController.GetSiteByIdNoSQL(noticia.siteprincipal);
                    idSecao = noticia.secaoprincipal;

                    var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                    if (secaoAuxiliar != null)
                    {
                        idsecaopai = secaoAuxiliar.IdSecaoPai;
                        secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                        idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                        secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                    }
                }

                // Verifica se é um Canal
                // NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoPai = secaopai != null ? noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaopai) : null;
                NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoEditoria = secaoeditoria != null ? noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaoeditoria) : null;

                if (canalSecaoEditoria != null)
                {
                    if (secaopai != null && secaopai.HotSite == 1)
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaopai.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaopai.Diretorio + "/";
                        }
                    }
                    else
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaoeditoria.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaoeditoria.Diretorio + "/";
                        }
                    }
                }
                else
                {
                    retorno = site.URL;
                }
            }
            else
            {
                // retorno empty pois se a notícia não está no mongo, devo utilizar a busca no banco relacional
                retorno = string.Empty;
            }
        }
        // tipoMidia = 2 -> Galeria
        else if (TipoMidia == "2")
        {
            if (galeria != null)
            {
                // verifica se o site de contexto está nos sites da galeria secoes sites
                var secoessiteContexto = galeria.secoessites.Where(a => a.idsite == siteWebConfig && a.idconteudo == galeria.idgaleria);

                if (secoessiteContexto != null && secoessiteContexto.Any())
                {
                    foreach (var secoessite in secoessiteContexto)
                    {
                        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secao = noticiasNoSQLController.GetSecaoByIdNoSQL(secoessite.idsecao);

                        if (secao != null)
                        {
                            if (secao.IdSecao == idSecao || secao.IdSecaoPai == idSecao || secao.IdSecaoEditoria == idSecao || secao.IdSecaoSecao == idSecao)
                            {
                                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                                site = sitesNoSQLController.GetSiteByIdNoSQL(secoessite.idsite);
                                idSecao = secao.IdSecao;

                                idsecaoeditoria = secao.IdSecaoEditoria;
                                secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                                idsecaopai = secao.IdSecaoPai;
                                secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                                break;
                            }
                        }
                    }
                    if (site == null)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL(galeria.siteprincipal);
                        idSecao = galeria.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                    else if (site != null && site.idSite == 0)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL((int)galeria.siteprincipal);
                        idSecao = (int)galeria.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                }
                else
                {
                    // do contrário a url será baseada no site padrão marcado/selecionado no backend
                    SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                    site = sitesNoSQLController.GetSiteByIdNoSQL(galeria.siteprincipal);
                    idSecao = galeria.secaoprincipal;

                    var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                    if (secaoAuxiliar != null)
                    {
                        idsecaopai = secaoAuxiliar.IdSecaoPai;
                        secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                        idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                        secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                    }
                }

                // Verifica se é um Canal
                //NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoPai = noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaopai);
                NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoEditoria = secaoeditoria != null ? noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaoeditoria) : null;

                if (canalSecaoEditoria != null)
                {
                    if (secaopai != null && secaopai.HotSite == 1)
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaopai.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaopai.Diretorio + "/";
                        }
                    }
                    else
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaoeditoria.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaoeditoria.Diretorio + "/";
                        }
                    }
                }
                else
                {
                    retorno = site.URL;
                }
            }
            else
            {
                // retorno empty pois se a galeria não está no mongo, devo utilizar a busca no banco relacional
                retorno = string.Empty;
            }
        }
        // tipoMidia = 3 -> Vídeo
        else if (TipoMidia == "3")
        {
            if (video != null)
            {
                // verifica se o site de contexto está nos sites da tabela videos secoes sites
                var secoessiteContexto = video.secoessites.Where(a => a.idsite == siteWebConfig && a.idconteudo == video.idvideo);

                if (secoessiteContexto != null && secoessiteContexto.Any())
                {
                    foreach (var secoessite in secoessiteContexto)
                    {
                        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secao = noticiasNoSQLController.GetSecaoByIdNoSQL(secoessite.idsecao);

                        if (secao != null)
                        {
                            if (secao.IdSecao == idSecao || secao.IdSecaoPai == idSecao || secao.IdSecaoEditoria == idSecao || secao.IdSecaoSecao == idSecao)
                            {
                                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                                site = sitesNoSQLController.GetSiteByIdNoSQL(secoessite.idsite);
                                idSecao = secao.IdSecao;

                                idsecaoeditoria = secao.IdSecaoEditoria;
                                secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                                idsecaopai = secao.IdSecaoPai;
                                secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                                break;
                            }
                        }
                    }
                    if (site == null)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL(video.siteprincipal);
                        idSecao = video.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                    else if (site != null && site.idSite == 0)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL((int)video.siteprincipal);
                        idSecao = (int)video.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                }
                else
                {
                    // do contrário a url será baseada no site padrão marcado/selecionado no backend
                    SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                    site = sitesNoSQLController.GetSiteByIdNoSQL(video.siteprincipal);
                    idSecao = video.secaoprincipal;

                    var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                    if (secaoAuxiliar != null)
                    {
                        idsecaopai = secaoAuxiliar.IdSecaoPai;
                        secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                        idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                        secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                    }
                }

                // Verifica se é um Canal
                //NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoPai = noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaopai);
                NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoEditoria = secaoeditoria != null ? noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaoeditoria) : null;

                if (canalSecaoEditoria != null)
                {
                    if (secaopai != null && secaopai.HotSite == 1)
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaopai.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaopai.Diretorio + "/";
                        }
                    }
                    else
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaoeditoria.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaoeditoria.Diretorio + "/";
                        }
                    }
                }
                else
                {
                    retorno = site.URL;
                }
            }
            else
            {
                // retorno empty pois se o video não está no mongo, devo utilizar a busca no banco relacional
                retorno = string.Empty;
            }
        }
        // tipoMidia = 4 -> Podcast - Sons
        else if (TipoMidia == "4")
        {
            if (som != null)
            {
                // verifica se o site de contexto está nos sites da tabela sons secoes sites
                var secoessiteContexto = som.secoessites.Where(a => a.idsite == siteWebConfig && a.idconteudo == som.idsom);

                if (secoessiteContexto != null && secoessiteContexto.Any())
                {
                    foreach (var secoessite in secoessiteContexto)
                    {
                        NoticiasModelsNoSQL.SecoesBsonModelAuxiliar secao = noticiasNoSQLController.GetSecaoByIdNoSQL(secoessite.idsecao);

                        if (secao != null)
                        {
                            if (secao.IdSecao == idSecao || secao.IdSecaoPai == idSecao || secao.IdSecaoEditoria == idSecao || secao.IdSecaoSecao == idSecao)
                            {
                                SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                                site = sitesNoSQLController.GetSiteByIdNoSQL(secoessite.idsite);
                                idSecao = secao.IdSecao;

                                idsecaoeditoria = secao.IdSecaoEditoria;
                                secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                                idsecaopai = secao.IdSecaoPai;
                                secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                                break;
                            }
                        }
                    }
                    if (site == null)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL(som.siteprincipal);
                        idSecao = som.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                    else if (site != null && site.idSite == 0)
                    {
                        SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                        site = sitesNoSQLController.GetSiteByIdNoSQL((int)som.siteprincipal);
                        idSecao = (int)som.secaoprincipal;

                        var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                        if (secaoAuxiliar != null)
                        {
                            idsecaopai = secaoAuxiliar.IdSecaoPai;
                            secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                            idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                            secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                        }
                    }
                }
                else
                {
                    // do contrário a url será baseada no site padrão marcado/selecionado no backend
                    SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                    site = sitesNoSQLController.GetSiteByIdNoSQL(som.siteprincipal);
                    idSecao = som.secaoprincipal;

                    var secaoAuxiliar = noticiasNoSQLController.GetSecaoByIdNoSQL(idSecao);

                    if (secaoAuxiliar != null)
                    {
                        idsecaopai = secaoAuxiliar.IdSecaoPai;
                        secaopai = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaopai);
                        idsecaoeditoria = secaoAuxiliar.IdSecaoEditoria;
                        secaoeditoria = noticiasNoSQLController.GetSecaoByIdNoSQL(idsecaoeditoria);
                    }
                }

                // Verifica se é um Canal
                // NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoPai = noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaopai);
                NoticiasModelsNoSQL.SecoesCanaisModelAuxiliar canalSecaoEditoria = noticiasNoSQLController.GetSecaoCanalByIdCanalNoSQL(secaoeditoria);

                if (canalSecaoEditoria != null)
                {
                    if (secaopai != null && secaopai.HotSite == 1)
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaopai.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaopai.Diretorio + "/";
                        }
                    }
                    else
                    {
                        if (canalSecaoEditoria.Canal != "/")
                        {
                            retorno = site.URL + canalSecaoEditoria.Canal + secaoeditoria.Diretorio + "/";
                        }
                        else
                        {
                            retorno = site.URL + secaoeditoria.Diretorio + "/";
                        }
                    }
                }
                else
                {
                    retorno = site.URL;
                }
            }
            else
            {
                // retorno empty pois se o som não está no mongo, devo utilizar a busca no banco relacional
                retorno = string.Empty;
            }
        }

        return retorno;
    }
    public class SecoesSites
    {
        public int idsite { get; set; }
        public int idsecao { get; set; }
        public int idconteudo { get; set; }
    }
}