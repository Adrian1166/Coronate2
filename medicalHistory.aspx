<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="medicalHistory.aspx.cs" Inherits="ssl_MedicalHistory" %>

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
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Medical history</div></div></td></tr>
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
    <asp:SqlDataSource ID="SqlMedicalHistory" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlMedicalHistory_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbmedicalhistory
(IdCentro,
IdPaziente,
IdTipVis,
SmokingHabits,
YearsSmoking,
NoCigarettesDay,
AlcoholConsumption,
DiabetesMellitus,
DiabetesMellitusYD,
DiabetesMellitusCT,
Hypertension,
HypertensionYD,
HypertensionCT,
Ischemic,
IschemicYD,
IschemicCT,
Hyperlipidemia,
HyperlipidemiaYD,
HyperlipidemiaCT,
Anxiety,
AnxietyYD,
AnxietyCT,
Malignancy,
MalignancyYD,
MalignancyCT,
Obesity,
ObesityYD,
ObesityCT,
PsoriaticArthritis,
PsoriaticArthritisYD,
PsoriaticArthritisCT,
OtherPathology,
OtherPathology1Spec,
OtherPathology1YD,
OtherPathology1CT,
OtherPathology2Spec,
OtherPathology2YD,
OtherPathology2CT,
OtherPathology3Spec,
OtherPathology3YD,
OtherPathology3CT,
SemID)
VALUES
(?IdCentro,
?IdPaziente,
1,
?SmokingHabits,
?YearsSmoking,
?NoCigarettesDay,
?AlcoholConsumption,
?DiabetesMellitus,
?DiabetesMellitusYD,
?DiabetesMellitusCT,
?Hypertension,
?HypertensionYD,
?HypertensionCT,
?Ischemic,
?IschemicYD,
?IschemicCT,
?Hyperlipidemia,
?HyperlipidemiaYD,
?HyperlipidemiaCT,
?Anxiety,
?AnxietyYD,
?AnxietyCT,
?Malignancy,
?MalignancyYD,
?MalignancyCT,
?Obesity,
?ObesityYD,
?ObesityCT,
?PsoriaticArthritis,
?PsoriaticArthritisYD,
?PsoriaticArthritisCT,
?OtherPathology,
?OtherPathology1Spec,
?OtherPathology1YD,
?OtherPathology1CT,
?OtherPathology2Spec,
?OtherPathology2YD,
?OtherPathology2CT,
?OtherPathology3Spec,
?OtherPathology3YD,
?OtherPathology3CT,
?SemID);"
        UpdateCommand="UPDATE tbmedicalhistory
