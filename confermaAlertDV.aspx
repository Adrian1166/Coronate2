<div id="divOpacity" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divConfermaQuery" runat="server" 
        style="left: 350px; position: absolute; top: 170px;
                border: 3px solid #4AA5FF; Z-INDEX: 100002;
                width: 370px; min-height: 150px; background-color:#003F7D; color: #FFFFFF;height:auto"  
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;
                width: 48px; height: 48px; 
                background-image: url(../../images/imgAlert.png);" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:11px;top:10px; position: absolute;left:75px;width:270px;height:auto">
    <asp:label runat="server" id="lblMsgQuery" width="270px"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:5px;text-align:center;left:0px">
    <table align="center" width="370px"><tr>
    <td align="center"><asp:Button ID="ConfermaCancQuery" runat="server" Text="Si" CausesValidation="false" OnClick="ConfermaCancQuery_Click" Width="85px" CssClass="button" />&nbsp;<asp:Button ID="ConfermaNonCancQuery" runat="server" CausesValidation="false" Text="No" CssClass="button" OnClick="ConfermaNonCancQuery_Click" Width="85px" />
    </td></tr></table></div>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecQuery"]%>","divOpacity");
</script>