<%@ Page Language="C#" ResponseEncoding="utf-8" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="pathologies.aspx.cs" Inherits="ssl_Pathologies" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="../css/style_pagina.css" rel="stylesheet" type="text/css" />
    <script src="../script/overDiv.js" type="text/javascript"></script>
    <script src="../script/jquery-1.7.2.min.js" type="text/javascript"></script>
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
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Current major other pathologies</div></div></td></tr>
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
    <asp:SqlDataSource ID="SqlPathologies" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlPathologies_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbpathologies
(IdCentro,
IdPaziente,
IdTipVis,
Pathologies,
Hypertension,
HypertensionDODD,
HypertensionDOMM,
HypertensionDOYY,
Dyslipidemia,
DyslipidemiaDODD,
DyslipidemiaDOMM,
DyslipidemiaDOYY,
Obesity,
ObesityDODD,
ObesityDOMM,
ObesityDOYY,
Diabetes,
DiabetesDODD,
DiabetesDOMM,
DiabetesDOYY,
Metabolic,
MetabolicDODD,
MetabolicDOMM,
MetabolicDOYY,
OtherNeoplasia,
OtherNeoplasiaSpec,
OtherNeoplasiaDODD,
OtherNeoplasiaDOMM,
OtherNeoplasiaDOYY,
BenignMalignan,
Depression,
DepressionDODD,
DepressionDOMM,
DepressionDOYY,
Anxiety,
AnxietyDODD,
AnxietyDOMM,
AnxietyDOYY,
Cardiovascular,
Infarction,
InfarctionDODD,
InfarctionDOMM,
InfarctionDOYY,
AtrialFibrillation,
AtrialFibrillationDODD,
AtrialFibrillationDOMM,
AtrialFibrillationDOYY,
Congestive,
CongestiveDODD,
CongestiveDOMM,
CongestiveDOYY,
Arrhythmias,
ArrhythmiasDODD,
ArrhythmiasDOMM,
ArrhythmiasDOYY,
HCV,
HCVDODD,
HCVDOMM,
HCVDOYY,
HIV,
HIVDODD,
HIVDOMM,
HIVDOYY,
HBV,
HBVDODD,
HBVDOMM,
HBVDOYY,
Autoimmune,
RheumatoidArthritis,
RheumatoidArthritisDODD,
RheumatoidArthritisDOMM,
RheumatoidArthritisDOYY,
PsoriaticArthritis,
PsoriaticArthritisDODD,
PsoriaticArthritisDOMM,
PsoriaticArthritisDOYY,
AxialSponylitis,
AxialSponylitisDODD,
AxialSponylitisDOMM,
AxialSponylitisDOYY,
ConnectiveTissue,
ConnectiveTissueDODD,
ConnectiveTissueDOMM,
ConnectiveTissueDOYY,
UlcerativeColitis,
UlcerativeColitisDODD,
UlcerativeColitisDOMM,
UlcerativeColitisDOYY,
Chron,
ChronDODD,
ChronDOMM,
ChronDOYY,
Psoriasis,
PsoriasisDODD,
PsoriasisDOMM,
PsoriasisDOYY,
Uveitis,
UveitisDODD,
UveitisDOMM,
UveitisDOYY,
Other1,
Other1Spec,
Other1DODD,
Other1DOMM,
Other1DOYY,
Other2,
Other2Spec,
Other2DODD,
Other2DOMM,
Other2DOYY,
Other3,
Other3Spec,
Other3DODD,
Other3DOMM,
Other3DOYY,
Other4,
Other4Spec,
Other4DODD,
Other4DOMM,
Other4DOYY,
Other5,
Other5Spec,
Other5DODD,
Other5DOMM,
Other5DOYY,
Other6,
Other6Spec,
Other6DODD,
Other6DOMM,
Other6DOYY,
MajorSurgeries,
SemID)
VALUES
(?IdCentro,
?IdPaziente,
1,
?Pathologies,
?Hypertension,
?HypertensionDODD,
?HypertensionDOMM,
?HypertensionDOYY,
?Dyslipidemia,
?DyslipidemiaDODD,
?DyslipidemiaDOMM,
?DyslipidemiaDOYY,
?Obesity,
?ObesityDODD,
?ObesityDOMM,
?ObesityDOYY,
?Diabetes,
?DiabetesDODD,
?DiabetesDOMM,
?DiabetesDOYY,
?Metabolic,
?MetabolicDODD,
?MetabolicDOMM,
?MetabolicDOYY,
?OtherNeoplasia,
?OtherNeoplasiaSpec,
?OtherNeoplasiaDODD,
?OtherNeoplasiaDOMM,
?OtherNeoplasiaDOYY,
?BenignMalignan,
?Depression,
?DepressionDODD,
?DepressionDOMM,
?DepressionDOYY,
?Anxiety,
?AnxietyDODD,
?AnxietyDOMM,
?AnxietyDOYY,
?Cardiovascular,
?Infarction,
?InfarctionDODD,
?InfarctionDOMM,
?InfarctionDOYY,
?AtrialFibrillation,
?AtrialFibrillationDODD,
?AtrialFibrillationDOMM,
?AtrialFibrillationDOYY,
?Congestive,
?CongestiveDODD,
?CongestiveDOMM,
?CongestiveDOYY,
?Arrhythmias,
?ArrhythmiasDODD,
?ArrhythmiasDOMM,
?ArrhythmiasDOYY,
?HCV,
?HCVDODD,
?HCVDOMM,
?HCVDOYY,
?HIV,
?HIVDODD,
?HIVDOMM,
?HIVDOYY,
?HBV,
?HBVDODD,
?HBVDOMM,
?HBVDOYY,
?Autoimmune,
?RheumatoidArthritis,
?RheumatoidArthritisDODD,
?RheumatoidArthritisDOMM,
?RheumatoidArthritisDOYY,
?PsoriaticArthritis,
?PsoriaticArthritisDODD,
?PsoriaticArthritisDOMM,
?PsoriaticArthritisDOYY,
?AxialSponylitis,
?AxialSponylitisDODD,
?AxialSponylitisDOMM,
?AxialSponylitisDOYY,
?ConnectiveTissue,
?ConnectiveTissueDODD,
?ConnectiveTissueDOMM,
?ConnectiveTissueDOYY,
?UlcerativeColitis,
?UlcerativeColitisDODD,
?UlcerativeColitisDOMM,
?UlcerativeColitisDOYY,
?Chron,
?ChronDODD,
?ChronDOMM,
?ChronDOYY,
?Psoriasis,
?PsoriasisDODD,
?PsoriasisDOMM,
?PsoriasisDOYY,
?Uveitis,
?UveitisDODD,
?UveitisDOMM,
?UveitisDOYY,
?Other1,
?Other1Spec,
?Other1DODD,
?Other1DOMM,
?Other1DOYY,
?Other2,
?Other2Spec,
?Other2DODD,
?Other2DOMM,
?Other2DOYY,
?Other3,
?Other3Spec,
?Other3DODD,
?Other3DOMM,
?Other3DOYY,
?Other4,
?Other4Spec,
?Other4DODD,
?Other4DOMM,
?Other4DOYY,
?Other5,
?Other5Spec,
?Other5DODD,
?Other5DOMM,
?Other5DOYY,
?Other6,
?Other6Spec,
?Other6DODD,
?Other6DOMM,
?Other6DOYY,
?MajorSurgeries,
?SemID);"
        UpdateCommand="UPDATE tbpathologies
