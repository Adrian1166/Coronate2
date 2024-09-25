<div id="divOpacityPatCom" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>  
<div id="divPatologConc" runat="server" visible="false" class="boxPatologConc">
    <div class="titoloPag"><b>Patologia concomitante</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="imgChiudiBox" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxPat" ca /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%">
     <asp:SqlDataSource ID="SqlPatologConc" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" OnSelected="SqlPatologConc_OnSelected" SelectCommand=""
        >
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwPatologConc" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlPatologConc" DefaultMode="Insert" 
        onItemInserted="frwPatologConc_ItemInserted" onItemUpdated="frwPatologConc_ItemUpdated">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
           <td class="TD1grigio">
           <table width="100%">
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Patologia:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="IdPatologia" runat="server" SelectedValue='<%# Bind("IdPatologia") %>' DataTextField="Patologia" DataValueField="idPatologia" DataSourceID="SqlPatologia"  CssClass="textbox" onclick="javascript:abilitarepatologiaAltro();">
                    </asp:DropDownList>
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdPatologConc" runat="server" Value='<%# Bind("IdPatologConc")%>' />
                    <asp:HiddenField ID="SemID" runat="server" Value='<%# Bind("SemID")%>' />
                    <div style="position:absolute;top:-1000px">
                    <asp:TextBox TabIndex="200" ID="DataInizio" runat="server" width="0px" Text='<%# Bind("DataInizio")%>'></asp:TextBox>
                    <asp:TextBox ID="DataFine" runat="server" width="0px" TabIndex="201"  Text='<%# Bind("DataFine")%>'></asp:TextBox>
                    <asp:TextBox ID="DataVisita" runat="server" width="0px" TabIndex="202" ></asp:TextBox></div>
                 </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">
                    Altro - specificare:
                </td>
                <td align="left" class="TD1grigio">
                <asp:TextBox ID="PatologiaAltro" runat="server" Text='<%# Bind("PatologiaAltro")%>' CssClass="textbox" MaxLength="250" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">
                    Descrizione della patologia:
                </td>
                <td align="left" class="TD1grigio">
                <asp:TextBox ID="PatologiaDesc" runat="server" Text='<%# Bind("PatologiaDesc")%>' CssClass="textbox" MaxLength="200" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Data inizio:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="DataInizioDD" CssClass="textbox" runat="server" onchange="javascript:scriviData('DataInizio');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DataInizioMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('DataInizio');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DataInizioYY" CssClass="textbox" runat="server" onchange="javascript:scriviData('DataInizio');">
                    </asp:DropDownList>&nbsp;(gg/mm/aaaa)
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">Data fine:</td>
                <td align="left" class="TD1grigio">
                    <asp:DropDownList ID="DataFineDD" CssClass="textbox" runat="server" onchange="javascript:scriviData('DataFine');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DataFineMM" CssClass="textbox" runat="server" onchange="javascript:scriviData('DataFine');">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DataFineYY" CssClass="textbox" runat="server"  onchange="javascript:scriviData('DataFine');">
                    </asp:DropDownList>&nbsp;(gg/mm/aaaa)
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">In corso:</td>
                <td align="left" class="TD1grigio">
                    <asp:CheckBoxList runat="server" runat="server" Id="InCorso" SelectedValue='<%# Bind("InCorso")%>' onclick="javascript:abilitareInCorso();">
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="TD1grigio" align="left" style="background-color:#dcdcdc">In trattamento:</td>
                <td align="left" class="TD1grigio">
                    <asp:RadioButtonList runat="server" runat="server" Id="InTrattamento" SelectedValue='<%# Bind("InTrattamento")%>' RepeatDirection="Horizontal" CellPadding="1">
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:RadioButtonList>
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
                    <asp:RequiredFieldValidator ControlToValidate="IdPatologia" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field <b>Patologia</b> is required" Display="None" ValidationGroup="Trattamenti" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="PatologiaDesc" ID="RequiredFieldValidator41" runat="server" ErrorMessage="The field <b>Descrizione della patologia</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="DataInizioDD" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field <b>Giorno - Data inizio</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="DataInizioMM" ID="RequiredFieldValidator42" runat="server" ErrorMessage="The field <b>Mese - Data inizio</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="DataInizioYY" ID="RequiredFieldValidator43" runat="server" ErrorMessage="The field <b>Anno - Data inizio</b> is required" Display="None" ValidationGroup="Trattamenti"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ControlToValidate="InTrattamento" ID="rfvInTrattamento" runat="server" ErrorMessage="The field <b>In trattamento</b> is required!" Display="None" ValidationGroup="Trattamenti" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Trattamenti" ID="RegularExpressionValidator3" Display="None" runat="server" 
                        ControlToValidate="DataInizio" ErrorMessage="The field <b>Data inizio</b>  is wrong."
                        ValidationExpression="(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))" />
                    <asp:RangeValidator ID="RangeValidator1" ValidationGroup="Trattamenti" ControlToValidate="DataInizio" runat="server" ErrorMessage="The field <b>Data inizio</b> non può essere successivo alla data corrente!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/01/01' Display="None" Type="Date"></asp:RangeValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Trattamenti" ID="RegularExpressionValidator5" Display="None" runat="server" 
                        ControlToValidate="DataFine" ErrorMessage="The field <b>Data fine</b>  is wrong."
                        ValidationExpression="(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))" />
                    <asp:RangeValidator ID="RangeValidator2" ValidationGroup="Trattamenti" ControlToValidate="DataFine" runat="server" ErrorMessage="The field <b>Data fine</b> non può essere successivo alla data corrente!" MaximumValue='<%# String.Format("{0:yyyy/MM/dd}",DateTime.Now.ToShortDateString())%>' MinimumValue='1901/01/01' Display="None" Type="Date"></asp:RangeValidator>
                    <asp:CompareValidator ID="CompareValidator1" ValidationGroup="Trattamenti" ControlToCompare="DataInizio" ControlToValidate="DataFine" Type="Date" Operator="GreaterThanEqual" runat="server" Display="None" 
                    ErrorMessage="<b>Data inizio</b> it cannot be after the <b>Data fine</b>."></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ValidationGroup="Trattamenti" ControlToValidate="IdPatologia" OnServerValidate="IdPatologia_OnServerValidate" ErrorMessage="" Display="None" ValidateEmptyText="true"></asp:CustomValidator>
                    <asp:CompareValidator ID="CompareValidator3" ValidationGroup="Trattamenti" ControlToCompare="DataInizio" ControlToValidate="DataVisita" Type="Date" Operator="GreaterThanEqual" runat="server" Display="None" 
                    ErrorMessage="<b>Start date</b> can not be later than <b>Visit date</b>."></asp:CompareValidator>
                    <asp:ValidationSummary id="ValidationSummary1" ValidationGroup="Trattamenti" DisplayMode="List" runat="server"
                        EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
                </td></tr>
            </table>
            </td></tr></table>
        <div style="text-align:center; margin-top:7px" runat="server" id="divMsg"></div>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:15px">
                <%if (Session["LIVELLOID"].ToString() == "1")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Salva" CommandArgument="Conc" OnCommand="btnSalvaPatConc_Click" ValidationGroup="Trattamenti" />
                        <asp:Button CssClass="button" ID="btnElimina" runat="server" Text="Elimina" OnClick="DeleteTratPrec_Clicked" CausesValidation="false" />
                  <%} %>
            </div>
        </FooterTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlPatologia" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
        SelectCommand="Select * from lspatologia order by Idpatologia"></asp:SqlDataSource>
   
 <script language="C#" type="text/C#" runat="server">
    
   

    
    protected void btnSalvaEnferm_Click(object sender, EventArgs e)
    {
        
    }
    protected void DeleteEnferm_Clicked(object sender, EventArgs e)
    {
        divPatologConc.Visible = false;
    }
    protected void ChiudiBoxPat(object sender, EventArgs e)
    {
       divPatologConc.Visible = false;
    }
