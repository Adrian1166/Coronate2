<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePsw.aspx.cs" Inherits="changePsw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coronate</title>
    <link href="css/style_pagina.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <div id="headerHome">
        <div class="logoleft"></div><div class="logocenter"></div><div class="logoright"></div><div id="titoloStudio"><strong class="strongtitolo2">Studio Coronate</strong></div>
        <br /><div class="versione">CRF versione 1.0 del 31-05-2019</div>
    </div>
    </td></tr>
    <tr><td align="center">

    <div class="contenuto">
    <table align="center" style="margin-top:50px"><tr><td>
    <div class="group">
        <table align="center" width="80%">
            <tr><td colspan="2"><h2>Cambia la password</h2></td></tr>
            <tr>
                <td align="right" style="font-size:15px">Utente:</td>
                <td align="left"><b><% Response.Write(Request["Utente"].ToString());%></b></td>
            </tr>
            <tr>
                <td align="right" style="font-size:15px">Nuova password:</td>
                <td align="left"><asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" Width="120px" CssClass="textbox" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" style="font-size:15px">Conferma nuova password:</td>
                <td align="left"><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" Width="120px" CssClass="textbox" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button onclick="btnSave_Click" ID="btnSave" CssClass="button" runat="server" Text="Salva" Width="70px" />
                    <asp:Button ID="LinkButton1" CssClass="button" runat="server" Text="Indietro" Width="70px" onclick="Ritorna" CausesValidation="false" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txtPassword1" runat="server" ErrorMessage="The field <b>Nuova password</b> is required"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" ControlToValidate="txtPassword2" runat="server" ErrorMessage="The field <b>Conferma nuova password</b> is required"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<b>WARNING</b>:<br/>The field <b>Nuova password</b> è diverso da <b>Conferma nuova password</b>" ControlToValidate="txtPassword1" ControlToCompare="txtPassword2" Display="None" ></asp:CompareValidator>
                    <asp:CustomValidator ID="cvdLungPsw" runat="server" ErrorMessage="<b>WARNING</b>:<br/>La <b>Nuova password</b> deve contenere almeno 10 caratteri, una lettera maiuscola, un numero e un carattere speciale." ControlToValidate="txtPassword1" Display="None"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvdEsitePsw" runat="server" ErrorMessage="<b>WARNING</b>:<br/>La <b>Nuova password</b> già esiste." ControlToValidate="txtPassword1" Display="None"></asp:CustomValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" />
                    <div id="divMsg" runat="server" style="color:Red" visible="false">WARNING: <b>Utente</b> o <b>Password</b>  is wrong.</div>
                </td>
            </tr>
        </table>
        </div></td></tr></table>
    </div></td></tr></table>
    <asp:SqlDataSource ID="SqlPsw" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
       ></asp:SqlDataSource>
    </form>
</body>
</html>
