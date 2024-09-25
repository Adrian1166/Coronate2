<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="anagrafica.aspx.cs" Inherits="ssl_anagrafica" %>

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
<td align="right" style="padding-top:10px" valign="top">
<div class="contenutoForm">
   <div id="divQuery" runat="server" visible="false" class="vaiaquery"><table width="240px"><tr><td align="right"><img src="../images/freccia_su.png" width="70px" /></td><td align="left" valign="bottom">Go to <b>"Query"</b></td></tr></table></div>
  <table align="center"  >
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Demographics/Eligibility criteria</div></div></td></tr>
  <tr><td>
    <asp:Panel id="Page1ViewPanel"
    Width="700px" 
    CssClass="ViewPanel"
    HorizontalAlign ="center"
    Font-size="12" 
    runat="Server">  
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
        <asp:SqlDataSource ID="SqlDemog" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
            UpdateCommand="UPDATE tbpazienti
SET
DateVisit = ?DateVisit,
Age = ?Age,
DataConsenso = ?DataConsenso,
gender = ?gender,
IdRace = ?IdRace,
RaceOther = ?RaceOther,
IdEducation = ?IdEducation,
IdCivilStatus = ?IdCivilStatus,
IdOccupazione = ?IdOccupazione,
Peso = ?Peso,
Altezza = ?Altezza,
Bmi = replace(?Bmi,',','.'),
SemID = 1,
CI1 = ?CI1,
CI2 = ?CI2,
CI3 = ?CI3,
CI4 = ?CI4,
CE1 = ?CE1
WHERE IdPaziente = ?IdPaziente">
            <UpdateParameters>
                <asp:Parameter Name="gender" />
                <asp:Parameter Name="DataConsenso" Type="DateTime" />
                <asp:Parameter Name="DateVisit" Type="DateTime" />
                <asp:Parameter Name="Age" />
                <asp:Parameter Name="IdRace" />
                <asp:Parameter Name="RaceOther" />
                <asp:Parameter Name="IdEducation" />
                <asp:Parameter Name="IdCivilStatus" />
                <asp:Parameter Name="IdOccupazione" />
                <asp:Parameter Name="Peso" />
                <asp:Parameter Name="Altezza" />
                <asp:Parameter Name="Bmi" />
                <asp:Parameter Name="NrControl" />
                <asp:Parameter Name="CI1" />
                <asp:Parameter Name="CI2" />
                <asp:Parameter Name="CI3" />
                <asp:Parameter Name="CI4" />
                <asp:Parameter Name="CE1" />
                <asp:Parameter Name="semid" />
                <asp:Parameter Name="IdPaziente" />
            </UpdateParameters>
        </asp:SqlDataSource> 
        <asp:FormView ID="frwDemog" style="margin-top:4px" runat="server" CellSpacing="1" CellPadding="0" BorderWidth="0" HorizontalAlign="Center" DataKeyNames="IdPaziente"
            DataSourceID="SqlDemog" width="99%" OnItemInserted="frwDemog_ItemInsert" OnItemUpdated="frwDemog_ItemUpdate">
            <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc;width:35%;" colspan="2">&nbsp;Patient number:</td>
                <td align="left" class="TD1" colspan="2"><asp:Label ID="NumPaz" Text='<%# Bind("NumPaz")%>' runat="server" CssClass="textbox" MaxLength="6" Width="50px" ReadOnly="true" BackColor="#FFFFDD"></asp:Label>
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:TextBox ID="DataVisita" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Date of the visit:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="DateVisit" runat="server" Text='<%# Bind("DateVisit")%>' CssClass="textbox" Width="80px" />&nbsp;(dd/mm/yyyy)
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Date of informed consent signature:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="DataConsenso" runat="server" Text='<%# Bind("DataConsenso")%>' CssClass="textbox" Width="80px" />&nbsp;(dd/mm/yyyy)
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Age:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="Age" Text='<%# Bind("Age")%>' runat="server" CssClass="textbox" MaxLength="2" Width="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Gender:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:RadioButtonList ID="gender" runat="server" SelectedValue='<%# Bind("gender") %>' RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0">
                        <asp:ListItem Text="M" Value="M"></asp:ListItem>
                        <asp:ListItem Text="F" Value="F"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Ethnic group:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:DropDownList ID="IdRace" runat="server" DataSourceID="SqlRazza" CssClass="textbox" DataTextField="razza" DataValueField="idrazza" SelectedValue='<%# Bind("IdRace")%>' RepeatDirection="Horizontal" onchange="javascript:gestioneRaceOther();">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1" colspan="2">Specify:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="RaceOther" runat="server" Text='<%# Bind("RaceOther")%>' CssClass="textbox" MaxLength="100" Width="180px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Education:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:DropDownList ID="IdEducation" runat="server" SelectedValue='<%# Bind("IdEducation") %>' DataSourceID="SqlIstruzione" 
                    DataTextField="Istruzione" DataValueField="IdIstruzione">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Marital status:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:DropDownList ID="IdCivilStatus" runat="server" SelectedValue='<%# Bind("IdCivilStatus") %>' DataSourceID="Sqlstatocivile" 
                        DataTextField="StatoCivile" DataValueField="idStatoCivile">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">&nbsp;Employment status:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:DropDownList ID="IdOccupazione" runat="server" SelectedValue='<%# Bind("IdOccupazione") %>' DataSourceID="SqlOccupazione" 
                        DataTextField="Occupazione" DataValueField="idOccupazione">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Weight:</td>
                <td align="left" class="TD1" colspan="5">
                    <asp:TextBox ID="Peso" runat="server" CssClass="textbox" Width="60px" Text='<%# Bind("peso")%>' onkeyup="javascript:CalcolaBMI();" onblur="javascript:CalcolaBMI();"></asp:TextBox>&nbsp;Kg
                    
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Height:</td>
                <td align="left" class="TD1" colspan="5"><asp:TextBox ID="Altezza" runat="server" CssClass="textbox" Width="60px" Text='<%# Bind("Altezza")%>' onkeyup="javascript:CalcolaBMI();" onblur="javascript:CalcolaBMI();"></asp:TextBox>&nbsp;cm</td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">BMI:</td>
                <td align="left" class="TD1" colspan="5">
                    <asp:Label ID="lblBmi" runat="server" Text='<%# Eval("Bmi") + "&nbsp;"%>' CssClass="textbox" Width="60px" BackColor="#FFFFCC" />&nbsp;kg/m²
                    <asp:HiddenField ID="Bmi" runat="server" Value='<%# Bind("Bmi")%>' />
                </td>
            </tr>
            
            <tr>
                
                <td align="left" class="TD1"  colspan="4">
                    &nbsp;
                </td>
            </tr>

            </table>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td colspan="4" bgcolor="WhiteSmoke">&nbsp;</td></tr>
            <tr><td colspan="4" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Inclusion criteria</td></tr>
            <tr>
               <td class="TD1" style="background-color:#dcdcdc">1.</td>
               <td class="TD1" align="left" style="background-color:#dcdcdc;width:75%" colspan="2">
                   Patient aged ≥ 30 years;
               </td>
               <td align="center" class="TD1" style="width:20%">
                    <asp:RadioButtonList ID="CI1" runat="server" SelectedValue='<%# Bind("CI1") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc">2.</td>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="2">
                    Patient has a confirmed diagnosis (documented at the clinical center) of moderate to severe
