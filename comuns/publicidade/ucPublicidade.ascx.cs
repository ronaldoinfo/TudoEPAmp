﻿using System;
using System.Configuration;
using System.Net.Mail;
using System.Web;

public partial class comuns_publicidade_ucPublicidade : System.Web.UI.UserControl, IAutoPopularBLL
{
    public string Position { get; set; }
    public string WidthBox { get; set; }
    public string DFP_Rede { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        AutoPopular();
    }

    #region IAutoPopular Members

    public void AutoPopular()
    {
        try
        {
            if (Propriedades.ContainsKey("position"))
            {
                Position = Propriedades["position"];
            }

            if (Propriedades.ContainsKey("widthbox"))
            {
                WidthBox = Propriedades["widthbox"];
            }

            if (Propriedades.ContainsKey("dfp_rede"))
            {
                DFP_Rede = Propriedades["dfp_rede"];
            }
            else
            {
                DFP_Rede = ConfigurationManager.AppSettings["DFP_Rede"] ?? string.Empty;
            }
        }
        catch (Exception ex)
        {
            ClassHelper.RegistrarErro(ex, HttpContext.Current, "ErroCarregarBanner", false);
            SendNotification();
        }
    }

    protected void SendNotification(string mensagem = "")
    {
        MailMessage Email = new MailMessage();
        Email.From = new MailAddress("suporte.sites@eptv.com.br");

        string EmailsDestino = ConfigurationManager.AppSettings["email-destinatario-erro-banner"];

        if (!string.IsNullOrWhiteSpace(EmailsDestino))
        {
            foreach (string Destinatario in EmailsDestino.Split(';'))
            {
                Email.To.Add(Destinatario);
            }

            Email.Subject = "Erro ao tentar exibir um banner no site" + ConfigurationManager.AppSettings["SiteName"];
            Email.IsBodyHtml = true;
            Email.Body = "<h2>Erro ao tentar montar banner</h2>" +
                (string.IsNullOrEmpty(mensagem) ? "<p>Pagina onde ocorreu o erro: '" + HttpContext.Current.Request.Url.AbsoluteUri + "'</p>"
                : "<p>O Parametro posição não foi informado</p>");

            SmtpClient _SmtpClient = new SmtpClient(ConfigurationManager.AppSettings["HostEmail"]);
            _SmtpClient.Send(Email);
        }
    }

    public System.Collections.Generic.Dictionary<string, string> Propriedades
    {
        get;
        set;
    }

    #endregion
}