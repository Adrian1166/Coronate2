<div id="divOpacityQuestionBriefCOPE" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divQuestionBriefCope" runat="server" 
        style="left: 100px; position: absolute; top: 20px;
                border: 5px solid #CCCCCC; Z-INDEX: 100010;
                width: 800px; height: 600px; background-color:#EFEFEF; color: #000000;font-size:14px;overflow:scroll" 
    visible="false">
    <div class="titoloPag" style="font-size:16px"><b>CORONATE FASE 2</b></div><div style="position:absolute; right:7px;top:3px"><asp:ImageButton ID="imgChiudiBoxBriefCOPE" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="CloseQuestionBriefCOPE_Click" /></div>
    <table align="center" width="100%">
        
        <tr>
            <td align="center" class="TD1" style="font-size:18px" colspan="2">Brief-COPE (Brief-COPE)</td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Patient number:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblNumPazQBriefCope" width="100px" ForeColor="black" Font-Size="14px"></asp:label></td>
        </tr>
        <tr><td colspan="2">
            <table width="100%"><tr><td>
            <asp:FormView ID="frwQuestionBriefCope" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlQuestionBriefCOPE" DefaultMode="Edit" 
       >
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi concentro sul lavoro o su altre attività per non pensare.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D1" runat="server" SelectedValue='<%# Bind("D1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Concentro gli sforzi per fare qualcosa rispetto alla situazione in cui mi trovo.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D2" runat="server" SelectedValue='<%# Bind("D2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi dico: “Tutto questo non è reale”.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D3" runat="server" SelectedValue='<%# Bind("D3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Assumo alcol o altre sostanze per sentirmi meglio.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D4" runat="server" SelectedValue='<%# Bind("D4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ottengo supporto emotivo da altre persone.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D5" runat="server" SelectedValue='<%# Bind("D5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">6.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Rinuncio a provare ad affrontare la situazione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D6" runat="server" SelectedValue='<%# Bind("D6") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">7.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Agisco per provare a migliorare la situazione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D7" runat="server" SelectedValue='<%# Bind("D7") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">8.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi rifiuto di credere che sia successo.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D8" runat="server" SelectedValue='<%# Bind("D8") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>     
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">9.</td>          
                <td align="left" class="TD1" style="background-color:#dcdcdc">Dico cose negative per sfogare i sentimenti spiacevoli.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D9" runat="server" SelectedValue='<%# Bind("D9") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">10.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ricevo supporto e consigli da altre persone.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D10" runat="server" SelectedValue='<%# Bind("D10") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">11.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Uso  alcol o altre sostanze per aiutarmi a superare la situazione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D11" runat="server" SelectedValue='<%# Bind("D11") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">12.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Provo a guardare la situazione da un punto di vista diverso, per farla sembrare più positiva.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D12" runat="server" SelectedValue='<%# Bind("D12") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">13.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Faccio autocritica.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D13" runat="server" SelectedValue='<%# Bind("D13") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">14.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Provo a definire una strategia d’azione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D14" runat="server" SelectedValue='<%# Bind("D14") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">15.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ricevo conforto e comprensione da qualcuno.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D15" runat="server" SelectedValue='<%# Bind("D15") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">16.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Rinuncio a provare a gestire la mia condizione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D16" runat="server" SelectedValue='<%# Bind("D16") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">17.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Cerco qualcosa di positivo in quello che sta accadendo</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D17" runat="server" SelectedValue='<%# Bind("D17") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">18.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ci scherzo su.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D18" runat="server" SelectedValue='<%# Bind("D18") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">19.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi tengo impegnato per pensarci di meno, ad esempio vado al cinema, guardo la TV, leggo, sogno a occhi aperti, dormo o faccio shopping.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D19" runat="server" SelectedValue='<%# Bind("D19") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">20.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Accetto la realtà di fatto di quello che è avvenuto.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D20" runat="server" SelectedValue='<%# Bind("D20") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">21.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Esprimo i miei sentimenti negativi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D21" runat="server" SelectedValue='<%# Bind("D21") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">22.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Cerco di trovare conforto nella mia religione o nel mio credo spirituale.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D22" runat="server" SelectedValue='<%# Bind("D22") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">23.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Provo a chiedere consigli o aiuto da altre persone su cosa fare.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D23" runat="server" SelectedValue='<%# Bind("D23") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">24.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Imparo a convivere con la situazione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D24" runat="server" SelectedValue='<%# Bind("D24") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">25.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso molto a quali azioni intraprendere.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D25" runat="server" SelectedValue='<%# Bind("D25") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">26.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi do la colpa per quello che è successo.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D26" runat="server" SelectedValue='<%# Bind("D26") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">27.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Prego o medito.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D27" runat="server" SelectedValue='<%# Bind("D27") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">28.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ironizzo sulla situazione.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D28" runat="server" SelectedValue='<%# Bind("D28") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Non lo faccio per niente" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poco" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mediamente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Lo faccio molto" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table></EditItemTemplate></asp:FormView>
            </td></tr></table>
        
        </td></tr>
        
        <tr>
            <td align="center" colspan="2">
                <br />
                <asp:Button ID="CloseQuestionBriefCOPE" runat="server" Text="Close" CausesValidation="false" OnClick="CloseQuestionBriefCOPE_Click" Width="75px" CssClass="button" />
            
        </td></tr></table>
        <asp:SqlDataSource ID="SqlQuestionBriefCope" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""></asp:SqlDataSource>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecQuestionBriefCOPE"]%>","divOpacityQuestionBriefCOPE");
</script>