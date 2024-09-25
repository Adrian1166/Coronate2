<div id="divOpacityQuestion" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divQuestionCenter" runat="server" visible="false" class="boxPatologConc">
    <div class="titoloPag"><b>QUESTIONARIO PER IL CENTRO</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="imgChiudiBox" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxQuestion" /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
     <asp:SqlDataSource ID="SqlQuestionCenter" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlQuestionCenter_OnSelected" SelectCommand=""
        InsertCommand="INSERT INTO tbquestioncenter
(IdCentro,
Question1,
Question1Spec,
Question2,
Question2Spec,
Question3,
Question3Spec)
VALUES
(?IdCentro,
?Question1,
?Question1Spec,
?Question2,
?Question2Spec,
?Question3,
?Question3Spec);"
        UpdateCommand="UPDATE tbquestioncenter
SET
Question1 = ?Question1,
Question1Spec = ?Question1Spec,
Question2 = ?Question2,
Question2Spec = ?Question2Spec,
Question3 = ?Question3,
Question3Spec = ?Question3Spec
WHERE IdQuestionCenter = ?IdQuestionCenter">
        <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdQuestionCenter" />
                <asp:Parameter Name="Question1" />
                <asp:Parameter Name="Question1Spec" />
                <asp:Parameter Name="Question2" />
                <asp:Parameter Name="Question2Spec" />
                <asp:Parameter Name="Question3" />
                <asp:Parameter Name="Question3Spec" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Question1" />
                <asp:Parameter Name="Question1Spec" />
                <asp:Parameter Name="Question2" />
                <asp:Parameter Name="Question2Spec" />
                <asp:Parameter Name="Question3" />
                <asp:Parameter Name="Question3Spec" />
                <asp:Parameter Name="IdQuestionCenter" />
            </UpdateParameters>
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwQuestionCenter" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlQuestionCenter" DefaultMode="Insert" 
        onItemInserted="frwQuestionCenter_ItemInserted" onItemUpdated="frwQuestionCenter_ItemUpdated">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr><td class="TD1" colspan="3" style="font-size:15px;color:Red"><b>Gentile sperimentatore, come previsto dal protocollo dopo l’arruolamento dei primi 5 pazienti, le chiediamo di rispondere alle seguenti domande relative al questionario DCE.</b></td></tr>
           <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc;width:75%">Ci sono stati pazienti che hanno trovato il questionario DCE difficile da comprendere e da completare?</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Question1" runat="server" SelectedValue='<%# Bind("Question1") %>' RepeatDirection="Horizontal" onclick="javascript:abilitareSpec('Question1')">
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="IdQuestionCenter" runat="server" Value='<%# Bind("IdQuestionCenter")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="right" colspan="2">
                    Se <b>SI</b>, quanti? 
                </td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="Question1Spec" runat="server" Text='<%# Bind("Question1Spec")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Qualche paziente ha chiesto spiegazioni aggiuntive sul questionario DCE?</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Question2" runat="server" SelectedValue='<%# Bind("Question2") %>' RepeatDirection="Horizontal" onclick="javascript:abilitareSpec('Question2')">
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="right" colspan="2">
                    Se <b>SI</b>, quanti? 
                </td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="Question2Spec" runat="server" Text='<%# Bind("Question2Spec")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1"style="background-color:#dcdcdc">Ci sono stati pazienti non soddisfatti dei chiarimenti forniti dal medico o da altro personale del centro dedicato allo studio?</td>
                <td align="left" class="TD1">
                    <asp:RadioButtonList ID="Question3" runat="server" SelectedValue='<%# Bind("Question3") %>' RepeatDirection="Horizontal" onclick="javascript:abilitareSpec('Question3')">
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="right" colspan="2">
                    Se <b>SI</b>, quanti? 
                </td>
                <td align="left" class="TD1">
                    <asp:TextBox ID="Question3Spec" runat="server" Text='<%# Bind("Question3Spec")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td align="left" colspan="2">
                    <asp:RequiredFieldValidator ControlToValidate="Question1" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Domanda 1</b> is required" Display="None" ValidationGroup="Question"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Question2" ID="RequiredFieldValidator42" runat="server" ErrorMessage="The field <b>Domanda 2</b> is required" Display="None" ValidationGroup="Question"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Question3" ID="RequiredFieldValidator43" runat="server" ErrorMessage="The field <b>Domanda 3</b> is required" Display="None" ValidationGroup="Question"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="Question1Spec" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true" ValidationGroup="Question"></asp:CustomValidator>
                    <asp:ValidationSummary id="ValidationSummary1" ValidationGroup="Question" DisplayMode="List" runat="server"
                        EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                </td></tr>
            </table>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:15px">
                <%if (Session["LIVELLOID"].ToString() == "1")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" OnClick="btnSalvaQuestion_Click" ValidationGroup="Question" />
                  <%} %>
            </div>
        </FooterTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlTreatmentCLL" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
        SelectCommand="Select * from lsTreatmentPso order by IdTreatmentPso"></asp:SqlDataSource>
   
 <script language="C#" type="text/C#" runat="server">
    protected void btnSalvaEnferm_Click(object sender, EventArgs e)
    {
        
    }
    protected void DeleteEnferm_Clicked(object sender, EventArgs e)
    {
        divQuestionCenter.Visible = false;
    }
    protected void ChiudiBoxPat(object sender, EventArgs e)
    {
       divQuestionCenter.Visible = false;
    }
</script>
<script language="javascript">


    abilitareSpec('Question1');
    abilitareSpec('Question2')
    abilitareSpec('Question3')
    function abilitareSpec(campo)
    {
        var opt = document.getElementById("frwQuestionCenter_" + campo + "_0");
        var txt = document.getElementById("frwQuestionCenter_" + campo + "Spec");
        txt.disabled = !opt.checked;
        if (!opt.checked)
        {
            txt.value="";
            txt.style.backgroundColor = "#dcdcdc";
        } else {
            txt.style.backgroundColor = "#FFFFFF";
        }
    }
        
</script>
<script language="C#" type="text/C#" runat="server">
    
</script>
<script type="text/javascript">
    show_overDiv("<%=Session["ConfermaQuestion"]%>","divOpacityQuestion");
</script>
</div>
</div>