</script>
<script language="javascript">
    abilitareInCorso();
    function abilitareInCorso()
    {
        var ddlDD=document.getElementById("frwPatologConc_DataFineDD");
        var ddlMM=document.getElementById("frwPatologConc_DataFineMM");
        var ddlYY=document.getElementById("frwPatologConc_DataFineYY");
        var chkInCorso=document.getElementById("frwPatologConc_InCorso_0");
        ddlDD.disabled=(chkInCorso.checked);
        ddlMM.disabled=(chkInCorso.checked);
        ddlYY.disabled=(chkInCorso.checked);
        if (chkInCorso.checked)
        {
            ddlDD.value="";
            ddlMM.value="";
            ddlYY.value="";
        }
        scriviData("DataFine");
    }
    
    abilitarepatologiaAltro();
    function abilitarepatologiaAltro()
    {
        var ddlpatologia=document.getElementById("frwPatologConc_IdPatologia");
        var txtAltro=document.getElementById("frwPatologConc_PatologiaAltro");
        txtAltro.disabled=parseInt(ddlpatologia.value)<90;
        if (parseInt(ddlpatologia.value) < 90)
        {
            txtAltro.value="";
        }
    }
    //scriviData("DataInizio");
    //scriviData("DataFine");
    function scriviData(campo)
    {
        var ddlGG=document.getElementById("frwPatologConc_"+campo+"DD");
        var ddlMM=document.getElementById("frwPatologConc_"+campo+"MM");
        var ddlYY=document.getElementById("frwPatologConc_"+campo+"YY");
        var txt=document.getElementById("frwPatologConc_"+campo);
        if (ddlGG.value == "ND" || ddlGG.value == "")
        {
            gg="01";
        }
        else
        {
            gg=ddlGG.value;
        }
        if (ddlMM.value == "ND" || ddlMM.value == "")
        {
            mm="01";
        }
        else
        {
            mm=ddlMM.value;
        }
        txt.value=gg+"/"+mm+"/"+ddlYY.value;
        if (ddlGG.value=="" && ddlMM.value=="" && ddlYY.value=="") txt.value="";
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
    show_overDiv("<%=Session["ConfermaPatCom"]%>","divOpacityPatCom");
</script>
</div>
</div>


