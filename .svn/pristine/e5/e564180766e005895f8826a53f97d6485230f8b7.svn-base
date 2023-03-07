<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPublicidade.ascx.cs" Inherits="comuns_publicidade_ucPublicidade" %>
<%
    if (!string.IsNullOrWhiteSpace(Position))
    {
        string dimensao = "";
        string sizeMapping = "";
        if (Propriedades["position"].Contains("SLB"))
        {
            dimensao = "970x250,970x150,970x90,728x90,468x60,320x100,320x50,300x100,300x50";
            sizeMapping = "SLB";

        }
        else if (Propriedades["position"].Contains("BOTTOM"))
        {
            dimensao = "970x250,970x150,970x90,728x90,468x60,320x100,320x50,300x100,300x50";
            sizeMapping = "SLB";
        }
        else if (Propriedades["position"].Contains("RM"))
        {
            dimensao = "300x250,250x250,200x200,fluid";
            sizeMapping = "RM";
        }
        else if (Propriedades["position"].Contains("CHAMADA"))
        {
            dimensao = "340x95,300x250,285x285,250x250,fluid";
            sizeMapping = "CHAMADA";
        }
        else if (Propriedades["position"].Contains("MEIAPAGINA"))
        {
            dimensao = "300x600,300x250,250x250";
            sizeMapping = "MEIAPAGINA";
        }
%>

<div id="opec" class='<%=Propriedades["position"]%>'>
 <amp-ad id="<%=Propriedades["position"]%>" style="max-width: 320px; width: 320px;overflow-x: hidden;margin-right: auto;margin-left: auto;min-height: 285px;text-align: center;" layout="fixed" 
     type='doubleclick' data-slot="/<%=DFP_Rede %>/<%=Position %>" data-multi-size='<%=dimensao %>' data-multi-size-validation="false" 
     json='{"targeting":{"dfp_Pos":"<%=Propriedades["position"]%>"}}' >
</amp-ad>
</div>
<%
    }
    else
    {
        SendNotification();
    }
%>