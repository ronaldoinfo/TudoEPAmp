using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Http;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading.Tasks;
using System.Web;
using System.Security.Cryptography;
using System.Globalization;
using System.IO;

[RoutePrefix("api/CXENSE")]
public class CXENSEController : ApiController
{
    private string URI = ConfigurationManager.AppSettings["UrlBaseCXENSE"].ToString();

    [Route("SendData")]
    [HttpPost]
    public async Task<string> SendData(CXENSEModel cXENSEModel)
    {
        string retorno = string.Empty;
        string Json = string.Empty;

        try
        {
            using (var client = new HttpClient())
            {
                AuthenticationModel authenticationModel = new AuthenticationModel();
                authenticationModel.cxusername = "admin.cxense@acidadeon.com";
                authenticationModel.cxapikey = "api&user&cu+3q7V/nMNiTG0pULsDog==";

                // Add an Accept header for JSON format.
                TimeSpan timespan = new TimeSpan(0, 0, 2);
                client.Timeout = timespan;
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // Headers 
                client.DefaultRequestHeaders.Add("X-cXense-Authentication", "{ cx-username : " + authenticationModel.cxusername + ", cx-api-key: " + authenticationModel.cxapikey + "  }");
                client.DefaultRequestHeaders.Add("X-Forwarded-For", GetLocalIPAddress());

                StringContent content = new StringContent(JsonConvert.SerializeObject(cXENSEModel), Encoding.UTF8, "application/json");

                // necessário para funcionar no localhost fazer chamadas a API´s que utilizam SSL our TLS
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

                HttpResponseMessage response = null;
                response = await client.PostAsync(URI + "/data", content);

                if (response.IsSuccessStatusCode)
                {
                    var ResultJsonString = response.Content.ReadAsStringAsync().Result;
                    retorno = ResultJsonString;
                }
                else
                {
                    retorno = response.ReasonPhrase;
                }
            }
            return retorno;
        }
        catch (Exception)
        {
            retorno = "error";
            return retorno;
        }
    }

    private static Random random = new Random();
    public string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    public static string GetLocalIPAddress()
    {
        var host = Dns.GetHostEntry(Dns.GetHostName());
        foreach (var ip in host.AddressList)
        {
            if (ip.AddressFamily == AddressFamily.InterNetwork)
            {
                return ip.ToString();
            }
        }
        throw new Exception("No network adapters with an IPv4 address in the system!");
    }

    [Route("CXENSESendData")]
    [HttpGet]
    public async Task<string> CXENSESendData(string IDNoticia, int NivelRestricao)
    {
        string cX_P = string.Empty;

        if (HttpContext.Current.Request.Cookies["cX_P"] != null)
        {
            cX_P = HttpContext.Current.Request.Cookies["cX_P"].Value;
        }

        string retorno = string.Empty;
        CXENSEController cXENSEController = new CXENSEController();
        CXENSEModel cXENSEModel = new CXENSEModel();

        try
        {
            cXENSEModel.widgetId = "92c3bfd8219a5c364fc142aa983e96cd2ef59960"; // valor passado por Pedro
            cXENSEModel.prnd = cXENSEController.RandomString(16);

            // usuário
            cXENSEModel.user = new UserModel();
            cXENSEModel.user.ids = new IDS();
            cXENSEModel.user.ids.usi = cX_P; // cookie

            // context
            cXENSEModel.context = new ContextModel();
            cXENSEModel.context.url = HttpContext.Current.Request.Url.AbsoluteUri;
            cXENSEModel.context.referrer = HttpContext.Current.Request.UrlReferrer != null ? HttpContext.Current.Request.UrlReferrer.AbsoluteUri : string.Empty;

            // verificar se está logado 
            HttpCookie LoginPaywall = HttpContext.Current.Request.Cookies["LoginPaywall"];
            var logado = !string.IsNullOrWhiteSpace(LoginPaywall != null ? LoginPaywall.Value : string.Empty);

            // Se estiver logado e se session do conteudo da noticia estiver preenchido ele é assinante
            var assinante = (logado && HttpContext.Current.Cache[IDNoticia] != null && NivelRestricao == 2);
            var isSubscriber = assinante ? "yes" : "no";

            // parameters
            cXENSEModel.context.parameters = new System.Collections.Generic.List<ParametersModel>();
            cXENSEModel.context.parameters.Add(new ParametersModel { key = "isSubscriber", value = isSubscriber });
            cXENSEModel.context.parameters.Add(new ParametersModel { key = "newsletter", value = "yes" });

            retorno = await cXENSEController.SendData(cXENSEModel);

            return retorno;
        }
        catch (Exception)
        {
            return retorno;
        }
    }

