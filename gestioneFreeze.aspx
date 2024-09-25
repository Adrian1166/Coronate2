<div id="divOpacityFreeze" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divGestioneFreeze" runat="server" visible="false" class="boxGestioneLock">
    <div class="titoloPag"><b>Management Freeze</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton100" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxFreeze" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
        <br />

        <table align="center" width="80%">
        <tr bgcolor="#66CCFF" >
            <td class="TD1" align="left" style="width:25%"><b>Patient N*.:</b></td>
            <td align="left" class="TD1" style="width:25%"><%Response.Write(Session["NumPaz"].ToString());%></td>
        </tr>
        <tr><td>&nbsp;<asp:HiddenField runat="server" id="TotForm" /></td></tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Repeater ID="rptTipVisF" runat="server" DataSourceID="SqlTIPVISF" >
                    <HeaderTemplate>
                        <table align="center" width="100%" cellspacing="0" cellpadding="0">
                            <tr >
                                <td class="TD1" align="center" style="width:55%; color: #FFFFFF;height:22px; background-color: #666666;"><b>Form</b></td>
                                <td class="TD1" align="center" style="width:15%; color: #FFFFFF;background-color: #666666;"><b>Freeze</b></td>
                            </tr>
                            <tr>
                                <td class="TD1" align="right"style="width:55%;height:20px">
                                
                                <b>Select/deselect all forms:&nbsp;</b>
                                </td>
                                <td class="TD1" align="center" style="width:15%">
                                    &nbsp;<asp:CheckBox ID="chkFreeze" runat="server" onclick="javascript:abilitareFreeze(this.id)" />&nbsp;
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="TD1" align="left" style="width:55%; height:22px"><asp:HiddenField ID="FORMID" runat="server" Value='<%# Eval("FORMID")%>' />&nbsp;<%# Eval("DESC")%></td>
                            <td class="TD1" align="center" style="width:15%;">
                                <asp:CheckBox ID="chkFreezeForm" runat="server" Visible='<%# Eval("SEMID").ToString()!="2" && Eval("SEMID").ToString()!="0" && Eval("SEMID").ToString()!="3"%>' Checked='<%# Convert.ToBoolean(Eval("SEMID").ToString()=="5" || Eval("SEMID").ToString()=="6") %>' 
                                    Enabled='<%# Session["LIVELLOID"].ToString() == "2" ? Convert.ToBoolean(Eval("SEMID").ToString()=="5") : (Convert.ToBoolean(Eval("SEMID").ToString()!="5") && Convert.ToBoolean(Eval("SEMID").ToString()!="6"))%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            <tr>
                                <td colspan="4" align="center"><asp:Button ID="btnSaveFreeze" runat="server" Text="Save" CssClass="button" OnClick="btnSaveFreeze_OnClick"  CausesValidation="false" /></td>
                            </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
     </table><br /><br />
    </div>
</div>
 <asp:SqlDataSource ID="SqlTIPVISF" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
    SelectCommand="" OnSelected="SqlTIPVISF_OnSelected" ></asp:SqlDataSource>
<script type="text/javascript">
    show_overDiv("<%=Session["GestioneFreeze"]%>","divOpacityFreeze");
</script>
<script language="javascript">
    
    function abilitareFreeze(campo)
    {
        var TotForm = document.getElementById("TotForm");
        var chkTot = document.getElementById(campo);
        for (i = 0; i < TotForm.value; i++) {

            try {
                var chk = document.getElementById("rptTipVisF_chkFreezeForm_" + i);
                if (chk.disabled == false) chk.checked = chkTot.checked;

            } catch (e) {
            }
        }
    }
</script>