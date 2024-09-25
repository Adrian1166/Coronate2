<!-- #INCLUDE FILE="msgAlert.aspx"-->
<!-- #INCLUDE FILE="gestioneLock.aspx"-->
<!-- #INCLUDE FILE="gestioneFreeze.aspx"-->
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<asp:SqlDataSource ID="SqlMenu" runat="server" ConnectionString="<%$ ConnectionStrings:CoronateConnectionString %>"
ProviderName="<%$ ConnectionStrings:CoronateConnectionString.ProviderName %>" SelectCommand="Select * from tbPazienti where IdPaziente=0"></asp:SqlDataSource>

<asp:FormView ID="frwMenu" runat="server" DataSourceID="SqlMenu" DefaultMode="Insert" Width="100%">
<EditItemTemplate>
<table cellspacing="0" id="frwMenu" style="width:100%; border-collapse:collapse;">
	<tr>
		<td>
<table align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
<tr>
<td>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td width="100%">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tr>
				        <td><img id="frwMenu_img8" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li1" runat="server"><asp:LinkButton ID="anagrafica" Text="Demografia" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(1)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(1,"")%>' runat="server" id="img1" /></td>
                    </tr>
				    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                    <tr>
				        <td><img id="frwMenu_img29" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li6" runat="server"><asp:LinkButton ID="criIncEsc" Text="Criteri di inc./esc." runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(2)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(2,"")%>' runat="server" id="img2" style="height:15px;width:15px;" /></td>
                    </tr>
				    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="frwMenu_img30" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li7" runat="server"><asp:LinkButton ID="storiaMedica" Text="Anamnesi/Storia medica" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(3)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(3,"")%>' runat="server" id="img3" /></td>
                    </tr>
				    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="frwMenu_img11" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li8" runat="server"><asp:LinkButton ID="AnamOncol" Text="Storia medica oncologica" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(4)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(4,"")%>' runat="server" id="img4" /></td>
                    </tr>
				    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="frwMenu_img12" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li9" runat="server"><asp:LinkButton ID="misurAntropome" Text="Misurazioni antropometriche" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(5)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(5,"")%>' runat="server" id="img5" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="Img11" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li2" runat="server"><asp:LinkButton ID="metabolico" Text="Esami di laboratorio" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(6)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(6,"")%>' runat="server" id="img11" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                    <tr>
				        <td><img id="Img8" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li3" runat="server"><asp:LinkButton ID="performanceStatus" Text="Performance status" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(7)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(7,"")%>' runat="server" id="img12" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                    <tr>
				        <td><img id="Img13" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li4" runat="server"><asp:LinkButton ID="terapiaAdiuvante" Text="Terapia adiuvante" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(8)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(8,"")%>' runat="server" id="img13" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                    <tr>
				        <td><img id="Img14" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li5" runat="server"><asp:LinkButton ID="terapia1linea" Text="Terapia 1° linea" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(9)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(9,"")%>' runat="server" id="img14" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
                    <tr>
				        <td><img id="Img15" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li11" runat="server"><asp:LinkButton ID="radioterapia" Text="Radioterapia" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(10)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(10,"")%>' runat="server" id="img15" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="frwMenu_img13" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li10" runat="server"><asp:LinkButton ID="reOspedalizzazione" Text="Re-Ospedalizzazione" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(11)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(11,"")%>' runat="server" id="img6" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="Img7" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li14" runat="server"><asp:LinkButton ID="tossicita" Text="Tossicità al trattamento" runat="server" CausesValidation="false"  CommandArgument='<%# ImpostaSem(12)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(12,"")%>' runat="server" id="img10" /></td>
                    </tr>
                    
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>
				    <tr>
				        <td><img id="Img16" src="../images/icopub.png" style="height:12px;width:13px;" /></td>
				        <td height="18" align="left">
	                        <div id="navmenu">
                                <ul>
                                    <li id="li13" runat="server"><asp:LinkButton ID="statoVitale" Text="Stato vitale/Fine studio" runat="server" CausesValidation="false" CommandArgument='<%# ImpostaSem(13)%>' OnCommand="lnkMenu_Click" ></asp:LinkButton></li>
                                </ul>
                            </div>
                        </td><td><asp:Image ImageUrl='<%# ControllaForm(13,"")%>' runat="server" id="img9" /></td>
                    </tr>
                    <tr bgcolor="#07431B"><td height="1" colspan="3"></td></tr>

                </table>
            </td></tr></table>
        </td></tr></table>
