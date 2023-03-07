using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comuns_AMP_widgets_cxense_amp_template_server : System.Web.UI.Page
{
    public bool ativarModuloCXENSE = false;
    public string IDNoticia { get; set; }
    public int NivelRestricao { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ativarModuloCXENSE = Request.QueryString["ativarcxense"] != null ? Convert.ToBoolean(Request.QueryString["ativarcxense"]) : false;
            IDNoticia = Request.QueryString["idmidia"] != null ? Request.QueryString["idmidia"].ToString() : string.Empty;
            NivelRestricao = Request.QueryString["nivelrestricao"] != null ? Convert.ToInt32(Request.QueryString["nivelrestricao"]) : 0;
        }
    }
}