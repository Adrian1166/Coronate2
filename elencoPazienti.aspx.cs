using System;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;
using iTextSharp.text.pdf;
using iTextSharp.text;
public partial class ssl_elencoPazienti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        Session["alertRec"] = "0";
        Session["deleteRecAlphaCode"] = "0";
        Session["deleteRecQuestionPaziente"] = "0";
        SqlPaziente.SelectCommand = "SELECT DateVisit," +
              "tbpazienti.IdPaziente," +
              "tbpazienti.NumPaz,Age,gender," +
              "tbpazienti.DataConsenso,AlphaCode,UrlDiretto,IdQuestionPaziente,IdQuestionPazienteReset,IdQuestionPartner,TbQuestionPazienteReset.DAG3 as DAG3Reset,TbQuestionPaziente.DAG3,IdQuestionMLCDP,IdquestionBriefCOPE" +
            " FROM " +
             " tbpazienti left join TbQuestionPaziente on tbpazienti.IdPaziente= TbQuestionPaziente.IdPaziente" +
             " left join TbQuestionPazienteReset on tbpazienti.IdPaziente= TbQuestionPazienteReset.IdPaziente" +
             " left join TbQuestionPartner on tbpazienti.IdPaziente= TbQuestionPartner.IdPaziente" +
             " left join TbQuestionMLCDP on tbpazienti.IdPaziente= TbQuestionMLCDP.IdPaziente" +
             " left join tbquestionBriefCOPE on tbpazienti.IdPaziente= tbquestionBriefCOPE.IdPaziente" +
             " WHERE" +
             "  TbPazienti.IdCentro=" + Session["IdCentro"] + " order by NumPaz";
        SqlPaziente.DataBind();
        grwPaziente.DataBind();
        
       
        
        if (IsPostBack) return;
        Session["GestioneFreeze"] = "0";
        if (Session["IdPaziente"] != null && grwPaziente.Rows.Count > 0)
        {
            for (int j = 0; j < grwPaziente.PageCount; j++)
            {
                grwPaziente.PageIndex = j;
                grwPaziente.DataBind();
                int i = 0;
                for (i = 0; i < grwPaziente.Rows.Count; i++)
                {
                    if (grwPaziente.DataKeys[i].Value.ToString() == Session["IdPaziente"].ToString())
                    {
                        grwPaziente.SelectedIndex = i;
                        break;
                    }
                }
                if (i < grwPaziente.Rows.Count)
                {
                    break;
                }
            }
        }
        else
        {
            if (grwPaziente.Rows.Count > 0)
            {
                grwPaziente.SelectedIndex = 0;
            }
        }

        
        Session["ConfermaQuestion"] = "0";
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=1&Form=elencoPazienti.aspx&IDTIPVIS=1&nomeVisit=&Pagina=&SemId=";
        //lnkGestioneQuery.Visible = false;
        
    }


    protected void frwQuestionCenter_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {

    }

    protected void frwQuestionCenter_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {

    }

    protected void btnNuovo_Click(object sender, EventArgs e)
    {
        string NumPaz = "00";
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        
        sql = "Select numpaz from tbpazienti where idcentro=" + Session["idcentro"]+" order by numpaz desc";
        MySqlCommand cmdci = new MySqlCommand(sql, cn);
        MySqlDataReader rdrci = cmdci.ExecuteReader();
        if (rdrci.HasRows)
        {
            rdrci.Read();
            NumPaz = rdrci[0].ToString().Substring(rdrci[0].ToString().IndexOf("-") + 1);
        }
        rdrci.Close();
        cn.Close();
        Session["DCEn"] = null;
        Session["DateVisit"] = null;
        Response.Redirect("nuovoPaziente.aspx?idpaziente=0&NumPaz=" + NumPaz);
    }

    
    protected void lnkStampa_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        //Response.Redirect("visita.aspx");
    }

    protected void ApriAlphaCode(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkApp = grwPaziente.Rows[i].FindControl("lnkApp") as LinkButton;
            if (lnkApp.ClientID == lnk.ClientID)
            {
                lblNumPaz.Text = grwPaziente.Rows[i].Cells[1].Text;
                lblAlphaCode.Text = grwPaziente.DataKeys[i].Values[2].ToString();
                lblUrlDiretto.Text = grwPaziente.DataKeys[i].Values[3].ToString();
                aUrlDiretto.HRef = grwPaziente.DataKeys[i].Values[3].ToString();
                divAlphaCode.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 400) / 2) + "px";
                divAlphaCode.Visible = true;
                Session["deleteRecAlphaCode"] = "1";
                break;
            }
        }
    }

    protected void ApriQuestionnaire(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkCoronate = grwPaziente.Rows[i].FindControl("lnkCoronate") as LinkButton;
            if (lnkCoronate.ClientID == lnk.ClientID)
            {
                lblNumPazQ.Text = grwPaziente.Rows[i].Cells[1].Text;
                SqlQuestionPaziente.SelectCommand = "Select * from TbQuestionPaziente where IdPaziente=" + grwPaziente.DataKeys[i].Values[0].ToString();
                SqlQuestionPaziente.DataBind();
                frwQuestionPaziente.ChangeMode(FormViewMode.Edit);
                frwQuestionPaziente.DataBind();
                divQuestionPaziente.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 800) / 2) + "px";
                divQuestionPaziente.Style["top"] = "20px";
                divQuestionPaziente.Visible = true;
                Session["deleteRecQuestionPaziente"] = "1";
                break;
            }
        }
    }

    protected void ApriQuestionnaireR(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkCoronate = grwPaziente.Rows[i].FindControl("lnkCoronateR") as LinkButton;
            if (lnkCoronate.ClientID == lnk.ClientID)
            {
                lblNumPazQ.Text = grwPaziente.Rows[i].Cells[1].Text;
                SqlQuestionPazienteReset.SelectCommand = "Select * from TbQuestionPazienteReset where IdPaziente=" + grwPaziente.DataKeys[i].Values[0].ToString();
                SqlQuestionPazienteReset.DataBind();
                frwQuestionPazienteReset.ChangeMode(FormViewMode.Edit);
                frwQuestionPazienteReset.DataBind();
                divQuestionPazienteReset.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 800) / 2) + "px";
                divQuestionPazienteReset.Style["top"] = "20px";
                divQuestionPazienteReset.Visible = true;
                Session["deleteRecQuestionPazienteReset"] = "1";
                break;
            }
        }
    }
    protected void ApriQuestionnaireP(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkPartner = grwPaziente.Rows[i].FindControl("lnkPartner") as LinkButton;
            if (lnkPartner.ClientID == lnk.ClientID)
            {
                lblNumPazQ.Text = grwPaziente.Rows[i].Cells[1].Text;
                SqlQuestionPartner.SelectCommand = "Select * from TbQuestionPartner where IdPaziente=" + grwPaziente.DataKeys[i].Values[0].ToString();
                SqlQuestionPartner.DataBind();
                frwQuestionPartner.ChangeMode(FormViewMode.Edit);
                frwQuestionPartner.DataBind();
                divQuestionPartner.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 800) / 2) + "px";
                divQuestionPartner.Style["top"] = "20px";
                divQuestionPartner.Visible = true;
                Session["deleteRecQuestionPartner"] = "1";
                break;
            }
        }
    }
    protected void ApriQuestionnaireMLCDP(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkMLCDP = grwPaziente.Rows[i].FindControl("lnkMLCDP") as LinkButton;
            if (lnkMLCDP.ClientID == lnk.ClientID)
            {
                lblNumPazQMLCDP.Text = grwPaziente.Rows[i].Cells[1].Text;
                SqlQuestionMLCDP.SelectCommand = "Select * from TbQuestionMLCDP where IdPaziente=" + grwPaziente.DataKeys[i].Values[0].ToString();
                SqlQuestionMLCDP.DataBind();
                frwQuestionMLCDP.ChangeMode(FormViewMode.Edit);
                frwQuestionMLCDP.DataBind();
                divQuestionMLCDP.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 800) / 2) + "px";
                divQuestionMLCDP.Style["top"] = "20px";
                divQuestionMLCDP.Visible = true;
                Session["deleteRecQuestionMLCDP"] = "1";
                break;
            }
        }
    }

    protected void ApriQuestionnaireBriefCOPE(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            LinkButton lnkBriefCope = grwPaziente.Rows[i].FindControl("lnkBriefCOPE") as LinkButton;
            if (lnkBriefCope.ClientID == lnk.ClientID)
            {
                lblNumPazQBriefCope.Text = grwPaziente.Rows[i].Cells[1].Text;
                SqlQuestionBriefCope.SelectCommand = "Select * from TbQuestionBriefCOPE where IdPaziente=" + grwPaziente.DataKeys[i].Values[0].ToString();
                SqlQuestionBriefCope.DataBind();
                frwQuestionBriefCope.ChangeMode(FormViewMode.Edit);
                frwQuestionBriefCope.DataBind();
                divQuestionBriefCope.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 800) / 2) + "px";
                divQuestionBriefCope.Style["top"] = "20px";
                divQuestionBriefCope.Visible = true;
                Session["deleteRecQuestionBriefCope"] = "1";
                break;
            }
        }
    }
    
    protected string ControllaQuestionnaire(string idpaz)
    {
        string d = "#000000";
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select * from TbQuestionPaziente where IdPaziente==" + idpaz;
        MySqlCommand cmd1 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr = cmd1.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            if (rdr["DAG3"].ToString() != "")
            {
                if (Convert.ToInt16( rdr["DAG3"].ToString())>4)
                {
                    d = "#FF0000";
                }
            }
        }
        rdr.Close();
        cn.Close();
        return d;
    }
        protected void CloseAlphaCode_Click(object sender, EventArgs e)
    {
        divAlphaCode.Visible = false;
        Session["deleteRecAlphaCode"] = "0";
    }

    protected void CloseQuestionPaziente_Click(object sender, EventArgs e)
    {
        divQuestionPaziente.Visible = false;
        Session["deleteRecQuestionPaziente"] = "0";
    }
        protected void CloseQuestionMLCDP_Click(object sender, EventArgs e)
    {
        divQuestionMLCDP.Visible = false;
        Session["deleteRecQuestionMLCDP"] = "0";
    }
    protected void CloseQuestionBriefCOPE_Click(object sender, EventArgs e)
    {
        divQuestionBriefCope.Visible = false;
        Session["deleteRecQuestionBriefCOPE"] = "0";
    }
    protected void btnVaiCartella_Click()
    {
        Session["idPaziente"] = grwPaziente.DataKeys[grwPaziente.SelectedIndex].Values[0].ToString();
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        sql = "Select (CI1+CI2+CI3+CI4) as totinc,(CE1) as totesc from tbPazienti where idPaziente=" + Session["idPaziente"];
        MySqlCommand cmdci = new MySqlCommand(sql, cn);
        MySqlDataReader rdrci = cmdci.ExecuteReader();
        Session["CriteriSOD"] = "SI";
        Session["CriteriINS"] = "SI";
        if (rdrci.HasRows)
        {
            rdrci.Read();
            if (rdrci["totinc"].ToString() != "4") Session["CriteriSOD"] = "NO";
            if (rdrci["totesc"].ToString() != "2") Session["CriteriSOD"] = "NO";
        }
        else
        {
            Session["CriteriINS"] = "NO";
        }
        rdrci.Close();

        cn.Close();
        Response.Redirect("anagrafica.aspx?semid=0&Aggiornamento=NO");
    }


    protected void grwPaziente_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView grw = sender as GridView;
        Session["IdPaziente"] = grw.DataKeys[grw.SelectedIndex].Values[0].ToString();
        Session["NumPaz"] = grw.Rows[grw.SelectedIndex].Cells[1].Text;
        Session["DateVisit"] = grw.DataKeys[grw.SelectedIndex].Values[1].ToString();
        Session["DataConsenso"] = grw.Rows[grw.SelectedIndex].Cells[2].Text;
        Session["Age"] = grw.Rows[grw.SelectedIndex].Cells[3].Text;
        btnVaiCartella_Click();
    }



    protected void grwPaziente_PageIndexChanged(object sender, EventArgs e)
    {
        grwPaziente.SelectedIndex = 0;
        grwPaziente.DataBind();
        //grwPaziente_SelectedIndexChanged(grwPaziente, EventArgs.Empty);
    }


    protected void TaskGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView grw = sender as GridView;
        Session["IdPaziente"] = grw.DataKeys[e.NewEditIndex].Values[0].ToString();
        Session["NumPaz"] = grw.Rows[e.NewEditIndex].Cells[1].Text;
        Response.Redirect("nuovoPaziente.aspx?idpaziente=" + grw.DataKeys[e.NewEditIndex].Values[0].ToString() + "&NumPaz=" + grw.Rows[e.NewEditIndex].Cells[1].Text);
    }


    protected bool TrovaSemVisitaAltro(string idpaz)
    {
        bool pathSem = false;
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select SEMID from PrStat where subjid=" + idpaz + " and semid=3";
        MySqlCommand cmd3 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr2 = cmd3.ExecuteReader();

        if (rdr2.HasRows)
        {
            pathSem = true;
        }
        rdr2.Close();
        cn.Close();
        return pathSem;
    }

    protected string TrovaSemVisita(string visita, string idpaz,string tipvis, string tipopaz)
    {
        string pathSem = "";
        

            MySqlConnection cn;
            cn = new MySqlConnection(Session["pathDb"].ToString());
            cn.Open();
            string sql = "Select SEMID from PrStat where subjid=" + idpaz + " and semid=3 and TIPVISID=" + tipvis;
            MySqlCommand cmd3 = new MySqlCommand(sql, cn);
            MySqlDataReader rdr2 = cmd3.ExecuteReader();

            if (rdr2.HasRows)
            {
                pathSem = "~/images/sem3.png";
                rdr2.Close();
            }
            else
            {
                rdr2.Close();
            
                bool formUscita = true;
                sql = "SELECT * from tbpartner Where IdPaziente=" + idpaz;
                MySqlCommand cmdForm = new MySqlCommand(sql, cn);
                MySqlDataReader rdrForm = cmdForm.ExecuteReader();
                if (rdrForm.HasRows)
                {
                    rdrForm.Read();
                    if (rdrForm["ParticipateStudy"].ToString() != "1")
                    {
                        formUscita = false;
                    }
                }
                rdrForm.Close();

                sql = "Select PrStat.SEMID from PrStat where subjid=" + idpaz + " And (PrStat.semid=2 or PrStat.semid=0) and FormId<>0 "+(formUscita==false ? " and FormId<>10" : "") + " and TIPVISID=" + tipvis;
                
                MySqlCommand cmd1 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr = cmd1.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();

                    pathSem = "~/images/sem2.png";
                }
                else
                {
                    pathSem = "~/images/sem1.png";
                }
                rdr.Close();
                sql = "Select SEMID from PrStat where subjid=" + idpaz + " and FormId=0 and TIPVISID=" + tipvis;
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (rdr1.HasRows)
                {
                    rdr1.Read();
                    if (rdr1[0].ToString() == "5")
                    {
                        pathSem = "~/images/sem5.png";
                    }
                    if (rdr1[0].ToString() == "6")
                    {
                        pathSem = "~/images/lucchettomini.gif";
                    }
                }
                rdr1.Close();
            }
            cn.Close();
        
        return pathSem;
    }

    protected void grwPaziente_OnSorting(object sender, EventArgs e)
    {
        grwPaziente.SelectedIndex = -1;
        
    }

    protected bool ControllaQuery(string idpaz)
    {
        bool d = false;
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select SEMID from PrStat where subjid=" + idpaz + " And semid=3";
        MySqlCommand cmd1 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr = cmd1.ExecuteReader();
        d = rdr.HasRows;
        rdr.Close();
        cn.Close();
        return d;
    }

    protected void CloseDiv_Click(object sender, EventArgs e)
    {
        divConfermaAlert.Visible = false;
        Session["alertRec"] = "0";
    }
    protected void CloseQuestionPazienteReset_Click(object sender, EventArgs e)
    {
        divQuestionPazienteReset.Visible = false;
        Session["deleteRecQuestionPazienteReset"] = "0";
    }
    protected void CloseQuestionPartner_Click(object sender, EventArgs e)
    {
        divQuestionPartner.Visible = false;
        Session["deleteRecQuestionPartner"] = "0";
    }
    
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                if (tc.HasControls())
                {
                    // search for the header link 
                    LinkButton lnk = (LinkButton)tc.Controls[0];
                    if (lnk != null)
                    {
                        // inizialize a new image 
                        System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image(); // setting the dynamically URL of the image 
                        img.ImageUrl = "~/images/icon_" + (grwPaziente.SortDirection == SortDirection.Ascending ? "asc" : "desc") + ".gif"; // checking if the header link is the user's Coronate 
                        if (grwPaziente.SortExpression == lnk.CommandArgument)
                        { // adding a space and the image to the header link 

                            tc.Controls.Add(new LiteralControl(" "));
                            tc.Controls.Add(img);
                        }
                    }
                }
            }
        }
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
        SqlTIPVISF.SelectCommand = "SELECT NumPaz,tbPazienti.IdPaziente,prstat.SemID,DatiConfermati FROM tbPazienti left join prstat on " +
            " tbPazienti.IdPaziente = prstat.SubjId left join tbfirmapi on tbPazienti.IdPaziente = tbfirmapi.IdPaziente Where FORMID=0 And tbPazienti.IdCentro=" + Session["IdCentro"].ToString() + " order by NumPaz";
        SqlTIPVISF.DataBind();
        rptTipVisF.DataBind();
    }

    protected void ChiudiBoxFreeze(object sender, EventArgs e)
    {
        divGestioneFreeze.Visible = false;
        Session["GestioneFreeze"] = "0";
    }

    protected void btnSaveFreeze_OnClick(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            MySqlConnection cn;
            cn = new MySqlConnection(Session["pathDb"].ToString());
            cn.Open();
            string sql = "";
            string semForm0 = "0";
            int contFreeze = 0;
            int i = 0;
            for (i = 0; i < rptTipVisF.Items.Count; i++)
            {
                HiddenField IdPaziente = rptTipVisF.Items[i].FindControl("IdPaziente") as HiddenField;
                CheckBox chkFreezeForm = rptTipVisF.Items[i].FindControl("chkFreezeForm") as CheckBox;
                if (chkFreezeForm != null)
                {
                    if (chkFreezeForm.Checked == true)
                    {
                        sql = "Select * from  tbfirmaPI Where IdPaziente=" + IdPaziente.Value;
                        MySqlCommand cmdSel = new MySqlCommand(sql, cn);
                        MySqlDataReader rdrSel = cmdSel.ExecuteReader();
                        if (!rdrSel.HasRows)
                        {
                            rdrSel.Close();
                            sql = "Insert into tbfirmaPI (IdCentro,IdPaziente,DatiConfermati,SemId) values (" + Session["IdCentro"] + "," + IdPaziente.Value + "," + (chkFreezeForm.Checked == true ? "1" : "null") + ",1)";
                            MySqlCommand cmd = new MySqlCommand(sql, cn);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            rdrSel.Close();
                            sql = "Update tbfirmaPI set DatiConfermati=" + (chkFreezeForm.Checked == true ? "1" : "null") + " Where IdPaziente=" + IdPaziente.Value;
                            MySqlCommand cmd = new MySqlCommand(sql, cn);
                            cmd.ExecuteNonQuery();
                        }
                        //Response.Write(sql + "</br>");
                    }
                    contFreeze++;

                }
            }
            cn.Close();

            divGestioneFreeze.Visible = false;
            Session["GestioneFreeze"] = "0";
        }
    }

    protected void SqlTIPVISF_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        TotForm.Value = e.AffectedRows.ToString();
    }

    protected void PSWPI_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        TextBox PSWPI = rptTipVisF.Controls[rptTipVisF.Controls.Count - 1].FindControl("PSWPI") as TextBox;
        TextBox UserName = rptTipVisF.Controls[rptTipVisF.Controls.Count - 1].FindControl("UserName") as TextBox;
        Cripta crp = new Cripta();
        bool pswCorreto = false;
        Utility utility1 = new Utility();
        string ConnString1 = utility1.getStringConnection(Request.ApplicationPath);
        MySqlConnection cn1 = new MySqlConnection(ConnString1);
        cn1.Open();
        string sql = "Select * FROM TBUTENTE  where IdCentro=" + Session["IdCentro"] + " and Password1='" + crp.getMD5Hash(PSWPI.Text) + "' And PricipalInvest=1 And Utente='" + UserName.Text.Replace("'", "''") + "'";
        MySqlCommand cmd1 = new MySqlCommand(sql, cn1);
        MySqlDataReader rdr = cmd1.ExecuteReader();
        if (rdr.HasRows)
        {
            pswCorreto = true;
        }
        rdr.Close();
        cn1.Close();
        if (pswCorreto == false)
        {
            args.IsValid = false;
        }
    }
}
