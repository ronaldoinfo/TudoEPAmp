using CMS.Web.FrontEnd.TemplatesV55.Comuns;
using MongoDB.Bson;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Net.Http;
using System.Threading;
using System.Web.Http;

/// <summary>
/// Descrição resumida de CheckConnectionController
/// </summary>
[RoutePrefix("api/CheckConnection")]
public class CheckConnectionController : ApiController
{
    private static string UrlBaseApi;
    public CheckConnectionController()
    {
        UrlBaseApi = ConfigurationManager.AppSettings["urlBaseAPI"].ToString();
    }

    /// <summary>
    /// Testa conexão/disponibilidade do Banco MSSQL
    /// </summary>
    /// <returns></returns>
    [Route("TestConnection")]
    [HttpGet]
    public bool TestConnection()
    {
        bool retorno = false;
        var client = CommonHttpClient.Instance;
        var URI = UrlBaseApi + "CheckConnection/TestConnection";
        try
        {
            HttpResponseMessage response = client.GetAsync(URI).Result;
            if (response.IsSuccessStatusCode)
            {
                var retornoJsonString = response.Content.ReadAsStringAsync().Result;
                retorno = JsonConvert.DeserializeObject<bool>(retornoJsonString);
            }
            return retorno;
        }
        catch (Exception)
        {
            return false;
        }
    }

    /// <summary>
    /// Testa conexão/disponibilidade do Banco NoSQL Mongo
    /// </summary>
    /// <returns></returns>
    [Route("TestConnectionNoSQL")]
    [HttpGet]
    public bool TestConnectionNoSQL()
    {
        var client = new MongoClient(ConfigurationManager.AppSettings["ConexaoMongo"].ToString());
        var startTime = DateTime.UtcNow;
        try
        {
            using (var timeoutCancellationTokenSource = new CancellationTokenSource(TimeSpan.FromMilliseconds(500)))
            {
                var idSite = Convert.ToInt32(ClassNegocio.GetIdPortal.ToString());
                var db = client.GetDatabase(idSite.ToString());
                db.RunCommandAsync((Command<BsonDocument>)"{ping:1}");
                return true;
            }
        }
        catch (Exception exception)
        {
            var endTime = DateTime.UtcNow;
            var elapsed = endTime - startTime;
            return false;
        }
    }
}