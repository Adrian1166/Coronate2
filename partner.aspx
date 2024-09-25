<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="partner.aspx.cs" Inherits="ssl_Partner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    <script src="../script/round.js" type="text/javascript"></script>
    <script src="../script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery.maskedinput-1.2.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery-ui.js" type="text/javascript"></script>
    <script src="../script/jquery.masknumber.js" type="text/javascript"></script>
    <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
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
    <div class="titolo"><div class="fontTitolo">Partner</div></div>
          <table cellspacing="0"  align="center" cellpadding="0" style="margin-top:30px">
            <tr>
                <td>
<asp:Panel id="Page1ViewPanel"
    Width="680px" 
    CssClass="ViewPanel"
    HorizontalAlign ="center"
    runat="Server">  
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
        <asp:SqlDataSource ID="SqlDemog" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="" OnSelected="SqlDemog_OnSelected"
            InsertCommand="INSERT INTO tbpartner
(IdPaziente,
IdCentro,
IDTIPVIS,
ParticipateStudy,
NumPar,
DataConsenso,
CI1,
Questio1,
Questio2,
Questio3,
Questio1No,
Questio2No,
Questio3No,
SemID)
VALUES
(?IdPaziente,
?IdCentro,
1,
?ParticipateStudy,
?NumPar,
?DataConsenso,
?CI1,
?Questio1,
?Questio2,
?Questio3,
?Questio1No,
?Questio2No,
?Questio3No,
1);"
            UpdateCommand="UPDATE tbpartner
