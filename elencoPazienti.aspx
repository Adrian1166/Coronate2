<%@ Page Language="C#" AutoEventWireup="true" CodeFile="elencoPazienti.aspx.cs" Inherits="ssl_elencoPazienti" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    <script src="../script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../script/jquery.masknumber.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
<div id="wrapper">
 <!--#INCLUDE FILE="testa.aspx"-->
 <div class="contenuto" style="background-color: #E9EFEF;">   
    <div style="text-align:left;left:8px;position:absolute;top:8px;  border: 1px solid #4A62B0;
    background-color: #D5F1FF; font-size:11px;float:right;-webkit-border-radius: 3px;">
            <table>
                <tr>
                <td align="left"><img alt="" src="../images/sem0.png" /></td><td>Visit not filled&nbsp;</td>
                <td align="left"><img alt="" src="../images/sem2.png" /></td><td>Visit incomplete&nbsp;</td>
                <td align="left"><img alt="" src="../images/sem1.png" /></td><td>Visit completed&nbsp;</td>
                <td align="left"><img alt="" src="../images/sem3.png" /></td><td>Visit with query&nbsp;</td>
                <td align="left"><img alt="" src="../images/sem5_g.jpg" /></td><td>Visit frozen&nbsp;</td>
                <td align="left"><img alt="" src="../images/icon_lucchetto.png" /></td><td>Visit locked&nbsp;</td></tr>
            </table>
        </div> 
        <div style="text-align:right;right:40px;position:absolute;top:8px; font-size:12px">
        <%if (Session["PricipalInvest"].ToString() == "1" || Session["LIVELLOID"].ToString() == "2")
          { %><br /><br />
            <asp:LinkButton ID="LinkButton1" Text="PI Signature" runat="server" CausesValidation="false" OnClick="VisualizzaFreeze" Font-Bold="True" ForeColor="#9900CC" />
        <%} %>
        <%if (Session["PricipalInvest"].ToString() == "1" || Session["LIVELLOID"].ToString() == "2" || Session["LIVELLOID"].ToString() == "5")
          { %><br /><br />
          <a href="https://full-epro.org/" target="_blank">ePRO</a>
        <%} %>
     </div><br />
    <div class="titolo" style="margin-top:30px"><div class="fontTitolo">Patient list</div></div>
