<div id="divOpacityQuestionMLCDP" class="div_trasparenza" visible="false" style="visibility:hidden">
<iframe style="Z-INDEX: 101;WIDTH: 100%; HEIGHT: 100%" align="center" marginheight="0" hspace="0" marginwidth="0" vspace="0" scrolling="no" frameborder="0" name="trans" id="trans" src="../nera.htm"></iframe>
</div> 
 <div id="divQuestionMLCDP" runat="server" 
        style="left: 100px; position: absolute; top: 20px;
                border: 5px solid #CCCCCC; Z-INDEX: 100010;
                width: 800px; height: 600px; background-color:#EFEFEF; color: #000000;font-size:14px;overflow:scroll" 
    visible="false">
    <div class="titoloPag" style="font-size:16px"><b>CORONATE FASE 2</b></div><div style="position:absolute; right:7px;top:3px"><asp:ImageButton ID="imgChiudiBoxMLCDP" runat="server" CausesValidation="false" ImageUrl="../images/icon_close.gif" OnClick="CloseQuestionMLCDP_Click" /></div>
    <table align="center" width="100%">
        
        <tr>
            <td align="center" class="TD1" style="font-size:18px" colspan="2">Questionario sulle principali decisioni che comportano cambiamenti di vita (MLCDP)</td>
        </tr>
        <tr>
            <td align="left" class="TD1" style="background-color:#dcdcdc"><b>Patient number:</b></td>
            <td align="left" class="TD1"><asp:label runat="server" id="lblNumPazQMLCDP" width="100px" ForeColor="black" Font-Size="14px"></asp:label></td>
        </tr>
        <tr><td colspan="2">
            <table width="100%"><tr><td>
            <asp:FormView ID="frwQuestionMLCDP" CellSpacing="1" CellPadding="0" BorderWidth="0" runat="server" Width="99%" HorizontalAlign="Center" DataSourceID="SqlQuestionMLCDP" DefaultMode="Edit" 
       >
        <EditItemTemplate>
        <table style="background-color: WhiteSmoke; color: black;" border="0" cellpadding="2" cellspacing="1" align="center" width="100%">
            <tr><td class="TD1" style="background-color:#dcdcdc;font-weight:bold" colspan="3">A. ISTRUZIONE<br />