plaque psoriasis (PASI≥10 or PASI<10 associated with facial, or palm/plantar, genital, or nail
lesions) for ≥10 years prior to study inclusion;
                </td>
                <td align="center" class="TD1"><asp:RadioButtonList ID="CI2" runat="server" SelectedValue='<%# Bind("CI2") %>' RepeatDirection="Horizontal" CellPadding="1">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc">3.</td>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="2">
                    Willing and able to provide informed consent;
                </td>
                <td align="center" class="TD1"><asp:RadioButtonList ID="CI3" runat="server" SelectedValue='<%# Bind("CI3") %>' RepeatDirection="Horizontal" CellPadding="1">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc">4.</td>
                <td class="TD1" align="left" style="background-color:#dcdcdc" colspan="2">
                    Willing and able to read, understand, and complete patient study materials.
                </td>
                <td align="center" class="TD1"><asp:RadioButtonList ID="CI4" runat="server" SelectedValue='<%# Bind("CI4") %>' RepeatDirection="Horizontal" CellPadding="1">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            
            <tr><td colspan="4" bgcolor="WhiteSmoke"><div style="color:Red"><i>To enroll the patient in the study all inclusion criteria must be <b>YES</b>
            </i></div><br /><br /></td></tr>
            <tr><td colspan="4" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Exclusion criteria</td></tr>
            <tr>
               <td class="TD1" style="background-color:#dcdcdc">1.</td>
               <td class="TD1" align="left" style="background-color:#dcdcdc;width:75%" colspan="2">
                    The patient suffers from psychiatric conditions that may interfere with study participation
