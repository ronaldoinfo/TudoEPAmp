using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

/// <summary>
/// Descrição resumida de SonsModelsNoSQL
/// </summary>
public class SonsModelsNoSQL
{
    public SonsModelsNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    public class IdsSom
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
        public List<dynamic> ListSonsModels { get; set; }
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
    public class SonsSecoesModel
    {
        public ObjectId _id { get; set; }
        public int idCanal { get; set; }
        public string Canal { get; set; }
        public List<dynamic> editorias { get; set; }
        public List<dynamic> secoes { get; set; }
        public List<dynamic> subsecoes { get; set; }
    }
    public enum EnumTipoSecao
    {
        Home = 1,
        Editoria = 2,
        Secao = 3,
        SubSecao = 4
    }
    public class SonsBsonModel
    {
        public ObjectId _id { get; set; }
        public bool? ativo { get; set; }
        public int idsom { get; set; }
        public string publicacao { get; set; }
        public string expiracao { get; set; }
        public string assunto { get; set; }
        public string manchete { get; set; }
        public string destaque { get; set; }
        public string legenda { get; set; }
        public string arquivo { get; set; }
        public string url { get; set; }
        public string subpasta { get; set; }
        public string duracao { get; set; }
        public int view { get; set; }
        public int nivelrestricao { get; set; }
        public string atualizacao { get; set; }
        public string idsites { get; set; }
        public int idportal { get; set; }
        public List<ImagensModel> imagens { get; set; }
        public string tags { get; set; }
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
        public string Canal { get; set; }
        public string nomesecao { get; set; }
        public string Diretorio { get; set; }
        public List<SecoesBsonModel> secoes { get; set; }
    }
    public class SecoesBsonModel
    {
        public int idsecao { get; set; }
        public int idsecaopai { get; set; }
        public string nomesecao { get; set; }
        public bool Agencia { get; set; }
        public string Diretorio { get; set; }
        public byte hotsite { get; set; }
        public List<SubSecoesBsonModel> subsecoes { get; set; }
    }
    public class SubSecoesBsonModel
    {
        public int idsecao { get; set; }
        public int idsecaopai { get; set; }
        public string nomesecao { get; set; }
        public bool Agencia { get; set; }
        public List<SonsBsonCustomModel> sons { get; set; }
    }
    public class SonsBsonCustomModel
    {
        public int idsom { get; set; }

        [BsonDateTimeOptions(Kind = DateTimeKind.Local)]
        public DateTime publicacao { get; set; }
    }
    public class McSonsModel
    {
        public int? FAUNA_ID { get; set; }
        public string SOM_CREDITO { get; set; }
        public DateTime? SOM_DATA_ATUALIZACAO { get; set; }
        public int? SOM_ID_USUARIO_ATUALIZACAO { get; set; }
        public int? SOM_ID_USUARIO_INSERCAO { get; set; }
        public int? SOM_VIEWS { get; set; }
        public bool? SOM_ATIVO { get; set; }
        public DateTime SOM_DATA_EXPIRACAO { get; set; }
        public DateTime SOM_DATA_PUBLICACAO { get; set; }
        public DateTime? SOM_DATA_CRIACAO { get; set; }
        public string SOM_DURACAO { get; set; }
        public string SOM_ARQUIVO { get; set; }
        public string SOM_SUBPASTA { get; set; }
        public string SOM_LEGENDA { get; set; }
        public byte? SOM_NIVELRESTRICAO { get; set; }
        public int SITEPRINCIPAL_ID { get; set; }
        public int SECAOPRINCIPAL_ID { get; set; }
        public string SOM_URL { get; set; }
        public string SOM_TAG_BUSCA { get; set; }
        public string SOM_DESTAQUE { get; set; }
        public string SOM_MANCHETE { get; set; }
        public string SOM_CHAPEU { get; set; }
        public int SOM_ID { get; set; }
        public List<ImagensModel> Imagens { get; set; }
        public int? IdImagemManchete { get; set; }
        public int? IdImagemDestaque { get; set; }

    }
    public class ImagensModel
    {
        public int Idmultimidia { get; set; }
        public string Arquivo { get; set; }
        public string Credito { get; set; }
        public string Legenda { get; set; }
        public string Tipo { get; set; }// pode ser manchete ou destaque
    }
}