</td></tr>
<tr><td><br />
<%if(Session["LIVELLOID"].ToString() == "1" || Session["LIVELLOID"].ToString() == "2"){%>
<asp:Button CssClass="buttonFreeze" ID="btnFreeze" runat="server" Text="Freeze" OnClick="VisualizzaFreeze" CausesValidation="false" onkeypress="javascript:EnterKeyPress()" />
<%} %>
<%if(Session["LIVELLOID"].ToString() == "2"){%>
<asp:Button CssClass="buttonLock" ID="btnLock" runat="server" Text="Lock" OnClick="VisualizzaLock" CausesValidation="false"  TabIndex="1000" />
<%} %></td></tr>
<tr><td align="center"><div class="boxsem"><table cellpadding="2">
<tr><td><img src="../images/sem0.png" /></td><td align="left">Form non compilata</td></tr>
<tr><td><img src="../images/sem2.png" /></td><td align="left">Form non completata</td></tr>
<tr><td><img src="../images/sem3.png" /></td><td align="left">Form con query</td></tr>
<tr><td><img src="../images/sem1.png" /></td><td align="left">Form completata</td></tr>
<tr><td><img src="../images/sem5.png" /></td><td align="left">Form frozen</td></tr>
<tr><td><img src="../images/icon_lucchetto.png" /></td><td align="left">Form locked</td></tr>
</table></div></td></tr>
</table>
</EditItemTemplate>
</asp:FormView>
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
        string pagina=lnk.ID+".aspx";
        if (lnk.ID.ToUpper() != "CRIINCESC" && lnk.ID.ToUpper() != "ANAGRAFICA")
        {
            if (Session["CriteriINS"].ToString() == "NO" )
            {
                Session["alertRec"] = "1";
                divConfermaAlert.Visible = true;
                divConfermaAlert.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                lblAlert.Text = "WARNING: Inserire i criteri di Inclusione e Esclusione!";
            }
            else
            {
                if (Session["CriteriSOD"].ToString() == "NO")
                {
                    lblAlert.Text = "WARNING: Il paziente è escluso dallo studio perche' non soddisfa i criteri di \nInclusione e Esclusione!<br/>Impossibile aggiornare i dati.";
                    Session["alertRec"] = "1";
                    Session["lnkMenu"] = pagina;
                    divConfermaAlert.Visible = true;
                    divConfermaAlert.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                }else
                {
                    Response.Redirect(pagina+"?semid="+e.CommandArgument.ToString()+"&Pagina="+e.CommandName.ToString());
                }
            }
        }
        else
        {
            Response.Redirect(pagina+"?semid="+e.CommandArgument.ToString()+"&Pagina="+e.CommandName.ToString());
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
            " INNER JOIN prform ON (prstat.FORMID = prform.FORMID) Where subjid=" + Session["IdPaziente"] + " And TipVisId=1 And prstat.FORMID<>0 order by orderform";
        SqlTIPVISF.DataBind();
        rptTipVisF.DataBind();
    }

    protected void btnSaveFreeze_OnClick(object sender, EventArgs e)
    {
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
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
        if (i == contFreeze)
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
            " INNER JOIN prform ON (prstat.FORMID = prform.FORMID) Where subjid=" + Session["IdPaziente"] + " And TipVisId=1 And prstat.FORMID<>0 order by orderform"; 
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
                    sql = "Update PrStat set SEMID=5 where SUBJID=" + Session["IdPaziente"].ToString() + " And TIPVISID=1 And FORMID=" + FORMID.Value + " And SemID=6";
                }
                MySqlCommand cmd = new MySqlCommand(sql, cn);
                cmd.ExecuteNonQuery();
            }

        }
        if (i == contLock)
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