<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="dermatologicHistory.aspx.cs" Inherits="ssl_DermatologicHistory" %>

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
    <tr><td align="center"><div class="titolo"><div class="fontTitolo">Dermatologic history</div></div></td></tr>
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
    <asp:SqlDataSource ID="SqlDermatologicHistory" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlDermatologicHistory_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbdermatologichistory
(IdCentro,
IdPaziente,
IdTipVis,
YearPsoriasis,
YearFirstDiagnosis,
YearModerate,
Scalp,
ScalpCV,
Face,
FaceCV,
Trunk,
TrunkCV,
Arms,
ArmsCV,
Legs,
LegsCV,
Nails,
NailsCV,
Hands,
HandsCV,
Feet,
FeetCV,
BodyFolds,
BodyFoldsCV,
GenitalArea,
GenitalAreaCV,
FamilyHistory,
NrAffectedPersons,
CoursePsoriasis,
GeneralPsoriasis,
SemID)
VALUES
(?IdCentro,
?IdPaziente,
1,
?YearPsoriasis,
?YearFirstDiagnosis,
?YearModerate,
?Scalp,
?ScalpCV,
?Face,
?FaceCV,
?Trunk,
?TrunkCV,
?Arms,
?ArmsCV,
?Legs,
?LegsCV,
?Nails,
?NailsCV,
?Hands,
?HandsCV,
?Feet,
?FeetCV,
?BodyFolds,
?BodyFoldsCV,
?GenitalArea,
?GenitalAreaCV,
?FamilyHistory,
?NrAffectedPersons,
?CoursePsoriasis,
?GeneralPsoriasis,
?SemID);"
        UpdateCommand="UPDATE tbdermatologichistory
