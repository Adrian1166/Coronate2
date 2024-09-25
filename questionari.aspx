<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"  CodeFile="questionari.aspx.cs" Inherits="ssl_questionari" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    
</head>
<body>
<form id="form1" runat="server">
<div id="wrapper">
   <table align="center" cellpadding="0" cellspacing="0" border="0">
   <tr><td colspan="2">
   <!--#INCLUDE FILE="testa.aspx"-->
   </td></tr>
   <tr><td style="padding-top:10px" valign="top">
<div class="menu">
    <!--#Include file="menu.aspx"-->
</div>
</td>
<td align="right" style="padding-top:10px" valign="top">

<div class="contenutoForm">
<div id="divQuery" runat="server" visible="false" class="vaiaquery"><table width="240px"><tr><td align="right"><img src="../images/freccia_su.png" width="70px" /></td><td align="left" valign="bottom">Go to <b>"Query"</b></td></tr></table></div>
  <table align="center" >
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Questionnaires for Patients</div></div></td></tr>
    <tr><td>
<asp:Panel id="Page1ViewPanel"
    Width="700" 
    CssClass="ViewPanel"
    runat="Server">  
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
    <asp:SqlDataSource ID="SqlQuestionari" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlQuestionari_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbquestionari
(IdCentro,
IdPaziente,
IdTipVis,
CORONATE,
CORONATENo,
Health,
HealthNo,
COPE,
COPENo,
MLCDP,
MLCDPNo,
SemId)
VALUES
(?IdCentro,
?IdPaziente,1,
?CORONATE,
?CORONATENo,
?Health,
?HealthNo,
?COPE,
?COPENo,
?MLCDP,
?MLCDPNo,
1)"
        UpdateCommand="UPDATE tbquestionari
SET
CORONATE = ?CORONATE,
CORONATENo = ?CORONATENo,
Health = ?Health,
HealthNo = ?HealthNo,
 COPE = ?COPE,
COPENo = ?COPENo,
MLCDP = ?MLCDP,
MLCDPNo = ?MLCDPNo
WHERE IdQuestionari = ?IdQuestionari">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="CORONATE" />
                <asp:Parameter Name="CORONATENo" />
                <asp:Parameter Name="Health" />
                <asp:Parameter Name="HealthNo" />
                <asp:Parameter Name="COPE" />
                <asp:Parameter Name="COPENo" />
                <asp:Parameter Name="MLCDP" />
                <asp:Parameter Name="MLCDPNo" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CORONATE" />
                <asp:Parameter Name="CORONATENo" />
                <asp:Parameter Name="Health" />
                <asp:Parameter Name="HealthNo" />
                 <asp:Parameter Name="COPE" />
                 <asp:Parameter Name="COPENo" />
                 <asp:Parameter Name="MLCDP" />
                 <asp:Parameter Name="MLCDPNo" />
                <asp:Parameter Name="IdQuestionari" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwQuestionari" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlQuestionari" DefaultMode="Insert" 
        onItemInserted="frwQuestionari_ItemInserted" onItemUpdated="frwQuestionari_ItemUpdated">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1">
            <table width="100%">
            <tr>
               <td class="TD1" align="left" style="background-color:#dcdcdc;">
                    Has the patient filled in the CORONATE questionnaire?
               </td>
               <td align="left" class="TD1" >
                    <asp:RadioButtonList ID="CORONATE" runat="server" SelectedValue='<%# Bind("CORONATE") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareAltro('CORONATE')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="CORONATENo" runat="server" Text='<%# Bind("CORONATENo")%>' CssClass="textbox" MaxLength="100" Width="260px"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td class="TD1" align="left" style="background-color:#dcdcdc;">
                    Has the patient filled in the health-related questions?
               </td>
               <td align="left" class="TD1" >
                    <asp:RadioButtonList ID="Health" runat="server" SelectedValue='<%# Bind("Health") %>' RepeatDirection="Horizontal" CellPadding="1" 
                        onclick="javascript:abilitareAltro('Health')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="HealthNo" runat="server" Text='<%# Bind("HealthNo")%>' CssClass="textbox" MaxLength="100" Width="260px"></asp:TextBox>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdQuestionari" runat="server" Value='<%# Bind("IdQuestionari")%>' />
                    <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                </td>
            </tr>
            <tr>
               <td class="TD1" align="left" style="background-color:#dcdcdc;">
                    Has the patient filled in the COPE inventory brief questionnaire? 
               </td>
               <td align="left" class="TD1" >
                    <asp:RadioButtonList ID="COPE" runat="server" SelectedValue='<%# Bind("COPE") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareAltro('COPE')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="COPENo" runat="server" Text='<%# Bind("COPENo")%>' CssClass="textbox" MaxLength="100" Width="260px"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td class="TD1" align="left" style="background-color:#dcdcdc;">
                    Has the patient filled in the Major Life Changing Decision Profile (MLCDP) questionnaire? 
               </td>
               <td align="left" class="TD1" >
                    <asp:RadioButtonList ID="MLCDP" runat="server" SelectedValue='<%# Bind("MLCDP") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareAltro('MLCDP')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="MLCDPNo" runat="server" Text='<%# Bind("MLCDPNo")%>' CssClass="textbox" MaxLength="100" Width="260px"></asp:TextBox>
                </td>
            </tr>
            <div id="divMotivo" runat="server" visible="false">
                <tr>
                    <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="3"><b>Reason for change:</b></td>
                </tr>
                <tr>
                    <td align="center" class="TD1" colspan="3">
                        <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" Height="50px" />
                    </td>
                </tr>
            </div>
            <tr><td align="left" colspan="3">
                <asp:RequiredFieldValidator ControlToValidate="CORONATE" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Has the patient filled in the CORONATE questionnaire</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="Health" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field <b>Has the patient filled in the health-related questions</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="COPE" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Has the patient filled in the COPE inventory brief questionnaire</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="MLCDP" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Has the patient filled in the Major Life Changing Decision Profile (MLCDP) questionnaire</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="CORONATE" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
    </td></tr>
            </table></td></tr>
            </table>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
                <asp:Label ID="lblAggiornamento" runat="server" Text="The data is updated correctly." Font-Size="14px" Font-Bold="True" ForeColor="#009933" Visible="false"></asp:Label>
                <%if (Session["LIVELLOID"].ToString() == "1" && Request["SemId"].ToString() != "5"
                 && Request["SemId"].ToString() != "6")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalva_Click" />
                        <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" CausesValidation="false" OnClick="Delete_Clicked" />
                  <%} %>
            </div>
        </FooterTemplate>
    </asp:FormView>
   
</div>
</asp:View>
    </asp:MultiView>
</asp:Panel> </td></tr></table><br /><br />
</div></td></tr></table></div>
<script src="../script/mantieneScroll.js" type="text/javascript"></script>

<script language="javascript">
    abilitareAltro('CORONATE');
    abilitareAltro('Health');
    abilitareAltro('COPE');
    abilitareAltro('MLCDP');
    function abilitareAltro(campo) {
        var opt = document.getElementById("frwQuestionari_" + campo + "_1");
        var txt = document.getElementById("frwQuestionari_" + campo + "No");
        txt.disabled = !opt.checked;
        if (!opt.checked) {
            txt.value = "";
            txt.style.backgroundColor = "#dcdcdc";
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }

    }

</script>
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
<!-- #INCLUDE FILE="confermaAlert.aspx"-->
</form>
</body>
</html>

