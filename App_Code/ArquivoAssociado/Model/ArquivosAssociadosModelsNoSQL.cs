using MongoDB.Bson;

/// <summary>
/// Descrição resumida de ArquivosAssociadosModelsNoSQL
/// </summary>
public class ArquivosAssociadosModelsNoSQL
{
    public ArquivosAssociadosModelsNoSQL()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }

    public class UploadFoldersModel
    {
        public ObjectId _id { get; set; }
        public int idFolder { get; set; }
        public int idSite { get; set; }
        public string nomeFolder { get; set; }
        public string caminhoRelativo { get; set; }
    }
    public class UploadFilesModel
    {
        public ObjectId _id { get; set; }
        public int idFile { get; set; }
        public int idFormato { get; set; }
        public int idFolder { get; set; }
        public bool? publicidade { get; set; }
        public string filename { get; set; }
        public string descricao { get; set; }
        public string datahora { get; set; }
        public string usuario { get; set; }
    }
}