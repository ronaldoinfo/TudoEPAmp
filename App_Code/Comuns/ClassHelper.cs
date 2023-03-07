﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using System.Configuration;

/// <summary>
/// Summary description for ClassHelper
/// </summary>
public static class ClassHelper
{
    public enum TipoDevice { Celular, Tablet_SmartTV_GameConsole, Desktop }
    public enum TipoReplace { Acento, EspacoEmBranco, ExpressaoRegular }

    public static string IFNull(this string valor, string retorno)
    {
        if (valor == null)
        {
            return retorno;
        }
        else
        {
            return valor;
        }
    }

    /// <summary>
    /// Necessita de uma pasta 'logs' na raiz do projeto
    /// </summary>
    /// <param name="Ex"></param>
    /// <param name="Contexto"></param>
    /// <param name="ThrowException"></param>
    public static void RegistrarErro(Exception Ex, HttpContext Contexto, string NomeArquivoLog, bool ThrowException, string ExceptionMessage)
    {
        File.WriteAllText(Contexto.Server.MapPath("/logs") + "/" + NomeArquivoLog + "_" + DateTime.Now.ToString("yyyy-MM-dd HH_mm") + ".txt",
                JsonConvert.SerializeObject(Ex));

        if (ThrowException)
        {
            if (string.IsNullOrWhiteSpace(ExceptionMessage))
            {
                throw new Exception("Ocorreu um erro ao tentar executar essa ação. Por favor tente novamente" +
                    " mais tarde ou entre em contato através do faleconosco.");
            }
            else
            {
                throw new Exception(ExceptionMessage);
            }
        }
    }

    /// <summary>
    /// Necessita de uma pasta 'logs' na raiz do projeto
    /// </summary>
    /// <param name="Ex"></param>
    /// <param name="Contexto"></param>
    /// <param name="ThrowException"></param>
    public static void RegistrarErro(Exception Ex, HttpContext Contexto, string NomeArquivoLog, bool ThrowException)
    {
        RegistrarErro(Ex, Contexto, NomeArquivoLog, ThrowException, null);
    }

    public static TipoDevice GetDevice()
    {
        if (HttpContext.Current != null &&
            HttpContext.Current.Request != null &&
            !string.IsNullOrWhiteSpace(HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"]))
        {
            string u = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"];
            Regex b = new Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex t = new Regex(@"ipad|android|android 3.0|xoom|sch-i800|playbook|tablet|kindle|nexus|hp-tablet|silk|GT-*|smart(-tv|tv)|googletv|x11|sh4|hbbtv|net(cast|tv)|gtv*|philipstv|nintendo*|playstation*|xbox*|gamepad", RegexOptions.IgnoreCase | RegexOptions.Multiline);

            if ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))))
            {

                return TipoDevice.Celular;
            }
            else if (t.IsMatch(u))
            {
                return TipoDevice.Tablet_SmartTV_GameConsole;
            }
            else
            {
                return TipoDevice.Desktop;
            }
        }
        else
        {
            return TipoDevice.Desktop;
        }
    }

    public static string Replace(this string Valor, TipoReplace Tipo, string Replacement)
    {
        switch (Tipo)
        {
            case TipoReplace.Acento:
                {
                    Valor = Valor.ReplaceAcentos();
                } break;
            case TipoReplace.EspacoEmBranco:
                {
                    Valor = Regex.Replace(Valor, "\\s+", Replacement);
                } break;
        }

        return Valor;
    }

    public static string ReplaceAcentos(this string Valor)
    {
        string Acentos = "ÁÀÂÃÄáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÔÕÖóòôõöÚÙÛÜúùûü";
        string Replacements = "AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuu";

        for (int index = 0; index < Acentos.Length; index++)
        {
            Valor = Valor.Replace(Acentos[index], Replacements[index]);
        }

        return Valor;
    }

    public static bool NavegadorAceitaCookies()
    {
        HttpRequest _Request = HttpContext.Current.Request;

        return _Request.Cookies != null &&
                _Request.Cookies["http-cookie"] != null &&
                _Request.Cookies["http-cookie"].Value.ToString().ToLower() == "allowed";
    }

    public static string CadastroID
    {
        get
        {
            HttpCookie Cookie = HttpContext.Current.Request.Cookies[ClassSeguranca.GetHash("idcadastro")];
            if (Cookie == null)
                return String.Empty;
            else
                return Cookie.Value;
        }
        set
        {
            HttpCookie Cookie = HttpContext.Current.Request.Cookies[ClassSeguranca.GetHash("idcadastro")];
            if (Cookie == null)
            {
                Cookie = new HttpCookie(ClassSeguranca.GetHash("idcadastro"), FrameworkExtension.CommonBusiness.CommonBusiness.Criptografar(value))
                {
                    Domain = ConfigurationManager.AppSettings["cookie-domain"]
                };
            }

            Cookie.Expires = DateTime.Now.AddMinutes(HttpContext.Current.Session.Timeout);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }
    }

    public static string GetBaseUrl()
    {
        string urlBase = string.Empty;

        string scheme = HttpContext.Current.Request.Url.Scheme;
        string port = HttpContext.Current.Request.Url.Port > 0 ? ":" + HttpContext.Current.Request.Url.Port.ToString() : string.Empty;
        string host = HttpContext.Current.Request.Url.Host;

        urlBase = scheme + "://" + host + port + "/";

        return urlBase;
    }

    public static string ToAbsoluteUrl(this string relativeUrl)
    {
        if (string.IsNullOrEmpty(relativeUrl))
            return relativeUrl;

        if (HttpContext.Current == null)
            return relativeUrl;

        if (relativeUrl.StartsWith("/"))
            relativeUrl = relativeUrl.Insert(0, "~");
        if (!relativeUrl.StartsWith("~/"))
            relativeUrl = relativeUrl.Insert(0, "~/");

        var url = HttpContext.Current.Request.Url;
        var port = url.Port != 80 ? (":" + url.Port) : String.Empty;

        return String.Format("{0}://{1}{2}{3}",
            url.Scheme, url.Host, port, VirtualPathUtility.ToAbsolute(relativeUrl));
    }
}