<div id="divOpacityQuestionPaziente" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divQuestionPaziente" runat="server" 
        style="left: 100px; position: absolute; top: 20px;
                border: 5px solid #CCCCCC; Z-INDEX: 100010;
                width: 800px; height: 600px; background-color:#EFEFEF; color: #000000;font-size:14px;overflow:scroll" 
    visible="false">
    <div class="titoloPag" style="font-size:16px"><b>CORONATE FASE 2</b></div><div style="position:absolute; right:7px;top:3px"><asp:ImageButton ID="imgChiudiBox" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="CloseQuestionPaziente_Click" /></div>
    <table align="center" width="100%">
        
        <tr>
            <td align="center" class="TD1" style="font-size:18px" colspan="2">Questionario CORONATE per il paziente</td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Patient number:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblNumPazQ" width="100px" ForeColor="black" Font-Size="14px"></asp:label></td>
        </tr>
        <tr><td colspan="2">
            <table width="100%"><tr><td>
            <asp:FormView ID="frwQuestionPaziente" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlQuestionPaziente" DefaultMode="Edit" 
       >
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
           <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Per un periodo della mia vita non ho potuto lavorare a causa della psoriasi.  </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D1" runat="server" SelectedValue='<%# Bind("D1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Non ho potuto svolgere la professione che avrei voluto svolgere a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D2" runat="server" SelectedValue='<%# Bind("D2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho perso molti giorni di lavoro a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D3" runat="server" SelectedValue='<%# Bind("D3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Mi è capitato di perdere il lavoro a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D4" runat="server" SelectedValue='<%# Bind("D4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho guadagnato meno di quanto avrei potuto a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D5" runat="server" SelectedValue='<%# Bind("D5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">6.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho avuto problemi nelle relazioni con gli altri a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D6" runat="server" SelectedValue='<%# Bind("D6") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">7.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho avuto difficoltà a trovare un partner a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D7" runat="server" SelectedValue='<%# Bind("D7") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">8.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho avuto problemi nella mia vita sessuale a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D8" runat="server" SelectedValue='<%# Bind("D8") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>     
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">9.</td>          
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho causato limitazioni alla vita della mia famiglia a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D9" runat="server" SelectedValue='<%# Bind("D9") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">10.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho dovuto rinunciare a molte attività sociali a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D10" runat="server" SelectedValue='<%# Bind("D10") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">11.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Non ho praticato tanto sport quanto avrei voluto a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D11" runat="server" SelectedValue='<%# Bind("D11") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">12.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho perso molto tempo nella mia vita per la cura e per la gestione della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D12" runat="server" SelectedValue='<%# Bind("D12") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">13.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho viaggiato meno di quanto avrei voluto a causa della psoriasi.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D13" runat="server" SelectedValue='<%# Bind("D13") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">14.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Non ho potuto indossare i vestiti o le scarpe che avrei voluto a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D14" runat="server" SelectedValue='<%# Bind("D14") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">15.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi mi abbia reso più triste di come avrei potuto essere.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D15" runat="server" SelectedValue='<%# Bind("D15") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">16.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi mi abbia reso meno estroverso/aperto di come avrei potuto essere.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D16" runat="server" SelectedValue='<%# Bind("D16") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">17.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi mi abbia reso meno fiducioso nel futuro di come avrei potuto essere.</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D17" runat="server" SelectedValue='<%# Bind("D17") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">18.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Nell’insieme, la mia vita ha preso una direzione peggiore a causa della psoriasi. </td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D18" runat="server" SelectedValue='<%# Bind("D18") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Falso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza falso" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Abbastanza vero" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Vero" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td align="center" class="TD1" style="font-size:18px" colspan="3">Informazioni Aggiuntive</td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Giudizio complessivo sulla gravità della Sua psoriasi<br />
                Da 1=poco grave a 5=molto grave</td>
                <td align="left" class="TD1">
                    <asp:Label ID="DAG1" runat="server" Text='<%# Eval("DAG1")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Giudizio complessivo sull'impatto della psoriasi sulla Sua qualità della vita<br />
                Da 1=nessun o minimo impatto a 5=massimo impatto</td>
                <td align="left" class="TD1">
                    <asp:Label ID="DAG2" runat="server" Text='<%# Eval("DAG2")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Rispetto all'ultima visita, la Sua psoriasi è:</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="DAG3" runat="server" SelectedValue='<%# Bind("DAG3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Scomparsa" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Notevolmente migliorata" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Migliorata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Leggermente migliorata" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Stabile" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Leggermente peggiorata" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Peggiorata" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Notevolmente peggiorata" Value="7"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ricorda se prima dell'insorgenza della malattia ci sono stati eventi traumatici nella Sua vita</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="DAG4" runat="server" SelectedValue='<%# Bind("DAG4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table></EditItemTemplate></asp:FormView>
            </td></tr></table>
        
        </td></tr>
        
        <tr>
            <td align="center" colspan="2">
                <br />
                <asp:Button ID="CloseQuestionPaziente" runat="server" Text="Close" CausesValidation="false" OnClick="CloseQuestionPaziente_Click" Width="75px" CssClass="button" />
            
        </td></tr></table>
        <asp:SqlDataSource ID="SqlQuestionPaziente" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""></asp:SqlDataSource>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecQuestionPaziente"]%>","divOpacityQuestionPaziente");
</script>