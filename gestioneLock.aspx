<div id="divOpacityLock" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divGestioneLock" runat="server" visible="false" class="boxGestioneLock">
    <div class="titoloPag"><b>Management Lock</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxLock" /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
        <br />

        <table align="center" width="90%">
        <tr bgcolor="#66CCFF" >
            <td class="TD1" align="left" style="width:25%"><b>Patient N*:</b></td>
            <td align="left" class="TD1" style="width:25%"><%Response.Write(Session["NumPaz"].ToString());%></td>
        </tr>
        <tr><td>&nbsp;<asp:HiddenField runat="server" id="TotFormGL" /></td></tr>
        <tr>
            <td colspan="4">
                <asp:Repeater ID="rptTipVis" runat="server" DataSourceID="SqlTIPVIS" >
                    <HeaderTemplate>
                        <table align="center" width="100%" cellspacing="0" cellpadding="0">
                            <tr bgcolor="Gray">
                                <td class="TD1" style="width:55%; color: #FFFFFF;height:22px;background-color: #666666;"><b>Form</b></td>
                                <td class="TD1" style="width:15%; color: #FFFFFF;background-color: #666666;"><b>Status</b></td>
                                <td class="TD1" style="width:15%; color: #FFFFFF;background-color: #666666;"><b>Lock</b></td>
                            </tr>
                            <tr>
                            <td class="TD1" align="right" colspan="2" style="width:55%;height:20px">
                            <b>Select / deselect all forms:&nbsp;</b>
                            <asp:Label ID="IDTIPVIS" runat="server" Text='<%# Eval("TIPVISID")%>' Visible="false"></asp:Label>
                            </td>
                            
                            <td class="TD1" style="width:15%">
                                <asp:CheckBox ID="chkLock" runat="server" onclick="javascript:abilitareLock(this.id);" />
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="TD1" align="left" style="width:55%;"><asp:HiddenField ID="FORMID" runat="server" Value='<%# Eval("FORMID")%>' />&nbsp;<%# Eval("DESC")%></td>
                            <td class="TD1" align="center" style="width:15%; height:22px"><asp:Image ID="imgSem" runat="server" ImageUrl='<%#"~/images/"+Eval("newSem") %>'  /></td>
                            
                            <td class="TD1" align="center" style="width:15%">
                            <asp:Label runat="server" Visible="false" ID="IdForm" Text='<%# Eval("FORMID")%>'></asp:Label>
                            <asp:CheckBox ID="chkLockForm" runat="server" Checked='<%# Convert.ToBoolean(Eval("sLock").ToString()=="1") %>' Visible='<%# Eval("SEMID").ToString()=="5" || Eval("SEMID").ToString()=="6"%>' 
                                onclick="javascript:abilitareLockSDV(this.id)" /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                         <tr>
                            <td colspan="4" align="center"><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button" OnClick="btnSaveLock_OnClick" CausesValidation="false" /></td>
                        </tr>
                        </table>
                    </FooterTemplate>
    </asp:Repeater>
            </td>
        </tr>
     </table>
    </div>

 <asp:SqlDataSource ID="SqlTIPVIS" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
    ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
    SelectCommand=""  OnSelected="SqlTIPVIS_OnSelected"></asp:SqlDataSource>
<script type="text/javascript">
    show_overDiv("<%=Session["GestioneLock"]%>","divOpacityLock");
</script>

<script language="javascript">
    var TotFormGL = document.getElementById("TotFormGL");

    for (i = 0; i < TotFormGL.value; i++) {
        try {
            campo1 = "rptTipVis_chkLockForm_" + i;

            //abilitareLockSDV(campo1.replace('chkSDV','chkLockForm'));
            //abilitareLock(campo1);

        } catch (e) {
        }
    }
    
    function abilitareSDV(campo)
    {
        var chkTot=document.getElementById(campo);
        for (i=1;i<=TotFormGL.value;i++)
        {
            try
            {
                if (i>9)
                {
                    var chk=document.getElementById("rptTipVis_ctl"+i+"_chkSDV");
                    campo1="rptTipVis_ctl"+i+"_chkSDV";
                }
                else
                {
                    var chk=document.getElementById("rptTipVis_ctl0"+i+"_chkSDV");
                    campo1="rptTipVis_ctl0"+i+"_chkSDV";
                }
                if (chk.disabled==false) chk.checked=chkTot.checked ;
                abilitareSDVLock(campo1);
            }catch(e) {
            }
        }
    }
    
    function abilitareLock(campo)
    {
        var TotFormGL=document.getElementById("TotFormGL");
        var chkTot=document.getElementById(campo);
        for (i = 0; i < TotFormGL.value; i++) {
            try {
                var chk = document.getElementById("rptTipVis_chkLockForm_" + i);
                if (chk.disabled == false) chk.checked = chkTot.checked;
            } catch (e) {
            }
        }
    }
    
    function abilitareLockSDV(campo)
    {
        var chkLock=document.getElementById(campo);
        var campo1=campo.replace('chkLockForm','chkSDV');
        var chkSDV=document.getElementById(campo1);
        chkSDV.disabled=chkLock.checked;
    }
    
    function abilitareSDVLock(campo)
    {
        var chkSDV=document.getElementById(campo);
        var campo1=campo.replace('chkSDV','chkLockForm');
        var chkLock=document.getElementById(campo1);
        //chkLock.disabled=!chkSDV.checked;
        if (chkSDV.checked==false)
        {
            //chkLock.checked=false;
        }
    }
</script>
</div>