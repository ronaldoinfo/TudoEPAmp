<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amp-template-server.aspx.cs" Inherits="comuns_AMP_widgets_cxense_amp_template_server" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
    <script type="text/javascript">
            <% if (ativarModuloCXENSE)
                { %>
                    /* Início Envio dados CXEnse */
                    $.ajax({
                        url: '/api/CXENSE/CXENSESendData?IDNoticia=' + <%=IDNoticia%> + '&NivelRestricao=' + <%=NivelRestricao%>,
                        data: "",
                        dataType: "json",
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        beforeSend: function () {
                        },
                        success: function (data) {
                            console.log('dados enviados ao cxense.');
                            console.log('cxense teste widget server ');
                        },
                        error: function (response) {
                            console.log(response);
                        }
                    });
                    /* Fim Envio dados CXEnse */
            <% } %>      

    </script>
</body>
</html>
