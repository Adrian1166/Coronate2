<div id="divOpacityPatCom" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divGestCurrentMedication" runat="server" visible="false" class="boxPatologConc">
    <div class="titoloPag"><b>Type of medication</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="imgChiudiBox" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxPat" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
     <asp:SqlDataSource ID="SqlGestCurrentMedication" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlGestCurrentMedication_OnSelected" SelectCommand=""
        >
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwGestCurrentMedication" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlGestCurrentMedication" DefaultMode="Insert" 
        onItemInserted="frwGestCurrentMedication_ItemInserted" onItemUpdated="frwGestCurrentMedication_ItemUpdated">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
           <td class="TD1grigio">
           <table width="100%">
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Treatment:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="IdTreatmentPso" runat="server" SelectedValue='<%# Bind("IdTreatmentPso") %>' DataTextField="TreatmentPso" DataValueField="IdTreatmentPso" DataSourceID="SqlTreatmentCLL"  CssClass="textbox">
                    </asp:DropDownList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdCurrentMedication" runat="server" Value='<%# Bind("IdCurrentMedication")%>' />
                    <asp:HiddenField ID="SemID" runat="server" Value='<%# Bind("SemID")%>' />
                    <div style="position:absolute;top:-1000px">
                    
                    <asp:TextBox ID="DataVisita" runat="server" width="0px" TabIndex="202" ></asp:TextBox></div>
                 </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Start date:</td>
                <td align="left" class="TD1grigio">
                    <asp:TextBox ID="StartDate" runat="server" width="80px" Text='<%# Bind("StartDate")%>'></asp:TextBox>&nbsp;(dd/mm/yyyy)
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Dose:</td>
                <td align="left" class="TD1grigio">
                     <asp:DropDownList ID="Dose" runat="server" SelectedValue='<%# Bind("Dose") %>' CssClass="textbox" >
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Standard dose" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Increased dose" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Decreased dose" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Frequency:</td>
                <td align="left" class="TD1grigio">
                     <asp:DropDownList ID="Frequency" runat="server" SelectedValue='<%# Bind("Frequency") %>' CssClass="textbox" >
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Standard frequency" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Increased frequency" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Decreased frequency" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <div id="divMotivo" runat="server" visible="false">
            <tr>
                <td align="center" class="TD1" style="background-color:#dcdcdc" colspan="2"><b>Reason for change:</b></td>
            </tr>
            
            <tr>
                <td align="center" class="TD1" colspan="2">
                    <asp:TextBox ID="MotivoModifica" runat="server" CssClass="textbox" Width="400px" Rows="3" TextMode="MultiLine" />
                </td>
            </tr>
            </div>
            <tr>
                <td align="left" colspan="2">
                    <asp:RequiredFieldValidator ControlToValidate="IdTreatmentPso" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Treatment</b> is required" Display="None" ValidationGroup="Trattamenti" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="StartDate" ID="RequiredFieldValidator42" runat="server" ErrorMessage="The field <b>Start date</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Dose" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>Dose</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Frequency" ID="RequiredFieldValidator15" runat="server" ErrorMessage="The field <b>Frequency</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" ValidationGroup="Trattamenti" ControlToCompare="StartDate" ControlToValidate="DataVisita" Type="Date" Operator="GreaterThanEqual" runat="server" Display="None" 
                        ErrorMessage="The field <b>Start date</b> it cannot be after the <b>Visit date</b>."></asp:CompareValidator>
                    <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:ValidationSummary id="ValidationSummary1" ValidationGroup="Trattamenti" DisplayMode="List" runat="server" ForeColor="Red"
                        EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                </td></tr>
            </table>
            </td></tr></table>
        <div style="text-align:center; margin-top:7px" runat="server" id="divMsg"></div>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:15px">
                <%if (Session["LIVELLOID"].ToString() == "1")
                  { %><asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Delete" OnClick="DeleteTratPrec_Clicked"  ValidationGroup="Trattamenti" />
                  <asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Save" CommandArgument="Conc" OnCommand="btnSalvaPatConc_Click" ValidationGroup="Trattamenti" />
                        
                  <%} %>
            </div>
        </FooterTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlTreatmentCLL" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
        SelectCommand="Select * from lsTreatmentPso order by TreatmentPso"></asp:SqlDataSource>
   
 <script language="C#" type="text/C#" runat="server">
    
   

    
    protected void btnSalvaEnferm_Click(object sender, EventArgs e)
    {
        
    }
    protected void DeleteEnferm_Clicked(object sender, EventArgs e)
    {
        divGestCurrentMedication.Visible = false;
    }
    protected void ChiudiBoxPat(object sender, EventArgs e)
    {
       divGestCurrentMedication.Visible = false;
    }
</script>
<script language="javascript">
    
    
    //abilitareOtherTreatment();
    function abilitareOtherTreatment()
    {
        var ddlTreatmentCLL=document.getElementById("frwGestCurrentMedication_IdTreatmentPso");
        var txtAltro=document.getElementById("frwGestCurrentMedication_OtherTreatment");
        txtAltro.disabled=parseInt(ddlTreatmentCLL.value)<90;
        if (parseInt(ddlTreatmentCLL.value) < 90) {
            txtAltro.value = "";
            txtAltro.style.backgroundColor = "#dcdcdc";
        } else {
            txtAltro.style.backgroundColor = "#FFFFFF";
        }
        
    }
    //scriviData("StartDate");
    //scriviData("DataFine");
    function scriviData(campo)
    {
        var ddlMM=document.getElementById("frwGestCurrentMedication_"+campo+"MM");
        var ddlYY=document.getElementById("frwGestCurrentMedication_"+campo+"YY");
        var txt = document.getElementById("frwGestCurrentMedication_" + campo);
       
        gg="01";
       
        if (ddlMM.value == "UK" || ddlMM.value == "")
        {
            mm="01";
        }
        else
        {
            mm=ddlMM.value;
        }
        txt.value = gg + "/" + mm + "/" + ddlYY.value;
        if (ddlMM.value == "" && ddlYY.value == "") txt.value = "";
    }

    $("#frwGestCurrentMedication_StartDate").mask("99/99/9999");
    $("#frwGestCurrentMedication_StartDate").datepicker();
</script>
<script language="C#" type="text/C#" runat="server">
    protected void DeleteTratPrec_Clicked(object sender, EventArgs e)
    {
        lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] =Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
        Session["nomeForm"] = "PATCONC";
    }
</script>
<script type="text/javascript">
    show_overDiv("<%=Session["ConfermaPatCom"]%>","divOpacityPatCom");
</script>
</div>
</div>