    // TODO metodo para buscar todos usuarios ativos
    // <add key="urlSubscription" value="https://subscriptionapi.acidadeon.com/api/"/>
    // public GetByFilterCustomers
    // parei aqui ClienteCadastroModel clienteCadastroModel = new ClienteCadastroModel();
    //private List<ClienteCadastroActiveSubscriberModel> GetAllCustomersActive()
    //{
    //    List<ClienteCadastroActiveSubscriberModel> clienteCadastroModel = new List<ClienteCadastroActiveSubscriberModel>();

    //    using (var client = new HttpClient())
    //    {
    //        var URI = ConfigurationManager.AppSettings["urlSubscription"].ToString() + "ClienteCadastro/GetAllCustomersActiveSubscriber";
    //        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

    //        //StringContent content = new StringContent(JsonConvert.SerializeObject(filter), Encoding.UTF8, "application/json");

    //        HttpResponseMessage response = client.GetAsync(URI).Result;

    //        if (response.IsSuccessStatusCode)
    //        {
    //            var clienteCadastroModelJsonString = response.Content.ReadAsStringAsync().Result;
    //            clienteCadastroModel = JsonConvert.DeserializeObject<List<ClienteCadastroActiveSubscriberModel>>(clienteCadastroModelJsonString);
    //        }
    //        else
    //            return null;
    //    }

    //    return clienteCadastroModel;
    //}

    // API para enviar dados do Cadastro de Clientes: TbCliente_Cadastro
    // https://api.cxense.com/profile/user/external/link/update
    [Route("SendDataCustomers")]
    [HttpPost]
    //public string SendDataCustomers()
    //{
    //    List<ClienteCadastroActiveSubscriberModel> clienteCadastroModels = GetAllCustomersActive();
    //    HttpResponseMessage response = null;

    //    if (clienteCadastroModels == null || !clienteCadastroModels.Any())
    //        throw new Exception("Nenhum cliente foi retornado");
    //    else
    //    {
    //        try
    //        {
    //            foreach (var item in clienteCadastroModels)
    //            {
    //                using (var client = new HttpClient())
    //                {
    //                    var ano = !string.IsNullOrWhiteSpace(item.DtNascimento) ? Convert.ToDateTime(item.DtNascimento).Year.ToString() : "1850";