Le seguenti affermazioni riguardano l'influenza della malattia cronica di cui soffre sulle decisioni prese in merito alla sua istruzione.
</td></tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di abbandonare gli studi prematuramente</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="A1" runat="server" SelectedValue='<%# Bind("A1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di cambiare percorso di studi</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="A2" runat="server" SelectedValue='<%# Bind("A2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di proseguire gli studi vicino alla mia famiglia</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="A3" runat="server" SelectedValue='<%# Bind("A3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                       <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td class="TD1" style="background-color:#dcdcdc;font-weight:bold" colspan="3">B. LAVORO/PERCORSO PROFESSIONALE<br />
                Le seguenti affermazioni riguardano l'influenza della malattia cronica di cui soffre sulle decisioni prese in merito al suo lavoro/percorso professionale.
            </td></tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di cambiare lavoro/percorso professionale</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B1" runat="server" SelectedValue='<%# Bind("B1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di lasciare il lavoro/percorso professionale dopo qualche tempo</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B2" runat="server" SelectedValue='<%# Bind("B2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di usufruire del prepensionamento</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B3" runat="server" SelectedValue='<%# Bind("B3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>     
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>          
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di adottare orari di lavoro flessibili</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B4" runat="server" SelectedValue='<%# Bind("B4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di optare per un lavoro/percorso professionale adatto al mio stato di salute</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B5" runat="server" SelectedValue='<%# Bind("B5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">6.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di rifiutare le promozioni</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B6" runat="server" SelectedValue='<%# Bind("b6") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">7.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di ridurre l'orario lavorativo</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B7" runat="server" SelectedValue='<%# Bind("B7") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">8.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di avviare un'attività in proprio</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B8" runat="server" SelectedValue='<%# Bind("B8") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">9.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di rimanere senza occupazione</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="B9" runat="server" SelectedValue='<%# Bind("B9") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td class="TD1" style="background-color:#dcdcdc;font-weight:bold" colspan="3">C. SITUAZIONE FAMILIARE/PERSONALE<br />
                Le seguenti affermazioni riguardano l'influenza della malattia cronica di cui soffre sulle decisioni prese in merito alla sua situazione familiare/personale.
            </td></tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di scegliere un altro momento per avere figli</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="C1" runat="server" SelectedValue='<%# Bind("C1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non avere figli</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="C2" runat="server" SelectedValue='<%# Bind("C2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non avere una relazione sessuale</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="C3" runat="server" SelectedValue='<%# Bind("C3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non sposarmi né di avere una relazione stabile</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="C4" runat="server" SelectedValue='<%# Bind("C4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di divorziare o di separarmi dal partner</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="C5" runat="server" SelectedValue='<%# Bind("C5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td class="TD1" style="background-color:#dcdcdc;font-weight:bold" colspan="3">D. VITA SOCIALE<br />
                Le seguenti affermazioni riguardano l'influenza della malattia cronica di cui soffre sulle decisioni prese in merito alla sua vita sociale.
            </td></tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di modificare le abitudini alimentari</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D1" runat="server" SelectedValue='<%# Bind("D1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di modificare il consumo di tabacco/alcol</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D2" runat="server" SelectedValue='<%# Bind("D2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di rinunciare a viaggi o vacanze all'estero</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D3" runat="server" SelectedValue='<%# Bind("D3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di trasferirmi</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D4" runat="server" SelectedValue='<%# Bind("D4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non trasferirmi</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D5" runat="server" SelectedValue='<%# Bind("D5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">6.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non trasferirmi all'estero</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D6" runat="server" SelectedValue='<%# Bind("D6") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">7.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di indossare vestiti/scarpe di tipo/colore diverso</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D7" runat="server" SelectedValue='<%# Bind("D7") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">8.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non partecipare ad attività collettive</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D8" runat="server" SelectedValue='<%# Bind("D8") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">9.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non frequentare altre persone</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D9" runat="server" SelectedValue='<%# Bind("D9") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">10.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di rinunciare alla cura della mia persona</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="D10" runat="server" SelectedValue='<%# Bind("D10") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td class="TD1" style="background-color:#dcdcdc;font-weight:bold" colspan="3">E. ATTIVITÀ FISICA<br />
                Le seguenti affermazioni riguardano l'influenza della malattia cronica di cui soffre sulle decisioni prese in meritoall'attività fisica.
            </td></tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">1.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non praticare il nuoto</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="E1" runat="server" SelectedValue='<%# Bind("E1") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">2.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di non praticare alcuna attività sportiva</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="E2" runat="server" SelectedValue='<%# Bind("E2") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">3.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di cambiare attività sportiva</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="E3" runat="server" SelectedValue='<%# Bind("E3") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">4.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di aumentare l'attività fisica</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="E4" runat="server" SelectedValue='<%# Bind("E4") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TD1" style="background-color:#dcdcdc;font-weight:bold">5.</td>
                <td align="left" class="TD1" style="background-color:#dcdcdc">Ho deciso di smettere di guidare</td>
                <td align="left" class="TD1">
                    <asp:DropDownList ID="E5" runat="server" SelectedValue='<%# Bind("E5") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nessuna influenza o non applicabile" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Influenza lieve" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Influenza moderata" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Influenza profonda" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Influenza molto profonda" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table></EditItemTemplate></asp:FormView>
            </td></tr></table>
        
        </td></tr>
        
        <tr>
            <td align="center" colspan="2">
                <br />
                <asp:Button ID="CloseQuestionMLCDP" runat="server" Text="Close" CausesValidation="false" OnClick="CloseQuestionMLCDP_Click" Width="75px" CssClass="button" />
            
        </td></tr></table>
        <asp:SqlDataSource ID="SqlQuestionMLCDP" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand=""></asp:SqlDataSource>
</div>
<script type="text/javascript">
    show_overDiv("<%=Session["deleteRecQuestionMLCDP"]%>","divOpacityQuestionMLCDP");
</script>