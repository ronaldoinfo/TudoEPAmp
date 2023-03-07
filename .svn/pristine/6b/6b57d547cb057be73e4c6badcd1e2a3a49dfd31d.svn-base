<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="gerador_Default" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            width: 566px;
        }
        .auto-style3 {
            height: 26px;
            width: 566px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label Text="Para funcionar local, informe o número da sua máquina ex: m9999" runat="server" Font-Bold="True" ForeColor="#FF6600" />
        <asp:Label Text="Obs: os arquivos serão gerados na pasta /gerador/saida + o da editoria informada." runat="server" Font-Bold="True" ForeColor="#FF6600" />

        <% if (HttpContext.Current.Request.Cookies["internaGenerator"] == null || HttpContext.Current.Request.Cookies["internaGenerator"].Values == null)
            { %>
        <table>
            <tr>
                <td>Login: <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Senha: <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button Text="Login" ID="btnLogin" runat="server" OnClick="btnLogin_Click" />
                </td>
                </tr>
            <tr><td>
                <asp:Literal Text="" ID="ltlMensagemLogin" runat="server" />
                </td></tr>
        </table>
        <% } %>

        <% if (HttpContext.Current.Request.Cookies["internaGenerator"] != null && HttpContext.Current.Request.Cookies["internaGenerator"].Values != null 
                && HttpContext.Current.Request.Cookies["internaGenerator"].Values["login"] == "admin" && HttpContext.Current.Request.Cookies["internaGenerator"].Values["senha"] == "186007#cms")
        {  %>

        <div>
            <h1>Gerador de internas</h1>
        </div>
        <table>
            <tr>
                <td>ID Seção:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtIdSecao" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtIdSecao" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Nome da Editoria:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtNomeEditoria" runat="server" Width="269px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNomeEditoria" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Título: (ex: ACidadeON)</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTitulo" runat="server" Width="269px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTitulo" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Meta Description: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtMetaDescription" runat="server" Width="269px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMetaDescription" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Meta Keywords: (separado por vírgula)</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtMetaKeywords" runat="server" Width="269px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMetaKeywords" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Quantidade registros nas listas:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtQuantidadeRegistros" runat="server" Width="94px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantidadeRegistros" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>ID do Site:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSite" runat="server" Width="94px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSite" ErrorMessage="Campo obrigatório" ForeColor="#FF5050" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div>
            <asp:Button ID="btnGerar" runat="server" Text="Gerar" OnClick="Button1_Click" />
        </div>
        <div>
            <asp:Literal ID="ltlResultado" runat="server" Text="Resultado:"></asp:Literal>
        </div>

        <%} %>

    </form>
</body>
</html>
