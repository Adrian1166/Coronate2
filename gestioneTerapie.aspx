<div id="divOpacityTreatment" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divTreatment" runat="server" visible="false" class="boxPatologConc">
    <div class="titoloPag"><b>Previous treatment for Pso</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton_1" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxTer" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
            <asp:SqlDataSource ID="SqlTreatment" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlTreatment_OnSelected" SelectCommand=""
                InsertCommand="INSERT INTO tbtreatment
(IdCentro,
IdPaziente,
IdTipVis,
IdTreatmentPso,
OtherTreatmentPso,
StartDateMM,
StartDateYY,
EndDateMM,
EndDateYY,
IdResponseTherapy,
IdReasonDiscontinuation,
OtherReason,
SemID)
VALUES
(?IdCentro,
?IdPaziente,
1,
?IdTreatmentPso,
?OtherTreatmentPso,
?StartDateMM,
?StartDateYY,
?EndDateMM,
?EndDateYY,
?IdResponseTherapy,
?IdReasonDiscontinuation,
?OtherReason,
?SemID);"
                UpdateCommand="UPDATE tbtreatment
SET
IdTreatmentPso = ?IdTreatmentPso,
OtherTreatmentPso = ?OtherTreatmentPso,
StartDateMM = ?StartDateMM,
StartDateYY = ?StartDateYY,
EndDateMM = ?EndDateMM,
EndDateYY = ?EndDateYY,
IdResponseTherapy = ?IdResponseTherapy,
IdReasonDiscontinuation = ?IdReasonDiscontinuation,
OtherReason = ?OtherReason,
SemID = ?SemID
WHERE IdTreatment = ?IdTreatment">
                <InsertParameters>
                    <asp:Parameter Name="IdCentro" />
                    <asp:Parameter Name="IdPaziente" />
                    <asp:Parameter Name="IdTipVis" />
                    <asp:Parameter Name="IdTreatmentPso" />
                    <asp:Parameter Name="OtherTreatmentPso" />
                    <asp:Parameter Name="StartDateMM" />
                    <asp:Parameter Name="StartDateYY" />
                    <asp:Parameter Name="EndDateMM" />
                    <asp:Parameter Name="EndDateYY" />
                    <asp:Parameter Name="IdResponseTherapy" />
                    <asp:Parameter Name="IdReasonDiscontinuation" />
                    <asp:Parameter Name="OtherReason" />
                    <asp:Parameter Name="SemID" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IdTreatmentPso" />
                    <asp:Parameter Name="OtherTreatmentPso" />
                    <asp:Parameter Name="StartDateMM" />
                    <asp:Parameter Name="StartDateYY" />
                    <asp:Parameter Name="EndDateMM" />
                    <asp:Parameter Name="EndDateYY" />
                    <asp:Parameter Name="IdResponseTherapy" />
                    <asp:Parameter Name="IdReasonDiscontinuation" />
                    <asp:Parameter Name="OtherReason" />
                    <asp:Parameter Name="SemID" />
                    <asp:Parameter Name="IdTreatment" />
                </UpdateParameters>
            </asp:SqlDataSource> 
            <asp:FormView ID="frwTreatment" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlTreatment" DefaultMode="Insert" 
                onItemInserted="frwTreatment_ItemInserted" onItemUpdated="frwTreatment_ItemUpdated" DataKeyNames="IdTreatment">
                <EditItemTemplate>
                    <table width="100%" cellpadding="1" cellspacing="1" style="margin-top:10px">
                        <tr>
                            <td align="left" class="TD1" style="background-color:#dcdcdc">Treatment:</td>
                            <td align="left" colspan="3" class="TD1" >
                                <asp:DropDownList CssClass="textbox"  ID="IdTreatmentPso" runat="server" DataSourceID="SqlTreatmentPso" DataTextField="TreatmentPso" DataValueField="IdTreatmentPso" 
                                    SelectedValue='<%# Bind("IdTreatmentPso")%>' onchange="javascript:abilitareAltro('IdTreatmentPso','OtherTreatmentPso')">
                                </asp:DropDownList>
                                <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' ></asp:HiddenField>
                                <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' ></asp:HiddenField>
                                <asp:HiddenField ID="IdTreatment" runat="server" Value='<%# Bind("IdTreatment")%>' ></asp:HiddenField>
                                <asp:HiddenField ID="SemId" runat="server" Value='<%# Bind("SemId")%>'></asp:HiddenField>
                            </td>
                        </tr>
                        <tr>
                            <td class="TD1" align="right">If <b>Other</b>, please specifiy:</td>
                            <td align="left" colspan="3" class="TD1">
                                <asp:TextBox runat="server" id="OtherTreatmentPso" maxlength="100" CssClass="textbox" Text='<%# Bind("OtherTreatmentPso")%>' width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="TD1" style="background-color:#dcdcdc">Start date:</td>
                            <td align="left" class="TD1" colspan="5">
                                <asp:DropDownList ID="StartDateMM" CssClass="textbox" runat="server" SelectedValue='<%# Bind("StartDateMM")%>'>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UK" Value="UK"></asp:ListItem>
                                    <asp:ListItem Text="01" Value="01"></asp:ListItem>
                                    <asp:ListItem Text="02" Value="02"></asp:ListItem>
                                    <asp:ListItem Text="03" Value="03"></asp:ListItem>
                                    <asp:ListItem Text="04" Value="04"></asp:ListItem>
                                    <asp:ListItem Text="05" Value="05"></asp:ListItem>
                                    <asp:ListItem Text="06" Value="06"></asp:ListItem>
                                    <asp:ListItem Text="07" Value="07"></asp:ListItem>
                                    <asp:ListItem Text="08" Value="08"></asp:ListItem>
                                    <asp:ListItem Text="09" Value="09"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="StartDateYY" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("StartDateYY")%>' MaxLength="4"></asp:TextBox>&nbsp;(mm/yyyy)
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="TD1" style="background-color:#dcdcdc">End date:</td>
                            <td align="left" class="TD1" colspan="5">
                                <asp:DropDownList ID="EndDateMM" CssClass="textbox" runat="server" SelectedValue='<%# Bind("EndDateMM")%>'>
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UK" Value="UK"></asp:ListItem>
                                    <asp:ListItem Text="01" Value="01"></asp:ListItem>
                                    <asp:ListItem Text="02" Value="02"></asp:ListItem>
                                    <asp:ListItem Text="03" Value="03"></asp:ListItem>
                                    <asp:ListItem Text="04" Value="04"></asp:ListItem>
                                    <asp:ListItem Text="05" Value="05"></asp:ListItem>
                                    <asp:ListItem Text="06" Value="06"></asp:ListItem>
                                    <asp:ListItem Text="07" Value="07"></asp:ListItem>
                                    <asp:ListItem Text="08" Value="08"></asp:ListItem>
                                    <asp:ListItem Text="09" Value="09"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="EndDateYY" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("EndDateYY")%>' MaxLength="4"></asp:TextBox>&nbsp;(mm/yyyy)
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="TD1" style="background-color:#dcdcdc">Response to therapy:<br /><i>(according to 2018iwPso response criteria)</i></td>
                            <td align="left" colspan="3" class="TD1" >
                                <asp:DropDownList CssClass="textbox"  ID="IdResponseTherapy" runat="server" DataSourceID="SqlResponseTherapy" DataTextField="ResponseTherapy" DataValueField="IdResponseTherapy" 
                                    SelectedValue='<%# Bind("IdResponseTherapy")%>'>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="TD1" style="background-color:#dcdcdc">Reason for discontinuation:</td>
                            <td align="left" colspan="3" class="TD1" >
                                <asp:DropDownList CssClass="textbox"  ID="IdReasonDiscontinuation" runat="server" DataSourceID="SqlReasonDiscontinuation" DataTextField="ReasonDiscontinuation" DataValueField="IdReasonDiscontinuation" 
                                    SelectedValue='<%# Bind("IdReasonDiscontinuation")%>' onchange="javascript:abilitareAltro('IdReasonDiscontinuation','OtherReason')">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="TD1" align="right">If <b>Other</b>, please specifiy:</td>
                            <td align="left" colspan="3" class="TD1">
                                <asp:TextBox runat="server" id="OtherReason" maxlength="100" CssClass="textbox" Text='<%# Bind("OtherReason")%>' width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <div id="divMotivo" runat="server" visible="false">
                            <tr>
                                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="2"><b>Motivo modifica dati:</b></td>
                            </tr>
                            <tr>
                                <td align="center" class="TD1" colspan="2">
                                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                                </td>
                            </tr>
                        </div>
                        <tr>
                            <td align="left" class="TD1" colspan="2">
                                <asp:RequiredFieldValidator ControlToValidate="IdTreatmentPso" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field <b>Treatment</b> is required!" Display="None" InitialValue="0" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="StartDateMM" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field <b>Start date - Month</b> is required!" Display="None" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="StartDateYY" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field <b>Start date - Year</b> is required!" Display="None" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="EndDateMM" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>End date - Month</b> is required!" Display="None" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="EndDateYY" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>End date - Year</b> is required!" Display="None" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="IdResponseTherapy" ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field <b>Response to therapy</b> is required!" Display="None" InitialValue="0" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ControlToValidate="IdReasonDiscontinuation" ID="RequiredFieldValidator7" runat="server" ErrorMessage="The field <b>Reason for discontinuation</b> is required!" Display="None" InitialValue="0" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="StartDateYY" OnServerValidate="TreatmentDate" Display="None" ValidateEmptyText="true" ValidationGroup="TERPso"></asp:CustomValidator>
                                <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None" ValidationGroup="TERPso"></asp:RequiredFieldValidator>
                                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server" ValidationGroup="TERPso"
                                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                                <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <script src="../script/mantieneScroll.js" type="text/javascript"></script>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <FooterTemplate>
                    <div style="text-align:center; margin-bottom:5px;padding: 5px" class="TD1">
                     <%if (Session["LIVELLOID"].ToString() == "1" && Request["SemId"].ToString() != "5"
                 && Request["SemId"].ToString() != "6")
                  { %>
                  <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" OnClick="DeleteTer_Clicked" ValidationGroup="TERPso" />
                  <asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalvaTer_Click" ValidationGroup="TERPso" />
                    <%} %>
                    </div>
                </FooterTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlTreatmentPso" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
                ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
                SelectCommand="Select * from lstreatmentPso order by idtreatmentPso"></asp:SqlDataSource>

 <script language="C#" type="text/C#" runat="server">
    
    
    protected void ChiudiBoxTer(object sender, EventArgs e)
    {
        divTreatment.Visible = false;
    }
    
   
</script>    
<script language="javascript">

    abilitareAltro('IdTreatmentPso', 'OtherTreatmentPso');
    abilitareAltro('IdReasonDiscontinuation', 'OtherReason')
    function abilitareAltro(campo1, campo2) {
        var ddl = document.getElementById("frwTreatment_" + campo1);
        var txt = document.getElementById("frwTreatment_" + campo2);

        txt.disabled = (ddl.value!="99");
        if (ddl.value != "99") {
            txt.value = "";
            txt.style.backgroundColor = "#dcdcdc";
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }
    }

    
</script>
 <script type="text/javascript">
 show_overDiv("<%=Session["GestioneTreatment"]%>","divOpacityTreatment");   
</script>

</div></div>