SET
ParticipateStudy = ?ParticipateStudy,
NumPar = ?NumPar,
DataConsenso = ?DataConsenso,
CI1 = ?CI1,
Questio1 = ?Questio1,
Questio2 = ?Questio2,
Questio3 = ?Questio3,
Questio1No = ?Questio1No,
Questio2No = ?Questio2No,
Questio3No = ?Questio3No
WHERE IdPartner = ?IdPartner">
            <InsertParameters>
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IDTIPVIS" />
                <asp:Parameter Name="ParticipateStudy" />
                <asp:Parameter Name="NumPar" />
                <asp:Parameter Name="DataConsenso" Type="DateTime" />
                <asp:Parameter Name="CI1" />
                <asp:Parameter Name="Questio1" />
                <asp:Parameter Name="Questio2" />
                <asp:Parameter Name="Questio3" />
                <asp:Parameter Name="Questio1No" />
                <asp:Parameter Name="Questio2No" />
                <asp:Parameter Name="Questio3No" />
                <asp:Parameter Name="SemID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ParticipateStudy" />
                <asp:Parameter Name="DataConsenso" Type="DateTime" />
                <asp:Parameter Name="CI1" />
                <asp:Parameter Name="Questio1" />
                <asp:Parameter Name="Questio2" />
                <asp:Parameter Name="Questio3" />
                <asp:Parameter Name="Questio1No" />
                <asp:Parameter Name="Questio2No" />
                <asp:Parameter Name="Questio3No" />
                <asp:Parameter Name="SemID" />
                <asp:Parameter Name="IdPartner" />
            </UpdateParameters>
        </asp:SqlDataSource> 
        <div id="divMsg" runat="server" visible="false"></div>
        <asp:FormView ID="frwDemog" style="margin-top:4px" runat="server" CellSpacing="1" HorizontalAlign="Center"
            CellPadding="0" BorderWidth="0" 
            DataSourceID="SqlDemog" width="99%" OnItemInserted="frwDemog_ItemInsert"
            OnItemUpdated="frwDemog_ItemUpdate">
            <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1">
            <table width="100%">
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="2">
                    Has the partner of the patient agreed to participate in the study?
                </td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="ParticipateStudy" runat="server" SelectedValue='<%# Bind("ParticipateStudy") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareForm()">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Partner number:</td>
                <td align="left" class="TD1" colspan="2"><asp:TextBox ID="NumPar" Text='<%# Bind("NumPar")%>' runat="server" CssClass="textbox" MaxLength="6" Width="50px" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Date of informed consent signature:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="DataConsenso" runat="server" Text='<%# Bind("DataConsenso")%>' CssClass="textbox" Width="80px" />&nbsp;(dd/mm/yyyy)
                </td>
            </tr>
            </table>
            <table width="100%">
            <tr><td colspan="4" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Inclusion criteria</td></tr>
            <tr>
               <td class="TD1" style="background-color:#dcdcdc">1.</td>
               <td class="TD1" align="left" style="background-color:#dcdcdc;width:75%" colspan="2">
                   Adult partner in relationship with the patient since at  least 3 years.
               </td>
               <td align="center" class="TD1" style="width:20%">
                    <asp:RadioButtonList ID="CI1" runat="server" SelectedValue='<%# Bind("CI1") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareQuestio()">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    
                </td>
            </tr>
            <tr><td colspan="4" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Questionnaires for partners</td></tr>
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="3">
                    Has the partner filled in the CORONATE questionnaire for PARTNER? 
                </td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Questio1" runat="server" SelectedValue='<%# Bind("Questio1") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareQuestionNo(1)">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="TD1" colspan="2">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="Questio1No" runat="server" Text='<%# Bind("Questio1No")%>' CssClass="textbox" Width="280px" MaxLength="100" />
                </td>
            </tr>
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="3">
                    Has the partner filled in the socio-demographic/health-related questions? 
                </td>
                <td align="center" class="TD1"><asp:RadioButtonList ID="Questio2" runat="server" SelectedValue='<%# Bind("Questio2") %>' RepeatDirection="Horizontal" CellPadding="1"
                    onclick="javascript:abilitareQuestionNo(2)">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="TD1" colspan="2">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="Questio2No" runat="server" Text='<%# Bind("Questio2No")%>' CssClass="textbox" Width="280px" MaxLength="100" />
                </td>
            </tr>
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="3">
                    Has the partner filled in the health-related question about the patient he/she has a relationship with?
                </td>
                <td align="center" class="TD1"><asp:RadioButtonList ID="Questio3" runat="server" SelectedValue='<%# Bind("Questio3") %>' RepeatDirection="Horizontal" CellPadding="1"
                    onclick="javascript:abilitareQuestionNo(3)">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="TD1" colspan="2">If <b>No</b>, please add the reason:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="Questio3No" runat="server" Text='<%# Bind("Questio3No")%>' CssClass="textbox" Width="280px" MaxLength="100" />
                </td>
            </tr>
            <div id="divMotivo" runat="server" visible="false">
            <tr>
                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="4"><b>Reason for change:</b></td>
            </tr>

            <tr>
                <td align="center" class="TD1" colspan="4">
                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
            </div>
            
            <tr><td colspan="4">
                <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                <asp:HiddenField ID="IdPartner" runat="server" Value='<%# Bind("IdPartner")%>' />
                <asp:TextBox ID="DataVisita" runat="server" Visible="false"></asp:TextBox>
            </td></tr>
            <tr><td colspan="4" align="left">
                <asp:RequiredFieldValidator ControlToValidate="ParticipateStudy" ID="RequiredFieldValidator10" runat="server" ErrorMessage="The field <b>Has the partner of the patient agreed to participate in the study?</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="DataConsenso" runat="server" ErrorMessage="The field <b>Date of informed consent signature</b> it cannot be after the current date or is wrong!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/10/01' Display="None" Type="Date"></asp:RangeValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required." Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="DataConsenso" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
         </table></td></tr></table>
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
    </div></asp:View></asp:MultiView></asp:Panel><br /><br />
    </td></tr></table></div>
    </div><br /><br />
    <script src="../script/mantieneScroll.js" type="text/javascript"></script>
    <script type="text/javascript">
        abilitareForm();
        function abilitareForm() {
            var opt = document.getElementById("frwDemog_ParticipateStudy_0");
            var DataConsenso = document.getElementById("frwDemog_DataConsenso");
            var CI1_0 = document.getElementById("frwDemog_CI1_0");
            var CI1_1 = document.getElementById("frwDemog_CI1_1");
            DataConsenso.disabled = !opt.checked;
            CI1_0.disabled = !opt.checked;
            CI1_1.disabled = !opt.checked;
            if (!opt.checked) {
                CI1_0.checked = false;
                CI1_1.checked = false;
                DataConsenso.value = "";
                DataConsenso.style.backgroundColor = "#dcdcdc";
            } else {
                DataConsenso.style.backgroundColor = "#FFFFFF";
            }
            abilitareQuestio();
        }

        function abilitareQuestio() {
            var opt = document.getElementById("frwDemog_CI1_0");
            var Questio1_0 = document.getElementById("frwDemog_Questio1_0");
            var Questio1_1 = document.getElementById("frwDemog_Questio1_1");
            var Questio2_0 = document.getElementById("frwDemog_Questio2_0");
            var Questio2_1 = document.getElementById("frwDemog_Questio2_1");
            var Questio3_0 = document.getElementById("frwDemog_Questio3_0");
            var Questio3_1 = document.getElementById("frwDemog_Questio3_1");
            Questio1_0.disabled = !opt.checked;
            Questio1_1.disabled = !opt.checked;
            Questio2_0.disabled = !opt.checked;
            Questio2_1.disabled = !opt.checked;
            Questio3_0.disabled = !opt.checked;
            Questio3_1.disabled = !opt.checked;
            if (!opt.checked) {
                Questio1_0.checked = false;
                Questio1_1.checked = false;
                Questio2_0.checked = false;
                Questio2_1.checked = false;
                Questio3_0.checked = false;
                Questio3_1.checked = false;
            } 
            abilitareQuestionNo(1);
            abilitareQuestionNo(2);
            abilitareQuestionNo(3);
        }

        function abilitareQuestionNo(campo) {
            var opt = document.getElementById("frwDemog_Questio" + campo +"_1");
            var txt = document.getElementById("frwDemog_Questio" + campo +"No");
            txt.disabled = !opt.checked;
            if (!opt.checked) {
                txt.value = "";
                txt.style.backgroundColor = "#dcdcdc";
            } else {
                txt.style.backgroundColor = "#FFFFFF";
            }
        }
        jQuery(document).ready(function () {
            $("#frwDemog_DataConsenso").mask("99/99/9999");
            $("#frwDemog_DataConsenso").datepicker();
        });

    </script>
        <!-- #INCLUDE FILE="confermaDelete.aspx"-->
    </form>
</body>
</html>
