<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="elencoCentri.aspx.cs" Inherits="ssl_elencoCentri" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<div id="wrapper">
    <!--#INCLUDE FILE="testaCentro.aspx"-->
 <div class="contenuto">
<div id="navigazione">
        <ul>
            <li>You are in:</li>
            <li><span>Center list&hellip;</span></li>
        </ul>
        
    </div>
    <div style="text-align:right;right:40px;position:absolute;top:8px; font-size:12px">
        <%if (Session["LIVELLOID"].ToString() == "2" || Session["LIVELLOID"].ToString() == "5")
          { %><br /><br />
          <a href="https://full-epro.org/" target="_blank">ePRO</a>
        <%} %>
     </div><br />
<div class="titolo"><div class="fontTitolo">Center list</div></div><br />
   <table align="center" cellspacing="1" border="0">
    <tr><td align="left" style="font-size:16px"><b>Total patients: &nbsp;</b><asp:Label ID="lblTotN" runat="server" Text="" ForeColor="#FF3300" Font-Size="16px" Font-Bold="True"></asp:Label></td></tr>
    <tr><td>
        <asp:GridView ID="grwCentro" AllowPaging="false" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="idCentro"
            DataSourceID="SqlCentro" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" Width="940px"  
            PageSize="15" PagerSettings-PageButtonCount="9"
            PagerSettings-Position="Top" OnPageIndexChanged="grwCentro_OnPageIndexChanged"
            OnSelectedIndexChanged="grwCentro_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Image" SelectText="" HeaderText="Select" SelectImageUrl="~/images/seleziona.GIF"
                    ShowSelectButton="True">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:CommandField>
                <asp:BoundField DataField="NumCentro" HeaderText="Center No." ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Citta" HeaderText="City" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Descrizione" HeaderText="Clinical Center" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Primario" HeaderText="Principal Investigator" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                </asp:BoundField>

                <asp:BoundField DataField="totPazTrat" HeaderText="No. of patients enrolled" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"  >
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                </asp:BoundField>
                
            </Columns>
            <RowStyle Font-Names="Verdana" Font-Size="Smaller" ForeColor="Black" BackColor="ghostwhite" />
            <PagerStyle Font-Names="Verdana" ForeColor="Black" BackColor="#C9C9C9" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <SelectedRowStyle BackColor="DodgerBlue" ForeColor="White" />
            <HeaderStyle Font-Names="Tahoma,Arial,Verdana,Helvetica,sans-serif;" Font-Bold="True" Font-Size="12px" BackColor="#767676" ForeColor="White" />
            <PagerSettings PageButtonCount="9" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlCentro" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
                >
            </asp:SqlDataSource> 
    </td></tr>
    </table>
    <br /><br />
    </div></div><br /><br />
    
    <%if (Session["LIVELLOID"].ToString() == "14")
      { %>
    <asp:GridView ID="grwTotale" AllowPaging="False" runat="server" Visible="true"
            AutoGenerateColumns="false"
            DataSourceID="SqlTotale" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" Width="750px">
            <Columns>
            <asp:BoundField DataField="newNumCentro" HeaderText="Center N°" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Citta" HeaderText="City" ItemStyle-HorizontalAlign="Left">
                <ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Descrizione" HeaderText="Center" ItemStyle-HorizontalAlign="Left">
                <ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Primario" HeaderText="PI" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
            </asp:BoundField>
            <asp:BoundField DataField="NumPaz" HeaderText="Subject Number" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="DateVisit" HeaderText="Date of visit" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="gender" HeaderText="Gender" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="Age" HeaderText="Age" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="Naive" HeaderText="Naive/Treated" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="TotalScore" HeaderText="CIRS Score" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="DCEn" HeaderText="DCE n°" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="DCE" HeaderText="DCE questionnaire" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="EQ5D_5L" HeaderText="EQ-5D-5L" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="QLQ_C30" HeaderText="QLQ C-30" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:BoundField DataField="CLL_16" HeaderText="QLQ CLL-16" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
            <asp:TemplateField>
                <HeaderStyle CssClass="headerGRW" />
                <HeaderTemplate>No. of treatment lines</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# TreatmentLines(Convert.ToString(Eval("IdPaziente")),Convert.ToString(Eval("Naive"))) %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle CssClass="headerGRW" />
                <HeaderTemplate>Treatments ongoing</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# TreatmentOngoing(Convert.ToString(Eval("IdPaziente")),Convert.ToString(Eval("Naive"))) %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
		<asp:BoundField DataField="NrControl" HeaderText="No. control visits at hospita" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
            </asp:BoundField>
</Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlTotale" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
                >
            </asp:SqlDataSource> 
             <asp:GridView ID="grwPaziente" AllowPaging="false" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="IdPaziente"
            DataSourceID="SqlPaziente" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3"
            GridLines="Vertical" Width="750px" 
            PageSize="15" PagerSettings-PageButtonCount="9"
            PagerSettings-Position="Top" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="NumCentro" HeaderText="Numero Centro" ReadOnly="True"  >
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                </asp:BoundField>
                <asp:BoundField DataField="Descrizione" HeaderText="Descrizione" ReadOnly="True"  >
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                </asp:BoundField>
                <asp:BoundField DataField="NumPaz" HeaderText="Numero soggetto" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField>
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <HeaderTemplate>V1</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="img1" runat="server" Text='<%# TrovaSemVisita(Convert.ToString(Eval("R1")),Convert.ToString(Eval("IdPaziente")),"1") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <HeaderTemplate>V2</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="img2" runat="server" Text='<%# TrovaSemVisita(Convert.ToString(Eval("R2")),Convert.ToString(Eval("IdPaziente")),"2") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                    <HeaderTemplate>V3</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="img3" runat="server" Text='<%# TrovaSemVisita(Convert.ToString(Eval("R3")),Convert.ToString(Eval("IdPaziente")),"3") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlPaziente" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
                >
            </asp:SqlDataSource> 
            <asp:SqlDataSource ID="SqlDataPaziente" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="">
</asp:SqlDataSource>
        <%} %>
        
    </form>
</body>
</html>
