<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="gestioneQuery.aspx.cs" Inherits="ssl_gestioneQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
 <!--#INCLUDE FILE="testa.aspx"-->
<div class="contenuto">
    <div id="navigazione">

        <ul>
            <li>You are in:</li>
             <%if (Session["LIVELLOID"].ToString() == "2" || Session["LIVELLOID"].ToString() == "4" || (Session["LIVELLOID"].ToString() == "1" && Session["NewLIVELLOID"].ToString() == "2"))
                    { %>
            <li>
                <a href="elencoCentri.aspx">
                    <span>Center list</span>
                </a>/
            </li>
            <%} %>
            <li><span>Query&hellip;</span></li>
        </ul>
        
    </div>
    <%if (Session["LIVELLOID"].ToString() == "2")
          { %>
        <div style="text-align:right;right:70px;position:absolute;top:3px; font-size:12px">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="CreaTabelleQuery"><b>Tabella Query</b></asp:LinkButton><br />
        </div>
        <%} %>
   <div class="titolo"><div class="fontTitolo">Query</div></div>

           <table cellspacing="0"  align="center" cellpadding="0">
            <tr>
                <td>
   
    <table align="center" width="750px"><tr><td>
    <div class="boxcerca">
        <table align="center" class="boxcercaTable" border="0" width="100%">
            <tr><td colspan="8" align="left" style="border-bottom: 1px solid; background-color: #CCCCCC; height: 22px; font-size: 12px"><b>Criteria for viewing</b></td></tr>
            <tr>
                <td><table width="100%"><tr>
                <td align="right">Patient list:</td>
                <td align="left">
                    <asp:DropDownList CssClass="textbox"  ID="ddlPazienti" runat="server" DataSourceID="SqlPazienti" DataTextField="NumPaz" 
                        DataValueField="IdPaziente">
                    </asp:DropDownList>
                </td>
                
                <td align="right">Type:</td>
                <td align="left">
                    <asp:DropDownList CssClass="textbox"  ID="TipoQuery" runat="server" DataSourceID="SqlTipoQuery" DataTextField="TipoQuery" 
                        DataValueField="IdTipoQuery">
                    </asp:DropDownList>
                </td>
                <td align="right">&nbsp;&nbsp;State:</td>
                <td align="left">
                    <asp:DropDownList CssClass="textbox"  ID="StatoQuery" runat="server" DataSourceID="SqlStatoQuery" DataTextField="StatoQuery" 
                        DataValueField="IdStatoQuery">
                    </asp:DropDownList>    
                </td>
                <td align="right">Visit:</td>
                <td align="left">
                    <asp:DropDownList CssClass="textbox"  ID="ddlVisita" runat="server" DataSourceID="SqlVisitaCerca" DataTextField="DESC1" DataValueField="TIPVISID" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">&nbsp;&nbsp;Form:</td>
                <td align="left" colspan="2">
                    <asp:DropDownList CssClass="textbox"  ID="ddlForm" runat="server" DataSourceID="SqlForm" DataTextField="newdesc" Width="250px"
                        DataValueField="FORMID">
                    </asp:DropDownList>  
                </td>
               
                
                <td align="left">
                    <asp:Button CssClass="buttonDentro" ID="btnCerca" runat="server" Text="Search" 
                    onclick="btnCerca_Click" />
                </td>
                <td align="right" colspan="5">
                <%if (Session["LIVELLOID"].ToString() == "2")
                  { %>
                    <asp:Button CssClass="buttonDentro" ID="btnNuovo" runat="server" Text="Add query" 
                    onclick="btnNuovo_Click" />
                 <%} %>
                </td>
                
            </tr> 
        </table>
        <asp:SqlDataSource ID="SqlPazienti" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlTipoQuery" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsTipoQuery order by IdTipoQuery"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlStatoQuery" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from lsStatoQuery order by IdStatoQuery"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlForm" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select 0 as formid,'All forms' as newdesc  from PrForm union Select if(formid=0,-1,formid) as formid,PrForm.desc as newdesc from PrForm order by 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlVisitaCerca" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select 0 as TIPVISID, '' as DESC1 from LsTIPVIS union Select TIPVISID, LsTIPVIS.DESC as DESC1 from LsTIPVIS order by TIPVISID"></asp:SqlDataSource>
    </td></tr></table></div>
    </td></tr>
    <tr><td align="center"><asp:Button ID="btnIndietro" CssClass="button" runat="server" Text="Back" onclick="btnIndietro_Click" CausesValidation="false" /></td></tr>
    <tr><td>
        <br />
        <asp:Repeater ID="rptElenco" runat="server" DataSourceID="SqlElencoQuery">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <table class="boxElencoQuery" width="100%" align="center">
                <tr>
                    <td align="right"><b>Patient nr.:</b></td>
                    <td align="left">
                        <asp:Label ID="Label10" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("NumPaz")%>' Width="100px"></asp:Label>
                    </td>
                    <td align="right"><b>Form:</b></td>
                    <td align="left" colspan="3">
                        <asp:Label ID="Label4" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("descForm")%>' Width="378px"></asp:Label>
                    </td>
                </tr>
                <tr>    
                <td align="right"><b>Visit:</b></td>
                    <td align="left">
                        <asp:Label ID="Label9" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("Desc")%>' Width="70px"></asp:Label>
                    </td>
                    <td align="right"><b>Field:</b></td>
                    <td align="left" colspan="3">
                        <asp:Label ID="Label6" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("newCampo")%>' Width="378px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right"><b>Type:</b></td>
                    <td align="left">
                        <asp:Label ID="Label1" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("TipoQuery")%>' Width="70px"></asp:Label>
                    </td>
                    <td align="right"><b>Date/Time:</b></td>
                    <td align="left">
                        <asp:Label ID="Label2" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("DataQuery")%>' Width="140px"></asp:Label>
                    </td>
                    <td align="right"><b>State:</b></td>
                    <td align="left">
                        <asp:Label ID="lblIdTipVis" CssClass="textbox" runat="server" Text='<%# Eval("IdTipVis")%>' Width="70px" Visible="false"></asp:Label>
                        <asp:Label ID="lblIdForm" CssClass="textbox" runat="server" Text='<%# Eval("IdForm")%>' Width="70px" Visible="false"></asp:Label>
                        <asp:Label ID="lblTABELLA" CssClass="textbox" runat="server" Text='<%# Eval("TABELLA")%>' Width="70px" Visible="false"></asp:Label>
                        <asp:Label ID="IdQuery" CssClass="textbox" runat="server" Text='<%# Eval("IdQuery")%>' Width="70px" Visible="false"></asp:Label>
                        <asp:Label ID="Label5" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("StatoQuery")%>' Width="58px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right"><b>N° answer:</b></td>
                    <td align="left">
                        <asp:Label ID="Label8" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("NRisp")%>' Width="20px"></asp:Label>
                    </td>
                    <td align="right" colspan="2"><b>Last answer Date/Time:</b></td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label3" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("DataOraRisp")%>' Width="144px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" class="boxTestoQuery" align="left" valign="top">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("TestoQuery")%>' Width="100%"></asp:Label></td>
                </tr>
                <td  colspan="8" align="right">
                   <%if (Session["LIVELLOID"].ToString() == "2")
                  { %><asp:Button CssClass="button" ID="btnChiudiQry" runat="server" Text="Close query" Visible='<%# (Eval("StatoQuery").ToString()=="Open")%>'
                    onclick="btnChiudi_Click" />
                    <%} %>
                 </td>  
                </table>
                <div class="elencorisposta">
                    <table width="100%"><tr>
                    <td style="width:20px">
                    <asp:ImageButton ID="imgRisposta" runat="server" ImageUrl="~/images/add.jpg" OnClick="btnRispondi_Click" AlternateText="OPEN" />
                    </td><td>&nbsp;<b>Answers</b></td>
                    <td align="right">
                        <asp:Button CssClass="button" ID="btnRispondi" runat="server" Text="Add answer" Visible='<%# (Eval("StatoQuery").ToString()=="Open")%>'
                        OnClick="btnNuovaRisposta_Click" /></td>
                        </tr></table>
                    
                <div id="divRisposta" runat="server" visible="false" style="background-color: #E8E8E8;">
                    <asp:SqlDataSource ID="SqlElencoRis" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
                    SelectCommand=""></asp:SqlDataSource>
                    <asp:Repeater ID="rptRisposta" runat="server" DataSourceID="SqlElencoRis">
                        <HeaderTemplate>
                            <table width="100%" align="center" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8">
                                <tr><td style="height:1px" bgcolor="Silver" colspan="4"></td></tr>
                                <tr><td style="height:1px" bgcolor="#747474" colspan="4"></td></tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr><td colspan="4">
                                <table cellpadding="5" align="center">
                                <tr bgcolor="#E8E8E8">
                                    <td align="left"><b>Data/Ora:</b></td>
                                    <td align="left">
                                        <asp:Label ID="Label2" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("DataOraRisp")%>' Width="120px"></asp:Label></td>
                                    <td align="left"><b>Utente:</b></td>
                                    <td align="left">
                                        <asp:Label ID="Label4" CssClass="textbox" runat="server" Text='<%# "&nbsp;"+Eval("Nome")+" "+Eval("Cognome")%>' Width="250px"></asp:Label></td>
                               </tr>
                                <tr  bgcolor="#E8E8E8">   
                                    <td align="left" colspan="4">
                                        <asp:TextBox ID="Label3" CssClass="textbox" runat="server" Text='<%# Eval("Risposta")%>' Width="500px"  ReadOnly="true" TextMode="MultiLine" Rows="2"></asp:textbox></td>
                                </tr>
                                </table>
                            </td></tr>
                               
                            <tr><td style="height:1px" bgcolor="Silver" colspan="4"></td></tr>
                            <tr><td style="height:1px" bgcolor="#747474" colspan="4"></td></tr>
                        
                        </ItemTemplate>
                        <FooterTemplate></table></FooterTemplate>
                     </asp:Repeater>
                </div></div>
                <br />
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater> </td></tr></table>  
        <asp:SqlDataSource ID="SqlElencoQuery" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlChiudiQry" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource></td></tr></table>
     </div>
    
    <asp:GridView ID="grwTotale" AllowPaging="False" runat="server" Visible="true"
            AutoGenerateColumns="false"
            DataSourceID="SqlTotale" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" Width="750px">
            <Columns>
            <asp:BoundField DataField="NumPaz" HeaderText="N°  soggetto" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="newDesc" HeaderText="Visita" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="newDescForm" HeaderText="Form" ReadOnly="True" ItemStyle-HorizontalAlign="left">
                </asp:BoundField>
                <asp:BoundField DataField="Campo" HeaderText="Campo" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="DataQuery" HeaderText="Data Query" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                </asp:BoundField>
                <asp:BoundField DataField="StatoQuery" HeaderText="Stato" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                </asp:BoundField>
                <asp:BoundField DataField="TestoQuery" HeaderText="Testo Query" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                </asp:BoundField>
                <asp:BoundField DataField="DataOraRisp" HeaderText="Data e Ora Risposta" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                </asp:BoundField>
                <asp:BoundField DataField="Risposta" HeaderText="Testo Risposta" ReadOnly="True" ItemStyle-HorizontalAlign="Left">
                </asp:BoundField>
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlTotale" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
                >
            </asp:SqlDataSource> 

    <!--#INCLUDE FILE="queryRisposta.aspx"-->
    <!--#INCLUDE FILE="queryNuovo.aspx"-->
    </form>
</body>
</html>
