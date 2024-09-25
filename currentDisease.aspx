<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="currentDisease.aspx.cs" Inherits="ssl_CurrentDisease" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    <script src="../script/round.js" type="text/javascript"></script>
    <script src="../script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery.masknumber.js" type="text/javascript"></script>
</head>
<body onkeypress="return disableEnterKey(event)">
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
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Disease activity at the time of the visit</div></div></td></tr>
    <tr><td>
<asp:Panel id="Page1ViewPanel"
    Width="700px" 
    CssClass="ViewPanel"
    runat="Server">   
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
    <asp:SqlDataSource ID="SqlCurrentDisease" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlCurrentDisease_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbcurrentdisease
(IdCentro,
IdPaziente,
IdTipVis,
PASI,
PGA,
VAS,
VAS_ND,
QualityLife,
PsoriasisIs,
DLQI,
DLQI_ND,
SemId)
VALUES
(?IdCentro,
?IdPaziente,
1,
replace(?PASI,',','.'),
?PGA,
replace(?VAS,',','.'),
?VAS_ND,
?QualityLife,
?PsoriasisIs,
replace(?DLQI,',','.'),
?DLQI_ND,
?SemId);"
        UpdateCommand="UPDATE tbcurrentdisease
SET
PASI = replace(?PASI,',','.'),
PGA = ?PGA,
VAS = replace(?VAS,',','.'),
VAS_ND = ?VAS_ND,
QualityLife = ?QualityLife,
PsoriasisIs = ?PsoriasisIs,
DLQI = replace(?DLQI,',','.'),
DLQI_ND = ?DLQI_ND,
SemId = ?SemId
WHERE IdCurrentDisease = ?IdCurrentDisease">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="PASI" />
                <asp:Parameter Name="PGA" />
                <asp:Parameter Name="VAS_ND" />
                <asp:Parameter Name="VAS" />
                <asp:Parameter Name="QualityLife" />
                <asp:Parameter Name="PsoriasisIs" />
                <asp:Parameter Name="DLQI" />
                <asp:Parameter Name="DLQI_ND" />
                <asp:Parameter Name="SemId" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PASI" />
                <asp:Parameter Name="PGA" />
                <asp:Parameter Name="VAS" />
                <asp:Parameter Name="VAS_ND" />
                <asp:Parameter Name="QualityLife" />
                <asp:Parameter Name="PsoriasisIs" />
                <asp:Parameter Name="DLQI" />
                <asp:Parameter Name="DLQI_ND" />
                <asp:Parameter Name="SemId" />
                <asp:Parameter Name="IdCurrentDisease" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwCurrentDisease" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" VerticalAlign="Center" DataSourceID="SqlCurrentDisease" DefaultMode="Insert" 
        onItemInserted="frwCurrentDisease_ItemInserted" onItemUpdated="frwCurrentDisease_ItemUpdated" HorizontalAlign="Center">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1"><table width="100%">
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc; width:40%"><b>PASI</b> index (0 - 72):</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="PASI" runat="server" Text='<%# Bind("PASI")%>' CssClass="textbox" MaxLength="5" Width="60px" onkeyup="javascript:this.value=this.value.replace('.',',')"></asp:TextBox>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                    <asp:HiddenField ID="IdCurrentDisease" runat="server" Value='<%# Bind("IdCurrentDisease")%>' />
                    <asp:HiddenField ID="SemId" runat="server" Value='<%# Bind("SemId")%>' />
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Overall judgment of the patient's clinical severity <b>PGA</b> (0=clear to 4= severe):</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="PGA" runat="server" SelectedValue='<%# Bind("PGA")%>' CssClass="textbox">
                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="0=clear" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1=almost clear" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2=mild" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3=moderate" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4=severe" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc; width:40%"><b>VAS pruritus</b> (0 - 10):</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="VAS" runat="server" Text='<%# Bind("VAS")%>' CssClass="textbox" MaxLength="4" Width="60px" onkeyup="javascript:this.value=this.value.replace('.',',')"></asp:TextBox>
                    <asp:CheckBoxList ID="VAS_ND" runat="server" SelectedValue='<%# Bind("VAS_ND") %>' onclick="javascript:abilitareValore('VAS','VAS_ND')">
                        <asp:ListItem Text="Not done" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Physician's overall judgment of the impact of psoriasis on the patient's quality of life (1=no or minimal
impact to 5=maximum impact):</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="QualityLife" runat="server" SelectedValue='<%# Bind("QualityLife")%>' CssClass="textbox" Width="60px">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2"><b>Compared to the last visit, the patient's psoriasis is</b>:</td>
            </tr>
            <tr>   
  
                <td align="left" class="TD1" colspan="2">
                    <asp:RadioButtonList ID="PsoriasisIs" runat="server" SelectedValue='<%# Bind("PsoriasisIs") %>' RepeatDirection="Vertical">
                        <asp:ListItem Text="Significantly improved" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Improved" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Slightly improved" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Stable" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Slightly worsened" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Worsened" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Significantly worsened" Value="7"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc; width:40%"><b>DLQI</b> (0 - 30):</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="DLQI" runat="server" Text='<%# Bind("DLQI")%>' CssClass="textbox" MaxLength="3" Width="60px"></asp:TextBox>
                    <asp:CheckBoxList ID="DLQI_ND" runat="server" SelectedValue='<%# Bind("DLQI_ND") %>' onclick="javascript:abilitareValore('DLQI','DLQI_ND')">
                        <asp:ListItem Text="Not done" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
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
            <tr><td align="left" colspan="4">
                <asp:RequiredFieldValidator ControlToValidate="PASI" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>PASI index</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="PGA" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>PGA</b> is required" Display="None" InitialValue="-1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="QualityLife" ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field <b>Physician's overall judgment of the impact of psoriasis...</b> is required" Display="None" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="PsoriasisIs" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Compared to the last visit, the patient's psoriasis is</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator3" ControlToValidate="PASI" runat="server" MinimumValue="0" MaximumValue="72" ErrorMessage="The field <b>PASI</b> must be an number between 0 and 72." Type="Double" Display="None"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator2" ControlToValidate="VAS" runat="server" MinimumValue="0" MaximumValue="10" ErrorMessage="The field <b>VAS</b> must be an number between 0 and 10." Type="Double" Display="None"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="DLQI" runat="server" MinimumValue="0" MaximumValue="30" ErrorMessage="The field <b>DLQI</b> must be an integer number between 0 and 30." Type="Integer" Display="None"></asp:RangeValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="VAS" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
            </table></td></tr>
            </table>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
            <asp:Label ID="lblAggiornamento" runat="server" Text="The data is updated correctly." Font-Size="14px" Font-Bold="True" ForeColor="#009933" Visible="false"></asp:Label><br />
            <asp:Label ID="lblWorsening" runat="server" Text="If a patient reports an adverse product-related event or special situation (as accidental or intentional overdose, lack of efficacy, medication error, occupational or accidental exposure, off-label use, drug abuse, drug misuse, or drug withdrawal, all which must be reported whether associated with an adverse event or not) during the data collection period or the healthcare professional identifies an adverse product-related event or special situation, while the patient was taking an AbbVie authorized product (Humira, Skyrizi), the information should be reported to AbbVie using the form and contact details provided in the 'Documents' area on the eCRF home page." Font-Size="14px" Font-Bold="False" ForeColor="#FF3300" Visible="false" Font-Italic="True"></asp:Label>
                <%if (Session["LIVELLOID"].ToString() == "1" && Request["SemId"].ToString() != "5"
                 && Request["SemId"].ToString() != "6")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalva_Click" />
                        <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" OnClick="Delete_Clicked" />
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
    abilitareValore('VAS', 'VAS_ND');
    abilitareValore('DLQI', 'DLQI_ND');
    function abilitareValore(campo1, campo2) {
        var chk = document.getElementById("frwCurrentDisease_" + campo2 + "_0");
        var txt = document.getElementById("frwCurrentDisease_" + campo1);
        txt.disabled = chk.checked;
        if (chk.checked) {
            txt.value = "";
            txt.style.backgroundColor = "#dcdcdc";
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }
    }
    //$("#frwCurrentDisease_VAS").maskNumber({ integer: true });
</script>
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
</form>
</body>
</html>
