<!-- #INCLUDE FILE="msgAlert.aspx"-->
<!-- #INCLUDE FILE="gestioneLock.aspx"-->
<!-- #INCLUDE FILE="gestioneFreeze.aspx"-->
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<asp:SqlDataSource ID="SqlMenu" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>"></asp:SqlDataSource>
<table cellspacing="0" style="width:100%; border-collapse:collapse;">
	<tr>
		<td>
        <asp:Repeater ID="frwMenu" runat="server" DataSourceID="SqlMenu">
<HeaderTemplate>
<table align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
<tr>
<td>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td width="100%">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                </HeaderTemplate>
                <ItemTemplate>
                    <div id="div1" runat="server" visible='<%# Eval("FormId").ToString()=="9" ? true : false%>'>
                        <tr><td align="left" class="TD1" style="background-color:#FF9933; height:22px;font-size:13px" colspan="3">&nbsp;<b>PARTNER</b></td></tr>
                    </div>
                    <tr>
				        <td><img id="frwMenu_img8" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li1" runat="server"><asp:LinkButton ID="anagrafica" Text='<%# Eval("desc")%>' runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(Convert.ToInt16(Eval("FormId").ToString()))%>' CommandName='<%# Eval("file").ToString()%>' OnCommand="lnkMenu_Click"></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(Convert.ToInt16(Eval("FormId").ToString()),"")%>' runat="server" id="img1" /></td>
                    </tr>
				    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                </ItemTemplate>
                <FooterTemplate>
                </table>
                </td>
            </tr>
        </table>
        </td></tr></table>
    </FooterTemplate>
     </asp:Repeater>
</td></tr>
<tr><td><br />
<%if(Session["LIVELLOID"].ToString() == "1" || Session["LIVELLOID"].ToString() == "2"){%>
<asp:Button CssClass="buttonFreeze" ID="btnFreeze" runat="server" Text="Freeze" OnClick="VisualizzaFreeze" CausesValidation="false" onkeypress="javascript:EnterKeyPress()" />
<%} %>
<%if(Session["LIVELLOID"].ToString() == "2"){%>
<asp:Button CssClass="buttonLock" ID="btnLock" runat="server" Text="Lock" OnClick="VisualizzaLock" CausesValidation="false"  TabIndex="1000" />
<%} %></td></tr>
<tr><td align="center"><div class="boxsem"><table cellpadding="2" align="center">
<tr><td><img src="../images/sem0.png" /></td><td align="left">Form non compilata</td></tr>
<tr><td><img src="../images/sem2.png" /></td><td align="left">Form non completata</td></tr>
<tr><td><img src="../images/sem3.png" /></td><td align="left">Form con query</td></tr>
<tr><td><img src="../images/sem1.png" /></td><td align="left">Form completata</td></tr>
<tr><td><img src="../images/sem5.png" /></td><td align="left">Form frozen</td></tr>
<tr><td><img src="../images/icon_lucchetto.png" /></td><td align="left">Form locked</td></tr>
</table></div></td></tr>
</table>

<script type="text/javascript">
 function disableEnterKey(e) {
 var key;
 if (window.event)
 key = window.event.keyCode; //IE
 else
 key = e.which; //firefox 

 return (key != 13);
}

 </script>

