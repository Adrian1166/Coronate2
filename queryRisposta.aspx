<div id="divOpacityRQ" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divRisposta" runat="server" visible="false" class="boxRisposta">
    <div class="titoloPag"><b>New answer</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBoxRis" CausesValidation="false" /></div>
    <div style="background-color:#F3F5F3;width:100%; height:auto">
    
     <asp:SqlDataSource ID="SqlRisposta" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
        InsertCommand="Insert into tbqryris (IdQuery,IdUtente,Risposta,DataOraRisp) Values (@IdQuery,@IdUtente,@Risposta,Now())">
            <InsertParameters>
                <asp:Parameter Name="IdQuery" />
                <asp:Parameter Name="IdUtente" />
                <asp:Parameter Name="Risposta" />
            </InsertParameters>
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwRisposta" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlRisposta" DefaultMode="Insert" 
        OnItemInserted="frwRisposta_ItemInsert">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
            <td class="TD1"><table width="100%">
            <tr>
                <td class="TD1" align="left" style="background-color:#dcdcdc"><b>Text of the answer</b></td>
            </tr>
            <tr>
                <td align="left" class="TD1">
                    <asp:TextBox runat="server" id="Risposta" Text='<%# Bind("Risposta")%>' CssClass="textbox" width="550px" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    <asp:HiddenField ID="IdQuery" runat="server" Value='<%# Bind("IdQuery")%>' />
                    <asp:HiddenField ID="IdUtente" runat="server"  Value='<%# Bind("IdUtente")%>' />
                </td>
            </tr>
            <tr><td align="left" colspan="3">
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
            </table></td></tr>
        </table>
        
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:15px">
              <asp:Button CssClass="button" ID="btnSalvaRis" runat="server" Text="Reply" CommandName="Insert" OnClick="btnSalvaRisposta_Click" />
                 
            </div>
        </FooterTemplate>
    </asp:FormView>
   <br />
 <script language="C#" type="text/C#" runat="server">
    
    protected void ChiudiBoxRis(object sender, EventArgs e)
    {
        divRisposta.Visible = false;
        Session["RispostaQuery"] = "0";
        TrovaItem();
    }
    
    protected void btnSalvaRisposta_Click(object sender, EventArgs e)
    {
        Session["RispostaQuery"] = "0";
    }
        
    protected void frwRisposta_ItemInsert(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                divRisposta.Visible = false;
                TrovaItem();
            }
        }
    }
</script>
</div>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["RispostaQuery"]%>","divOpacityRQ");
</script>