    //                    CustomerModel customerModel = new CustomerModel();
    //                    customerModel.type = "ept";
    //                    customerModel.id = item.IdCadastro;
    //                    customerModel.profile = new List<ProfileModel>();
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-sexo", item = !string.IsNullOrWhiteSpace(item.Sexo) ? item.Sexo : "nao informado" });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-nome", item = item.Nome });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-idade", item = string.IsNullOrWhiteSpace(item.Idade) ? "0" : item.Idade.Substring(0, 2) });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-byear", item = ano });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-cidade", item = !string.IsNullOrWhiteSpace(item.Cidade) ? item.Cidade : "nao informada" });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-bairro", item = !string.IsNullOrWhiteSpace(item.Bairro) ? item.Bairro : "nao informado" });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-estadocivil", item = !string.IsNullOrWhiteSpace(item.EstadoCivil) ? item.EstadoCivil : "nao informado" });
    //                    customerModel.profile.Add(new ProfileModel { group = "ept-tipopessoa", item = !string.IsNullOrWhiteSpace(item.TipoPessoa) ? item.TipoPessoa : "nao informado" });

    //                    AuthenticationModel authenticationModel = new AuthenticationModel();
    //                    authenticationModel.cxusername = "admin.cxense@acidadeon.com";
    //                    authenticationModel.cxapikey = "api&user&cu+3q7V/nMNiTG0pULsDog==";

    //                    var date = DateTime.UtcNow.ToString("o");
    //                    var hmacsha256 = new HMACSHA256(Encoding.UTF8.GetBytes(authenticationModel.cxapikey));
    //                    var hmac = hmacsha256.ComputeHash(Encoding.UTF8.GetBytes(date));
    //                    var hmacHex = hmac.Aggregate(new StringBuilder(32), (sb, b) => sb.Append(b.ToString("X2"))).ToString();

    //                    // Add an Accept header for JSON format.
    //                    //TimeSpan timespan = new TimeSpan(0, 0, 10);
    //                    //client.Timeout = timespan;
    //                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

    //                    // Headers 
    //                    var headerJSON = "username=" + authenticationModel.cxusername + " date=" + date + " hmac-sha256-hex=" + hmacHex;
    //                    client.DefaultRequestHeaders.Add("X-cXense-Authentication", headerJSON);
    //                    //exemplo funcional //client.DefaultRequestHeaders.Add("X-cXense-Authentication", "username=admin.cxense@acidadeon.com date=2020-03-05T17:40:35.472Z hmac-sha256-base64=8VcRBshrCcVuDq4oCkkf5wfWModOE2QtNdS61I+PO/4=");

    //                    StringContent content = new StringContent(JsonConvert.SerializeObject(customerModel), Encoding.UTF8, "application/json");

    //                    // necessário para funcionar no localhost fazer chamadas a API´s que utilizam SSL our TLS
    //                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

    //                    response = client.PostAsync("https://api.cxense.com/profile/user/external/update", content).Result;
    //                }
    //            }

    //            string retorno;
    //            if (response.IsSuccessStatusCode)
    //            {
    //                var ResultJsonString = response.Content.ReadAsStringAsync().Result;
    //                retorno = response.ReasonPhrase;
    //                return retorno;
    //            }
    //            else
    //            {
    //                retorno = response.ReasonPhrase;
    //                return retorno;
    //            }

    //        }
    //        catch (Exception ex)
    //        {
    //            throw new Exception(ex.Message);
    //        }
    //    }
    //}

    public string ComputeSha256Hash(string rawData)
    {
        // Create a SHA256   
        using (SHA256 sha256Hash = SHA256.Create())
        {
            // ComputeHash - returns byte array  
            byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

            // Convert byte array to a string   
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }
    private string CreateToken(string message, string secret)
    {
        secret = secret ?? "";
        var encoding = new System.Text.ASCIIEncoding();
        byte[] keyByte = encoding.GetBytes(secret);
        byte[] messageBytes = encoding.GetBytes(message);
        using (var hmacsha256 = new HMACSHA256(keyByte))
        {
            byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
            return Convert.ToBase64String(hashmessage);
        }
    }

    // https://wiki.cxense.com/display/cust/API+authentication
    // Exemplo de autenticação documentação Cxense
    private void ExemploCXEnse()
    {
        string user = "<Your user here>";
        string apiKey = "<Your api key here>";
        string siteId = "<Your site id here>";
        string apiUrl = "https://api.cxense.com/site";
        var date = DateTime.UtcNow.ToString("o");
        var hmacsha256 = new HMACSHA256(Encoding.UTF8.GetBytes(apiKey));
        var hmac = hmacsha256.ComputeHash(Encoding.UTF8.GetBytes(date));
        var hmacHex = hmac.Aggregate(new StringBuilder(32), (sb, b) => sb.Append(b.ToString("X2"))).ToString();
        WebRequest request = WebRequest.Create(apiUrl);
        request.ContentType = "application/json";
        request.Headers.Add("X-cXense-Authentication", "username=" + user + " date=" + date + " hmac-sha256-hex=" + hmacHex);
        request.Method = "POST";
        string query = "{\"siteId\":\"" + siteId + "\"}";
        byte[] byteArray = Encoding.UTF8.GetBytes(query);
        request.ContentLength = byteArray.Length;
        try
        {
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();
            WebResponse response = request.GetResponse();
            using (var reader = new StreamReader(response.GetResponseStream()))
            {
                string result = reader.ReadToEnd();
                reader.Close();
                Console.WriteLine(result);
            }
            response.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
        Console.ReadKey();
    }
}
public class CXENSEModel
{
    public string widgetId { get; set; } //String  Yes Identifier of a content widget object.
    public UserModel user { get; set; }  //Object  No Information about the current user / consumer.
    public ContextModel context { get; set; } //Object  No Information about the current context / page.
    public string tag { get; set; }  //String  No Only display results from the branch with the given tag and ignore other conditions.
    public string prnd { get; set; } //String  No Identifier for the page view where the result of this call will be displayed. Should only be provided when overridden using setRandomId in cx.js.
    public List<string> consent { get; set; } //List of Strings	No
}

//"user":{"ids":{"usi":"<value of cX_P cookie>"}},
public class UserModel
{
    public IDS ids { get; set; }
}

public class IDS
{
    public string usi { get; set; }
}

//public class USI
//{
//    public string usi { get; set; }
//}

public class ContextModel
{
    public string url { get; set; } //String  The URL.
    public string referrer { get; set; }//String  The URI of the document that linked to this page.
    public List<ParametersModel> parameters { get; set; }
}

public class AuthenticationModel
{
    public string cxusername { get; set; }
    public string cxapikey { get; set; }

}

public class ParametersModel
{
    public string key { get; set; }
    public string value { get; set; }
}

public class CustomerModel
{
    public string id { get; set; }
    public string type { get; set; }
    public List<ProfileModel> profile { get; set; }
}

public class ProfileModel
{
    public string group { get; set; }
    public string item { get; set; }
}