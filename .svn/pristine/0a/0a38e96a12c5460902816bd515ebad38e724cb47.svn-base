using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

/// <summary>
/// Descrição resumida de ModelsNoSQL
/// </summary>
public class NoticiasModelsNoSQL
{
    public NoticiasModelsNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    #region Models, Enums, Classes Auxiliares
    public class IdsNoticia
    {
        public string Ids { get; set; }
    }
    public class SecoesCanaisModel
    {
        public int IdCanal { get; set; }
        public string Canal { get; set; }
        public List<dynamic> Editorias { get; set; }
    }

    public class SecoesModel
    {
        public ObjectId _id { get; set; }
        public List<dynamic> ListSecoesModel { get; set; }
        public List<dynamic> ListNoticiasModels { get; set; }
        public string Canal { get; set; }
        public byte TipoConteudo { get; set; }
        public int? Modoexibicao { get; set; }
        public DateTime? DtAtualizacao { get; set; }
        public int IdUsuarioAtualizacao { get; set; }
        public bool? Status { get; set; }
        public bool Xml { get; set; }
        public bool Multimidia { get; set; }
        public bool Agencia { get; set; }
        public string Paginasecao { get; set; }
        public string Diretorio { get; set; }
        public byte HotSite { get; set; }
        public int? IdCanal { get; set; }
        public string Secao { get; set; }
        public int IdTipoSecao { get; set; }
        public int IdSecaoSecao { get; set; }
        public int IdSecaoEditoria { get; set; }
        public int IdSecaoPai { get; set; }
        public int IdSecao { get; set; }
        public string Tagspadrao { get; set; }
        //public virtual SecoesTiposModel TbSecoes_Tipos { get; set; }
    }
    public enum EnumTipoSecao
    {
        Home = 1,
        Editoria = 2,
        Secao = 3,
        SubSecao = 4
    }
    public class NoticiasModel
    {
        public int? QtdVisitas { get; set; }
        public int? QtdVotos { get; set; }
        public int? SomatoriaVotos { get; set; }
        public string Noticia { get; set; }
        public int? IdCidade { get; set; }
        public int IdSecao { get; set; }
        public int? TipoMidiaEmbed { get; set; }
        public bool? ContemcomentarioFacebook { get; set; }
        public int? IdUsuarioConectado { get; set; }
        public decimal? Investimento { get; set; }
        public string PrioridadeImagens { get; set; }
        public int? FAUNA_ID { get; set; }
        public int? FLORA_ID { get; set; }
        public int? IdImagemPatrocinio { get; set; }
        public decimal? Precovoucher { get; set; }
        public bool? Contemcomentario { get; set; }
        public int? IdTipoConteudo { get; set; }
        public int? QtdLimiteVoucher { get; set; }
        public int? IdParceiro { get; set; }
        public decimal? Precofinalvoucher { get; set; }
        public decimal? Descontovoucher { get; set; }
        public DateTime DtAtualizacao { get; set; }
        public int IdUsuarioInsercao { get; set; }
        public int IdNoticia { get; set; }
        public DateTime DtInsercao { get; set; }
        public DateTime DtPublicacao { get; set; }
        public DateTime? DtExpiracao { get; set; }
        public int IdSitePadrao { get; set; }
        public string Fonte { get; set; }
        public string DestinoFonte { get; set; }
        public string Credito { get; set; }
        public string DestinoCredito { get; set; }
        public string TipoDestinoCredito { get; set; }
        public int? IdImagemManchete { get; set; }
        public int? IdImagemDestaque { get; set; }
        public int? TipoDestaque { get; set; }
        public int SubTipoDestaque { get; set; }
        public byte? Prioridade { get; set; }
        public int? DestaqueEmc { get; set; }
        public string DirecionarUrl { get; set; }
        public bool? Ativo { get; set; }
        public string Tags { get; set; }
        public string Destaque { get; set; }
        public string Manchete { get; set; }
        public string Assunto { get; set; }
        public string Assunto_alternativo { get; set; }
        public int IdUsuarioAtualizacao { get; set; }
        public byte NivelRestricao { get; set; }
        public bool? Publicado { get; set; }
        public int? IdEditor { get; set; }
        public int? IdReporter { get; set; }
        public int? IdIdioma { get; set; }
        public string Url { get; set; }
        public string Destino { get; set; }
        public bool? Mobile { get; set; }
        public List<ImagensModel> Imagens { get; set; }
    }
    public class ImagensModel
    {
        public int Idmultimidia { get; set; }
        public string Arquivo { get; set; }
        public string Credito { get; set; }
        public string Legenda { get; set; }
        public string Tipo { get; set; }// pode ser manchete ou destaque
    }
    public class VideosAssociadosModel
    {
        public int Idvideos { get; set; }
    }
    public class SonsAssociadosModel
    {
        public int Idsons { get; set; }
    }
    public class ArquivosAssociadosModel
    {
        public int Idarquivos { get; set; }
    }
    public class GaleriasAssociadasModel
    {
        public int Idgalerias { get; set; }
    }
    public class NoticiasFilesModel
    {
        public int IdNoticia { get; set; }
        public int IdFile { get; set; }
        public int ID { get; set; }
    }
    public class McVideosNoticiasModel
    {
        public int VIDEO_ID { get; set; }
        public int NOTICIA_ID { get; set; }
        public int ID { get; set; }
        public virtual NoticiasModel TbNoticias { get; set; }
    }
    public class NoticiasGaleriasModel
    {
        public int IdNoticia { get; set; }
        public int IdGaleria { get; set; }
        public int ID { get; set; }
        public virtual NoticiasModel TbNoticias { get; set; }
    }
    public class McSonsNoticiasModel
    {
        public int SOM_ID { get; set; }
        public int NOTICIA_ID { get; set; }
        public int ID { get; set; }
        public virtual NoticiasModel TbNoticias { get; set; }
    }
    public class McFotosModel
    {
        public int? FLORA_ID { get; set; }
        public int? FAUNA_ID { get; set; }
        public int CountFormatos { get; set; }
        public DateTime DtInsercao { get; set; }
        public int IdUsuarioInsercao { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public string Credito { get; set; }
        public string PalavrasChave { get; set; }
        public string Arquivo { get; set; }
        public string Pasta { get; set; }
        public int Idtipo { get; set; }
        public int IdGrupo { get; set; }
        public int IdMultimidia { get; set; }
        public string Legenda { get; set; }
    }
    public class CidadesModel
    {
        public int IdCidade { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public bool? CoberturaEPTV { get; set; }
        public int? IdRegiao { get; set; }
        public bool? Status { get; set; }
        public int? IdUsuarioAtualizacao { get; set; }
        public DateTime? DtAtualizacao { get; set; }
        public string Distrito { get; set; }
    }
    public class NoticiasSecoesModel
    {
        public ObjectId _id { get; set; }
        public int idCanal { get; set; }
        public string Canal { get; set; }
        public List<dynamic> editorias { get; set; }
        public List<dynamic> secoes { get; set; }
        public List<dynamic> subsecoes { get; set; }
    }
    public class NoticiasBsonModel
    {
        public ObjectId _id { get; set; }
        public int idnoticia { get; set; }
        public bool ativo { get; set; }
        public string publicacao { get; set; }
        public string expiracao { get; set; }
        public int tiponoticia { get; set; }
        public string url { get; set; }
        public string assunto { get; set; }
        public string assunto_alternativo { get; set; }
        public string destaque { get; set; }
        public string manchete { get; set; }
        public string tags { get; set; }
        public string tipo { get; set; }
        public int subtiponoticia { get; set; }
        public int idioma { get; set; }
        public string mob { get; set; }
        public string credito { get; set; }
        public int nivelrestricao { get; set; }
        public int tipomidiaembed { get; set; }
        public int idtipoconteudo { get; set; }
        public string atualizacao { get; set; }
        public string idsites { get; set; }
        public int idportal { get; set; }
        public string idparceiro { get; set; }
        public string precovoucher { get; set; }
        public string precofinalvoucher { get; set; }
        public string descontovoucher { get; set; }
        public string qtdlimitevoucher { get; set; }
        public bool? contemcomentarios { get; set; }
        public bool? contemcomentariofacebook { get; set; }
        public string fonte { get; set; }
        public string destinofonte { get; set; }
        public string destinocredito { get; set; }
        public string direcionaurl { get; set; }
        public string destino { get; set; }
        public string textonoticia { get; set; }
        public List<ImagensModel> imagens { get; set; }
        public string arquivos { get; set; }
        public string videos { get; set; }
        public string galerias { get; set; }
        public string sons { get; set; }
        public int siteprincipal { get; set; }
        public int secaoprincipal { get; set; }
        public List<CommonNoSQL.SecoesSites> secoessites { get; set; }
        public string urlCompleta { get; set; }
    }
    public class SecoesCanaisBsonModel
    {
        public ObjectId _id { get; set; }
        public int IdCanal { get; set; }
        public string Canal { get; set; }
        public List<EditoriasBsonModel> Editorias { get; set; }
    }
    public class EditoriasBsonModel
    {
        public int idsecao { get; set; }
        public int idsecaopai { get; set; }
        public int idsecaoeditoria { get; set; }
        public int idsecaosecao { get; set; }
        public int idtiposecao { get; set; }
        public int idcanal { get; set; }
        public string Canal { get; set; }
        public string nomesecao { get; set; }
        public string Diretorio { get; set; }
        public List<SecoesBsonModel> secoes { get; set; }
    }
    public class SecoesBsonModel
    {
        public ObjectId _id { get; set; }
        public int idsecao { get; set; }
        public int idsecaopai { get; set; }
        public int idsecaoeditoria { get; set; }
        public int idsecaosecao { get; set; }
        public int idtiposecao { get; set; }
        public int idcanal { get; set; }
        public string nomesecao { get; set; }
        public bool Agencia { get; set; }
        public string Diretorio { get; set; }
        public byte hotsite { get; set; }
        public List<SubSecoesBsonModel> subsecoes { get; set; }
    }

