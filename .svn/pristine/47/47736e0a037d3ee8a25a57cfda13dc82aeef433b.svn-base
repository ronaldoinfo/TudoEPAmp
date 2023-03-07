using CMS.Noticia.Model;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Model
/// </summary>
public class SitesModelsNoSQL
{
    public SitesModelsNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    public class SitesModel
    {
        public virtual ICollection<SitesAgrupadoresModel> TbSites_Agrupadores { get; set; }
        public virtual ICollection<GrupoSecoesSitesModel> tbSysAdminGrupo_Secoes_Sites { get; set; }
        public virtual ICollection<SecoesSitesModel> TbSecoes_Sites { get; set; }
        public virtual ICollection<NoticiasConteudoFontesModel> TbNoticias_ConteudoFontes { get; set; }
        public virtual ICollection<NoticiasConteudoCreditosModel> TbNoticias_ConteudoCreditos { get; set; }
        public int versaoTemplateFront { get; set; }
        public bool? UtilizaMarcaDagua { get; set; }
        public bool? habilitaProprClubeAssinante { get; set; }
        public bool? reterNoticia { get; set; }
        public DateTime? dtAtualizacao { get; set; }
        public int IdUsuarioAtualizacao { get; set; }
        public bool? status { get; set; }
        public bool? identificarCanaisSecoes { get; set; }
        public bool? agruparConteudo { get; set; }
        public int? idcidade { get; set; }
        public string FanPage { get; set; }
        public string URLBoletim { get; set; }
        public string URLParticipacao { get; set; }
        public string URLEMC { get; set; }
        public string URLPublicacao { get; set; }
        public string URL { get; set; }
        public string nomeSite { get; set; }
        public int idSite { get; set; }
        public virtual ICollection<SitesAgrupadoresModel> TbSites_Agrupadores1 { get; set; }
        public virtual ICollection<UsuariosModel> TbSysAdmin_Usuarios { get; set; }

        public bool? UtilizaNoSQL { get; set; }
    }

    public class SitesBsonModel
    {
        public ObjectId _id { get; set; }
        public virtual ICollection<SitesAgrupadoresModel> TbSites_Agrupadores { get; set; }
        public virtual ICollection<GrupoSecoesSitesModel> tbSysAdminGrupo_Secoes_Sites { get; set; }
        public virtual ICollection<SecoesSitesModel> TbSecoes_Sites { get; set; }
        public virtual ICollection<NoticiasConteudoFontesModel> TbNoticias_ConteudoFontes { get; set; }
        public virtual ICollection<NoticiasConteudoCreditosModel> TbNoticias_ConteudoCreditos { get; set; }
        public int versaoTemplateFront { get; set; }
        public bool? UtilizaMarcaDagua { get; set; }
        public bool? habilitaProprClubeAssinante { get; set; }
        public bool? reterNoticia { get; set; }
        public DateTime? dtAtualizacao { get; set; }
        public int IdUsuarioAtualizacao { get; set; }
        public bool? status { get; set; }
        public bool? identificarCanaisSecoes { get; set; }
        public bool? agruparConteudo { get; set; }
        public int? idcidade { get; set; }
        public string FanPage { get; set; }
        public string URLBoletim { get; set; }
        public string URLParticipacao { get; set; }
        public string URLEMC { get; set; }
        public string URLPublicacao { get; set; }
        public string URL { get; set; }
        public string nomeSite { get; set; }
        public int idSite { get; set; }
        public virtual ICollection<SitesAgrupadoresModel> TbSites_Agrupadores1 { get; set; }
        public virtual ICollection<UsuariosModel> TbSysAdmin_Usuarios { get; set; }

        public bool? UtilizaNoSQL { get; set; }
    }
}