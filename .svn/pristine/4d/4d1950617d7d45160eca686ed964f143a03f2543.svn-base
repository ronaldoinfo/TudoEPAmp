using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using WebApi.SiteNoSQL.Controllers;

/// <summary>
/// Descrição resumida de ArquivoAssociadoController
/// </summary>
/// 
namespace WebApi.ArquivosAssociadosNoSQLController.Controllers
{
    [RoutePrefix("api/ArquivosAssociadosNoSQL")]
    public class ArquivosAssociadosNoSQLController : ApiController
    {
        private static string UrlBaseApi;
        private static int IdSite;
        private static SitesModelsNoSQL.SitesModel sitesModel;
        private static IMongoDatabase mongoDatabase;

        /// <summary>
        /// Existem 2 construtores, sendo 1 sem parâmetro, que busca do tbsites do MSSQL. (na verdade sempre que formos publicar devemos pegar direto do MSSQL)
        /// O outro construtor busca dos sites do NoSQL para maior velocidade nas buscas e também quando o MSSQL estiver fora.
        /// </summary>
        public ArquivosAssociadosNoSQLController()
        {
            UrlBaseApi = ConfigurationManager.AppSettings["urlBaseAPI"].ToString();
            IdSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
            var client = CommonMongoClient.Instance;
            mongoDatabase = client.GetDatabase(IdSite.ToString());
            SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
            sitesModel = sitesNoSQLController.GetSite(IdSite);
        }

        public ArquivosAssociadosNoSQLController(bool FromNoSQL = false)
        {
            UrlBaseApi = ConfigurationManager.AppSettings["urlBaseAPI"].ToString();
            IdSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
            var client = CommonMongoClient.Instance;
            mongoDatabase = client.GetDatabase(IdSite.ToString());
            SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
            sitesModel = FromNoSQL ? sitesNoSQLController.SitesBsonModelToSitesModel(sitesNoSQLController.GetSiteByIdNoSQL(IdSite)) : sitesNoSQLController.GetSite(IdSite);
        }

        #region Publicadores

        /// <summary>
        /// Gera documento no mongo baseado na tabela TbSites
        /// </summary>
        [HttpGet]
        [Route("PublicarUploadFolders")]
        public string PublicarUploadFolders()
        {
            mongoDatabase.DropCollectionAsync("UploadFolders");

            string inicio = DateTime.Now.ToString();
            var collection = mongoDatabase.GetCollection<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>("UploadFolders");

            foreach (var item in GetAllUploadFolders())
            {
                collection.InsertOneAsync(item);
            }

            #region Criação de índices
            IndexKeysDefinition<ArquivosAssociadosModelsNoSQL.UploadFoldersModel> keys = Builders<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>.IndexKeys.Ascending("idFolder");
            var options = new CreateIndexOptions { Name = "UploadFoldersIDX" };
            var indexModel = new CreateIndexModel<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>(keys, options);
            collection.Indexes.CreateOneAsync(indexModel);
            #endregion

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("PublicarUploadFiles")]
        public string PublicarUploadFiles()
        {
            mongoDatabase.DropCollectionAsync("UploadFiles");

            string inicio = DateTime.Now.ToString();
            var collection = mongoDatabase.GetCollection<ArquivosAssociadosModelsNoSQL.UploadFilesModel>("UploadFiles");

            foreach (var item in GetAllUploadFiles())
            {
                collection.InsertOneAsync(item);
            }

            #region Criação de índices
            IndexKeysDefinition<ArquivosAssociadosModelsNoSQL.UploadFilesModel> keys = Builders<ArquivosAssociadosModelsNoSQL.UploadFilesModel>.IndexKeys.Ascending("idFile");
            var options = new CreateIndexOptions { Name = "UploadFilesIDX" };
            var indexModel = new CreateIndexModel<ArquivosAssociadosModelsNoSQL.UploadFilesModel>(keys, options);
            collection.Indexes.CreateOneAsync(indexModel);
            #endregion

            return JsonConvert.SerializeObject("{" + "Início: " + inicio + ", Término: " + DateTime.Now.ToString() + ", Duração: " + (DateTime.Now - Convert.ToDateTime(inicio))) + "}";
        }

