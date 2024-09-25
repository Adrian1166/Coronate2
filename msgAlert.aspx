  <div id="divOpacityAlert" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divConfermaAlert" runat="server" 
        style="position: absolute; top: 170px;text-align:center;float:inherit;
                border: 3px solid #4AA5FF; Z-INDEX: 100002;
                width: 370px; min-height: 150px; background-color:#003F7D; color: #FFFFFF;"  
    visible="false">
    <div style="text-align:center;font-family:Verdana;font-size:small;top:10px; position: absolute;width:370px">
    <asp:label runat="server" id="lblAlert" width="250px" ForeColor="White"></asp:label></div>
    <br />
    <div style="position:absolute;bottom:5px;text-align:center;left:0px">
    <table align="center" width="370px"><tr>
    <td align="center"><asp:Button ID="ConfermaCancAlert" runat="server" Text="Close" CausesValidation="false" OnClick="CloseDiv_Click" usesubmitbehavior="true"
 Width="85px" CssClass="button" />
    </td></tr></table>
</div></div>
<script type="text/javascript">
    show_overDiv("<%=Session["alertRec"]%>","divOpacityAlert");
</script>
