<div id="divOpacityPatCom" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divGestPreviousMedication" runat="server" visible="false" class="boxPatologConc">
    <div class="titoloPag"><b>Type of medication</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="imgChiudiBox" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxPat" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
     <asp:SqlDataSource ID="SqlGestPreviousMedication" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlGestPreviousMedication_OnSelected" SelectCommand=""
        >
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwGestPreviousMedication" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlGestPreviousMedication" DefaultMode="Insert" 
        onItemInserted="frwGestPreviousMedication_ItemInserted" onItemUpdated="frwGestPreviousMedication_ItemUpdated">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
           <td class="TD1grigio">
           <table width="100%">
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Treatment:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="IdTreatmentPso" runat="server" SelectedValue='<%# Bind("IdTreatmentPso") %>' DataTextField="TreatmentPso" DataValueField="IdTreatmentPso" DataSourceID="SqlTreatmentCLL"  CssClass="textbox" onclick="javascript:abilitareOtherTreatment();">
                    </asp:DropDownList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdPreviousMedication" runat="server" Value='<%# Bind("IdPreviousMedication")%>' />
                    <asp:HiddenField ID="SemID" runat="server" Value='<%# Bind("SemID")%>' />
                    <div style="position:absolute;top:-1000px">
                    
                    <asp:TextBox ID="DataVisita" runat="server" width="0px" TabIndex="202" ></asp:TextBox></div>
                 </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Start date:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="StartDateMM" runat="server" SelectedValue='<%# Bind("StartDateMM")%>' CssClass="textbox">
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
                    <asp:TextBox ID="StartDateYY" runat="server" width="50px" Text='<%# Bind("StartDateYY")%>'></asp:TextBox>&nbsp;(mm/yyyy)
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">End date:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="EndDateMM" runat="server" SelectedValue='<%# Bind("EndDateMM")%>' CssClass="textbox">
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
                    <asp:TextBox ID="EndDateYY" runat="server" width="50px" Text='<%# Bind("EndDateYY")%>'></asp:TextBox>&nbsp;(mm/yyyy)
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
                    <asp:RequiredFieldValidator ControlToValidate="StartDateMM" ID="RequiredFieldValidator44" runat="server" ErrorMessage="The field <b>Start date - Month</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="StartDateYY" ID="RequiredFieldValidator42" runat="server" ErrorMessage="The field <b>Start date - Year</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="EndDateMM" ID="RequiredFieldValidator45" runat="server" ErrorMessage="The field <b>End date - Month</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="EndDateYY" ID="RequiredFieldValidator43" runat="server" ErrorMessage="The field <b>End date - Year</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="MotivoModifica" ID="rfvMotivoModifica" runat="server" ErrorMessage="The field <b>Reason for change</b> is required!" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ControlToValidate="DataVisita" OnServerValidate="ControllaAltro" Display="None" ValidateEmptyText="true" ValidationGroup="Trattamenti"></asp:CustomValidator>
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
        SelectCommand="Select * from lsTreatmentPso where IdTreatmentPso<>99 order by TreatmentPso"></asp:SqlDataSource>
   
 <script language="C#" type="text/C#" runat="server">
    
   

    
    protected void btnSalvaEnferm_Click(object sender, EventArgs e)
    {
        
    }
    protected void DeleteEnferm_Clicked(object sender, EventArgs e)
    {
        divGestPreviousMedication.Visible = false;
    }
    protected void ChiudiBoxPat(object sender, EventArgs e)
    {
       divGestPreviousMedication.Visible = false;
    }
</script>
<script language="javascript">
    
    
    //abilitareOtherTreatment();
    function abilitareOtherTreatment()
    {
        var ddlTreatmentCLL=document.getElementById("frwGestPreviousMedication_IdTreatmentPso");
        var txtAltro=document.getElementById("frwGestPreviousMedication_OtherTreatment");
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
        var ddlMM=document.getElementById("frwGestPreviousMedication_"+campo+"MM");
        var ddlYY=document.getElementById("frwGestPreviousMedication_"+campo+"YY");
        var txt = document.getElementById("frwGestPreviousMedication_" + campo);
       
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
     $("#frwGestPreviousMedication_StartDateYY").maskNumber({ integer: true, thousands: '' }); 
      $("#frwGestPreviousMedication_EndDateYY").maskNumber({ integer: true, thousands: '' }); 
    show_overDiv("<%=Session["ConfermaPatCom"]%>","divOpacityPatCom");
</script>
</div>
</div>


