<div id="divOpacityQuestionPartner" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divQuestionPartner" runat="server" 
        style="left: 100px; position: absolute; top: 20px;
                border: 5px solid #CCCCCC; Z-INDEX: 100010;
                width: 800px; height: 600px; background-color:#EFEFEF; color: #000000;font-size:14px;" 
    visible="false">
    <div class="titoloPag" style="font-size:16px"><b>CORONATE FASE 2</b></div><div style="position:absolute; right:7px;top:3px"><asp:ImageButton ID="imgChiudiBox2" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="CloseQuestionPartner_Click" /></div>
    <table align="center" width="100%">
        
        <tr>
            <td align="center" class="TD1" style="font-size:18px" colspan="2">Questionario CORONATE per il Partner</td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Patient number:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblNumPazQP" width="100px" ForeColor="black" Font-Size="14px"></asp:label></td>
        </tr>
        <tr><td colspan="2">
            <table width="100%"><tr><td>
            <asp:FormView ID="frwQuestionPartner" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlQuestionPartner" DefaultMode="Edit" 
       >
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
          
            <tr>
                <td class="TD1" style="font-weight:bold" colspan="3">Dati socio demografici</td>
            </tr>
            <tr>
                <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Anno di nascita:</td>
                <td align="left" class="TD1">
                    <asp:Label ID="Q1" runat="server" Text='<%# Eval("Q1") %>'></asp:Label>
                </td>
            </tr>
            <tr>
    <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Istruzione:</td>
    <td align="left" class="TD1">
        <asp:Label ID="Q2" runat="server" Text='<%# Eval("Q2") %>'></asp:Label>
    </td>
</tr>
            <tr>
    <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Relazione con il paziente:</td>
    <td align="left" class="TD1">
        <asp:Label ID="Q3" runat="server" Text='<%# Eval("Q3") %>'></asp:Label>
    </td>
</tr>
            <tr>
    <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Se convivente, da quanto tempo:</td>
    <td align="left" class="TD1">
        <asp:Label ID="Q4" runat="server" Text='<%# Eval("Q4") %>'></asp:Label>
    </td>
</tr>
            <tr>
    <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Da quanto tempo conosce il paziente:</td>
    <td align="left" class="TD1">
        <asp:Label ID="Q5" runat="server" Text='<%# Eval("Q5") %>'></asp:Label>
    </td>
</tr>
                        <tr>
    <td align="left" class="TD1" style="background-color:#dcdcdc" colspan="2">Soffre o ha sofferto di psoriasi?</td>
    <td align="left" class="TD1">
        <asp:Label ID="Q6" runat="server" Text='<%# Eval("Q6") %>'></asp:Label>
    </td>
</tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Per un periodo della vita il suo partner non ha potuto lavorare a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner non ha potuto svolgere la professione che avrebbe voluto svolgere a causa della psoriasi. </td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha perso molti giorni di lavoro a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Al suo partner è capitato di perdere il lavoro a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha guadagnato meno di quanto avrebbe potuto a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha avuto problemi nelle relazioni con gli altri a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha avuto difficoltà ad avere relazioni sentimentali a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc"> Il suo partner ha avuto problemi nella sua vita sessuale a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha condizionato la vita dei propri familiari a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha dovuto rinunciare a molte attività sociali a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner non ha praticato tanto sport quanto avrebbe voluto a causa della psoriasi. </td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc"> Il suo partner ha perso molto tempo nella sua vita per la cura e per la gestione della  psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Il suo partner ha viaggiato meno di quanto avrebbe voluto a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Non ho potuto indossare i vestiti o le scarpe che avrei voluto a causa della psoriasi.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi  abbia reso il mio partner più triste di come avrebbe potuto essere.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi abbia reso il mio partner meno estroverso/aperto di come avrebbe potuto essere.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Penso che la psoriasi abbia reso il mio partner meno fiducioso nel futuro di come avrebbe potuto essere.</td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Nell’insieme, la vita del mio partner ha preso una direzione peggiore a causa della psoriasi. </td>
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
                <td align="left" class="TD1" style="background-color:#dcdcdc">Sulla base della Sua esperienza di malattia, quanto è grave la psoriasi del Suo partner in questo momento?<br />
                Da 1=poco grave a 5=molto grave</td>
                <td align="left" class="TD1">
                    <asp:Label ID="DAG1" runat="server" Text='<%# Eval("DAG1")%>' CssClass="textbox" MaxLength="2" Width="50px"></asp:Label>
                </td>
            </tr>
            </table></EditItemTemplate></asp:FormView>
            </td></tr></table>
        
        </td></tr>
        
        <tr>
            <td align="center" colspan="2">
                <br />
                <asp:Button ID="CloseQuestionPartner" runat="server" Text="Close" CausesValidation="false" OnClick="CloseQuestionPartner_Click" Width="75px" CssClass="button" />
            
        </td></tr></table>
        <asp:SqlDataSource ID="SqlQuestionPartner" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""></asp:SqlDataSource>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecQuestionPartner"]%>","divOpacityQuestionPartner");
</script>