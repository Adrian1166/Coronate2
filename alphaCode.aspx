<div id="divOpacityAlphaCode" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divAlphaCode" runat="server" 
        style="left: 620px; position: absolute; top: 170px;
                border: 5px solid #CCCCCC; Z-INDEX: 100010;
                width: 400px; min-height: 150px; background-color:#EFEFEF; color: #000000;font-size:14px" 
    visible="false">
    <table align="center" width="100%">
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Patient number:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblNumPaz" width="100px" ForeColor="black"></asp:label></td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Alpha Code:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblAlphaCode" width="100px" ForeColor="black"></asp:label></td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>URL:</b></td>
            <td align="left" class="TD1">
                <a href="" runat="server" id="aUrlDiretto" target="_blank">
                    <asp:label runat="server" id="lblUrlDiretto" ForeColor="black"></asp:label>
                </a>
            </td>
        </tr>
    
        <tr>
            <td align="center" colspan="2">
                <br /><br /><br />
                <asp:Button ID="CloseAlphaCode" runat="server" Text="Close" CausesValidation="false" OnClick="CloseAlphaCode_Click" Width="75px" CssClass="button" />
            
        </td></tr></table>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecAlphaCode"]%>","divOpacityAlphaCode");
</script>