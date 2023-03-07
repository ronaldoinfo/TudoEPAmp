using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Singleton da classe de conexão do mongodb
/// de acordo com a documentação https://mongodb.github.io/mongo-csharp-driver/2.10/reference/driver/connecting/,  
/// é recomendado criar uma única instância de MongoClient
/// 
/// </summary>
public sealed class CommonMongoClient
{
    private static MongoClient instance;
    private static object syncRoot = new object();

    public static MongoClient Instance
    {
        get
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                    {
                        var client = new MongoClient(ConfigurationManager.AppSettings["ConexaoMongo"].ToString());
                        instance = client;
                    }
                }
            }
            return instance;
        }
    }
}