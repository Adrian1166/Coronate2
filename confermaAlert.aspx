 
<div id="divVissAlert" runat="server" 
        style="left: 350px; position: absolute; top: 170px;
                border: 3px solid #4AA5FF; Z-INDEX: 100002;
                width: 370px; min-height: 150px; background-color:#003F7D; color: #FFFFFF;"  
    visible="false">
    <div style="left: 10px; position: absolute; top: 10px; 
                 Z-INDEX: 111;
                width: 48px; height: 48px; 
                background-image: url(../../images/puntoInterr1.png);" > </div>
    <div style="text-align:left;font-family:Verdana;font-size:small;top:10px; position: absolute;left:75px;width:270px">
    <asp:label runat="server" id="lblTextAlert" width="270px"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:5px;text-align:center;left:0px">
    <table align="center" width="370px"><tr>
    <td align="center"><asp:Button ID="ConfermaAlertSi" runat="server" Text="Si" CausesValidation="false" OnClick="ConfermaAlertSi_Click" Width="85px" CssClass="button" />&nbsp;<asp:Button ID="ConfermaAlertNo" runat="server" CausesValidation="false" Text="No" CssClass="button" OnClick="ConfermaAlertNo_Click" Width="85px" />
    </td></tr></table></div>
</div>