SET

Pathologies = ?Pathologies,
Hypertension = ?Hypertension,
HypertensionDODD = ?HypertensionDODD,
HypertensionDOMM = ?HypertensionDOMM,
HypertensionDOYY = ?HypertensionDOYY,
Dyslipidemia = ?Dyslipidemia,
DyslipidemiaDODD = ?DyslipidemiaDODD,
DyslipidemiaDOMM = ?DyslipidemiaDOMM,
DyslipidemiaDOYY = ?DyslipidemiaDOYY,
Obesity = ?Obesity,
ObesityDODD = ?ObesityDODD,
ObesityDOMM = ?ObesityDOMM,
ObesityDOYY = ?ObesityDOYY,
Diabetes = ?Diabetes,
DiabetesDODD = ?DiabetesDODD,
DiabetesDOMM = ?DiabetesDOMM,
DiabetesDOYY = ?DiabetesDOYY,
Metabolic = ?Metabolic,
MetabolicDODD = ?MetabolicDODD,
MetabolicDOMM = ?MetabolicDOMM,
MetabolicDOYY = ?MetabolicDOYY,
OtherNeoplasia = ?OtherNeoplasia,
OtherNeoplasiaSpec = ?OtherNeoplasiaSpec,
OtherNeoplasiaDODD = ?OtherNeoplasiaDODD,
OtherNeoplasiaDOMM = ?OtherNeoplasiaDOMM,
OtherNeoplasiaDOYY = ?OtherNeoplasiaDOYY,
BenignMalignan = ?BenignMalignan,
Depression = ?Depression,
DepressionDODD = ?DepressionDODD,
DepressionDOMM = ?DepressionDOMM,
DepressionDOYY = ?DepressionDOYY,
Anxiety = ?Anxiety,
AnxietyDODD = ?AnxietyDODD,
AnxietyDOMM = ?AnxietyDOMM,
AnxietyDOYY = ?AnxietyDOYY,
Cardiovascular = ?Cardiovascular,
Infarction = ?Infarction,
InfarctionDODD = ?InfarctionDODD,
InfarctionDOMM = ?InfarctionDOMM,
InfarctionDOYY = ?InfarctionDOYY,
AtrialFibrillation = ?AtrialFibrillation,
AtrialFibrillationDODD = ?AtrialFibrillationDODD,
AtrialFibrillationDOMM = ?AtrialFibrillationDOMM,
AtrialFibrillationDOYY = ?AtrialFibrillationDOYY,
Congestive = ?Congestive,
CongestiveDODD = ?CongestiveDODD,
CongestiveDOMM = ?CongestiveDOMM,
CongestiveDOYY = ?CongestiveDOYY,
Arrhythmias = ?Arrhythmias,
ArrhythmiasDODD = ?ArrhythmiasDODD,
ArrhythmiasDOMM = ?ArrhythmiasDOMM,
ArrhythmiasDOYY = ?ArrhythmiasDOYY,
HCV = ?HCV,
HCVDODD = ?HCVDODD,
HCVDOMM = ?HCVDOMM,
HCVDOYY = ?HCVDOYY,
HIV = ?HIV,
HIVDODD = ?HIVDODD,
HIVDOMM = ?HIVDOMM,
HIVDOYY = ?HIVDOYY,
HBV = ?HBV,
HBVDODD = ?HBVDODD,
HBVDOMM = ?HBVDOMM,
HBVDOYY = ?HBVDOYY,
Autoimmune = ?Autoimmune,
RheumatoidArthritis = ?RheumatoidArthritis,
RheumatoidArthritisDODD = ?RheumatoidArthritisDODD,
RheumatoidArthritisDOMM = ?RheumatoidArthritisDOMM,
RheumatoidArthritisDOYY = ?RheumatoidArthritisDOYY,
PsoriaticArthritis = ?PsoriaticArthritis,
PsoriaticArthritisDODD = ?PsoriaticArthritisDODD,
PsoriaticArthritisDOMM = ?PsoriaticArthritisDOMM,
PsoriaticArthritisDOYY = ?PsoriaticArthritisDOYY,
AxialSponylitis = ?AxialSponylitis,
AxialSponylitisDODD = ?AxialSponylitisDODD,
AxialSponylitisDOMM = ?AxialSponylitisDOMM,
AxialSponylitisDOYY = ?AxialSponylitisDOYY,
ConnectiveTissue = ?ConnectiveTissue,
ConnectiveTissueDODD = ?ConnectiveTissueDODD,
ConnectiveTissueDOMM = ?ConnectiveTissueDOMM,
ConnectiveTissueDOYY = ?ConnectiveTissueDOYY,
UlcerativeColitis = ?UlcerativeColitis,
UlcerativeColitisDODD = ?UlcerativeColitisDODD,
UlcerativeColitisDOMM = ?UlcerativeColitisDOMM,
UlcerativeColitisDOYY = ?UlcerativeColitisDOYY,
Chron = ?Chron,
ChronDODD = ?ChronDODD,
ChronDOMM = ?ChronDOMM,
ChronDOYY = ?ChronDOYY,
Psoriasis = ?Psoriasis,
PsoriasisDODD = ?PsoriasisDODD,
PsoriasisDOMM = ?PsoriasisDOMM,
PsoriasisDOYY = ?PsoriasisDOYY,
Uveitis = ?Uveitis,
UveitisDODD = ?UveitisDODD,
UveitisDOMM = ?UveitisDOMM,
UveitisDOYY = ?UveitisDOYY,
Other1 = ?Other1,
Other1Spec = ?Other1Spec,
Other1DODD = ?Other1DODD,
Other1DOMM = ?Other1DOMM,
Other1DOYY = ?Other1DOYY,
Other2 = ?Other2,
Other2Spec = ?Other2Spec,
Other2DODD = ?Other2DODD,
Other2DOMM = ?Other2DOMM,
Other2DOYY = ?Other2DOYY,
Other3 = ?Other3,
Other3Spec = ?Other3Spec,
Other3DODD = ?Other3DODD,
Other3DOMM = ?Other3DOMM,
Other3DOYY = ?Other3DOYY,
Other4 = ?Other4,
Other4Spec = ?Other4Spec,
Other4DODD = ?Other4DODD,
Other4DOMM = ?Other4DOMM,
Other4DOYY = ?Other4DOYY,
Other5 = ?Other5,
Other5Spec = ?Other5Spec,
Other5DODD = ?Other5DODD,
Other5DOMM = ?Other5DOMM,
Other5DOYY = ?Other5DOYY,
Other6 = ?Other6,
Other6Spec = ?Other6Spec,
Other6DODD = ?Other6DODD,
Other6DOMM = ?Other6DOMM,
Other6DOYY = ?Other6DOYY,
MajorSurgeries = ?MajorSurgeries,
SemID = ?SemID
WHERE IdPathologies = ?IdPathologies">

            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="Pathologies" />
                <asp:Parameter Name="Hypertension" />
                <asp:Parameter Name="HypertensionDODD" />
                <asp:Parameter Name="HypertensionDOMM" />
                <asp:Parameter Name="HypertensionDOYY" />
                <asp:Parameter Name="Dyslipidemia" />
                <asp:Parameter Name="DyslipidemiaDODD" />
                <asp:Parameter Name="DyslipidemiaDOMM" />
                <asp:Parameter Name="DyslipidemiaDOYY" />
                <asp:Parameter Name="Obesity" />
                <asp:Parameter Name="ObesityDODD" />
                <asp:Parameter Name="ObesityDOMM" />
                <asp:Parameter Name="ObesityDOYY" />
                <asp:Parameter Name="Diabetes" />
                <asp:Parameter Name="DiabetesDODD" />
                <asp:Parameter Name="DiabetesDOMM" />
                <asp:Parameter Name="DiabetesDOYY" />
                <asp:Parameter Name="Metabolic" />
                <asp:Parameter Name="MetabolicDODD" />
                <asp:Parameter Name="MetabolicDOMM" />
                <asp:Parameter Name="MetabolicDOYY" />
                <asp:Parameter Name="OtherNeoplasia" />
                <asp:Parameter Name="OtherNeoplasiaSpec" />
                <asp:Parameter Name="OtherNeoplasiaDODD" />
                <asp:Parameter Name="OtherNeoplasiaDOMM" />
                <asp:Parameter Name="OtherNeoplasiaDOYY" />
                <asp:Parameter Name="BenignMalignan" />
                <asp:Parameter Name="Depression" />
                <asp:Parameter Name="DepressionDODD" />
                <asp:Parameter Name="DepressionDOMM" />
                <asp:Parameter Name="DepressionDOYY" />
                <asp:Parameter Name="Anxiety" />
                <asp:Parameter Name="AnxietyDODD" />
                <asp:Parameter Name="AnxietyDOMM" />
                <asp:Parameter Name="AnxietyDOYY" />
                <asp:Parameter Name="Cardiovascular" />
                <asp:Parameter Name="Infarction" />
                <asp:Parameter Name="InfarctionDODD" />
                <asp:Parameter Name="InfarctionDOMM" />
                <asp:Parameter Name="InfarctionDOYY" />
                <asp:Parameter Name="AtrialFibrillation" />
                <asp:Parameter Name="AtrialFibrillationDODD" />
                <asp:Parameter Name="AtrialFibrillationDOMM" />
                <asp:Parameter Name="AtrialFibrillationDOYY" />
                <asp:Parameter Name="Congestive" />
                <asp:Parameter Name="CongestiveDODD" />
                <asp:Parameter Name="CongestiveDOMM" />
                <asp:Parameter Name="CongestiveDOYY" />
                <asp:Parameter Name="Arrhythmias" />
                <asp:Parameter Name="ArrhythmiasDODD" />
                <asp:Parameter Name="ArrhythmiasDOMM" />
                <asp:Parameter Name="ArrhythmiasDOYY" />
                <asp:Parameter Name="HCV" />
                <asp:Parameter Name="HCVDODD" />
                <asp:Parameter Name="HCVDOMM" />
                <asp:Parameter Name="HCVDOYY" />
                <asp:Parameter Name="HIV" />
                <asp:Parameter Name="HIVDODD" />
                <asp:Parameter Name="HIVDOMM" />
                <asp:Parameter Name="HIVDOYY" />
                <asp:Parameter Name="HBV" />
                <asp:Parameter Name="HBVDODD" />
                <asp:Parameter Name="HBVDOMM" />
                <asp:Parameter Name="HBVDOYY" />
                <asp:Parameter Name="Autoimmune" />
                <asp:Parameter Name="RheumatoidArthritis" />
                <asp:Parameter Name="RheumatoidArthritisDODD" />
                <asp:Parameter Name="RheumatoidArthritisDOMM" />
                <asp:Parameter Name="RheumatoidArthritisDOYY" />
                <asp:Parameter Name="PsoriaticArthritis" />
                <asp:Parameter Name="PsoriaticArthritisDODD" />
                <asp:Parameter Name="PsoriaticArthritisDOMM" />
                <asp:Parameter Name="PsoriaticArthritisDOYY" />
                <asp:Parameter Name="AxialSponylitis" />
                <asp:Parameter Name="AxialSponylitisDODD" />
                <asp:Parameter Name="AxialSponylitisDOMM" />
                <asp:Parameter Name="AxialSponylitisDOYY" />
                <asp:Parameter Name="ConnectiveTissue" />
                <asp:Parameter Name="ConnectiveTissueDODD" />
                <asp:Parameter Name="ConnectiveTissueDOMM" />
                <asp:Parameter Name="ConnectiveTissueDOYY" />
                <asp:Parameter Name="UlcerativeColitis" />
                <asp:Parameter Name="UlcerativeColitisDODD" />
                <asp:Parameter Name="UlcerativeColitisDOMM" />
                <asp:Parameter Name="UlcerativeColitisDOYY" />
                <asp:Parameter Name="Chron" />
                <asp:Parameter Name="ChronDODD" />
                <asp:Parameter Name="ChronDOMM" />
                <asp:Parameter Name="ChronDOYY" />
                <asp:Parameter Name="Psoriasis" />
                <asp:Parameter Name="PsoriasisDODD" />
                <asp:Parameter Name="PsoriasisDOMM" />
                <asp:Parameter Name="PsoriasisDOYY" />
                <asp:Parameter Name="Uveitis" />
                <asp:Parameter Name="UveitisDODD" />
                <asp:Parameter Name="UveitisDOMM" />
                <asp:Parameter Name="UveitisDOYY" />
                <asp:Parameter Name="Other1" />
                <asp:Parameter Name="Other1Spec" />
                <asp:Parameter Name="Other1DODD" />
                <asp:Parameter Name="Other1DOMM" />
                <asp:Parameter Name="Other1DOYY" />
                <asp:Parameter Name="Other2" />
                <asp:Parameter Name="Other2Spec" />
                <asp:Parameter Name="Other2DODD" />
                <asp:Parameter Name="Other2DOMM" />
                <asp:Parameter Name="Other2DOYY" />
                <asp:Parameter Name="Other3" />
                <asp:Parameter Name="Other3Spec" />
                <asp:Parameter Name="Other3DODD" />
                <asp:Parameter Name="Other3DOMM" />
                <asp:Parameter Name="Other3DOYY" />
                <asp:Parameter Name="Other4" />
                <asp:Parameter Name="Other4Spec" />
                <asp:Parameter Name="Other4DODD" />
                <asp:Parameter Name="Other4DOMM" />
                <asp:Parameter Name="Other4DOYY" />
                <asp:Parameter Name="Other5" />
                <asp:Parameter Name="Other5Spec" />
                <asp:Parameter Name="Other5DODD" />
                <asp:Parameter Name="Other5DOMM" />
                <asp:Parameter Name="Other5DOYY" />
                <asp:Parameter Name="Other6" />
                <asp:Parameter Name="Other6Spec" />
                <asp:Parameter Name="Other6DODD" />
                <asp:Parameter Name="Other6DOMM" />
                <asp:Parameter Name="Other6DOYY" />
                <asp:Parameter Name="MajorSurgeries" />
                <asp:Parameter Name="SemID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pathologies" />
                <asp:Parameter Name="Hypertension" />
                <asp:Parameter Name="HypertensionDODD" />
                <asp:Parameter Name="HypertensionDOMM" />
                <asp:Parameter Name="HypertensionDOYY" />
                <asp:Parameter Name="Dyslipidemia" />
                <asp:Parameter Name="DyslipidemiaDODD" />
                <asp:Parameter Name="DyslipidemiaDOMM" />
                <asp:Parameter Name="DyslipidemiaDOYY" />
                <asp:Parameter Name="Obesity" />
                <asp:Parameter Name="ObesityDODD" />
                <asp:Parameter Name="ObesityDOMM" />
                <asp:Parameter Name="ObesityDOYY" />
                <asp:Parameter Name="Diabetes" />
                <asp:Parameter Name="DiabetesDODD" />
                <asp:Parameter Name="DiabetesDOMM" />
                <asp:Parameter Name="DiabetesDOYY" />
                <asp:Parameter Name="Metabolic" />
                <asp:Parameter Name="MetabolicDODD" />
                <asp:Parameter Name="MetabolicDOMM" />
                <asp:Parameter Name="MetabolicDOYY" />
                <asp:Parameter Name="OtherNeoplasia" />
                <asp:Parameter Name="OtherNeoplasiaSpec" />
                <asp:Parameter Name="OtherNeoplasiaDODD" />
                <asp:Parameter Name="OtherNeoplasiaDOMM" />
                <asp:Parameter Name="OtherNeoplasiaDOYY" />
                <asp:Parameter Name="BenignMalignan" />
                <asp:Parameter Name="Depression" />
                <asp:Parameter Name="DepressionDODD" />
                <asp:Parameter Name="DepressionDOMM" />
                <asp:Parameter Name="DepressionDOYY" />
                <asp:Parameter Name="Anxiety" />
                <asp:Parameter Name="AnxietyDODD" />
                <asp:Parameter Name="AnxietyDOMM" />
                <asp:Parameter Name="AnxietyDOYY" />
                <asp:Parameter Name="Cardiovascular" />
                <asp:Parameter Name="Infarction" />
                <asp:Parameter Name="InfarctionDODD" />
                <asp:Parameter Name="InfarctionDOMM" />
                <asp:Parameter Name="InfarctionDOYY" />
                <asp:Parameter Name="AtrialFibrillation" />
                <asp:Parameter Name="AtrialFibrillationDODD" />
                <asp:Parameter Name="AtrialFibrillationDOMM" />
                <asp:Parameter Name="AtrialFibrillationDOYY" />
                <asp:Parameter Name="Congestive" />
                <asp:Parameter Name="CongestiveDODD" />
                <asp:Parameter Name="CongestiveDOMM" />
                <asp:Parameter Name="CongestiveDOYY" />
                <asp:Parameter Name="Arrhythmias" />
                <asp:Parameter Name="ArrhythmiasDODD" />
                <asp:Parameter Name="ArrhythmiasDOMM" />
                <asp:Parameter Name="ArrhythmiasDOYY" />
                <asp:Parameter Name="HCV" />
                <asp:Parameter Name="HCVDODD" />
                <asp:Parameter Name="HCVDOMM" />
                <asp:Parameter Name="HCVDOYY" />
                <asp:Parameter Name="HIV" />
                <asp:Parameter Name="HIVDODD" />
                <asp:Parameter Name="HIVDOMM" />
                <asp:Parameter Name="HIVDOYY" />
                <asp:Parameter Name="HBV" />
                <asp:Parameter Name="HBVDODD" />
                <asp:Parameter Name="HBVDOMM" />
                <asp:Parameter Name="HBVDOYY" />
                <asp:Parameter Name="Autoimmune" />
                <asp:Parameter Name="RheumatoidArthritis" />
                <asp:Parameter Name="RheumatoidArthritisDODD" />
                <asp:Parameter Name="RheumatoidArthritisDOMM" />
                <asp:Parameter Name="RheumatoidArthritisDOYY" />
                <asp:Parameter Name="PsoriaticArthritis" />
                <asp:Parameter Name="PsoriaticArthritisDODD" />
                <asp:Parameter Name="PsoriaticArthritisDOMM" />
                <asp:Parameter Name="PsoriaticArthritisDOYY" />
                <asp:Parameter Name="AxialSponylitis" />
                <asp:Parameter Name="AxialSponylitisDODD" />
                <asp:Parameter Name="AxialSponylitisDOMM" />
                <asp:Parameter Name="AxialSponylitisDOYY" />
                <asp:Parameter Name="ConnectiveTissue" />
                <asp:Parameter Name="ConnectiveTissueDODD" />
                <asp:Parameter Name="ConnectiveTissueDOMM" />
                <asp:Parameter Name="ConnectiveTissueDOYY" />
                <asp:Parameter Name="UlcerativeColitis" />
                <asp:Parameter Name="UlcerativeColitisDODD" />
                <asp:Parameter Name="UlcerativeColitisDOMM" />
                <asp:Parameter Name="UlcerativeColitisDOYY" />
                <asp:Parameter Name="Chron" />
                <asp:Parameter Name="ChronDODD" />
                <asp:Parameter Name="ChronDOMM" />
                <asp:Parameter Name="ChronDOYY" />
                <asp:Parameter Name="Psoriasis" />
                <asp:Parameter Name="PsoriasisDODD" />
                <asp:Parameter Name="PsoriasisDOMM" />
                <asp:Parameter Name="PsoriasisDOYY" />
                <asp:Parameter Name="Uveitis" />
                <asp:Parameter Name="UveitisDODD" />
                <asp:Parameter Name="UveitisDOMM" />
                <asp:Parameter Name="UveitisDOYY" />
                <asp:Parameter Name="Other1" />
                <asp:Parameter Name="Other1Spec" />
                <asp:Parameter Name="Other1DODD" />
                <asp:Parameter Name="Other1DOMM" />
                <asp:Parameter Name="Other1DOYY" />
                <asp:Parameter Name="Other2" />
                <asp:Parameter Name="Other2Spec" />
                <asp:Parameter Name="Other2DODD" />
                <asp:Parameter Name="Other2DOMM" />
                <asp:Parameter Name="Other2DOYY" />
                <asp:Parameter Name="Other3" />
                <asp:Parameter Name="Other3Spec" />
                <asp:Parameter Name="Other3DODD" />
                <asp:Parameter Name="Other3DOMM" />
                <asp:Parameter Name="Other3DOYY" />
                <asp:Parameter Name="Other4" />
                <asp:Parameter Name="Other4Spec" />
                <asp:Parameter Name="Other4DODD" />
                <asp:Parameter Name="Other4DOMM" />
                <asp:Parameter Name="Other4DOYY" />
                <asp:Parameter Name="Other5" />
                <asp:Parameter Name="Other5Spec" />
                <asp:Parameter Name="Other5DODD" />
                <asp:Parameter Name="Other5DOMM" />
                <asp:Parameter Name="Other5DOYY" />
                <asp:Parameter Name="Other6" />
                <asp:Parameter Name="Other6Spec" />
                <asp:Parameter Name="Other6DODD" />
                <asp:Parameter Name="Other6DOMM" />
                <asp:Parameter Name="Other6DOYY" />
                <asp:Parameter Name="MajorSurgeries" />
                <asp:Parameter Name="SemID" />
                <asp:Parameter Name="IdPathologies" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwPathologies" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlPathologies" DefaultMode="Insert" 
        onItemInserted="frwPathologies_ItemInserted" onItemUpdated="frwPathologies_ItemUpdated">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1">
            <table width="100%">
            <tr>
                <td class="TD1" style="background-color:#005570; color: #FFFFFF; height:20px" align="left">&nbsp;<b>
                    Is the patient suffering from other major pathologies?</b>
                </td>
                <td align="center" class="TD1" >
                    <asp:RadioButtonList ID="Pathologies" runat="server" SelectedValue='<%# Bind("Pathologies") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:chiamaAbilitare('');">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField  ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField  ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField  ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                    <asp:HiddenField  ID="IdPathologies" runat="server" Value='<%# Bind("IdPathologies")%>' />
                    <asp:HiddenField  ID="SemID" runat="server" Value='<%# Bind("SemID")%>' />
                    <div style="position:absolute;top:-1000px">
                        <asp:TextBox ID="HypertensionDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HypertensionDO")%>'></asp:TextBox>
                        <asp:TextBox ID="DyslipidemiaDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("DyslipidemiaDO")%>'></asp:TextBox>
                        <asp:TextBox ID="ObesityDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("ObesityDO")%>'></asp:TextBox>
                        <asp:TextBox ID="DiabetesDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("DiabetesDO")%>'></asp:TextBox>
                        <asp:TextBox ID="MetabolicDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("MetabolicDO")%>'></asp:TextBox>
                        <asp:TextBox ID="DepressionDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("DepressionDO")%>'></asp:TextBox>

                        <asp:TextBox ID="HCVDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HCVDO")%>'></asp:TextBox>
                        <asp:TextBox ID="HIVDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HIVDO")%>'></asp:TextBox>
                        <asp:TextBox ID="HBVDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HBVDO")%>'></asp:TextBox>
                        <asp:TextBox ID="OtherNeoplasiaDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("OtherNeoplasiaDO")%>'></asp:TextBox>
                        
                        <asp:TextBox ID="AnxietyDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("AnxietyDO")%>'></asp:TextBox>
                        <asp:TextBox ID="InfarctionDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("InfarctionDO")%>'></asp:TextBox>
                        <asp:TextBox ID="AtrialFibrillationDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("AtrialFibrillationDO")%>'></asp:TextBox>
                        <asp:TextBox ID="CongestiveDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("CongestiveDO")%>'></asp:TextBox>
                        <asp:TextBox ID="ArrhythmiasDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("ArrhythmiasDO")%>'></asp:TextBox>
                        <asp:TextBox ID="RheumatoidArthritisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("RheumatoidArthritisDO")%>'></asp:TextBox>
                        <asp:TextBox ID="PsoriaticArthritisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("PsoriaticArthritisDO")%>'></asp:TextBox>
                        <asp:TextBox ID="AxialSponylitisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("AxialSponylitisDO")%>'></asp:TextBox>
                        <asp:TextBox ID="ConnectiveTissueDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("ConnectiveTissueDO")%>'></asp:TextBox>
                        <asp:TextBox ID="UlcerativeColitisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("UlcerativeColitisDO")%>'></asp:TextBox>
                        <asp:TextBox ID="ChronDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HypertensionDO")%>'></asp:TextBox>
                        <asp:TextBox ID="PsoriasisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HypertensionDO")%>'></asp:TextBox>
                        <asp:TextBox ID="UveitisDO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("HypertensionDO")%>'></asp:TextBox>                        <asp:TextBox ID="Other1DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other1DO")%>'></asp:TextBox>
                        <asp:TextBox ID="Other2DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other2DO")%>'></asp:TextBox>
                        <asp:TextBox ID="Other3DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other3DO")%>'></asp:TextBox>
                        <asp:TextBox ID="Other4DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other4DO")%>'></asp:TextBox>
                        <asp:TextBox ID="Other5DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other5DO")%>'></asp:TextBox>
                        <asp:TextBox ID="Other6DO" runat="server" width="0px" TabIndex="200" Text='<%# Bind("Other6DO")%>'></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr><td align="center" bgcolor="#DFDFDF" colspan="2"><table width="100%" bgcolor="#CCCCCC" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" class="TD1" style="background-color: #005570; height:20px; color:White"><b>Pathologies</b> </td>
                <td align="center" class="TD1" style="background-color: #005570;color:White"><b>Onset date</b></td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Hypertension" runat="server" SelectedValue='<%# Bind("Hypertension") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Hypertension','');">
                        <asp:ListItem Text="Hypertension" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HypertensionV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="HypertensionDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('HypertensionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HypertensionDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('HypertensionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HypertensionDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('HypertensionDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Dyslipidemia" runat="server" SelectedValue='<%# Bind("Dyslipidemia") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Dyslipidemia','');">
                        <asp:ListItem Text="Dyslipidemia" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="DyslipidemiaV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="DyslipidemiaDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('DyslipidemiaDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DyslipidemiaDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('DyslipidemiaDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DyslipidemiaDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('DyslipidemiaDO');">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Obesity" runat="server" SelectedValue='<%# Bind("Obesity") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Obesity','');">
                        <asp:ListItem Text="Obesity" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="ObesityV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="ObesityDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('ObesityDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ObesityDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('ObesityDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ObesityDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('ObesityDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Diabetes" runat="server" SelectedValue='<%# Bind("Diabetes") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Diabetes','');">
                        <asp:ListItem Text="Diabetes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="DiabetesV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="DiabetesDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('DiabetesDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DiabetesDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('DiabetesDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DiabetesDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('DiabetesDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Metabolic" runat="server" SelectedValue='<%# Bind("Metabolic") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Metabolic','');">
                        <asp:ListItem Text="Metabolic syndrome" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="MetabolicV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="MetabolicDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('MetabolicDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="MetabolicDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('MetabolicDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="MetabolicDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('MetabolicDO');">
                    </asp:DropDownList>
                </td>
            </tr
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="OtherNeoplasia" runat="server" SelectedValue='<%# Bind("OtherNeoplasia") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('OtherNeoplasia','');">
                        <asp:ListItem Text="Other neoplasia" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList><asp:TextBox ID="OtherNeoplasiaSpec" runat="server" Text='<%# Bind("OtherNeoplasiaSpec")%>'></asp:TextBox>
                    <asp:HiddenField  ID="OtherNeoplasiaV1" runat="server" />
                    <asp:RadioButtonList ID="BenignMalignan" runat="server" SelectedValue='<%# Bind("BenignMalignan") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Neoplasia','');">
                        <asp:ListItem Text="Benign" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Malignant" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="OtherNeoplasiaDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('OtherNeoplasiaDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="OtherNeoplasiaDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('OtherNeoplasiaDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="OtherNeoplasiaDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('OtherNeoplasiaDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Depression" runat="server" SelectedValue='<%# Bind("Depression") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Depression','');">
                        <asp:ListItem Text="Depression" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="DepressionV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="DepressionDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('DepressionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DepressionDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('DepressionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DepressionDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('DepressionDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="Anxiety" runat="server" SelectedValue='<%# Bind("Anxiety") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Anxiety','');">
                        <asp:ListItem Text="Anxiety" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="AnxietyV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="AnxietyDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('AnxietyDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AnxietyDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('AnxietyDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AnxietyDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('AnxietyDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2" colspan="2">
                    <asp:CheckBoxList ID="Cardiovascular" runat="server" SelectedValue='<%# Bind("Cardiovascular") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abiltareCardiovascular();">
                        <asp:ListItem Text="Cardiovascular disease" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HiddenField1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Infarction" runat="server" SelectedValue='<%# Bind("Infarction") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Infarction','');">
                        <asp:ListItem Text="Previous myocardial infarction" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="InfarctionV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="InfarctionDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('InfarctionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="InfarctionDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('InfarctionDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="InfarctionDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('InfarctionDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="AtrialFibrillation" runat="server" SelectedValue='<%# Bind("AtrialFibrillation") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('AtrialFibrillation','');">
                        <asp:ListItem Text="Atrial fibrillation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="AtrialFibrillationV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="AtrialFibrillationDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('AtrialFibrillationDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AtrialFibrillationDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('AtrialFibrillationDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AtrialFibrillationDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('AtrialFibrillationDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Congestive" runat="server" SelectedValue='<%# Bind("Congestive") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Congestive','');">
                        <asp:ListItem Text="Congestive heart failure" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="CongestiveV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="CongestiveDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('CongestiveDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="CongestiveDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('CongestiveDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="CongestiveDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('CongestiveDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Arrhythmias" runat="server" SelectedValue='<%# Bind("Arrhythmias") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Arrhythmias','');">
                        <asp:ListItem Text="Arrhythmias other than AF" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="ArrhythmiasV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="ArrhythmiasDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('ArrhythmiasDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ArrhythmiasDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('ArrhythmiasDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ArrhythmiasDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('ArrhythmiasDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="HCV" runat="server" SelectedValue='<%# Bind("HCV") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('HCV','');">
                        <asp:ListItem Text="HCV" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HCVV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="HCVDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('HCVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HCVDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('HCVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HCVDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('HCVDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="HIV" runat="server" SelectedValue='<%# Bind("HIV") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('HIV','');">
                        <asp:ListItem Text="HIV" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HIVV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="HIVDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('HIVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HIVDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('HIVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HIVDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('HIVDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <asp:CheckBoxList ID="HBV" runat="server" SelectedValue='<%# Bind("HBV") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('HBV','');">
                        <asp:ListItem Text="HBV" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HBVV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="HBVDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('HBVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HBVDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('HBVDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="HBVDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('HBVDO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2" colspan="2">
                    <asp:CheckBoxList ID="Autoimmune" runat="server" SelectedValue='<%# Bind("Autoimmune") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abiltareAutoimmune();">
                        <asp:ListItem Text="Autoimmune disease" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="HiddenField2" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="RheumatoidArthritis" runat="server" SelectedValue='<%# Bind("RheumatoidArthritis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('RheumatoidArthritis','');">
                        <asp:ListItem Text="Rheumatoid Arthritis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="RheumatoidArthritisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="RheumatoidArthritisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('RheumatoidArthritisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="RheumatoidArthritisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('RheumatoidArthritisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="RheumatoidArthritisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('RheumatoidArthritisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="PsoriaticArthritis" runat="server" SelectedValue='<%# Bind("PsoriaticArthritis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('PsoriaticArthritis','');">
                        <asp:ListItem Text="Psoriatic Arthritis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="PsoriaticArthritisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="PsoriaticArthritisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriaticArthritisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="PsoriaticArthritisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriaticArthritisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="PsoriaticArthritisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriaticArthritisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="AxialSponylitis" runat="server" SelectedValue='<%# Bind("AxialSponylitis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('AxialSponylitis','');">
                        <asp:ListItem Text="Axial Spondylitis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="AxialSponylitisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="AxialSponylitisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('AxialSponylitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AxialSponylitisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('AxialSponylitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="AxialSponylitisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('AxialSponylitisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="ConnectiveTissue" runat="server" SelectedValue='<%# Bind("ConnectiveTissue") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('ConnectiveTissue','');">
                        <asp:ListItem Text="Connective tissue disease" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="ConnectiveTissueV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="ConnectiveTissueDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('ConnectiveTissueDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ConnectiveTissueDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('ConnectiveTissueDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ConnectiveTissueDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('ConnectiveTissueDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="UlcerativeColitis" runat="server" SelectedValue='<%# Bind("UlcerativeColitis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('UlcerativeColitis','');">
                        <asp:ListItem Text="Ulcerative Colitis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="UlcerativeColitisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="UlcerativeColitisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('UlcerativeColitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="UlcerativeColitisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('UlcerativeColitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="UlcerativeColitisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('UlcerativeColitisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Chron" runat="server" SelectedValue='<%# Bind("Chron") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Chron','');">
                        <asp:ListItem Text="Crohn" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="ChronV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="ChronDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('ChronDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ChronDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('ChronDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ChronDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('ChronDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Psoriasis" runat="server" SelectedValue='<%# Bind("Psoriasis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Psoriasis','');">
                        <asp:ListItem Text="Psoriasis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="PsoriasisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="PsoriasisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriasisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="PsoriasisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriasisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="PsoriasisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('PsoriasisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2;padding-left:30px">
                    <asp:CheckBoxList ID="Uveitis" runat="server" SelectedValue='<%# Bind("Uveitis") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Uveitis','');">
                        <asp:ListItem Text="Non infectious uveitis" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:HiddenField  ID="UveitisV1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="UveitisDODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('UveitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="UveitisDOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('UveitisDO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="UveitisDOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('UveitisDO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other1" runat="server" SelectedValue='<%# Bind("Other1") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other1','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other1Spec" runat="server" Text='<%# Bind("Other1Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other1V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other1DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other1DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other1DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other1DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other1DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other1DO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other2" runat="server" SelectedValue='<%# Bind("Other2") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other2','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other2Spec" runat="server" Text='<%# Bind("Other2Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other2V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other2DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other2DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other2DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other2DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other2DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other2DO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other3" runat="server" SelectedValue='<%# Bind("Other3") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other3','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other3Spec" runat="server" Text='<%# Bind("Other3Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other3V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other3DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other3DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other3DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other3DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other3DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other3DO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other4" runat="server" SelectedValue='<%# Bind("Other4") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other4','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other4Spec" runat="server" Text='<%# Bind("Other4Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other4V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other4DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other4DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other4DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other4DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other4DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other4DO');">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other5" runat="server" SelectedValue='<%# Bind("Other5") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other5','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other5Spec" runat="server" Text='<%# Bind("Other5Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other5V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other5DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other5DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other5DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other5DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other5DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other5DO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color: #F2F2F2">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="Other6" runat="server" SelectedValue='<%# Bind("Other6") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareEsame('Other6','');">
                                    <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:TextBox ID="Other6Spec" runat="server" Text='<%# Bind("Other6Spec")%>' MaxLength="45" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField  ID="Other6V1" runat="server" />
                </td>
                <td align="center" class="TD1" style="background-color: #F2F2F2">
                    <asp:DropDownList ID="Other6DODD" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other6DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other6DOMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other6DO');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Other6DOYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('Other6DO');">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#005570; color: #FFFFFF; height:20px" align="left">&nbsp;<b>
                    Previous Major Surgeries?</b>
                </td>
                <td align="center" class="TD1" >
                    <asp:RadioButtonList ID="MajorSurgeries" runat="server" SelectedValue='<%# Bind("MajorSurgeries") %>' RepeatDirection="Horizontal" CellPadding="1" onclick="javascript:abilitareSurgery();">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            </table>
            <div id="divSurgery" style="display:none;visibility:hidden">
            <table width="100%">
            <tr>
                <td class="TD1" align="left">&nbsp;<b>
                    If Yes, Major Surgery:</b>
                </td>
            </tr>
            <tr>
                <td class="TD1" align="center">
                    <%if (Session["LIVELLOID"].ToString() == "1") {%>
                    <asp:Button CssClass="buttonDentro" ID="btnNuovo1" runat="server" OnClick="btnNuovaMajorSurgery_Click" Text="Add Major Surgery" CausesValidation="false"  />
                    <%} %>
                </td>
            </tr>
            <tr>
                <td class="TD1" align="center">
                    <asp:GridView ID="grwElenco" AllowPaging="false" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="IdMajorSurgery"
                    DataSourceID="SqlElenco" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" Width="100%" AllowSorting="false" 
                    PageSize="25" PagerSettings-PageButtonCount="9" 
                    PagerSettings-Position="TopAndBottom" onselectedindexchanged="grwElenco_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Select" SelectText="" SelectImageUrl="~/images/seleziona.GIF"
                            ShowSelectButton="True">
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="MajorSurgery" HeaderText="Major Surgeries" ReadOnly="True" ItemStyle-HorizontalAlign="Left" >
                             <HeaderStyle CssClass="headerGRW" BackColor="#005570" ForeColor="White" Font-Size="12px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateSurgery" HeaderText="Date of Surgery" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
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
                    <asp:SqlDataSource ID="SqlElenco" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="">
                    </asp:SqlDataSource> 
                </td>
            </tr>
            </table>
            
            </div>
            <table width="100%">
            <div id="divMotivo" runat="server" visible="false">
            <tr>
                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="3"><b>Reason for change:</b></td>
            </tr>
            
            <tr>
                <td align="center" class="TD1" colspan="3">
                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
            </div>
            <tr><td align="left" colspan="4">
                <asp:RequiredFieldValidator ControlToValidate="Pathologies" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>Is the patient suffering from other major pathologies?</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="Pathologies" OnServerValidate="Pathologies_OnServerValidate" ErrorMessage="" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="OtherNeoplasiaSpec" OnServerValidate="AltroNeoplasia_OnServerValidate" ErrorMessage="The field <b>Other neoplasia - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="Other1Spec" OnServerValidate="Altro_OnServerValidate" ErrorMessage="The field <b>Other 1 - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="Other2Spec" OnServerValidate="Altro_OnServerValidate" ErrorMessage="The field <b>Other 2 - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="Other3Spec" OnServerValidate="Altro_OnServerValidate" ErrorMessage="The field <b>Other 3 - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="Other4Spec" OnServerValidate="Altro_OnServerValidate" ErrorMessage="The field <b>Other 4 - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="Other5Spec" OnServerValidate="Altro_OnServerValidate" ErrorMessage="The field <b>Other 5 - specify</b> deve essere compilato." Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="Other5Spec" OnServerValidate="DataFine_OnServerValidate" ErrorMessage="" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td></tr>
            </table></td></tr></table></td></tr></table>
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
</asp:Panel></td></tr></table><br /><br />
</div></td></tr></table><br /><br /></div><br /><br />
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
<!-- #INCLUDE FILE="gestioneMajorSurgery.aspx"-->
<!-- #INCLUDE FILE="msgAlertPatol.aspx"-->
<script language="javascript">
    var sp = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Cardiovascular,HCV,HIV,HBV,Autoimmune,Other1,Other2,Other3,Other4,Other5,Other6";
    var campip = new Array();
    campip = sp.split(',');
    chiamaAbilitare("LOAD");
      
    function chiamaAbilitare(vieneda)
    {
        for (i = 0; i < campip.length; i++)
        {
            abilitareCheck(campip[i], vieneda);
        }
    }

    function abilitareCheck(campoPadre, vieneda) {
        var opt = document.getElementById("frwPathologies_Pathologies_0");
        var chk = document.getElementById("frwPathologies_" + campoPadre + "_0");
        chk.disabled = !opt.checked;
        if (opt.checked == false) {
            chk.checked = false;
        }
        if (campoPadre == "Cardiovascular") {
            abiltareCardiovascular();
        } else {
            if (campoPadre == "Autoimmune") {
                abiltareAutoimmune();
            } else {
                abilitareEsame(campoPadre, vieneda);
            }
        }
        
    }

    function abilitareEsame(campoPadre,vieneda) {
        var IdPathologies = document.getElementById("frwPathologies_IdPathologies");
        var IdTipVis = document.getElementById("frwPathologies_IdTipVis");
        var chk = document.getElementById("frwPathologies_" + campoPadre + "_0");
        var txtDODD = document.getElementById("frwPathologies_" + campoPadre + "DODD");
        var txtDOMM = document.getElementById("frwPathologies_" + campoPadre + "DOMM");
        var txtDOYY = document.getElementById("frwPathologies_" + campoPadre + "DOYY");
        var hdf = document.getElementById("frwPathologies_" + campoPadre + "V1");

        txtDODD.disabled = !chk.checked;
        txtDOMM.disabled = !chk.checked;
        txtDOYY.disabled = !chk.checked;
      
        if (campoPadre.substring(0,5)== "Other")
        {
            var txtSpec = document.getElementById("frwPathologies_" + campoPadre + "Spec");
            txtSpec.disabled=!chk.checked;
            if (chk.checked==false)
            {
                txtSpec.value="";
            }
            if (campoPadre.indexOf("Neoplasia") > -1) {
                var opt1 = document.getElementById("frwPathologies_BenignMalignan_0");
                var opt2 = document.getElementById("frwPathologies_BenignMalignan_1");
                opt1.disabled = !chk.checked;
                opt2.disabled = !chk.checked;
                if (chk.checked == false) {
                    opt1.checked = false;
                    opt2.checked = false;
                }
            }
        }
        if (chk.checked==false)
        {
            txtDODD.value="";
            txtDOMM.value="";
            txtDOYY.value="";
        }
       
    }

    function abiltareCardiovascular() {
        var st = "Infarction,AtrialFibrillation,Congestive,Arrhythmias";
        var campiC = new Array();
        campiC = st.split(',');
        var chk = document.getElementById("frwPathologies_Cardiovascular_0");
        
        for (j = 0; j < campiC.length; j++) {
            var chk2 = document.getElementById("frwPathologies_" + campiC[j] + "_0");
            chk2.disabled = !chk.checked;
            if (chk.checked == false) {
                chk2.checked = false;
            }
           
            var txtDODD = document.getElementById("frwPathologies_" + campiC[j] + "DODD");
            var txtDOMM = document.getElementById("frwPathologies_" + campiC[j] + "DOMM");
            var txtDOYY = document.getElementById("frwPathologies_" + campiC[j] + "DOYY");
            var hdf = document.getElementById("frwPathologies_" + campiC[j] + "V1");

            txtDODD.disabled = !chk2.checked;
            txtDOMM.disabled = !chk2.checked;
            txtDOYY.disabled = !chk2.checked;
            if (chk2.checked == false) {
                txtDODD.value = "";
                txtDOMM.value = "";
                txtDOYY.value = "";
            }
        }
    }

    function abiltareAutoimmune() {
        var st = "RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis,Chron,Psoriasis,Uveitis"
        var campiC = new Array();
        campiC = st.split(',');
        var chk = document.getElementById("frwPathologies_Autoimmune_0");

        for (j = 0; j < campiC.length; j++) {
            var chk2 = document.getElementById("frwPathologies_" + campiC[j] + "_0");
            chk2.disabled = !chk.checked;
            if (chk.checked == false) {
                chk2.checked = false;
            }

            var txtDODD = document.getElementById("frwPathologies_" + campiC[j] + "DODD");
            var txtDOMM = document.getElementById("frwPathologies_" + campiC[j] + "DOMM");
            var txtDOYY = document.getElementById("frwPathologies_" + campiC[j] + "DOYY");
            var hdf = document.getElementById("frwPathologies_" + campiC[j] + "V1");

            txtDODD.disabled = !chk2.checked;
            txtDOMM.disabled = !chk2.checked;
            txtDOYY.disabled = !chk2.checked;
            if (chk2.checked == false) {
                txtDODD.value = "";
                txtDOMM.value = "";
                txtDOYY.value = "";
            }
        }
    }
    
    function scriviData(campo) {
        var ddlGG = document.getElementById("frwPathologies_" + campo + "DD");
        var ddlMM = document.getElementById("frwPathologies_" + campo + "MM");
        var ddlYY = document.getElementById("frwPathologies_" + campo + "YY");
        var txt = document.getElementById("frwPathologies_" + campo);
        if (ddlGG.value == "UK" || ddlGG.value == "") {
            gg = "01";
        }
        else {
            gg = ddlGG.value;
        }
        if (ddlMM.value == "UK" || ddlMM.value == "") {
            mm = "01";
        }
        else {
            mm = ddlMM.value;
        }
        txt.value = gg + "/" + mm + "/" + ddlYY.value;
        if (ddlGG.value == "" && ddlMM.value == "" && ddlYY.value == "") txt.value = "";
    }

    abilitareSurgery();
    function abilitareSurgery() {
        var opt = document.getElementById("frwPathologies_MajorSurgeries_0");
        //var divSurgery = document.getElementById("divSurgery");
        
        if (opt.checked == true) {
            divSurgery.style.display = "block";
            divSurgery.style.visibility = "visible";
        } else {

            divSurgery.style.display = "none";
            divSurgery.style.visibility = "hidden";
        }
    }

    jQuery(document).ready(function () {
        for (i = 0; i < document.getElementsByTagName("input").length; i++) {
            if (document.getElementsByTagName("input")[i].id.indexOf("DateSurgeryNew") > -1) {
                DataN = document.getElementsByTagName("input")[i];
                $(DataN).mask("99/99/9999");
            } else {
                if (document.getElementsByTagName("input")[i].id.indexOf("DateSurgery") > -1) {
                    Data = document.getElementsByTagName("input")[i];
                    $(Data).mask("99/99/9999");
                }
            }
        }
          
   });
</script>

    <script src="../script/mantieneScroll.js" type="text/javascript"></script>
</form>
</body>
</html>
