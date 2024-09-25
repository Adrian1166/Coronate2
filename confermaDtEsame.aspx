<div id="divOpacity" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divConfermaDtEsame" runat="server" 
        style="left: 600px; position: absolute; top: 170px;
                border: 3px solid #4AA5FF; Z-INDEX: 100002;
                width: 370px; min-height: 150px; background-color:#003F7D; color: #FFFFFF;" 
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;background-image: url(../../images/imgalert.png); background-repeat: no-repeat; width: 48px; height: 48px;" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:small;top:10px; position: absolute;left:75px;width:270px">
    <asp:label runat="server" id="lblMsgDtEsame" width="290px"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:5px;text-align:center;left:0px">
    <table align="center" width="350px"><tr>
    <td align="center">
    <asp:Button ID="ConfermaDtEsame" runat="server" Text="Si" CausesValidation="false" OnClick="ConfermaDtEsame_Click" Width="85px" CssClass="button" />&nbsp;<asp:Button ID="ConfermaNonDtEsame" runat="server" CausesValidation="false" Text="Annulla" CssClass="button" OnClick="ConfermaNonDtEsame_Click" Width="85px" />
    </td></tr>
    <tr><td>Se Si, commento.</td></tr></table></div>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["ConfermaDtEsame"]%>","divOpacity");
</script>