according to clinical judgment.
               </td>
               <td align="center" class="TD1" style="width:20%">
                    <asp:RadioButtonList ID="CE1" runat="server" SelectedValue='<%# Bind("CE1") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

            <tr><td colspan="4" bgcolor="WhiteSmoke"><div style="color:Red"><i>To enroll the patient in the study all exclusion criteria must be <b>NO</b>
                </i></div></td></tr>
            
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
            <tr><td colspan="4" align="left">
                <asp:RequiredFieldValidator ControlToValidate="Age" ID="RequiredFieldValidator8" runat="server" ErrorMessage="The field <b>Age</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="DataConsenso" ID="RequiredFieldValidator11" runat="server" ErrorMessage="The field <b>Date of informed consent signature</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="DateVisit" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>Date of visit</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="Gender" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Gender</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="IdRace" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Ethnic group</b> is required" Display="None" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="IdEducation" ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field <b>Education</b> is required" Display="None" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="IdCivilStatus" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Marital status</b> is required" Display="None" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="IdOccupazione" ID="RequiredFieldValidator9" runat="server" ErrorMessage="The field <b>Employment status</b> is required" Display="None" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="peso" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field <b>Weight</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="Altezza" ID="RequiredFieldValidator7" runat="server" ErrorMessage="The field <b>Height</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="Age" runat="server" ErrorMessage="The field <b>Age</b> must be ≥ 30 years old!" ValueToCompare="30" Type="Integer" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="DataConsenso" runat="server" ErrorMessage="The field <b>Date of informed consent signature</b> cannot be after the current date or is wrong!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/10/01' Display="None" Type="Date"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator11" ControlToValidate="DateVisit" runat="server" ErrorMessage="The field <b>Date of visit</b> cannot be after the current date or is wrong!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/10/01' Display="None" Type="Date"></asp:RangeValidator>
                <asp:CompareValidator ID="CVDataConsenso" ControlToCompare="DataConsenso" ControlToValidate="DateVisit" runat="server" ErrorMessage="<b>Date of informed consent signature</b> cannot be after the <b>Date of the visit</b>!" Type="Date" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>
                <asp:RangeValidator ID="RangeValidator2" ControlToValidate="Peso" runat="server" MinimumValue="30" MaximumValue="250" ErrorMessage="The field <b>Weight</b> must be a number between 30 and 250 Kg." Type="Integer" Display="None"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator3" ControlToValidate="Altezza" runat="server" MinimumValue="130" MaximumValue="220" ErrorMessage="The field <b>Height</b> must be a number between 130 and 220 cm." Type="Integer" Display="None"></asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="DataConsenso" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
         </table>
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
         
    </div>
        </asp:View>
    </asp:MultiView>
</asp:Panel></td></tr></table><br /><br /></div></td></tr></table></div><br /><br />
 <asp:SqlDataSource ID="Sqlstatocivile" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsstatocivile order by idstatocivile"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlIstruzione" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsIstruzione order by IdIstruzione"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRazza" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsRazza order by idrazza"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlOccupazione" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsoccupazione order by idoccupazione"></asp:SqlDataSource>    
    <!-- #INCLUDE FILE="confermaDelete.aspx"-->
    <!-- #INCLUDE FILE="info3.aspx"-->
    <script src="../script/mantieneScroll.js" type="text/javascript"></script>
    <script language="javascript">
        gestioneRaceOther();
        function gestioneRaceOther() {
            var ddlRazza = document.getElementById("frwDemog_IdRace");
            var txtAltro = document.getElementById("frwDemog_RaceOther");
            txtAltro.disabled = !(ddlRazza.value == "99");
            if (ddlRazza.value != "99") {
                txtAltro.value = "";
                txtAltro.style.backgroundColor = "#dcdcdc";
            } else {
                txtAltro.style.backgroundColor = "#FFFFFF";
            }
        }
        function CalcolaBMI() {
        var intPeso = 0;
        var intAltezza = 0;
        var number;
        var txtPeso = document.getElementById("frwDemog_Peso");
        var txtAltezza = document.getElementById("frwDemog_Altezza");
        var txtBmi = document.getElementById("frwDemog_Bmi");
        var lblBmi = document.getElementById("frwDemog_lblBmi");
        txtBmi.value = "";
        lblBmi.innerHTML = "&nbsp;";
        if (txtPeso.value != "" && txtAltezza.value != "") {
            intPeso = txtPeso.value;
            intAltezza = txtAltezza.value;
            txtBmi.value = intPeso / ((intAltezza / 100) * (intAltezza / 100));
            txtBmi.value = round(txtBmi.value, 2);
            txtBmi.value = txtBmi.value.replace(".", ",");
            lblBmi.innerHTML = txtBmi.value.replace("NaN", "") + "&nbsp;";
        }
    }

    $("#frwDemog_Peso").maskNumber({integer: true,});
    $("#frwDemog_Altezza").maskNumber({integer: true,});

        
        jQuery(document).ready(function () {
            $("#frwDemog_DataConsenso").mask("99/99/9999");
            $("#frwDemog_DateVisit").mask("99/99/9999");
            $("#frwDemog_DataConsenso").datepicker();
            $("#frwDemog_DateVisit").datepicker();
        });

        $("#frwDemog_Age").maskNumber({ integer: true });
       
           // $('input').maskNumber({  thousands: '*'});
    </script>
    </form>
</body>
</html>
