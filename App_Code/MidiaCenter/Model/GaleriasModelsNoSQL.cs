﻿using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

/// <summary>
/// Descrição resumida de GaleriasModelsNoSQL
/// </summary>
public class GaleriasModelsNoSQL
{
    public GaleriasModelsNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    public class IdsGaleria
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
        public List<dynamic> ListGaleriasModels { get; set; }
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
    public class GaleriasSecoesModel
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
    public class GaleriasBsonModel
    {
        public ObjectId _id { get; set; }
        public bool? ativo { get; set; }
        public int idgaleria { get; set; }
        public string publicacao { get; set; }
        public string expiracao { get; set; }
        public string manchete { get; set; }
        public string destaque { get; set; }
        public string url { get; set; }
        public string tags { get; set; }
        public string votos { get; set; }
        public int rate { get; set; }
        public string resumo { get; set; }
        public string subpasta { get; set; }
        public int nivelrestricao { get; set; }
        public int secaoid { get; set; }
        public string credito { get; set; }
        public string atualizacao { get; set; }
        public string idsites { get; set; }
        public int idportal { get; set; }
        public List<dynamic> fotos { get; set; }
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
        public List<GaleriasBsonCustomModel> galerias { get; set; }
    }

    public class GaleriasBsonCustomModel
    {
        public int idgaleria { get; set; }

        [BsonDateTimeOptions(Kind = DateTimeKind.Local)]
        public DateTime publicacao { get; set; }
    }

    public class McGaleriasModel
    {
        public bool? GALERIA_APROVADA { get; set; }
        public string GALERIA_APROVADA_POR { get; set; }
        public DateTime? GALERIA_APROVADA_DATA { get; set; }
        public int COMENTARIO_GRUPO_ID { get; set; }
        public int GALERIA_QTD_ENVIO_AMIGO { get; set; }
        public int GALERIA_QTD_COMPRAS { get; set; }
        public int GALERIA_QTD_ADD_FAVORITOS { get; set; }
        public int GALERIA_QTD_COMENTARIOS { get; set; }
        public bool? GALERIA_INTERNAUTA { get; set; }
        public bool? GALERIA_TERRA { get; set; }
        public string GALERIA_SUBPASTA { get; set; }
        public int? GALERIA_ID_USUARIO_INSERCAO { get; set; }
        public int? GALERIA_ID_USUARIO_ATUALIZACAO { get; set; }
        public DateTime? GALERIA_DATA_ATUALIZACAO { get; set; }
        public string GALERIA_CREDITO { get; set; }
        public int? FAUNA_ID { get; set; }
        public int? FLORA_ID { get; set; }
        public virtual ICollection<McGaleriasFotosModel> TbMC_GALERIAS_Fotos { get; set; }
        public int USUARIO_ID { get; set; }
        public long GALERIA_VIEWS { get; set; }
        public int GALERIA_RATE_VOTO5 { get; set; }
        public int GALERIA_RATE_VOTO4 { get; set; }
        public int GALERIA_ID { get; set; }
        public string GALERIA_MANCHETE { get; set; }
        public string GALERIA_DESTAQUE { get; set; }
        public string GALERIA_RESUMO { get; set; }
        public string GALERIA_URL { get; set; }
        public bool? GALERIA_DESTACAR { get; set; }
        public string GALERIA_TAG_BUSCA { get; set; }
        public DateTime GALERIA_DATA_CRIACAO { get; set; }
        public DateTime GALERIA_DATA_PUBLICACAO { get; set; }
        public DateTime GALERIA_DATA_EXPIRACAO { get; set; }
        public bool? GALERIA_ATIVA { get; set; }
        public byte? GALERIA_NIVELRESTRICAO { get; set; }
        public int? SITEPRINCIPAL_ID { get; set; }
        public int? SECAOPRINCIPAL_ID { get; set; }
        public int GALERIA_RATE { get; set; }
        public int GALERIA_RATE_INICIAL { get; set; }
        public int GALERIA_RATE_VOTO1 { get; set; }
        public int GALERIA_RATE_VOTO2 { get; set; }
        public int GALERIA_RATE_VOTO3 { get; set; }
    }

    public class McGaleriasFotosModel
    {
        public int FOTO_APROVADA_POR { get; set; }
        public DateTime? FOTO_APROVADA_DATA { get; set; }
        public bool? FOTO_APROVADA { get; set; }
        public DateTime FOTO_DATA_CRIACAO { get; set; }
        public int USUARIO_ID { get; set; }
        public int GALERIA_ID { get; set; }
        public long FOTO_VIEWS { get; set; }
        public int FOTO_ORDEM { get; set; }
        public bool? FOTO_ATIVA { get; set; }
        public int FOTO_DIMENSAO_ALT { get; set; }
        public string FOTO_THUMBNAIL { get; set; }
        public string FOTO_ARQUIVO { get; set; }
        public bool? FOTO_CAPA { get; set; }
        public string FOTO_CREDITO { get; set; }
        public string FOTO_LEGENDA { get; set; }
        public int FOTO_ID { get; set; }
        public int FOTO_DIMENSAO_LAR { get; set; }
        public virtual McGaleriasModel TbMC_GALERIAS { get; set; }
    }
 }