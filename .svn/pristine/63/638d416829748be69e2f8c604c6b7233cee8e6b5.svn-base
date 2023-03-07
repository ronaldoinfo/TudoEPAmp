using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

/// <summary>
/// Singleton da classe HttpClient para evitar o erro: 
/// "Only one usage of each socket address (protocol/network address/port) is normally permitted 10.254.13.101:443"
/// </summary>
public sealed class CommonHttpClient
{
    private static HttpClient instance;
    private static object syncRoot = new object();

    public static HttpClient Instance
    {
        get
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                    {
                        var handler = new HttpClientHandler { UseDefaultCredentials = true, Credentials = CredentialCache.DefaultCredentials };
                        var client = new HttpClient(handler, false);
                        TimeSpan timespan = new TimeSpan(0, 15, 0);
                        client.Timeout = timespan;
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        instance = client;
                    }
                }
            }
            return instance;
        }
    }
}