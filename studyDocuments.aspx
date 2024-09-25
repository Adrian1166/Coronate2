<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studyDocuments.aspx.cs" Inherits="studyDocuments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%Response.Write(Session["TitoloPrg"].ToString());%></title>
    <link href="css/style_pagina.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form2" runat="server">
<!--#INCLUDE FILE="testa.aspx"-->
 <div class="contenuto">
    <div id="navigazione">
        <ul>
            <li>You are in:</li>
             <%if (Session["LIVELLOID"].ToString() == "2" || (Session["LIVELLOID"].ToString()=="1" && Session["NewLIVELLOID"].ToString()=="2"))
                    { %>
            <li>
                <a href="ssl/elencoCentri.aspx">
                    <span>Center list</span>
                </a>/
            </li>
            <%} %>
            <li>
                <a href="ssl/elencoPazienti.aspx">
                    <span>Patient list</span>
                </a>/
            </li>
            <li><span>Documents&hellip;</span></li>
        </ul>
    </div>

    <div class="titolo"><div class="fontTitolo">Documents</div></div><br />
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="70%">
            <tr><td colspan="2" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Manuali utente</td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/Coronate manuale utente del 23-01-2020.pdf" target="_blank">Coronate manuale utente del 23-01-2020</a><br /><br />
            </td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/Coronate manuale_iPAD_v2.0 del 23gen20_finale.pdf" target="_blank">Coronate manuale_iPAD_v2.0 del 23 gen 2020 finale</a><br /><br />
            </td></tr>
            <tr><td colspan="2" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Protocollo e contatti</td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/Coronate-protocol_28AUG2019 final.pdf" target="_blank">Coronate protocol 28 AUG 2019 final</a><br /><br />
            </td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/ELENCO CONTATTI STUDIO Coronate.pdf" target="_blank">ELENCO CONTATTI STUDIO Coronate</a><br /><br />
            </td></tr>
            <tr><td colspan="2" class="TD1" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px" align="left">&nbsp;Questionari</td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/CLL16 Italian 1.1.pdf" target="_blank">CLL16 Italian 1.1</a><br /><br />
            </td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/EQ-5D-5L v1.0_Italian.pdf" target="_blank">EQ-5D-5L v 1.0 Italian</a><br /><br />
            </td></tr>
            <tr>
                <td colspan="2" align="left">    
                    <a href="document/QLQ-C30 Italian 2.1.pdf" target="_blank">QLQ-C30 Italian 2.1</a><br /><br />
            </td></tr>
            
            <tr>
                <td align="center" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px">    
                    <b>DCE Naive</b>
                </td>
                <td align="center" style="background-color:#005570; color: #FFFFFF; font-weight: bold;height:20px">    
                    <b>DCE Treated</b>
            </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_01.pdf" target="_blank">N01</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_01.pdf" target="_blank">T01</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_02.pdf" target="_blank">N02</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_02.pdf" target="_blank">T02</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_03.pdf" target="_blank">N03</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_03.pdf" target="_blank">T03</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_04.pdf" target="_blank">N04</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_04.pdf" target="_blank">T04</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_05.pdf" target="_blank">N05</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_05.pdf" target="_blank">T05</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_06.pdf" target="_blank">N06</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_06.pdf" target="_blank">T06</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_07.pdf" target="_blank">N07</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_07.pdf" target="_blank">T07</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_08.pdf" target="_blank">N08</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_08.pdf" target="_blank">T08</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_09.pdf" target="_blank">N09</a><br /><br />
                </td>
                <td>    
                    <a href="document/DCE_Treated_pdf/DCE_Treated_09.pdf" target="_blank">T09</a><br /><br />
                </td>
            </tr>
            <tr>
                <td>    
                    <a href="document/DCE_Naive_pdf/DCE_Naive_10.pdf" target="_blank">N10</a><br /><br />
                </td>
                <td>    
                    &nbsp;<br />
                </td>
            </tr>
            
    </table><br /><br />
    </div><br /><br />
 
    </form>
</body>
</html>
