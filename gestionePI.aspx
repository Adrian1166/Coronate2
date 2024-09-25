<div id="divOpacityFreeze" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divGestioneFreeze" runat="server" visible="false" class="boxGestioneLock">
    <div class="titoloPag"><b>PI Signature</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton100" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxFreeze" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
        <br />

        <table align="center" width="80%">
        <tr><td  colspan="4" align="center" style="font-size:14px; color:Red"><b>By signing this form I confirm that all data entered in this CRF are complete, accurate and consistent with clinical chart and other source documents.</b></td></tr>
        <tr><td>&nbsp;<asp:HiddenField runat="server" id="TotForm" /></td></tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Repeater ID="rptTipVisF" runat="server" DataSourceID="SqlTIPVISF" >
                    <HeaderTemplate>
                        <table align="center" width="100%" cellspacing="0" cellpadding="0">
                            <tr >
                                <td class="TD1" align="center" style="width:55%; color: #FFFFFF;height:22px; background-color: #666666;"><b>Patient number</b></td>
                                <td class="TD1" align="center" style="width:15%; color: #FFFFFF;background-color: #666666;"><b>Signature</b></td>
                            </tr>
                            <tr>
                                <td class="TD1" align="right"style="width:55%;height:20px">
                                
                                <b>Select/deselect all patients:&nbsp;</b>
                                </td>
                                <td class="TD1" align="center" style="width:15%">
                                    &nbsp;<asp:CheckBox ID="chkFreeze" runat="server" onclick="javascript:abilitareFreeze(this.id)" />&nbsp;
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="TD1" align="left" style="width:55%; height:22px"><asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Eval("IdPaziente")%>' />&nbsp;<%# Eval("NumPaz").ToString()%></td>
                            <td class="TD1" align="center" style="width:15%;">
                                <asp:CheckBox ID="chkFreezeForm" runat="server" Visible='<%# Eval("SEMID").ToString()=="6"%>' Checked='<%# Convert.ToBoolean(Eval("DatiConfermati").ToString()=="1") %>'  />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            <tr>
                                <td align="left" class="TD1"><b>Username of Principal investigator:</b>&nbsp;</td>
                                <td align="left" class="TD1"><asp:TextBox ID="UserName" runat="server" CssClass="textbox" width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="left" class="TD1"><b>Password of Principal investigator:</b>&nbsp;</td>
                                <td align="left" class="TD1"><asp:TextBox ID="PSWPI" runat="server" CssClass="textbox" width="200px" TextMode="Password" onkeypress="javascript: return (event.keyCode!=13)"></asp:TextBox></td>
                            </tr>
                            <tr><td align="left"  colspan="2">
                                <asp:RequiredFieldValidator ControlToValidate="UserName" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Username of Principal investigato</b> is required." Display="None"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="PSWPI" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field <b>Password of Principal investigator</b> is required." Display="None"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cvdEsitePsw" runat="server" ErrorMessage="<b>Username</b> o <b>Password</b>  is wrong/a." ControlToValidate="PSWPI" Display="None" OnServerValidate="PSWPI_OnServerValidate"></asp:CustomValidator>
                                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server"
                                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:Button ID="btnSaveFreeze" runat="server" Text="Save" CssClass="button" OnClick="btnSaveFreeze_OnClick" TabIndex="0" /></td>
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
        var TotForm=document.getElementById("TotForm");
        var chkTot=document.getElementById(campo);
        for (i=1;i<=TotForm.value;i++)
        {
            try
            {
                if (i>9)
                {
                    var chk=document.getElementById("rptTipVisF_ctl"+i+"_chkFreezeForm");
                }
                else
                {
                    var chk=document.getElementById("rptTipVisF_ctl0"+i+"_chkFreezeForm");
                }
                if (chk.disabled==false) chk.checked=chkTot.checked ;
            }catch(e) {
            }
        }
    }


</script>