SET
SmokingHabits = ?SmokingHabits,
YearsSmoking = ?YearsSmoking,
NoCigarettesDay = ?NoCigarettesDay,
AlcoholConsumption = ?AlcoholConsumption,
DiabetesMellitus = ?DiabetesMellitus,
DiabetesMellitusYD = ?DiabetesMellitusYD,
DiabetesMellitusCT = ?DiabetesMellitusCT,
Hypertension = ?Hypertension,
HypertensionYD = ?HypertensionYD,
HypertensionCT = ?HypertensionCT,
Ischemic = ?Ischemic,
IschemicYD = ?IschemicYD,
IschemicCT = ?IschemicCT,
Hyperlipidemia = ?Hyperlipidemia,
HyperlipidemiaYD = ?HyperlipidemiaYD,
HyperlipidemiaCT = ?HyperlipidemiaCT,
Anxiety = ?Anxiety,
AnxietyYD = ?AnxietyYD,
AnxietyCT = ?AnxietyCT,
Malignancy = ?Malignancy,
MalignancyYD = ?MalignancyYD,
MalignancyCT = ?MalignancyCT,
Obesity = ?Obesity,
ObesityYD = ?ObesityYD,
ObesityCT = ?ObesityCT,
PsoriaticArthritis = ?PsoriaticArthritis,
PsoriaticArthritisYD = ?PsoriaticArthritisYD,
PsoriaticArthritisCT = ?PsoriaticArthritisCT,
OtherPathology = ?OtherPathology,
OtherPathology1Spec = ?OtherPathology1Spec,
OtherPathology1YD = ?OtherPathology1YD,
OtherPathology1CT = ?OtherPathology1CT,
OtherPathology2Spec = ?OtherPathology2Spec,
OtherPathology2YD = ?OtherPathology2YD,
OtherPathology2CT = ?OtherPathology2CT,
OtherPathology3Spec = ?OtherPathology3Spec,
OtherPathology3YD = ?OtherPathology3YD,
OtherPathology3CT = ?OtherPathology3CT,
SemID = ?SemID
WHERE IdMedicalHistory = ?IdMedicalHistory">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="SmokingHabits" />
                <asp:Parameter Name="YearsSmoking" />
                <asp:Parameter Name="NoCigarettesDay" />
                <asp:Parameter Name="AlcoholConsumption" />
                <asp:Parameter Name="DiabetesMellitus" />
                <asp:Parameter Name="DiabetesMellitusYD" />
                <asp:Parameter Name="DiabetesMellitusCT" />
                <asp:Parameter Name="Hypertension" />
                <asp:Parameter Name="HypertensionYD" />
                <asp:Parameter Name="HypertensionCT" />
                <asp:Parameter Name="Ischemic" />
                <asp:Parameter Name="IschemicYD" />
                <asp:Parameter Name="IschemicCT" />
                <asp:Parameter Name="Hyperlipidemia" />
                <asp:Parameter Name="HyperlipidemiaYD" />
                <asp:Parameter Name="HyperlipidemiaCT" />
                <asp:Parameter Name="Anxiety" />
                <asp:Parameter Name="AnxietyYD" />
                <asp:Parameter Name="AnxietyCT" />
                <asp:Parameter Name="Malignancy" />
                <asp:Parameter Name="MalignancyYD" />
                <asp:Parameter Name="MalignancyCT" />
                <asp:Parameter Name="Obesity" />
                <asp:Parameter Name="ObesityYD" />
                <asp:Parameter Name="ObesityCT" />
                <asp:Parameter Name="PsoriaticArthritis" />
                <asp:Parameter Name="PsoriaticArthritisYD" />
                <asp:Parameter Name="PsoriaticArthritisCT" />
                <asp:Parameter Name="OtherPathology" />
                <asp:Parameter Name="OtherPathology1Spec" />
                <asp:Parameter Name="OtherPathology1YD" />
                <asp:Parameter Name="OtherPathology1CT" />
                <asp:Parameter Name="OtherPathology2Spec" />
                <asp:Parameter Name="OtherPathology2YD" />
                <asp:Parameter Name="OtherPathology2CT" />
                <asp:Parameter Name="OtherPathology3Spec" />
                <asp:Parameter Name="OtherPathology3YD" />
                <asp:Parameter Name="OtherPathology3CT" />
                <asp:Parameter Name="SemID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SmokingHabits" />
                <asp:Parameter Name="YearsSmoking" />
                <asp:Parameter Name="NoCigarettesDay" />
                <asp:Parameter Name="AlcoholConsumption" />
                <asp:Parameter Name="DiabetesMellitus" />
                <asp:Parameter Name="DiabetesMellitusYD" />
                <asp:Parameter Name="DiabetesMellitusCT" />
                <asp:Parameter Name="Hypertension" />
                <asp:Parameter Name="HypertensionYD" />
                <asp:Parameter Name="HypertensionCT" />
                <asp:Parameter Name="Ischemic" />
                <asp:Parameter Name="IschemicYD" />
                <asp:Parameter Name="IschemicCT" />
                <asp:Parameter Name="Hyperlipidemia" />
                <asp:Parameter Name="HyperlipidemiaYD" />
                <asp:Parameter Name="HyperlipidemiaCT" />
                <asp:Parameter Name="Anxiety" />
                <asp:Parameter Name="AnxietyYD" />
                <asp:Parameter Name="AnxietyCT" />
                <asp:Parameter Name="Malignancy" />
                <asp:Parameter Name="MalignancyYD" />
                <asp:Parameter Name="MalignancyCT" />
                <asp:Parameter Name="Obesity" />
                <asp:Parameter Name="ObesityYD" />
                <asp:Parameter Name="ObesityCT" />
                <asp:Parameter Name="PsoriaticArthritis" />
                <asp:Parameter Name="PsoriaticArthritisYD" />
                <asp:Parameter Name="PsoriaticArthritisCT" />
                <asp:Parameter Name="OtherPathology" />
                <asp:Parameter Name="OtherPathology1Spec" />
                <asp:Parameter Name="OtherPathology1YD" />
                <asp:Parameter Name="OtherPathology1CT" />
                <asp:Parameter Name="OtherPathology2Spec" />
                <asp:Parameter Name="OtherPathology2YD" />
                <asp:Parameter Name="OtherPathology2CT" />
                <asp:Parameter Name="OtherPathology3Spec" />
                <asp:Parameter Name="OtherPathology3YD" />
                <asp:Parameter Name="OtherPathology3CT" />
                <asp:Parameter Name="SemId" />
                <asp:Parameter Name="IdMedicalHistory" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwMedicalHistory" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" VerticalAlign="Center" DataSourceID="SqlMedicalHistory" DefaultMode="Insert" 
        onItemInserted="frwMedicalHistory_ItemInserted" onItemUpdated="frwMedicalHistory_ItemUpdated" HorizontalAlign="Center">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1"><table width="100%">
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Smoking habits:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="SmokingHabits" runat="server" SelectedValue='<%# Bind("SmokingHabits") %>' RepeatDirection="Vertical" onclick="javascript:abilitareSmoking()">
                        <asp:ListItem Text="Smoker" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Non-smoker" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Former smoker (> 6 months)" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Unknown" Value="4"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>Smoker</b>, Number of years smoking:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="YearsSmoking" runat="server" Text='<%# Bind("YearsSmoking")%>' CssClass="textbox" MaxLength="2" Width="60px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">Daily consumption (No. cigarettes/day):</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="NoCigarettesDay" runat="server" Text='<%# Bind("NoCigarettesDay")%>' CssClass="textbox" MaxLength="2" Width="60px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">&nbsp;Alcohol consumption:</td>
                <td align="left" class="TD1" >
                    <asp:RadioButtonList ID="AlcoholConsumption" runat="server" SelectedValue='<%# Bind("AlcoholConsumption") %>' RepeatDirection="Vertical">
                        <asp:ListItem Text="Does not consume alcohol" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Occasional drinker" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Discreet drinker (less than 3 glasses of wine per day)" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Regular drinker (at least 3 glasses of wine or one hard liquor per day)" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Former drinker" Value="5"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            </table>
            <table width="100%">
            <tr><td colspan="6" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Major comorbidities</td></tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Diabetes mellitus:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="DiabetesMellitus" runat="server" SelectedValue='<%# Bind("DiabetesMellitus") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('DiabetesMellitus')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                    <asp:HiddenField ID="IdMedicalHistory" runat="server" Value='<%# Bind("IdMedicalHistory")%>' />
                    <asp:HiddenField ID="SemId" runat="server" Value='<%# Bind("SemId")%>' />
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="DiabetesMellitusYD" runat="server" Text='<%# Bind("DiabetesMellitusYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="DiabetesMellitusCT" runat="server" SelectedValue='<%# Bind("DiabetesMellitusCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Hypertension:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Hypertension" runat="server" SelectedValue='<%# Bind("Hypertension") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Hypertension')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="HypertensionYD" runat="server" Text='<%# Bind("HypertensionYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="HypertensionCT" runat="server" SelectedValue='<%# Bind("HypertensionCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ischemic heart disease:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Ischemic" runat="server" SelectedValue='<%# Bind("Ischemic") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Ischemic')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="IschemicYD" runat="server" Text='<%# Bind("IschemicYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="IschemicCT" runat="server" SelectedValue='<%# Bind("IschemicCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Hyperlipidemia:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Hyperlipidemia" runat="server" SelectedValue='<%# Bind("Hyperlipidemia") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Hyperlipidemia')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="HyperlipidemiaYD" runat="server" Text='<%# Bind("HyperlipidemiaYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="HyperlipidemiaCT" runat="server" SelectedValue='<%# Bind("HyperlipidemiaCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Anxiety/Depression:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Anxiety" runat="server" SelectedValue='<%# Bind("Anxiety") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Anxiety')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="AnxietyYD" runat="server" Text='<%# Bind("AnxietyYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="AnxietyCT" runat="server" SelectedValue='<%# Bind("AnxietyCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Malignancy:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Malignancy" runat="server" SelectedValue='<%# Bind("Malignancy") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Malignancy')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="MalignancyYD" runat="server" Text='<%# Bind("MalignancyYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="MalignancyCT" runat="server" SelectedValue='<%# Bind("MalignancyCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Obesity:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Obesity" runat="server" SelectedValue='<%# Bind("Obesity") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('Obesity')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="ObesityYD" runat="server" Text='<%# Bind("ObesityYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="ObesityCT" runat="server" SelectedValue='<%# Bind("ObesityCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Psoriatic Arthritis:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="PsoriaticArthritis" runat="server" SelectedValue='<%# Bind("PsoriaticArthritis") %>' RepeatDirection="Horizontal" CellPadding="1"
                        onclick="javascript:abilitareComorbidities('PsoriaticArthritis')">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="PsoriaticArthritisYD" runat="server" Text='<%# Bind("PsoriaticArthritisYD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="PsoriaticArthritisCT" runat="server" SelectedValue='<%# Bind("PsoriaticArthritisCT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            </table>
            <table width="100%">
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Any other major pathology?</td>
                <td align="left" class="TD1" colspan="6">
                    <asp:RadioButtonList ID="OtherPathology" runat="server" SelectedValue='<%# Bind("OtherPathology") %>' RepeatDirection="Horizontal" CellPadding="1" 
                        onclick="javascript:abilitareOtherComorbidities()">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="6">If <b>Yes</b>, please specify:</td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Other Pathology 1:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology1Spec" runat="server" Text='<%# Bind("OtherPathology1Spec")%>' CssClass="textbox" MaxLength="100" Width="200px"></asp:TextBox>
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology1YD" runat="server" Text='<%# Bind("OtherPathology1YD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="OtherPathology1CT" runat="server" SelectedValue='<%# Bind("OtherPathology1CT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Other Pathology 2:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology2Spec" runat="server" Text='<%# Bind("OtherPathology2Spec")%>' CssClass="textbox" MaxLength="100" Width="200px"></asp:TextBox>
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology2YD" runat="server" Text='<%# Bind("OtherPathology2YD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="OtherPathology2CT" runat="server" SelectedValue='<%# Bind("OtherPathology2CT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Other Pathology 3:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology3Spec" runat="server" Text='<%# Bind("OtherPathology3Spec")%>' CssClass="textbox" MaxLength="100" Width="200px"></asp:TextBox>
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of Diagnosis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="OtherPathology3YD" runat="server" Text='<%# Bind("OtherPathology3YD")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp(yyyy)
                </td>
            
                <td align="left" class="TD1" style="background-color:#dcdcdc">Currently Treated:</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="OtherPathology3CT" runat="server" SelectedValue='<%# Bind("OtherPathology3CT") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <div id="divMotivo" runat="server" visible="false">
            <tr>
                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="6"><b>Reason for change:</b></td>
            </tr>
            
            <tr>
                <td align="center" class="TD1" colspan="6">
                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
            </div>
            <tr><td align="left" colspan="6">
                <asp:RequiredFieldValidator ControlToValidate="SmokingHabits" ID="RequiredFieldValidator7" runat="server" ErrorMessage="The field <b>Smoking Habits</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="AlcoholConsumption" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Alcohol Consumption</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="SmokingHabits" OnServerValidate="ControllaDiagnosisDate" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
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
    var s = "DiabetesMellitus,Hypertension,Ischemic,Hyperlipidemia,Anxiety,Malignancy,Obesity,PsoriaticArthritis";
    var campi = new Array();
    campi = s.split(',');
    for (i = 0; i < campi.length; i++) {
        abilitareComorbidities(campi[i]);
    }
    function abilitareComorbidities(campo) {
        var opt = document.getElementById("frwMedicalHistory_" + campo + "_0");
        var txt = document.getElementById("frwMedicalHistory_" + campo + "YD");
        var opt0 = document.getElementById("frwMedicalHistory_" + campo + "CT_0");
        var opt1 = document.getElementById("frwMedicalHistory_" + campo + "CT_1");
        txt.disabled = !opt.checked;
        opt0.disabled = !opt.checked;
        opt1.disabled = !opt.checked;
        
        if (!opt.checked) {
            txt.value = "";
            txt.style.backgroundColor = "#dcdcdc";
            opt0.checked = false;
            opt1.checked = false;
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }
        abilitareOtherComorbidities();
    }

    function abilitareOtherComorbidities() {
        var opt = document.getElementById("frwMedicalHistory_OtherPathology_0");
        for (var i = 1; i < 4; i++) {
            var txt1 = document.getElementById("frwMedicalHistory_OtherPathology" + i + "Spec");
            var txt2 = document.getElementById("frwMedicalHistory_OtherPathology" + i + "YD");
            var opt0 = document.getElementById("frwMedicalHistory_OtherPathology" + i + "CT_0");
            var opt1 = document.getElementById("frwMedicalHistory_OtherPathology" + i + "CT_1");
            txt1.disabled = !opt.checked;
            txt2.disabled = !opt.checked;
            opt0.disabled = !opt.checked;
            opt1.disabled = !opt.checked;
            if (!opt.checked) {
                txt1.value = "";
                txt1.style.backgroundColor = "#dcdcdc";
                txt2.value = "";
                txt2.style.backgroundColor = "#dcdcdc";
                opt0.checked = false;
                opt1.checked = false;
            } else {
                txt1.style.backgroundColor = "#FFFFFF";
                txt2.style.backgroundColor = "#FFFFFF";
            }
        }
    }
    abilitareSmoking();
    function abilitareSmoking() {
        var opt = document.getElementById("frwMedicalHistory_SmokingHabits_0");
        var YearsSmoking = document.getElementById("frwMedicalHistory_YearsSmoking");
        var NoCigarettesDay = document.getElementById("frwMedicalHistory_NoCigarettesDay");
        YearsSmoking.disabled = !opt.checked;
        NoCigarettesDay.disabled = !opt.checked;
        if (!opt.checked) {
            YearsSmoking.value = "";
            YearsSmoking.style.backgroundColor = "#dcdcdc";
            NoCigarettesDay.value = "";
            NoCigarettesDay.style.backgroundColor = "#dcdcdc";
        } else {
            YearsSmoking.style.backgroundColor = "#FFFFFF";
            NoCigarettesDay.style.backgroundColor = "#FFFFFF";
        }

    }
    $("#frwMedicalHistory_YearsSmoking").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_NoCigarettesDay").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_DiabetesMellitusYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_HypertensionYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_IschemicYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_HyperlipidemiaYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_AnxietyYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_MalignancyYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_ObesityYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_PsoriaticArthritisYD").maskNumber({ integer: true, thousands: '' });
    $("#frwMedicalHistory_OtherPathologyYD").maskNumber({ integer: true, thousands: '' });

</script>
<!-- #INCLUDE FILE="info2.aspx"-->
<!-- #INCLUDE FILE="gestioneTerapie.aspx"-->
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
</form>
</body>
</html>
