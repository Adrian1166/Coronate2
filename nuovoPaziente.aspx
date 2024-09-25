<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="nuovoPaziente.aspx.cs" Inherits="ssl_nuovoPaziente" %>

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
     <!--#INCLUDE FILE="testa.aspx"-->
<div class="contenuto">
    <div id="navigazione">
    <ul>
        <li>You are in:</li>
        <%if (Session["LIVELLOID"].ToString() == "2" || (Session["LIVELLOID"].ToString()=="1" && Session["NewLIVELLOID"].ToString()=="2"))
        { %>
        <li>
            <a href="elencoCentri.aspx">
                <span>Center list</span>
            </a>/
        </li>
        <%} %>
        <li>
            <a href="elencoPazienti.aspx">
                <span>Patient list</span>
            </a>/
        </li>
        <li><span>Patient registration&hellip;</span></li>
    </ul>
</div>
    <div class="titolo"><div class="fontTitolo">Patient registration</div></div>
          <table cellspacing="0"  align="center" cellpadding="0" style="margin-top:30px">
            <tr>
                <td>
<asp:Panel id="Page1ViewPanel"
    Width="720px" 
    CssClass="ViewPanel"
    HorizontalAlign ="center"
    runat="Server">  
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
        <asp:SqlDataSource ID="SqlDemog" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
            InsertCommand="Insert into tbpazienti(IdCentro, IDTIPVIS, NumPaz, IdEducation,IdOccupazione, IdRace, DateVisit, DataConsenso,IdCivilStatus,CI1, CI2, CI3, CI4, CE1,AlphaCode,UrlDiretto,SemID) values
            (?IdCentro,1, ?NumPaz, 0, 0,0, ?DateVisit, ?DataConsenso,0, ?CI1, ?CI2,?CI3, ?CI4, ?CE1, ?AlphaCode,?UrlDiretto,2)">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="NumPaz" />
                <asp:Parameter Name="DataConsenso" Type="DateTime" />
                <asp:Parameter Name="DateVisit" Type="DateTime" />
                <asp:Parameter Name="Naive" />
                <asp:Parameter Name="CI1" />
                <asp:Parameter Name="CI2" />
                <asp:Parameter Name="CI3" />
                <asp:Parameter Name="CI4" />
                <asp:Parameter Name="CE1" />
                <asp:Parameter Name="AlphaCode" />
                <asp:Parameter Name="UrlDiretto" />
            </InsertParameters>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2"><b>Site No.:</b><br /></td>
                <td align="left" class="TD1"  colspan="2">
                    <b><%Response.Write(Session["SiteId"].ToString()); %></b>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Patient number:</td>
                <td align="left" class="TD1" colspan="2"><asp:TextBox ID="NumPaz" Text='<%# Bind("NumPaz")%>' runat="server" CssClass="textbox" MaxLength="6" Width="50px" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Date of the visit:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="DateVisit" runat="server" Text='<%# Bind("DateVisit")%>' CssClass="textbox" Width="80px" />&nbsp;(dd/mm/yyyy)
                </td>
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
            
            <tr><td colspan="4">
                 <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                 <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                 <asp:HiddenField ID="AlphaCode" runat="server" Value='<%# Bind("AlphaCode")%>' />
                 <asp:HiddenField ID="UrlDiretto" runat="server" Value='<%# Bind("UrlDiretto")%>' />
                 <asp:TextBox ID="DataVisita" runat="server" Visible="false"></asp:TextBox>
            </td></tr>
            <tr><td colspan="4" align="left">
                <asp:RequiredFieldValidator ControlToValidate="DateVisit" ID="RequiredFieldValidator10" runat="server" ErrorMessage="The field <b>Date of the visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="DataConsenso" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Date of informed consent signature</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="DataConsenso" runat="server" ErrorMessage="The field <b>Date of informed consent signature</b> it cannot be after the current date or is wrong!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/10/01' Display="None" Type="Date"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator11" ControlToValidate="DateVisit" runat="server" ErrorMessage="The field <b>Date of visit</b> it cannot be after the current date or is wrong!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/10/01' Display="None" Type="Date"></asp:RangeValidator>
                <asp:CompareValidator ID="CVDataConsenso" ControlToCompare="DataConsenso" ControlToValidate="DateVisit" runat="server" ErrorMessage="<b>Date of informed consent signature</b> it cannot be after the <b>Date of the visit</b>!" Type="Date" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>
                <asp:RequiredFieldValidator ControlToValidate="CI1" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field <b>Inclusion criteria - Question 1</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="CI2" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Inclusion criteria - Question 2</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="CI3" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>Inclusion criteria - Question 3</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="CI4" ID="RequiredFieldValidator9" runat="server" ErrorMessage="The field <b>Inclusion criteria - Question 4</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="CE1" ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field <b>Exclusion criteria - Question 1</b> is required!" Display="None"></asp:RequiredFieldValidator>
                
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
         </table></td></tr></table>
         </EditItemTemplate>
         <FooterTemplate>
            <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
                <%if (Session["LIVELLOID"].ToString() == "1")
                  { %>
                <asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save"  OnClick="btnSalva_Click" />
                <%} %>
                <asp:Button CssClass="button" ID="btnIndietro" runat="server" Text="Back" CausesValidation="false"
                    OnClick="btnIndietro_Click" />
            </div>
        </FooterTemplate>
         </asp:FormView>
    </div></asp:View></asp:MultiView></asp:Panel><br /><br />
    </td></tr></table></div>
    </div><br /><br />
<!-- #INCLUDE FILE="msgAlert.aspx"-->
    <script src="../script/mantieneScroll.js" type="text/javascript"></script>
    <script type="text/javascript">

        jQuery(document).ready(function () {
            $("#frwDemog_DataConsenso").mask("99/99/9999");
            $("#frwDemog_DateVisit").mask("99/99/9999");
            $("#frwDemog_DataConsenso").datepicker();
            $("#frwDemog_DateVisit").datepicker();
        });

</script>
    </form>
</body>
</html>
