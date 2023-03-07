<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Templates.Interna.AMP.master" AutoEventWireup="true" CodeFile="noticias_internaSOM.aspx.cs" 
    Inherits="CMS.Web.FrontEnd.TemplatesV55.noticias_noticias_internaSOM" %>

<%@ Register Src="~/comuns/podcasts/ucPodcast_Interna_AMP.ascx" TagPrefix="uc1" TagName="ucSomInterna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead_Interna" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopoCorpo_Interna" runat="Server">
    <uc1:ucSomInterna runat="server" ID="ucSomInterna" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRodapeCorpo_Interna" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptsRodape_Interna" runat="Server">
</asp:Content>