    public class SecoesBsonModelAuxiliar
    {
        public ObjectId _id { get; set; }
        public List<dynamic> ListSecoesModel { get; set; }
        public List<dynamic> ListNoticiasModels { get; set; }
        public string Canal { get; set; }
        public byte TipoConteudo { get; set; }
        public int? Modoexibicao { get; set; }
        public DateTime? DtAtualizacao { get; set; }
        public int IdUsuarioAtualizacao { get; set; }
        public bool? Status { get; set; }
        public bool Xml { get; set; }
        public bool Multimidia { get; set; }
        public bool Agencia { get; set; }
        public string Paginasecao { get; set; }
        public string Diretorio { get; set; }
        public byte HotSite { get; set; }
        public int? IdCanal { get; set; }
        public string Secao { get; set; }
        public int IdTipoSecao { get; set; }
        public int IdSecaoSecao { get; set; }
        public int IdSecaoEditoria { get; set; }
        public int IdSecaoPai { get; set; }
        public int IdSecao { get; set; }
        public string Tagspadrao { get; set; }
    }

    public class SecoesCanaisModelAuxiliar
    {
        public ObjectId _id { get; set; }
        public int IdCanal { get; set; }
        public string Canal { get; set; }
    }

    public class SubSecoesBsonModel
    {
        public int idsecao { get; set; }
        public int idsecaopai { get; set; }
        public string nomesecao { get; set; }
        public bool Agencia { get; set; }
        public string Diretorio { get; set; }
        public List<NoticiasBsonCustomModel> noticias { get; set; }
    }
    public class NoticiasBsonCustomModel
    {
        public int idnoticia { get; set; }
        public DateTime publicacao { get; set; }
    }

    #endregion
}