<%@ Page Title="Conteúdo não disponível no momento" Language="C#" MasterPageFile="~/masterpages/Template.AMP.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="ResponseStatusPages_404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link rel="canonical" href="<%= SiteUrlHtml %>" />
    <!-- <title>Conteúdo não disponível no momento.</title> -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopoCorpo" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphCorpo" runat="Server">

        <div class="cont-ops flex" style="min-height: 28rem;">
            <div class="ms-area m-auto py-5">
                <div class="cont-amp text-center">
                    <h2 class="ms-ver">Olá internauta!</h2>
                    <p>Desculpe, conteúdo não disponível no momento.<br />
                        <br />
                        Acesse a <a href="https://www.tudoep.com/">Página Inicial</a>.</p>
                </div>
            </div>
        </div>
        
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphRodapeCorpo" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScriptsRodape" runat="Server">
</asp:Content>

