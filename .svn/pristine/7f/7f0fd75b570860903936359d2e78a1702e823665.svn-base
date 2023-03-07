using CMS.MidiaCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Http;

[RoutePrefix("api/EstadosFront")]
public class EstadosFrontController : ApiController
{
    [Route("GetByFilter")]
    [HttpPost]
    public List<EstadosModel> GetByFilter(EstadosModel filter)
    {
        try
        {
            if (filter == null)
                throw new Exception("O filtro deve ser informado.");

            List<EstadosModel> estadosModel = null;

            using (var client = new HttpClient())
            {
                var URI = ConfigurationManager.AppSettings["urlBaseAPI"].ToString() + "Estados/GetByFilter";

                // Add an Accept header for JSON format.
                TimeSpan timespan = new TimeSpan(0, 15, 0);
                client.Timeout = timespan;
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // content é o objeto que vai no Body do POST 
                StringContent content = new StringContent(JsonConvert.SerializeObject(filter), Encoding.UTF8, "application/json");

                // chama o método GetByFilter passando o content no Body
                HttpResponseMessage response = client.PostAsync(URI, content).Result;

                if (response.IsSuccessStatusCode)
                {
                    var estadosModelJsonString = response.Content.ReadAsStringAsync().Result;
                    estadosModel = JsonConvert.DeserializeObject<List<EstadosModel>>(estadosModelJsonString);
                }
                else
                {
                    throw new Exception();
                }
            }

            return estadosModel;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}