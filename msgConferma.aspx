    
<div id="divConfermaCont" runat="server" 
        style="left: 300px; position: absolute; top: 170px; 
                border: darkgray solid; Z-INDEX: 100000;
                width: 350px; height: 160px;background-color:#D6EFFF" 
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;
                width: 59px; height: 61px; 
                background-image: url(../../images/sign_alert.gif);" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:small;top:10px; position: absolute;left:75px;width:250px"><asp:label runat="server" id="lblAlertContinua" width="250px"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:15px;left:140px;"><asp:Button ID="btnConferma" runat="server" Text="Continua" CausesValidation="false" OnClick="btnConferma_Click" Width="85px" CssClass="button" />
    <asp:Button ID="btnAnnullaConferma" runat="server" Text="Annulla" CausesValidation="false" OnClick="btnAnnullaConferma_Click" Width="85px" CssClass="button" /></div>
</div>

 
