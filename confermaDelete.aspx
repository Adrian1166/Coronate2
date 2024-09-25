<div id="divOpacityConferma" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divConferma" runat="server" 
        style="left: 620px; position: absolute; top: 170px;
                border: 3px solid #4AA5FF; Z-INDEX: 100010;
                width: 350px; min-height: 150px; background-color:#003F7D; color: #FFFFFF;" 
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;background-image: url(../images/puntoInterr1.png); background-repeat: no-repeat; width: 48px; height: 48px;" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:small;top:10px; position: absolute;left:75px;width:270px">
    <asp:label runat="server" id="lblMsg" width="270px" ForeColor="White"></asp:label></div>
    <br />   
    <div style="position:absolute;bottom:5px;text-align:center;left:0px">
    <table align="center" width="350px"><tr>
    <td align="center">
    <asp:Button ID="ConfermaCanc" runat="server" Text="Yes" CausesValidation="false" OnClick="ConfermaCanc_Click" Width="75px" CssClass="button" />&nbsp;<asp:Button ID="ConfermaNonCanc" runat="server" CausesValidation="false" Text="No" CssClass="button" OnClick="ConfermaNonCanc_Click" Width="75px" />
    </td></tr></table></div>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRec"]%>","divOpacityConferma");
</script>