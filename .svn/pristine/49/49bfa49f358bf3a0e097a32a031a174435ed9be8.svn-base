<%@ Application Language="C#" %>

<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.Net" %>


<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        GlobalConfiguration.Configuration.MapHttpAttributeRoutes();

        GlobalConfiguration.Configuration.Routes.MapHttpRoute(
        name: "DefaultApi",
        routeTemplate: "api/{controller}/{id}",
        defaults: new { id = System.Web.Http.RouteParameter.Optional });

        GlobalConfiguration.Configuration.EnsureInitialized();
		ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
    }

    void Application_End(object sender, EventArgs e)
    {
        HttpRuntime runtime = (HttpRuntime)typeof(System.Web.HttpRuntime).InvokeMember("_theRuntime",
                                                                                        System.Reflection.BindingFlags.NonPublic
                                                                                        | System.Reflection.BindingFlags.Static
                                                                                        | System.Reflection.BindingFlags.GetField,
                                                                                        null,
                                                                                        null,
                                                                                        null);

        if (runtime == null)
            return;

        string shutDownMessage = (string)runtime.GetType().InvokeMember("_shutDownMessage",
                                                                         System.Reflection.BindingFlags.NonPublic
                                                                         | System.Reflection.BindingFlags.Instance
                                                                         | System.Reflection.BindingFlags.GetField,
                                                                         null,
                                                                         runtime,
                                                                         null);

        string shutDownStack = (string)runtime.GetType().InvokeMember("_shutDownStack",
                                                                       System.Reflection.BindingFlags.NonPublic
                                                                       | System.Reflection.BindingFlags.Instance
                                                                       | System.Reflection.BindingFlags.GetField,
                                                                       null,
                                                                       runtime,
                                                                       null);

        if (!System.Diagnostics.EventLog.SourceExists(".NET Runtime"))
            System.Diagnostics.EventLog.CreateEventSource(".NET Runtime", "Application");

        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();

        log.Source = ".NET Runtime";
        log.WriteEntry(String.Format("\r\n\r\n_shutDownMessage={0}\r\n\r\n_shutDownStack={1}",
                                     shutDownMessage,
                                     shutDownStack),
                                     System.Diagnostics.EventLogEntryType.Error);

        // Verifica Motivos de desligamento no pool do aplicativo e "mata" o processo caso tenha havido alterações nos diretórios bin, appcode ou no web.config, global.asax
        if (shutDownMessage.ToLower().Contains("change"))
        {
            System.Diagnostics.Process process = System.Diagnostics.Process.GetCurrentProcess();
            process.Kill();
        }
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        try
        {
            if (Server != null)
            {
                Exception ex = Server.GetLastError();
                if (ex != null)
                {
                    if (ex.InnerException != null)
                    {
                        string msg = Newtonsoft.Json.JsonConvert.SerializeObject(ex);
                        // Verificar onde foi parar o Debug
                        FrameworkExtension.CommonBusiness.Debug.WriteFile(msg);
                        if (Response != null)
                        {
                            //Response.Redirect("~/Alerta.aspx");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

        //Aqui é feita a inclusão do usuário nas estatísticas
        Session.Timeout = 18; //Em minutos          
        Request.Cookies.Add(new HttpCookie("http-cookie", "allowed") { Expires = DateTime.Now.AddDays(1) });

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void Application_BeginRequest(object sender, EventArgs e)
    {
        FrameworkExtension.CommonBusiness.CacheHelper cacheHelper = new FrameworkExtension.CommonBusiness.CacheHelper();
        cacheHelper.VerificaRemoveCache();
    }

    public override void Init()
    {
        string appName = ConfigurationManager.AppSettings["SiteName"];
        if (!string.IsNullOrEmpty(appName))
        {
            System.Reflection.FieldInfo runtimeInfo = typeof(HttpRuntime).GetField("_theRuntime",
                                    System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.NonPublic);
            HttpRuntime theRuntime = (HttpRuntime)runtimeInfo.GetValue(null);
            System.Reflection.FieldInfo appNameInfo = typeof(HttpRuntime).GetField("_appDomainAppId",
                                    System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);

            appNameInfo.SetValue(theRuntime, appName);
        }

        /// <summary>
        /// Verifica se existem as coleções necessárias no NoSQL para que o site suba.
        /// Passará aqui uma única vez quando subir o site, ou quando houver iisreset/recycle
        /// </summary>
        CheckStructureSiteController checkStructureSiteController = new CheckStructureSiteController();
        checkStructureSiteController.CheckStructureSiteIsComplete();
    }

    public override string GetVaryByCustomString(HttpContext context, string arg)
    {
        string customstring = base.GetVaryByCustomString(context, arg);

        if (arg.ToLower().Trim() == "idcadastro")
        {
            string idcadastro = "";
            idcadastro = ClassHelper.CadastroID;

            if (!String.IsNullOrEmpty(idcadastro))
            {
                customstring = idcadastro + ClassHelper.GetDevice().ToString();
            }
            else
            {
                customstring = DateTime.Now.ToString("dd/MM/yyyy") + ClassHelper.GetDevice().ToString();
            }
        }
        else if (arg.ToLower().Trim() == "device")
        {
            customstring = ClassHelper.GetDevice().ToString();
        }
        return customstring;
    }

</script>
