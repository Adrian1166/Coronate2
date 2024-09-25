<div id="header">
<div class="logoleft"></div>
    <div id="infopanelPaz">
        <ul>
            <li>Utente: <b><% Response.Write(Session["Nominativo"].ToString());%> </b></li>
            <%if (Session["NumPaz"]!=null){ %>
            <li>N° paziente: <b><% Response.Write(Session["NumPaz"].ToString());%> </b></li>
            <%} %>
            <%if (Request["nomeVisit"] !=null && Request["IdTipVis"]!=null){ 
                if (Request["IdTipVis"].ToString()!="7"){%>
            <li>Visita: <b><% Response.Write(Request["nomeVisit"].ToString());%> </b></li>
            <li>Data Visita: <b><%dataVisita d = new dataVisita();Response.Write(d.getDataVisita( Session["IdPaziente"].ToString(), Request["IDTIPVIS"].ToString(), Session["pathDb"].ToString()));%> </b></li>
            <%} 
            }%>
        </ul>
    </div>

    <div class="infopanel">
        <ul>
            <li><asp:LinkButton ID="lnkElencoCentriL" Text="Elenco centri" runat="server" CausesValidation="false" PostBackUrl="~/ssl/elencoCentri.aspx" /></li>
            <li><asp:LinkButton ID="lnkElencoPazL" Text="Elenco pazienti" runat="server" CausesValidation="false" PostBackUrl="~/ssl/elencopazientilab.aspx" /></li>
            <li><asp:LinkButton ID="btnDocumentsL" Text="Documenti" runat="server" CausesValidation="false" PostBackUrl="~/studyDocuments.aspx" /></li>
            <li runat="server" id="liGestioneQueryL"><asp:LinkButton ID="lnkGestioneQueryL" Text="Gestione query" runat="server" CausesValidation="false" /></li>
       </ul>
    </div>
    <div class="last"><a href="../Default.aspx">Logoff</a></div>
</div>