<table align="center" style="margin-top:20px;" cellspacing="1">
    <tr>
        <td colspan="2" align="center">
            <div style="text-align:center; margin-top:5px">
            <%if (Session["LIVELLOID"].ToString() == "1")
            { %>
            <asp:Button CssClass="buttonNew" ID="btnNuovo" runat="server" Text="Enroll new patient" onclick="btnNuovo_Click" TabIndex="100" />
            <%} %> 
            </div>
        </td>
    </tr>
    <tr>
        <td style="width:940px" valign="top">
            <table width="98%" class="TD1" align="center" style="border: 1px solid #CCCCCC; background-color: #FFFFFF;">
                <tr><td style="width:100%" valign="top">
                    <div style="min-height:250px">
                    <asp:GridView ID="grwPaziente" AllowPaging="false" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="IdPaziente,DateVisit,AlphaCode,UrlDiretto"
                        DataSourceID="SqlPaziente" BackColor="#DFFFDF" BorderColor="#999999" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSorting="grwPaziente_OnSorting"
                        GridLines="Vertical" Width="100%"  OnRowCreated="GridView1_RowCreated"
                        PageSize="15" PagerSettings-PageButtonCount="9" OnPageIndexChanged="grwPaziente_PageIndexChanged"
                        PagerSettings-Position="Top" OnRowEditing="TaskGridView_RowEditing"
                        OnSelectedIndexChanged="grwPaziente_SelectedIndexChanged" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ButtonType="Image" HeaderText="Select" SelectText="" SelectImageUrl="~/images/seleziona.GIF"
                                ShowSelectButton="True">
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="NumPaz" HeaderText="Patient n°" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="NumPaz">
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="DataConsenso" HeaderText="Date of informed consent" ReadOnly="True"  DataFormatString="{0:dd/MM/yyyy}" SortExpression="DataConsenso">
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Age" HeaderText="Age" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="NumPaz">
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="NumPaz">
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Visit</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="img1" runat="server" ImageUrl='<%# TrovaSemVisita("1",Convert.ToString(Eval("IdPaziente")),"1","Naive") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Link for App</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkApp" runat="server" Text="Open" OnClick='ApriAlphaCode' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Coronate</HeaderTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCoronate" runat="server" OnClick='ApriQuestionnaire' Visible='<%# Eval("IdQuestionPaziente").ToString()!="" %>' ForeColor='<%# Eval("DAG3").ToString()=="5" || Eval("DAG3").ToString()=="6" || Eval("DAG3").ToString()=="7" ? System.Drawing.Color.Red : System.Drawing.Color.Blue %>'>
                                    Open</asp:LinkButton>&nbsp;<asp:Image ID="imgAlert" runat="server" ImageUrl="~/images/alert.png" Visible='<%# Eval("DAG3").ToString()=="5" || Eval("DAG3").ToString()=="6" || Eval("DAG3").ToString()=="7" ? true : false %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Coronate retest</HeaderTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCoronateR" runat="server" OnClick='ApriQuestionnaireR' Visible='<%# Eval("IdQuestionPazienteReset").ToString()!="" %>' ForeColor='<%# Eval("DAG3Reset").ToString()=="5" || Eval("DAG3Reset").ToString()=="6" || Eval("DAG3Reset").ToString()=="7" ? System.Drawing.Color.Red : System.Drawing.Color.Blue %>'>
                                    Open</asp:LinkButton>&nbsp;<asp:Image ID="imgAlert2" runat="server" ImageUrl="~/images/alert.png" Visible='<%# Eval("DAG3Reset").ToString()=="5" || Eval("DAG3Reset").ToString()=="6" || Eval("DAG3Reset").ToString()=="7" ? true : false %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Partner</HeaderTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkPartner" runat="server" OnClick='ApriQuestionnaireP' Visible='<%# Eval("IdQuestionPartner").ToString()!="" %>' >
                                    Open</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>MLCDP</HeaderTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkMLCDP" runat="server" OnClick='ApriQuestionnaireMLCDP' Visible='<%# Eval("IdQuestionMLCDP").ToString()!="" %>' >
                                    Open</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Brief Cope</HeaderTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkBriefCope" runat="server" OnClick='ApriQuestionnaireBriefCOPE' Visible='<%# Eval("IdQuestionBriefCOPE").ToString()!="" %>' >
                                    Open</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="headerGRW" BackColor="#E0E0E0" />
                                <HeaderTemplate>Print</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkStampa" runat="server" ImageUrl="~/images/stampa1.gif" Width="17" Height="17" PostBackUrl='<%# "~/ssl/stampa/creaStampaVis1.aspx?IdPaziente="+Eval("idPaziente")+"&NumPaz="+Eval("NumPaz")+"&TipoPaziente=Naive"%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                
                        </Columns>
                        <RowStyle Font-Names="Verdana" Font-Size="Smaller" ForeColor="Black" BackColor="ghostwhite" />
                        <PagerStyle Font-Names="Verdana" ForeColor="#0057D9" Font-Bold="true" Font-Size="14px" BackColor="#C9C9C9" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="#EEEEEE" />
                        <SelectedRowStyle BackColor="#0099CC" ForeColor="White" />
                        <PagerSettings PageButtonCount="9" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlPaziente" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
                            >
                        </asp:SqlDataSource> 
                        </div>

                    </td>
                </tr>
                
            </table>
        </td>

    </tr>
</table>
<br />
 
</div><br /><br />
<asp:SqlDataSource ID="SqlDataPaziente" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="">
</asp:SqlDataSource> 

</div>
  
    <!-- #INCLUDE FILE="msgAlert.aspx"-->
    <!-- #INCLUDE FILE="gestionePI.aspx"-->
    <!-- #INCLUDE FILE="alphaCode.aspx"-->
    <!-- #INCLUDE FILE="QuestionPaziente.aspx"-->
    <!-- #INCLUDE FILE="QuestionPazienteReset.aspx"-->
    <!-- #INCLUDE FILE="questionMLCDP.aspx"-->
    <!-- #INCLUDE FILE="questionBriefCOPE.aspx"-->
    <!-- #INCLUDE FILE="questionPartner.aspx"-->
    </form>
</body>
</html>
