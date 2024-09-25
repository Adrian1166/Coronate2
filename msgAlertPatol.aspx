<div id="divOpacity2P" class="div_trasparenza" visible="false" style="visibility:hidden;height:100%">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divConfermaAlertPatol" runat="server" 
        style="left: 620px; position: absolute; top: 170px;
                border: 3px solid #4AA5FF; Z-INDEX: 100010;
                width: 500px; min-height: 250px; background-color:#003F7D; color: #FFFFFF;" 
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;background-image: url(../images/imgalert.png); background-repeat: no-repeat; width: 48px; height: 48px;" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:small;top:10px; position: absolute;left:75px;width:250px">
        <asp:label runat="server" id="lblAlertPatol" width="400px"  ForeColor="White"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:15px;left:210px;"><asp:Button ID="CancAlertPatol" runat="server" Text="OK" CausesValidation="false" OnClick="CloseDivPatol_Click" Width="85px" CssClass="button" /></div>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["alertRecPatol"]%>","divOpacity2P");
</script>

