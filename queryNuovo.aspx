<div id="divOpacityNQ" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div>    
<div id="divQuery" runat="server" visible="false" class="boxQuery">
    <div class="titoloPag"><b>New query</b></div><div style="position:absolute; right:7px;top:7px"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/icon_close.gif" OnClick="ChiudiBox" CausesValidation="false" /></div>
    <div style="background-color:#F3F5F3;width:100%; height:100%;Z-INDEX: 103000;">
     <asp:SqlDataSource ID="SqlQuery" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""
        >
            <InsertParameters>
                <asp:Parameter Name="IdCentro" />
                <asp:Parameter Name="IdPaziente" />
                <asp:Parameter Name="IdTipVis" />
                <asp:Parameter Name="IdForm" />
                <asp:FormParameter FormField="ddlCampo" Name="Campo" />
                <asp:Parameter Name="DataQuery" />
                <asp:Parameter Name="TipoQuery" />
                <asp:Parameter Name="StatoQuery" />
                <asp:Parameter Name="IdTxtQry" />
                <asp:Parameter Name="TestoQuery" />
                <asp:Parameter Name="IdChiave" />
            </InsertParameters>
        </asp:SqlDataSource> 
        <br />
    <asp:FormView ID="frwQuery" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="95%" HorizontalAlign="Center" DataSourceID="SqlQuery" DefaultMode="Insert" 
        OnItemInserted="frwQuery_ItemInsert">
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1" style="border-top: 1px solid #FFBD5B;border-left: 1px solid #FFBD5B">
            <table width="100%">
            <tr>
                <td class="TD1" align="left" style="background-color:#FFBD5B">Visit</td>
                <td align="left" class="TD1">
                    <asp:DropDownList CssClass="textbox"  ID="ddlVisita" runat="server" DataSourceID="SqlVisita" DataTextField="DESC" DataValueField="TIPVISID" 
                    OnSelectedIndexChanged="CaricaCampiVisita" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="background-color:#FFBD5B">Patient list:</td>
                <td align="left">
                    <asp:DropDownList CssClass="textbox"  ID="ddlPazienti" runat="server" DataSourceID="SqlPazientiQry" DataTextField="NumPaz" 
                        DataValueField="IdPaziente">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
               <td class="TD1" align="left" style="background-color:#FFBD5B;width:75%">Form</td>
               <td align="left" class="TD1" style="width:20%">
                    <asp:DropDownList CssClass="textbox"  ID="ddlForm" runat="server" DataSourceID="SqlFormQry" DataTextField="descrizione"
                        DataValueField="FORMID" OnSelectedIndexChanged="CaricaCampiForm" AutoPostBack="true">
                    </asp:DropDownList>  
                    <asp:HiddenField ID="IdPaziente" runat="server" Value='<%# Bind("IdPaziente")%>' />
                    <asp:HiddenField ID="IdCentro" runat="server" Value='<%# Bind("IdCentro")%>' />
                    <asp:HiddenField ID="IdTipVis" runat="server" Value='<%# Bind("IdTipVis")%>' />
                    <asp:HiddenField ID="IdQuery" runat="server" Value='<%# Bind("IdQuery")%>' />
                </td>
            </tr>
            <tr>
                <td class="TD1" align="left" style="background-color:#FFBD5B">Name of field</td>
                <td align="left" class="TD1">
                    <asp:DropDownList CssClass="textbox"  ID="ddlCampo" runat="server" DataSourceID="SqlCampo" DataTextField="Descrizione" DataValueField="Campo" >
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td class="TD1" align="left" style="background-color:#FFBD5B">Text of query</td>
                <td align="left" class="TD1">
                    <asp:TextBox runat="server" id="TestoQuery" Text='<%# Bind("TestoQuery")%>' maxlength="250" CssClass="textbox" width="350px" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr><td align="left" colspan="3">
                <asp:ValidationSummary id="ValidationSummary1" DisplayMode="List" runat="server"
                    EnableClientScript="true" HeaderText="<b>WARNING:</b>" />
            </td></tr>
            </table></td></tr>
        </table>
        
        <div style="text-align:center; margin-top:7px" runat="server" id="divMsg"></div>
        </EditItemTemplate>
        <FooterTemplate>
            <div style="text-align:center; margin-bottom:15px">
                <%if (Session["LIVELLOID"].ToString() == "2")
                  { %><asp:Button CssClass="button" ID="btnSalva" runat="server" Text="Salva" OnClick="btnSalvaQuery_Click" />
                        
                  <%} %>
            </div>
        </FooterTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlCampo" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlFormQry" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPazientiQry" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand=""></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlVisita" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"
            SelectCommand="Select * from LsTIPVIS order by TIPVISID"></asp:SqlDataSource>
 </div></div>
 <script language="C#" type="text/C#" runat="server">
    
    protected void ChiudiBox(object sender, EventArgs e)
    {
        divQuery.Visible = false;
        Session["NuovaQuery"]="0";
    }
    
    
    protected void DeleteEnferm_Clicked(object sender, EventArgs e)
    {
        divQuery.Visible = false;
    }

    
    protected void frwQuery_ItemInsert(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                 
            }
        }
    }
</script>
<script type="text/javascript">
    show_overDiv("<%=Session["NuovaQuery"]%>","divOpacityNQ");
</script>
