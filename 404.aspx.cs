using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResponseStatusPages_404 : System.Web.UI.Page
{
    public string SiteUrlHtml { get; set; }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SiteUrlHtml = !string.IsNullOrWhiteSpace(ConfigurationManager.AppSettings.Get("SiteUrl")) ? ConfigurationManager.AppSettings.Get("SiteUrl").ToString() : string.Empty;
            SiteUrlHtml = String.Concat(SiteUrlHtml, System.Web.HttpContext.Current.Request.RawUrl.ToString());
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}