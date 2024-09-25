<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="uscitaStudio2.aspx.cs" Inherits="ssl_UscitaStudio2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    <script src="../script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery.maskedinput-1.2.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery.masknumber.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
<div id="wrapper">
   <table align="center" cellpadding="0" cellspacing="0" border="0"><tr><td colspan="2">
   <!--#INCLUDE FILE="testa.aspx"-->
   </td></tr>
   <tr><td style="padding-top:10px" valign="top">
<div class="menu">
    <!--#Include file="menu.aspx"-->
</div>
</td>
<td align="right" style="padding-top:10px"  valign="top">
<div class="contenutoForm" >
   <div id="divQuery" runat="server" visible="false" class="vaiaquery"><table width="240px"><tr><td align="right"><img src="../images/freccia_su.png" width="70px" /></td><td align="left" valign="bottom">Go to <b>"Query"</b></td></tr></table></div>
  <table align="center" style="margin-top:10px" >
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Completion of the study</div></div></td></tr>
    <tr><td>
<asp:Panel id="Page1ViewPanel"
    Width="700px" 
    CssClass="ViewPanel"
    HorizontalAlign ="center"
    runat="Server">   
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">

    <asp:SqlDataSource ID="SqlUscitaStudio2" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlUscitaStudio2_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO TBUscitaStudio2 (IdCentro, IdPaziente, IdTipVis, StudioCompletato, IdMotivoUscita, AltroMotivo,SemID)
                        Values (?IdCentro, ?IdPaziente, 1, ?StudioCompletato, ?IdMotivoUscita, ?AltroMotivo,1)"
        UpdateCommand="UPDATE TBUscitaStudio2 SET StudioCompletato=?StudioCompletato, IdMotivoUscita=?IdMotivoUscita, AltroMotivo=?AltroMotivo
                    WHERE IdUscitaStudio2=?IdUscitaStudio2">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="StudioCompletato" />
                <asp:Parameter Name="IdMotivoUscita" />
                <asp:Parameter Name="AltroMotivo" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StudioCompletato" />
                <asp:Parameter Name="IdMotivoUscita" />
                <asp:Parameter Name="AltroMotivo" />
                <asp:Parameter Name="IdUscitaStudio2" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwUscitaStudio2" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlUscitaStudio2" DefaultMode="Insert" 
        onItemInserted="frwUscitaStudio2_ItemInserted" onItemUpdated="frwUscitaStudio2_ItemUpdated">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1"><table width="100%">
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc;width:50%">
                    Did the partner complete the study?
                </td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="StudioCompletato" runat="server" SelectedValue='<%# Bind("StudioCompletato")%>' RepeatDirection="Vertical" onclick="javascript:abilitareForm();">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdUscitaStudio2" runat="server" Value='<%# Bind("IdUscitaStudio2")%>' />
                    <asp:HiddenField ID="SemId" runat="server" Value='<%# Bind("SemId")%>' />
                </td>
            </tr>
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="2">
                    If <b>No</b>, specify reason:
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1"  colspan="2">
                    <asp:DropDownList ID="IdMotivoUscita" runat="server" CellSpacing="1" CellPadding="2" SelectedValue='<%# Bind("IdMotivoUscita") %>' DataSourceID="SqlMotivoUscita" 
                        DataTextField="MotivoUscita" DataValueField="IdMotivoUscita" onchange="javascript:abilitareAltro()">
                    </asp:DropDownList>
                </td>
            </tr>
           <tr>
                <td align="right" class="TD1">If <b>Other</b>, specify:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="AltroMotivo" runat="server" Text='<%# Bind("AltroMotivo")%>' CssClass="textbox" MaxLength="100" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <div id="divMotivo" runat="server" visible="false">
            <tr>
                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="2"><b>Reason for change:</b></td>
            </tr>
            
            <tr>
                <td align="center" class="TD1" colspan="2">
                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
            </div>
            <tr><td align="left"  colspan="2">
                <asp:RequiredFieldValidator ControlToValidate="StudioCompletato" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Did the partner complete the study? </b> is required." Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required." Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" ControlToValidate="StudioCompletato" runat="server" OnServerValidate="StudioCompletato_OnServerValidate" ErrorMessage="" Display="None" ></asp:CustomValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                </td></tr>
            </table></td>
            </tr></table>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
                <asp:Label ID="lblAggiornamento" runat="server" Text="The data is updated correctly." Font-Size="14px" Font-Bold="True" ForeColor="#009933" Visible="false"></asp:Label>
                   <%if (Session["LIVELLOID"].ToString() == "1" && Request["SemId"].ToString() != "5"
                 && Request["SemId"].ToString() != "6")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalva_Click" />
                        <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" OnClick="Delete_Clicked" />
                  <%} %>
                 </div>
        </FooterTemplate>
    </asp:FormView>
        <asp:SqlDataSource ID="SqlMotivoUscita" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsMotivoUscita order by idMotivoUscita"></asp:SqlDataSource>

</div>
</asp:View>
    </asp:MultiView>
</asp:Panel></td></tr></table><br /><br />
</div></td></tr></table></div>
    <script src="../script/mantieneScroll.js" type="text/javascript"></script>
<script language="javascript">
    abilitareForm();
    
    function abilitareForm()
    {
        var StudioCompletato = document.getElementById("frwUscitaStudio2_StudioCompletato_1");

        var IdMotivoUscita = document.getElementById("frwUscitaStudio2_IdMotivoUscita");
        IdMotivoUscita.disabled=(!StudioCompletato.checked);
        if (StudioCompletato.checked==false)
        {
            IdMotivoUscita.value="0";
        }
        abilitareAltro();
    }

    function abilitareAltro() {
        var IdMotivoUscita = document.getElementById("frwUscitaStudio2_IdMotivoUscita");
        var txtAltroSpec = document.getElementById("frwUscitaStudio2_AltroMotivo");
        txtAltroSpec.disabled = IdMotivoUscita.value!="99";
        if (IdMotivoUscita.value != "99") {
            txtAltroSpec.value = "";
            txtAltroSpec.style.backgroundColor = "#dcdcdc";
        } else {
            txtAltroSpec.style.backgroundColor = "#FFFFFF";
        }
    }
    
</script>
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
</form>
</body>
</html>