<script language="C#" type="text/C#" runat="server">
    
    protected string ControllaForm(int formid, string quando)
    {
        Utility utility = new Utility();
        string ConnString = utility.getStringConnection(Request.ApplicationPath);
        string sql = "";
        string formInserito = "../images/sem0.png";
        MySql.Data.MySqlClient.MySqlConnection cn = new MySql.Data.MySqlClient.MySqlConnection(ConnString);
        cn.Open();
        sql = "SELECT SEMID from prstat Where SUBJID=" + Session["IdPaziente"]+" And FORMID="+formid;
        
        MySql.Data.MySqlClient.MySqlCommand cmdForm = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
        MySql.Data.MySqlClient.MySqlDataReader rdrForm = cmdForm.ExecuteReader();
        if (rdrForm.HasRows)
        {
            rdrForm.Read();
            if (rdrForm["SEMID"].ToString()=="6"){
                formInserito = "../images/icon_lucchetto.png";
            }else{
            formInserito = "../images/sem"+rdrForm["SEMID"].ToString()+".png";
            }
        }
        rdrForm.Close();
        cn.Close();
        return formInserito;
    }
    
    protected string ImpostaSem(int formid)
    {
        Utility utility = new Utility();
        string ConnString = utility.getStringConnection(Request.ApplicationPath);
        string sql = "";
        string formInserito = "0";
        MySql.Data.MySqlClient.MySqlConnection cn = new MySql.Data.MySqlClient.MySqlConnection(ConnString);
        cn.Open();
        sql = "SELECT SEMID from prstat Where SUBJID=" + Session["IdPaziente"]+" And FORMID="+formid;
        
        MySql.Data.MySqlClient.MySqlCommand cmdForm = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
        MySql.Data.MySqlClient.MySqlDataReader rdrForm = cmdForm.ExecuteReader();
        if (rdrForm.HasRows)
        {
            rdrForm.Read();
            formInserito = rdrForm["SEMID"].ToString();
        }
        rdrForm.Close();
        cn.Close();
        return formInserito;
    }

    protected void lnkMenu_Click(object sender, CommandEventArgs e)
    {
        Session["lnkMenu"]=null;
        LinkButton lnk = sender as LinkButton;
        string pagina=e.CommandName.ToString();
        Utility utility = new Utility();
        string ConnString = utility.getStringConnection(Request.ApplicationPath);
        string sql = "";
        bool formUscita = true;
        MySql.Data.MySqlClient.MySqlConnection cn = new MySql.Data.MySqlClient.MySqlConnection(ConnString);
        cn.Open();
        sql = "SELECT * from tbpartner Where IdPaziente=" + Session["IdPaziente"];
        MySql.Data.MySqlClient.MySqlCommand cmdForm = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
        MySql.Data.MySqlClient.MySqlDataReader rdrForm = cmdForm.ExecuteReader();
        if (rdrForm.HasRows)
        {
            rdrForm.Read();
            if (rdrForm["ParticipateStudy"].ToString()!="1"){
                formUscita = false;
            }
        }
        rdrForm.Close();
        cn.Close();
        if (e.CommandName.ToString().ToUpper()!= "ANAGRAFICA.ASPX")
        {
            if (Session["CriteriINS"].ToString() == "NO" )
            {
                Session["alertRec"] = "1";
                divConfermaAlert.Visible = true;
                divConfermaAlert.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                lblAlert.Text = "Warning: Enter the Inclusion and Exclusion criteria!";
            }
            else
            {
                if (Session["CriteriSOD"].ToString() == "NO")
                {
                    lblAlert.Text = "Warning: The subject is excluded from the study because he/she does not meet the Inclusion and Exclusion criteria! <br/> The data could not be updated.";
                    Session["alertRec"] = "1";
                    Session["lnkMenu"] = pagina;
                    divConfermaAlert.Visible = true;
                    divConfermaAlert.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                }else
                {
                    if (e.CommandName.ToString().ToUpper()== "USCITASTUDIO2.ASPX")
                    {
                        if (formUscita == false)
                        {
                            lblAlert.Text = "Warning: The partner not participate in the study! <br/> The data could not be updated.";
                                Session["alertRec"] = "1";
                                Session["lnkMenu"] = pagina;
                                divConfermaAlert.Visible = true;
                                divConfermaAlert.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                        }
                        else
                        {
                            Response.Redirect(pagina+"?Aggiornamento=NO&semid="+e.CommandArgument.ToString()+"&Pagina="+e.CommandName.ToString());
                        }
                    }
                    else
                    {
                        Response.Redirect(pagina+"?Aggiornamento=NO&semid="+e.CommandArgument.ToString()+"&Pagina="+e.CommandName.ToString());
                    }
                }
            }
        }
        else
        {
            Response.Redirect(pagina+"?Aggiornamento=NO&semid="+e.CommandArgument.ToString()+"&Pagina="+e.CommandName.ToString());
        }
    }
    
    protected void CloseDiv_Click(object sender, EventArgs e)
    {
        Session["alertRec"] = "0";
        divConfermaAlert.Visible = false;
    }

     protected void VisualizzaFreeze(object sender, EventArgs e)
    {
        divGestioneFreeze.Visible = true;
        Session["GestioneFreeze"] = "1";
        divGestioneFreeze.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 650) / 2) + "px";
        CaricaElencoFreeze();
    }

    protected void CaricaElencoFreeze()
    {
        SqlTIPVISF.SelectCommand = "SELECT SEMID, prform.`DESC`, if(SEMID=6,1,0) AS sLock,prform.FORMID,if(SEMID=0,'sem0.png',if(SEMID=2,'sem2.pnggif',if(SEMID=1,'sem1.png',if(SEMID=5,'sem5.png','icon_lucchetto.png')))) as newSem,SDV FROM prstat" +
            " INNER JOIN prform ON (prstat.FORMID = prform.FORMID) Where subjid=" + Session["IdPaziente"] + " And TipVisId=1 And prstat.FORMID<>0  order by orderform";
        SqlTIPVISF.DataBind();
        rptTipVisF.DataBind();
    }

    protected void btnSaveFreeze_OnClick(object sender, EventArgs e)
    {
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        bool formUscita = true;
        sql = "SELECT * from tbpartner Where IdPaziente=" + Session["IdPaziente"];
        MySql.Data.MySqlClient.MySqlCommand cmdForm = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
        MySql.Data.MySqlClient.MySqlDataReader rdrForm = cmdForm.ExecuteReader();
        if (rdrForm.HasRows)
        {
            rdrForm.Read();
            if (rdrForm["ParticipateStudy"].ToString()!="1"){
                formUscita = false;
           }
        }
        rdrForm.Close();
        
        string semForm0 = "0";
        int contFreeze = 0;
        int i=0;
        for (i = 0; i < rptTipVisF.Items.Count; i++)
        {
            HiddenField FORMID = rptTipVisF.Items[i].FindControl("FORMID") as HiddenField;
            CheckBox chkFreezeForm = rptTipVisF.Items[i].FindControl("chkFreezeForm") as CheckBox;
            if (chkFreezeForm != null)
            {
                if (chkFreezeForm.Checked && Session["LIVELLOID"].ToString() == "1")
                {
                    sql = "Update PrStat set SEMID=5 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=" + FORMID.Value + " And SemID<>6";
                    MySqlCommand cmd = new MySqlCommand(sql, cn);
                    cmd.ExecuteNonQuery();
                    contFreeze++;
                }
                if (chkFreezeForm.Checked == false && Session["LIVELLOID"].ToString() == "2")
                {
                    sql = "Update PrStat set SEMID=1 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=" + FORMID.Value + " And SemID=5";
                    MySqlCommand cmd1 = new MySqlCommand(sql, cn);
                    cmd1.ExecuteNonQuery();
                }
            }
        }
        if (i == contFreeze || (formUscita == false && contFreeze == i-1))
        {
            semForm0 = "5";
        }
        sql = "Update PrStat set SEMID=" + semForm0 + " where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=0";
        MySqlCommand cmd2 = new MySqlCommand(sql, cn);
        cmd2.ExecuteNonQuery();
        cn.Close();

        divGestioneFreeze.Visible = false;
        Session["GestioneFreeze"] = "0";
        SqlMenu.DataBind();
        frwMenu.DataBind();
    }

    protected void VisualizzaLock(object sender, EventArgs e)
    {
        divGestioneLock.Visible = true;
        Session["GestioneLock"] = "1";
        divGestioneLock.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 650) / 2) + "px";
        CaricaElencoForm();
    }

     protected void CaricaElencoForm()
    {
        SqlTIPVIS.SelectCommand = "SELECT SEMID, prform.`DESC`, if(SEMID=6,1,0) AS sLock,prform.FORMID,if(SEMID=0,'sem0.png',if(SEMID=2,'sem2.png',if(SEMID=1,'sem1.png',if(SEMID=5,'sem5.png',if(SEMID=3,'sem3.png','icon_lucchetto.png'))))) as newSem,if(SDV is null,0,SDV) as SDV FROM prstat" +
            " INNER JOIN prform ON (prstat.FORMID = prform.FORMID) Where subjid=" + Session["IdPaziente"] + " And TipVisId=1 And prstat.FORMID<>0  order by orderform"; 
        SqlTIPVIS.DataBind();
        SqlTIPVIS.DataBind();
        rptTipVis.DataBind();
    }

    protected void btnSaveLock_OnClick(object sender, EventArgs e)
    {
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        bool formUscita = true;
        sql = "SELECT * from tbpartner Where IdPaziente=" + Session["IdPaziente"];
        MySql.Data.MySqlClient.MySqlCommand cmdForm = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
        MySql.Data.MySqlClient.MySqlDataReader rdrForm = cmdForm.ExecuteReader();
        if (rdrForm.HasRows)
        {
            rdrForm.Read();
            if (rdrForm["ParticipateStudy"].ToString()!="1"){
                formUscita = false;
            }
        }
        rdrForm.Close();
        int contLock = 0;
        int i = 0;
        for ( i = 0; i < rptTipVis.Items.Count; i++)
        {
            HiddenField FORMID = rptTipVis.Items[i].FindControl("FORMID") as HiddenField;
            CheckBox chkLockForm = rptTipVis.Items[i].FindControl("chkLockForm") as CheckBox;
            
            if (chkLockForm != null)
            {
                if (chkLockForm.Checked)
                {
                    sql = "Update PrStat set SEMID=6 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=" + FORMID.Value;
                    contLock++;
                }
                else
                {
                    sql = "Update PrStat set SEMID=5 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=0 And SemID=6";
                    MySqlCommand cmd5 = new MySqlCommand(sql, cn);
                    cmd5.ExecuteNonQuery();
                    sql = "Update PrStat set SEMID=5 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=" + FORMID.Value + " And SemID=6";
                }
                MySqlCommand cmd = new MySqlCommand(sql, cn);
                cmd.ExecuteNonQuery();
            }

        }
        if (i == contLock || (formUscita == false && contLock == i-1))
        {
            sql = "Update PrStat set SEMID=6 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=0";
            MySqlCommand cmd2 = new MySqlCommand(sql, cn);
            cmd2.ExecuteNonQuery();
        }
        cn.Close();

        divGestioneLock.Visible = false;
        divGestioneFreeze.Visible = false;
        Session["GestioneLock"] = "0";
        Session["GestioneFreeze"] = "0";
        SqlMenu.DataBind();
        frwMenu.DataBind();
    }

    protected void ChiudiBoxLock(object sender, EventArgs e)
    {
        divGestioneLock.Visible = false;
        divGestioneFreeze.Visible = false;
        Session["GestioneLock"] = "0";
        Session["GestioneFreeze"] = "0";
    }

    protected void ChiudiBoxFreeze(object sender, EventArgs e)
    {
        divGestioneFreeze.Visible = false;
        Session["GestioneFreeze"] = "0";
    }
    
    protected void SqlTIPVISF_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        TotForm.Value = e.AffectedRows.ToString();
    }

    protected void SqlTIPVIS_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        TotFormGL.Value = e.AffectedRows.ToString();
    }

    protected void ChiudiBox(object sender, EventArgs e)
    {
       
    }
    
    
    
</script>