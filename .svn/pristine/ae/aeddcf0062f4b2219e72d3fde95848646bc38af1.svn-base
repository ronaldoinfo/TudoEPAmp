using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Linq;
using MongoDB.Bson;
using WebApi.MidiaCenterNoSQL.Galerias.Controllers;
using WebApi.NoticiaNoSQL.Controllers;
using WebApi.SiteNoSQL.Controllers;
using WebApi.MidiaCenterNoSQL.Sons.Controllers;
using WebApi.ArquivosAssociadosNoSQLController.Controllers;
using WebApi.MidiaCenterNoSQL.Videos.Controllers;

[RoutePrefix("api/CheckStructureSite")]
public class CheckStructureSiteController : ApiController
{
    /// <summary>
    /// Verifica se existem as coleções necessárias no NoSQL para que o site suba.
    /// </summary>
    [Route("CheckStructureSiteIsComplete")]
    [HttpGet]
    public bool CheckStructureSiteIsComplete(bool complete = false)
    {
        CheckConnectionController checkConnectionController = new CheckConnectionController();
        string[] collectionsArray = { "Secoes", "Galerias", "GaleriasSecoesSites", "Noticias", "NoticiasSecoesSites", "Sons",
                                      "SonsSecoesSites", "UploadFiles", "UploadFolders", "Videos", "VideosSecoesSites", "SecoesCanais" };
        try
        {
            bool retorno;
            if (checkConnectionController.TestConnectionNoSQL())
            {
                var client = CommonMongoClient.Instance;
                var idSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
                var db = client.GetDatabase(idSite.ToString());

                if (!CollectionExists(db, "Sites"))
                {
                    SitesNoSQLController sitesNoSQLController = new SitesNoSQLController();
                    sitesNoSQLController.PublicarSites();
                }

                if (complete)
                {
                    foreach (var collection in collectionsArray)
                    {
                        if (CollectionExists(db, collection))
                        {
                            continue;
                        }
                        else
                        {
                            if (collection == "Secoes")
                            {
                                NoticiasNoSQLController noticiasNoSQLController = new NoticiasNoSQLController();
                                noticiasNoSQLController.PublicarSecoes();
                            }
                            if (collection == "SecoesCanais")
                            {
                                NoticiasNoSQLController noticiasNoSQLController = new NoticiasNoSQLController();
                                noticiasNoSQLController.PublicarCanais();
                            }
                            if (collection == "Noticias")
                            {
                                NoticiasNoSQLController noticiasNoSQLController = new NoticiasNoSQLController();
                                noticiasNoSQLController.PublicarNoticiasSecoesSites();
                                noticiasNoSQLController.PublicarNoticias();
                            }
                            if (collection == "Galerias")
                            {
                                GaleriasNoSQLController galeriasNoSQLController = new GaleriasNoSQLController();
                                galeriasNoSQLController.PublicarGaleriasSecoesSites();
                                galeriasNoSQLController.PublicarGalerias();
                            }
                            if (collection == "Sons")
                            {
                                SonsNoSQLController sonsNoSQLController = new SonsNoSQLController();
                                sonsNoSQLController.PublicarSonsSecoesSites();
                                sonsNoSQLController.PublicarSons();
                            }
                            if (collection == "Videos")
                            {
                                VideosNoSQLController videosNoSQLController = new VideosNoSQLController();
                                videosNoSQLController.PublicarVideosSecoesSites();
                                videosNoSQLController.PublicarVideos();
                            }
                            if (collection == "UploadFiles")
                            {
                                ArquivosAssociadosNoSQLController arquivosAssociadosNoSQLController = new ArquivosAssociadosNoSQLController();
                                arquivosAssociadosNoSQLController.PublicarUploadFiles();
                            }
                            if (collection == "UploadFolders")
                            {
                                ArquivosAssociadosNoSQLController arquivosAssociadosNoSQLController = new ArquivosAssociadosNoSQLController();
                                arquivosAssociadosNoSQLController.PublicarUploadFolders();
                            }
                        }
                    }
                }

                retorno = true;
            }
            else
            {
                retorno = false;
            }
            return retorno;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public static bool CollectionExists(IMongoDatabase database, string collectionName)
    {
        var filter = new BsonDocument("name", collectionName);
        var options = new ListCollectionNamesOptions { Filter = filter };
        return database.ListCollectionNames(options).Any();
    }
}