        [HttpGet]
        [Route("InserirUploadFile")]
        public bool InserirUploadFile(int IdFile)
        {
            try
            {
                RemoverUploadFile(IdFile);

                var collection = mongoDatabase.GetCollection<dynamic>("UploadFiles");
                var uploadFilesModel = GetUploadFileByIdFile(IdFile);

                collection.InsertOneAsync(new
                {
                    idFile = uploadFilesModel.idFile,
                    idFormato = uploadFilesModel.idFormato,
                    filename = uploadFilesModel.filename,
                    idFolder = uploadFilesModel.idFolder,
                    descricao = uploadFilesModel.descricao,
                    datahora = uploadFilesModel.datahora,
                    usuario = uploadFilesModel.usuario,
                    publicidade = uploadFilesModel.publicidade
                });

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpGet]
        [Route("RemoverUploadFile")]
        public bool RemoverUploadFile(int IdFile)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<dynamic>("UploadFiles");
                var filter = Builders<dynamic>.Filter.Eq("idFile", IdFile);
                var resultado = collection.DeleteOne(filter);

                return (resultado.DeletedCount > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region Buscas NoSQL

        [HttpGet]
        [Route("GetUploadFolderByIdSiteNoSQL")]
        public async Task<ArquivosAssociadosModelsNoSQL.UploadFoldersModel> GetUploadFolderByIdSiteNoSQL(int IdSite)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>("UploadFolders");
                var filter = Builders<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>.Filter.Eq("idSite", IdSite);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetUploadFileByIdFileNoSQL")]
        public async Task<ArquivosAssociadosModelsNoSQL.UploadFilesModel> GetUploadFileByIdFileNoSQL(int IdFile)
        {
            try
            {
                var collection = mongoDatabase.GetCollection<ArquivosAssociadosModelsNoSQL.UploadFilesModel>("UploadFiles");
                var filter = Builders<ArquivosAssociadosModelsNoSQL.UploadFilesModel>.Filter.Eq("idFile", IdFile);
                return await collection.FindAsync(filter).Result.FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

        #region Buscas Banco Relacional
        private static List<ArquivosAssociadosModelsNoSQL.UploadFoldersModel> GetAllUploadFolders()
        {
            List<ArquivosAssociadosModelsNoSQL.UploadFoldersModel> uploadFoldersModel = new List<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "UploadFolders";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var uploadFoldersJsonString = response.Content.ReadAsStringAsync().Result;
                uploadFoldersModel = JsonConvert.DeserializeObject<List<ArquivosAssociadosModelsNoSQL.UploadFoldersModel>>(uploadFoldersJsonString);
            }

            return uploadFoldersModel;
        }

        private static List<ArquivosAssociadosModelsNoSQL.UploadFilesModel> GetAllUploadFiles()
        {
            List<ArquivosAssociadosModelsNoSQL.UploadFilesModel> uploadFilesModel = new List<ArquivosAssociadosModelsNoSQL.UploadFilesModel>();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "UploadFiles";
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var uploadFoldersJsonString = response.Content.ReadAsStringAsync().Result;
                uploadFilesModel = JsonConvert.DeserializeObject<List<ArquivosAssociadosModelsNoSQL.UploadFilesModel>>(uploadFoldersJsonString);
            }

            return uploadFilesModel;
        }

        private static ArquivosAssociadosModelsNoSQL.UploadFilesModel GetUploadFileByIdFile(int IdFile)
        {
            ArquivosAssociadosModelsNoSQL.UploadFilesModel uploadFilesModel = new ArquivosAssociadosModelsNoSQL.UploadFilesModel();
            var client = CommonHttpClient.Instance;
            var URI = UrlBaseApi + "UploadFiles/" + IdFile;
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var uploadFoldersJsonString = response.Content.ReadAsStringAsync().Result;
                uploadFilesModel = JsonConvert.DeserializeObject<ArquivosAssociadosModelsNoSQL.UploadFilesModel>(uploadFoldersJsonString);
            }

            return uploadFilesModel;
        }
        #endregion
    }
}