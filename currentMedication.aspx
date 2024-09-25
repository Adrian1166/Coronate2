<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="currentMedication.aspx.cs" Inherits="ssl_CurrentMedication" %>

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
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Current therapy</div></div></td></tr>
    <tr><td>
<asp:Panel id="Page1ViewPanel"
    Width="700px" 
    CssClass="ViewPanel"
    HorizontalAlign ="center"
    runat="Server" >  
    <asp:MultiView id="DevPollMultiView"
        ActiveViewIndex="0"
        runat="Server">
        <asp:View id="Page1" runat="server">
   <div style="margin-top:0px">
        <asp:SqlDataSource ID="SqlCurrentMedication" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlCurrentMedication_OnSelected" SelectCommand=""
            InsertCommand="INSERT INTO TBCurrentMedication (IdCentro,IdPaziente,IdTipVis,CurrentMedication,IdTreatmentPso,SemID)
                                               Values (?IdCentro,?IdPaziente,1,?CurrentMedication,0,?SemID)"
            UpdateCommand="UPDATE TBCurrentMedication SET CurrentMedication=?CurrentMedication,SemID=?SemID
                        WHERE IdCurrentMedication=?IdCurrentMedication">
                <InsertParameters>
                    <asp:Parameter Name="IdCentro" />
                    <asp:Parameter Name="IdPaziente" />
                    <asp:Parameter Name="IdTipVis" />
                    <asp:Parameter Name="CurrentMedication" />
                    <asp:Parameter Name="SemID" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CurrentMedication" />
                    <asp:Parameter Name="SemID" />
                    <asp:Parameter Name="IdCurrentMedication" />
                </UpdateParameters>
            </asp:SqlDataSource> 

        <asp:FormView ID="frwCurrentMedication" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlCurrentMedication" DefaultMode="Insert" 
            onItemInserted="frwCurrentMedication_ItemInserted" onItemUpdated="frwCurrentMedication_ItemUpdated">
            <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
                <tr><td class="TD1"><table width="100%">
               
                <tr>
                   <td class="TD1" align="left" style="background-color:#dcdcdc;">
                        Is the patient currently on therapy? (please insert all the ongoing therapies for psoriasis):
                   </td>
                
                   <td align="left" class="TD1">
                        <asp:RadioButtonList ID="CurrentMedication" runat="server" SelectedValue='<%# Bind("CurrentMedication") %>' RepeatDirection="Horizontal" CellPadding="1">
                           <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                           <asp:ListItem Text="No" Value="2"></asp:ListItem>
                           <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                        <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                        <asp:HiddenField ID="IdCurrentMedication" runat="server" Value='<%# Bind("IdCurrentMedication")%>' />
                        <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                        <asp:HiddenField ID="SemID" runat="server" Value='<%# Bind("SemID")%>' />
                    </td>
                    <td align="center" class="TD1">
                    
                    <%if (Session["LIVELLOID"].ToString() == "1")
                      { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalva_Click" ValidationGroup="CurrentMedication" />
                            <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" OnClick="Delete_Clicked" Visible="false" />
                      <%} %>
                </td>
                </tr>
                <tr><td colspan="3"><asp:Label ID="lblAggiornamento" runat="server" Text="WARNING: Il paziente è Treated, pertanto deve essere in trattamento o deve aver ricevuto un trattamento in passato." Font-Size="14px" Font-Bold="True" ForeColor="red" Visible="false"></asp:Label></td></tr>
                <div>
                <tr>
                    <td class="TD1" colspan="3" align="left" style="background-color:#dcdcdc">
                        If <b>Yes</b>, specify:
                    </td>
                </tr>
                <tr><td colspan="3" class="TD1" ><%if (Session["LIVELLOID"].ToString() == "1") {%>
                    <asp:Button CssClass="buttonDentro" ID="btnNuovo1" runat="server" OnClick="btnNuovaCurrentMedication_Click" Text="Add Treatment" CausesValidation="false"  />
                    <%} %>
                <asp:GridView ID="grwElencoConc" AllowPaging="True" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="IdCurrentMedication"
                    DataSourceID="SqlElencoConc" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" Width="100%" AllowSorting="false" 
                    PageSize="25" PagerSettings-PageButtonCount="9" 
                    PagerSettings-Position="TopAndBottom" onselectedindexchanged="grwElencoConc_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Select" SelectText="" SelectImageUrl="~/images/seleziona.GIF"
                            ShowSelectButton="True">
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Treatment" HeaderText="Treatment" ReadOnly="True" ItemStyle-HorizontalAlign="Left" SortExpression="Treatment">
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StartDate" HeaderText="Start date" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" SortExpression="DataInizio" >
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="newDose" HeaderText="Dose" ReadOnly="True" ItemStyle-HorizontalAlign="Left" SortExpression="Treatment">
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="newFrequency" HeaderText="Frequency" ReadOnly="True" ItemStyle-HorizontalAlign="Left" SortExpression="Treatment">
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle Font-Names="Verdana" Font-Size="Smaller" ForeColor="Black" BackColor="ghostwhite" />
                    <PagerStyle Font-Names="Verdana" ForeColor="Black" BackColor="#C9C9C9" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#EEEEEE" />
                    <SelectedRowStyle BackColor="#70A7DE" ForeColor="White" />
                    <HeaderStyle Font-Names="Tahoma,Arial,Verdana,Helvetica,sans-serif;" Font-Bold="True" Font-Size="11px" BackColor="#CA5202" ForeColor="White" />
                    <PagerSettings PageButtonCount="9" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlElencoConc" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="">
                </asp:SqlDataSource> 
                </td></tr>
                </div>
                <tr><td align="left" colspan="3">
                    <asp:RequiredFieldValidator  ControlToValidate="CurrentMedication" ID="RequiredFieldValidator5" ValidationGroup="CurrentMedication" runat="server" ErrorMessage="The field <b>Is the patient currently treated for CLL?</b> is required!" Display="None"></asp:RequiredFieldValidator>
                    <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ValidationGroup="CurrentMedication"
                        EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                </td></tr>
                <tr><td colspan="3" align="left"><asp:Label ID="lblWorsening" runat="server" Text="If a patient reports an adverse product-related event or special situation (as accidental or intentional overdose, lack of efficacy, medication error, occupational or accidental exposure, off-label use, drug abuse, drug misuse, or drug withdrawal, all which must be reported whether associated with an adverse event or not) during the data collection period or the healthcare professional identifies an adverse product-related event or special situation, while the patient was taking an AbbVie authorized product (Humira, Skyrizi), the information should be reported to AbbVie using the form and contact details provided in the 'Documents' area on the eCRF home page." Font-Size="14px" Font-Bold="False" ForeColor="#FF3300" Visible="false" Font-Italic="True"></asp:Label></td></tr>
                </table></td></tr>
                </table>
            </EditItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:FormView>
        
        </div>

        </asp:View>
    </asp:MultiView>
</asp:Panel> </td></tr></table><br />
</div></td></tr></table></div>
<!-- #INCLUDE FILE="gestioneCurrentMedication.aspx"-->
<script language="javascript">
    
    if (<%=Session["LIVELLOID"].ToString()%>== "1"){
        abilitarePatologia();
    }
    
    function abilitarePatologia() {

        var opt1 = document.getElementById("frwCurrentMedication_CurrentMedication_0");
        var btnNuovo1 = document.getElementById("frwCurrentMedication_btnNuovo1");
        if (opt1.checked == true) {
            btnNuovo1.style.visibility = "visible";
        }
        else {
            btnNuovo1.style.visibility = "hidden";
        }
    }
    
    function abilitarePatologia2() {

        var opt1 = document.getElementById("frwCurrentMedication_PatologieAxSpA_0");
        var btn = document.getElementById("frwCurrentMedication_btnNuovo2");
        if (opt1.checked == false) {
            btn.style.visibility = "hidden";
        } else {
            btn.style.visibility = "";
        }
    }

    
</script>
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
</form>
</body>
</html>