SET
YearPsoriasis = ?YearPsoriasis,
YearFirstDiagnosis = ?YearFirstDiagnosis,
YearModerate = ?YearModerate,
Scalp = ?Scalp,
ScalpCV = ?ScalpCV,
Face = ?Face,
FaceCV = ?FaceCV,
Trunk = ?Trunk,
TrunkCV = ?TrunkCV,
Arms = ?Arms,
ArmsCV = ?ArmsCV,
Legs = ?Legs,
LegsCV = ?LegsCV,
Nails = ?Nails,
NailsCV = ?NailsCV,
Hands = ?Hands,
HandsCV = ?HandsCV,
Feet = ?Feet,
FeetCV = ?FeetCV,
BodyFolds = ?BodyFolds,
BodyFoldsCV = ?BodyFoldsCV,
GenitalArea = ?GenitalArea,
GenitalAreaCV = ?GenitalAreaCV,
FamilyHistory = ?FamilyHistory,
NrAffectedPersons = ?NrAffectedPersons,
CoursePsoriasis = ?CoursePsoriasis,
GeneralPsoriasis = ?GeneralPsoriasis,
SemID = ?SemID
WHERE IdDermatologicHistory = ?IdDermatologicHistory">
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="YearPsoriasis" />
                <asp:Parameter Name="YearFirstDiagnosis" />
                <asp:Parameter Name="YearModerate" />
                <asp:Parameter Name="Scalp" />
                <asp:Parameter Name="ScalpCV" />
                <asp:Parameter Name="Face" />
                <asp:Parameter Name="FaceCV" />
                <asp:Parameter Name="Trunk" />
                <asp:Parameter Name="TrunkCV" />
                <asp:Parameter Name="Arms" />
                <asp:Parameter Name="ArmsCV" />
                <asp:Parameter Name="Legs" />
                <asp:Parameter Name="LegsCV" />
                <asp:Parameter Name="Nails" />
                <asp:Parameter Name="NailsCV" />
                <asp:Parameter Name="Hands" />
                <asp:Parameter Name="HandsCV" />
                <asp:Parameter Name="Feet" />
                <asp:Parameter Name="FeetCV" />
                <asp:Parameter Name="BodyFolds" />
                <asp:Parameter Name="BodyFoldsCV" />
                <asp:Parameter Name="GenitalArea" />
                <asp:Parameter Name="GenitalAreaCV" />
                <asp:Parameter Name="FamilyHistory" />
                <asp:Parameter Name="NrAffectedPersons" />
                <asp:Parameter Name="CoursePsoriasis" />
                <asp:Parameter Name="GeneralPsoriasis" />
                <asp:Parameter Name="SemID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="YearPsoriasis" />
                <asp:Parameter Name="YearFirstDiagnosis" />
                <asp:Parameter Name="YearModerate" />
                <asp:Parameter Name="Scalp" />
                <asp:Parameter Name="ScalpCV" />
                <asp:Parameter Name="Face" />
                <asp:Parameter Name="FaceCV" />
                <asp:Parameter Name="Trunk" />
                <asp:Parameter Name="TrunkCV" />
                <asp:Parameter Name="Arms" />
                <asp:Parameter Name="ArmsCV" />
                <asp:Parameter Name="Legs" />
                <asp:Parameter Name="LegsCV" />
                <asp:Parameter Name="Nails" />
                <asp:Parameter Name="NailsCV" />
                <asp:Parameter Name="Hands" />
                <asp:Parameter Name="HandsCV" />
                <asp:Parameter Name="Feet" />
                <asp:Parameter Name="FeetCV" />
                <asp:Parameter Name="BodyFolds" />
                <asp:Parameter Name="BodyFoldsCV" />
                <asp:Parameter Name="GenitalArea" />
                <asp:Parameter Name="GenitalAreaCV" />
                <asp:Parameter Name="FamilyHistory" />
                <asp:Parameter Name="NrAffectedPersons" />
                <asp:Parameter Name="CoursePsoriasis" />
                <asp:Parameter Name="GeneralPsoriasis" />
                <asp:Parameter Name="SemId" />
                <asp:Parameter Name="IdDermatologicHistory" />
            </UpdateParameters>
        </asp:SqlDataSource> 
    <asp:FormView ID="frwDermatologicHistory" style="margin-top:4px" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" VerticalAlign="Center" DataSourceID="SqlDermatologicHistory" DefaultMode="Insert" 
        onItemInserted="frwDermatologicHistory_ItemInserted" onItemUpdated="frwDermatologicHistory_ItemUpdated" HorizontalAlign="Center">
        <EditItemTemplate>
            <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
                            
            <tr><td class="TD1"><table width="100%">
            <asp:Label ID="lblAggiornamento" runat="server" Text="The data is updated correctly." Font-Size="14px" Font-Bold="True" ForeColor="#009933" Visible="false"></asp:Label><br />
                <asp:Label ID="lblWorsening" runat="server" Text="If a patient reports an adverse product-related event or special situation (as accidental or intentional overdose, lack of efficacy, medication error, occupational or accidental exposure, off-label use, drug abuse, drug misuse, or drug withdrawal, all which must be reported whether associated with an adverse event or not) during the data collection period or the healthcare professional identifies an adverse product-related event or special situation, while the patient was taking an AbbVie authorized product (Humira, Skyrizi), the information should be reported to AbbVie using the form and contact details provided in the 'Documents' area on the eCRF home page." Font-Size="14px" Font-Bold="False" ForeColor="#FF3300" Visible="false" Font-Italic="True"></asp:Label>

            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of onset of first skin manifestations related to psoriasis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="YearPsoriasis" runat="server" Text='<%# Bind("YearPsoriasis")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp;(yyyy)
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of first psoriasis diagnosis by a dermatologist:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="YearFirstDiagnosis" runat="server" Text='<%# Bind("YearFirstDiagnosis")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp;(yyyy)
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Year of diagnosis of moderate to severe plaque psoriasis:</td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="YearModerate" runat="server" Text='<%# Bind("YearModerate")%>' CssClass="textbox" MaxLength="4" Width="60px"></asp:TextBox>&nbsp;(yyyy)
                </td>
            </tr>
            
            </table>
            <table width="100%">
            <tr><td colspan="6" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Localization of clinical manifestations</td></tr>
            <tr>
                <td></td>
                <td align="center" class="TD1" style="background-color:#EAEAEA;height:25px"><b>At moderate to severe DIAGNOSIS</b></td>
                <td align="center" class="TD1"  style="background-color: #53D9FF"><b>At CURRENT visit</b></td>
                </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Scalp:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Scalp" runat="server" SelectedValue='<%# Bind("Scalp") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                    <asp:HiddenField ID="IdDermatologicHistory" runat="server" Value='<%# Bind("IdDermatologicHistory")%>' />
                    <asp:HiddenField ID="SemId" runat="server" Value='<%# Bind("SemId")%>' />
                </td>
                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="ScalpCV" runat="server" SelectedValue='<%# Bind("ScalpCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Face:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Face" runat="server" SelectedValue='<%# Bind("Face") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="FaceCV" runat="server" SelectedValue='<%# Bind("FaceCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Trunk:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Trunk" runat="server" SelectedValue='<%# Bind("Trunk") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>

                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="TrunkCV" runat="server" SelectedValue='<%# Bind("TrunkCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Arms:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Arms" runat="server" SelectedValue='<%# Bind("Arms") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>

                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="ArmsCV" runat="server" SelectedValue='<%# Bind("ArmsCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Legs:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Legs" runat="server" SelectedValue='<%# Bind("Legs") %>' RepeatDirection="Horizontal" CellPadding="1"
                       >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>

                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="LegsCV" runat="server" SelectedValue='<%# Bind("LegsCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Nails:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Nails" runat="server" SelectedValue='<%# Bind("Nails") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>

                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="NailsCV" runat="server" SelectedValue='<%# Bind("NailsCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Hands:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Hands" runat="server" SelectedValue='<%# Bind("Hands") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>

                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="HandsCV" runat="server" SelectedValue='<%# Bind("HandsCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Feet:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="Feet" runat="server" SelectedValue='<%# Bind("Feet") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
               
                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="FeetCV" runat="server" SelectedValue='<%# Bind("FeetCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Body Folds (inverse psoriasis):</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="BodyFolds" runat="server" SelectedValue='<%# Bind("BodyFolds") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
               
                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="BodyFoldsCV" runat="server" SelectedValue='<%# Bind("BodyFoldsCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Genital area:</td>
                <td align="center" class="TD1">
                    <asp:RadioButtonList ID="GenitalArea" runat="server" SelectedValue='<%# Bind("GenitalArea") %>' RepeatDirection="Horizontal" CellPadding="1"
                        >
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
               
                <td align="center" class="TD1" style="background-color: #DFF8FF">
                    <asp:RadioButtonList ID="GenitalAreaCV" runat="server" SelectedValue='<%# Bind("GenitalAreaCV") %>' RepeatDirection="Horizontal" CellPadding="1">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="Unknown" Value="3"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Family history of psoriasis:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:RadioButtonList ID="FamilyHistory" runat="server" SelectedValue='<%# Bind("FamilyHistory") %>' RepeatDirection="Horizontal" CellPadding="1" 
                        onclick="javascript:abilitareFamily()">
                       <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                       <asp:ListItem Text="No" Value="2"></asp:ListItem>
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right" class="TD1">If <b>Yes</b>, No. of affected persons:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:TextBox ID="NrAffectedPersons" runat="server" Text='<%# Bind("NrAffectedPersons")%>' CssClass="textbox" MaxLength="1" Width="60px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Course of psoriasis over the past year:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:RadioButtonList ID="CoursePsoriasis" runat="server" SelectedValue='<%# Bind("CoursePsoriasis") %>' RepeatDirection="Vertical" CellPadding="1">
                        <asp:ListItem Text="Stable" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Alternating improvement and worsening" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Improvement with therapy" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Improvement without therapy" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Worsening" Value="5"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc">General course of psoriasis since<br />onset of moderate/severe form:</td>
                <td align="left" class="TD1" colspan="2">
                    <asp:RadioButtonList ID="GeneralPsoriasis" runat="server" SelectedValue='<%# Bind("GeneralPsoriasis") %>' RepeatDirection="Vertical" CellPadding="1">
                        <asp:ListItem Text="Stable" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Alternating improvement and worsening" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Improvement with therapy" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Improvement without therapy" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Worsening" Value="5"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
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
                <asp:RequiredFieldValidator ControlToValidate="YearPsoriasis" ID="RequiredFieldValidator7" runat="server" ErrorMessage="The field <b>Year of onset of first skin manifestations related to psoriasis</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="YearFirstDiagnosis" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Year of first diagnosis by a dermatologist</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="YearModerate" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Year of diagnosis of moderate to severe plaque psoriasis</b> is required" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Scalp" runat="server" ErrorMessage="The field <b>Scalp - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ScalpCV" runat="server" ErrorMessage="The field <b>Scalp - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Face" runat="server" ErrorMessage="The field <b>Face - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="FaceCV" runat="server" ErrorMessage="The field <b>Face - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="Trunk" runat="server" ErrorMessage="The field <b>Trunk - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TrunkCV" runat="server" ErrorMessage="The field <b>Trunk - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="Arms" runat="server" ErrorMessage="The field <b>Arms - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ArmsCV" runat="server" ErrorMessage="The field <b>Arms - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="Legs" runat="server" ErrorMessage="The field <b>Legs - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="LegsCV" runat="server" ErrorMessage="The field <b>Legs - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="Nails" runat="server" ErrorMessage="The field <b>Nails - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="NailsCV" runat="server" ErrorMessage="The field <b>Nails - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="Hands" runat="server" ErrorMessage="The field <b>Hands - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="HandsCV" runat="server" ErrorMessage="The field <b>Hands - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="Feet" runat="server" ErrorMessage="The field <b>Feet - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="FeetCV" runat="server" ErrorMessage="The field <b>Feet - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="BodyFolds" runat="server" ErrorMessage="The field <b>Body Folds - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="BodyFoldsCV" runat="server" ErrorMessage="The field <b>Body Folds - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="GenitalArea" runat="server" ErrorMessage="The field <b>Genital Area - At moderate to severe diagnosis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="GenitalAreaCV" runat="server" ErrorMessage="The field <b>Genital Area - At current visit</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="FamilyHistory" runat="server" ErrorMessage="The field <b>Family history of psoriasis</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ControlToValidate="CoursePsoriasis" runat="server" ErrorMessage="The field <b>Course of psoriasis over the past year</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="GeneralPsoriasis" runat="server" ErrorMessage="The field <b>General course of psoriasis since onset of moderate/severe form</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="YearPsoriasis" runat="server" ErrorMessage="The field <b>Year of onset of first skin manifestations related to psoriasis</b> it cannot be after the current year or is wrong!" MaximumValue='<%# DateTime.Today.Year%>' MinimumValue='1901' Display="None" Type="Integer"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator2" ControlToValidate="YearFirstDiagnosis" runat="server" ErrorMessage="The field <b>Year of first diagnosis by a dermatologist</b> it cannot be after the current year or is wrong!" MaximumValue='<%# DateTime.Today.Year%>' MinimumValue='1901' Display="None" Type="Integer"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator3" ControlToValidate="YearModerate" runat="server" ErrorMessage="The years from the diagnosis of moderate to severe must be at least 10!" MaximumValue='<%# DateTime.Today.Year-10%>' MinimumValue='1901' Display="None" Type="Integer"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToCompare="YearPsoriasis" ControlToValidate="YearFirstDiagnosis" runat="server" ErrorMessage="The field <b>Year of onset of first skin manifestations related to psoriasis</b> must not be later than the <b>Year of first diagnosis by a dermatologist</b>." Operator="GreaterThanEqual" Type="Integer" Display="None"></asp:CompareValidator>
                <asp:CompareValidator ID="CompareValidator2" ControlToCompare="YearFirstDiagnosis" ControlToValidate="YearModerate" runat="server" ErrorMessage="The field <b>Year of first diagnosis by a dermatologist</b> must not be later than the <b>Year of diagnosis of moderate to severe plaque psoriasis</b>." Operator="GreaterThanEqual" Type="Integer" Display="None"></asp:CompareValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="YearPsoriasis" OnServerValidate="ControllaDiagnosisDate" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
            </table></td></tr>
            </table>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
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
    var s = "Scalp,Face,Ischemic,Hyperlipidemia,Anxiety,Malignancy,Obesity,PsoriaticArthritis,OtherPathology";
    var campi = new Array();
    campi = s.split(',');
    for (i = 0; i < campi.length; i++) {
        //abilitareComorbidities(campi[i]);
    }
    function abilitareComorbidities(campo) {
        
    }
    abilitareFamily();
    function abilitareFamily() {
        var opt = document.getElementById("frwDermatologicHistory_FamilyHistory_0");
        var txt = document.getElementById("frwDermatologicHistory_NrAffectedPersons");
        txt.disabled = !opt.checked;
        if (!opt.checked) {
            txt.value = "";
            txt.style.backgroundColor = "#dcdcdc";
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }

    }
    $("#frwDermatologicHistory_YearPsoriasis").maskNumber({ integer: true, thousands: '' });
    $("#frwDermatologicHistory_YearFirstDiagnosis").maskNumber({ integer: true, thousands: '' });
    $("#frwDermatologicHistory_YearModerate").maskNumber({ integer: true, thousands: '' });
    $("#frwDermatologicHistory_NrAffectedPersons").maskNumber({ integer: true, thousands: '' }); 
</script>
<!-- #INCLUDE FILE="info2.aspx"-->
<!-- #INCLUDE FILE="gestioneTerapie.aspx"-->
<!-- #INCLUDE FILE="confermaDelete.aspx"-->
</form>
</body>
</html>
