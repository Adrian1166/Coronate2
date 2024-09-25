using System;
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

public partial class ssl_PreviousMedication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        SqlMenu.SelectCommand = "Select * from Prform where formid<>0 and vissual=1 order by orderform";
        SqlMenu.DataBind();
        frwMenu.DataBind();
        for (int i = 0; i < frwMenu.Items.Count; i++)
        {
            RepeaterItem r = frwMenu.Items[i];
            LinkButton lnk = r.FindControl("anagrafica") as LinkButton;
            if (lnk.ClientID == "frwMenu_anagrafica_4")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        CaricaPreviousMedication();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=8&Form=PreviousMedication.aspx&Pagina=PreviousMedication&nomeVisit=&IDTIPVIS=1&SemId=" + Request["SemId"].ToString();
    }

    protected void CaricaPreviousMedication()
    {
        if (IsPostBack) return;
        Session["deleteRec"] = "0";
        Session["alertRec"] = "0";
        Session["DaDove"] = "FORM";
        Session["ConfermaPatCom"] = "0";
        Session["ConfermaPatAxSpA"] = "0";
        SqlPreviousMedication.SelectCommand = "Select * from TbPreviousMedication where IdPaziente=" + Session["IdPaziente"].ToString() + " And IdTipVis=" + "1";
        SqlPreviousMedication.Select(DataSourceSelectArguments.Empty);
        SqlPreviousMedication.DataBind();
        frwPreviousMedication.DataBind();
        HiddenField IdCentro = frwPreviousMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwPreviousMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdTipVis = frwPreviousMedication.FindControl("IdTipVis") as HiddenField;
        IdTipVis.Value = "1";
        HiddenField IdPreviousMedication = frwPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
        Button btnSalva = frwPreviousMedication.FindControl("btnSalva") as Button;
        Button btnElimina = frwPreviousMedication.FindControl("btnElimina") as Button;
        if (IdPreviousMedication.Value != "")
        {
            //btnSalva.CommandName = "Update";
            btnElimina.Visible = false;
        }
        else
        {
            //btnSalva.CommandName = "Insert";
            btnElimina.Visible = false;
        }
        RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        Button btnNuovo1 = frwPreviousMedication.FindControl("btnNuovo1") as Button;
        if (PreviousMedication.SelectedValue == "1")
        {
            btnNuovo1.Visible = true;
        }
        else
        {
            btnNuovo1.Visible = false;
        }
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "8");
        Label lblAggiornamento = frwPreviousMedication.FindControl("lblAggiornamento") as Label;
        lblAggiornamento.Visible = false;
        if (Request["msgVis"] != null)
        {
            if (Request["msgVis"].ToString() == "SI")
            {
                lblAggiornamento.Visible = true;
            }
        }
        removeRadioNull();
        CaricaElencoPatologie();
    }

    protected void SqlPreviousMedication_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwPreviousMedication.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwPreviousMedication.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void frwPreviousMedication_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwPreviousMedication_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("UPDATE");
            }
        }
    }

    protected void removeRadioNull()
    {
        RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        PreviousMedication.Items.RemoveAt(2);
    }

    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        string semId = "1";
        RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
        if (PreviousMedication.SelectedValue == "1" && grwElencoConc.Rows.Count == 0) semId = "2";
        HiddenField IdPreviousMedication = frwPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
        if (IdPreviousMedication.Value == "" || IdPreviousMedication.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID( "TbPreviousMedication", "IdPreviousMedication", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdPreviousMedication.Value;
        }
        AuditTrial at = new AuditTrial();
        at.getAuditTrial( "PreviousMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPreviousMedication", valCI, operazione,"");

        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "8", semId);
        //Utility utility = new Utility();
        //string ConnString = utility.getStringConnection(Request.ApplicationPath);
        //MySqlConnection cn = new MySqlConnection(ConnString);
        //cn.Open();
        //string sql = "Select PreviousTreatment from tbmedicalhistory where idPaziente=" + Session["idPaziente"];
        //MySqlCommand cmd2 = new MySqlCommand(sql, cn);
        //MySqlDataReader rdr1 = cmd2.ExecuteReader();
        //string PreviousTreatment = "0";
        //if (rdr1.HasRows)
        //{
        //    rdr1.Read();
        //    PreviousTreatment = rdr1[0].ToString();
        //}

        //rdr1.Close();
        //cn.Close();
        string msgVis = "NO";
        

        Response.Redirect("PreviousMedication.aspx?Aggiornamento=SI&SemID=" + semId + "&msgVis=" + msgVis);
        
    }

    protected void CaricaElencoPatologie()
    {
        GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
        SqlDataSource SqlElencoConc = frwPreviousMedication.FindControl("SqlElencoConc") as SqlDataSource;
        SqlElencoConc.SelectCommand = "Select IdPreviousMedication,TreatmentPso as Treatment, " +
                "concat(StartDateMM,'/',StartDateYY) as StartDate,concat(EndDateMM,'/',EndDateYY) as EndDate from tbPreviousMedication Left join lsTreatmentPso on tbPreviousMedication.IdTreatmentPso=lsTreatmentPso.IdTreatmentPso" +
                " where IdPaziente=" + Session["IdPaziente"].ToString() + " And IdTipVis=" + "1" + " and StartDateMM is not null order by 1";
        SqlElencoConc.DataBind();
        grwElencoConc.DataBind();
        RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        Button btnSalva = frwPreviousMedication.FindControl("btnSalva") as Button;
        Button btnElimina = frwPreviousMedication.FindControl("btnElimina") as Button;
        //Response.Write(SqlElencoConc.SelectCommand);
        if (grwElencoConc.Rows.Count > 0)
        {
            PreviousMedication.SelectedValue = "1";
            btnElimina.Visible = false;
            btnSalva.Visible = false;
        }
        else
        {
            //btnNuovo1.Visible = false;
        }
        PreviousMedication.Items[0].Enabled = (grwElencoConc.Rows.Count == 0);
        PreviousMedication.Items[1].Enabled = (grwElencoConc.Rows.Count == 0);
        divGestPreviousMedication.Visible = false;
        Session["ConfermaPatCom"] = "0";
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = false;
        lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
        Session["nomeForm"] = "PreviousMedication";
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        if (Session["nomeForm"].ToString() == "PreviousMedication")
        {
            HiddenField IdPreviousMedication = frwPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("PreviousMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idPreviousMedication", IdPreviousMedication.Value, "DELETE","");

            SqlPreviousMedication.DeleteCommand = "Delete from tbPreviousMedication where IdPaziente=" + Session["IdPaziente"].ToString();
            SqlPreviousMedication.Delete();

            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            AggiornaStato aggs = new AggiornaStato();
            aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "8", "0");
            Response.Redirect("PreviousMedication.aspx?Aggiornamento=&SemID=0");
        }
        else
        {
            HiddenField IdPreviousMedication = frwPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("PreviousMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idPreviousMedication", IdPreviousMedication.Value, "DELETE","");

            SqlPreviousMedication.DeleteCommand = "Delete from tbPreviousMedication where IdPreviousMedication=" + IdPreviousMedication.Value;
            SqlPreviousMedication.Delete();
            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            divGestPreviousMedication.Visible = false;
            Session["ConfermaPatCom"] = "0";
            GridView grwElencoConc= frwPreviousMedication.FindControl("grwElencoConc") as GridView;
            if (grwElencoConc.Rows.Count == 1)
            {
                AggiornaStato aggs = new AggiornaStato();
                aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "8", "2");
            }
            Response.Redirect("PreviousMedication.aspx?SemID=1&Aggiornamento=");
        }
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    protected void grwElencoConc_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView grw = sender as GridView;
        frwGestPreviousMedication.ChangeMode(FormViewMode.Edit);
        SqlGestPreviousMedication.SelectCommand = "Select * from TbPreviousMedication where IdPreviousMedication=" + grw.DataKeys[grw.SelectedIndex].Value.ToString();
        SqlGestPreviousMedication.DataBind();
        frwGestPreviousMedication.DataBind();
        Session["ConfermaPatCom"] = "1";
        divGestPreviousMedication.Visible = true;
        divGestPreviousMedication.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        HiddenField IdCentro = frwGestPreviousMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwGestPreviousMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdPreviousMedication = frwGestPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
        Button btnElimina = frwGestPreviousMedication.FindControl("btnElimina") as Button;
        btnElimina.Visible = true;
        
        TextBox DataVisita = frwGestPreviousMedication.FindControl("DataVisita") as TextBox;
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwGestPreviousMedication.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwGestPreviousMedication.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = true;
        rfvMotivoModifica.Enabled = true;
    }
    
    protected void grwElencoConc_OnSorting(object sender, EventArgs e)
    {
        CaricaElencoPatologie();
    }

    protected void prendiData(string strData, string data, FormView frw)
    {
        TextBox dt = frw.FindControl(data) as TextBox;
        if (dt.Text == "//") dt.Text = "";
        if (dt.Text != "")
        {
            DropDownList giorno = frw.FindControl(strData + "DD") as DropDownList;
            DropDownList mese = frw.FindControl(strData + "MM") as DropDownList;
            DropDownList anno = frw.FindControl(strData + "YY") as DropDownList;
            giorno.SelectedValue = dt.Text.Substring(0, 2);
            mese.SelectedValue = dt.Text.Substring(3, 2);
            anno.SelectedValue = dt.Text.Substring(6, 4);
            dt.Text = dt.Text.Replace("UK", "01");
        }

    }

    protected void AbilitareTer(object sender, EventArgs e)
    {
        //HtmlContainerControl divElencoTer1 = frwPreviousMedication.FindControl("divElencoTer1") as HtmlContainerControl;
        //RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        //divElencoTer1.Visible = (PreviousMedication.SelectedValue == "1");
    }

    protected void btnNuovaPreviousMedication_Click(object sender, EventArgs e)
    {
        bool primo = false;
        GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
        if (grwElencoConc.Rows.Count == 0)
        {
            primo = true;
        }

        frwGestPreviousMedication.ChangeMode(FormViewMode.Insert);
        SqlGestPreviousMedication.SelectCommand = "Select * from TbPreviousMedication" +
           " WHERE " + (primo == true ? "IdPaziente=" + Session["IdPaziente"].ToString() : " IdPreviousMedication = 0");
        SqlGestPreviousMedication.DataBind();
        frwGestPreviousMedication.DataBind();
        
        divGestPreviousMedication.Visible = true;
        Session["ConfermaPatCom"] = "1";
        divGestPreviousMedication.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";

        HiddenField IdCentro = frwGestPreviousMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwGestPreviousMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField SemId = frwGestPreviousMedication.FindControl("SemId") as HiddenField;
        SemId.Value = "1";
        Button btnElimina = frwGestPreviousMedication.FindControl("btnElimina") as Button;
        btnElimina.Visible = false;
       
        TextBox DataVisita = frwGestPreviousMedication.FindControl("DataVisita") as TextBox;
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwGestPreviousMedication.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwGestPreviousMedication.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
    }

    protected void SqlGestPreviousMedication_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwGestPreviousMedication.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwGestPreviousMedication.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {

        if (Session["IdCentro"].ToString() != null)
        {
            GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
            RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
            HiddenField SemID = frwPreviousMedication.FindControl("SemID") as HiddenField;
            SemID.Value = "1";
            if (PreviousMedication.SelectedValue == "1" && grwElencoConc.Rows.Count == 0) SemID.Value = "2";
            HiddenField IdPreviousMedication = frwPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
            if (IdPreviousMedication.Value != "")
            {
                frwPreviousMedication.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from TBPreviousMedication where idPaziente=" + Session["idPaziente"];
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwPreviousMedication.InsertItem(false);
                }
                else
                {
                    rdr1.Close();
                    cn.Close();
                }
            }
        }
    }

    protected void btnSalvaPatConc_Click(object sender, CommandEventArgs e)
    {
        if (Page.IsValid)
        {
            bool primo = false;
            string tabella = e.CommandArgument.ToString();
            GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
            if (grwElencoConc.Rows.Count == 0)
            {
                primo = true;
            }
            HiddenField IdPreviousMedication = frwGestPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
            DropDownList IdTreatmentPso = frwGestPreviousMedication.FindControl("IdTreatmentPso") as DropDownList;
            DropDownList EndDateMM = frwGestPreviousMedication.FindControl("EndDateMM") as DropDownList;
            DropDownList StartDateMM = frwGestPreviousMedication.FindControl("StartDateMM") as DropDownList;
            TextBox OtherTreatment = frwGestPreviousMedication.FindControl("OtherTreatment") as TextBox;
            TextBox EndDateYY = frwGestPreviousMedication.FindControl("EndDateYY") as TextBox;
            TextBox StartDateYY = frwGestPreviousMedication.FindControl("StartDateYY") as TextBox;
            string sql = "";
            if (IdPreviousMedication.Value != "" || primo == true)
            {
                sql = "UPDATE TbPreviousMedication SET  IdTreatmentPso=" + IdTreatmentPso.SelectedValue + ",  " +
                    "EndDateYY=" + EndDateYY.Text + "," + "EndDateMM='" + EndDateMM.SelectedValue + "'," +
                    "StartDateYY=" + StartDateYY.Text + ",StartDateMM='" + StartDateMM.SelectedValue + "',SemID=1";

                sql = sql + " WHERE " + (primo == true ? "IdPaziente=" + Session["IdPaziente"].ToString() : " IdPreviousMedication = " + IdPreviousMedication.Value);
                //Response.Write(sql);
                SqlGestPreviousMedication.UpdateCommand = sql;
                frwGestPreviousMedication.UpdateItem(false);
            }
            else
            {
                sql = "INSERT INTO TbPreviousMedication (IdCentro, IdPaziente, IdTipVis, IdTreatmentPso, " +
                        " StartDateMM,StartDateYY,EndDateMM,EndDateYY,SemID)" +
                        " Values (" + Session["IdCentro"] + "," + Session["IdPaziente"] + ", " + "1" + "," + IdTreatmentPso.SelectedValue +
                        ",'" + StartDateMM.SelectedValue + "'," + StartDateYY.Text + ",'" + EndDateMM.SelectedValue + "'," + EndDateYY.Text + ",1)";
                                
                //Response.Write(sql);
                SqlGestPreviousMedication.InsertCommand = sql;
                frwGestPreviousMedication.InsertItem(false);
            }
        }
    }

    protected void frwGestPreviousMedication_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiConc("INSERT", "Conc");
            }
        }
    }

    protected void frwGestPreviousMedication_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiConc("UPDATE", "Conc");
            }
        }
    }

    protected void controllaCampiConc(string operazione, string tabella)
    {
        string valCI = "";
        HiddenField IdPreviousMedication = frwGestPreviousMedication.FindControl("IdPreviousMedication") as HiddenField;
        if (IdPreviousMedication.Value == "" || IdPreviousMedication.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("TbPreviousMedication", "IdPreviousMedication", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdPreviousMedication.Value;
        }
        TextBox MotivoModifica = frwGestPreviousMedication.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("PreviousMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPreviousMedication", valCI, operazione, MotivoModifica.Text);
        
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato( Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "8", "1");
        CaricaElencoPatologie();
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridView grw = sender as GridView;
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
                        GridView grwElencoConc = frwPreviousMedication.FindControl("grwElencoConc") as GridView;
                        // inizialize a new image 
                        System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image(); // setting the dynamically URL of the image 
                        img.ImageUrl = "~/images/icon_" + (grw.SortDirection == SortDirection.Ascending ? "asc" : "desc") + ".gif"; // checking if the header link is the user's Coronate 
                        if (grw.SortExpression == lnk.CommandArgument)
                        { // adding a space and the image to the header link 

                            tc.Controls.Add(new LiteralControl(" "));
                            tc.Controls.Add(img);
                        }
                    }
                }
            }
        }
    }

    protected void ControllaAltro(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        DropDownList EndDateMM = frwGestPreviousMedication.FindControl("EndDateMM") as DropDownList;
        DropDownList StartDateMM = frwGestPreviousMedication.FindControl("StartDateMM") as DropDownList;
        TextBox OtherTreatment = frwGestPreviousMedication.FindControl("OtherTreatment") as TextBox;
        TextBox EndDateYY = frwGestPreviousMedication.FindControl("EndDateYY") as TextBox;
        TextBox StartDateYY = frwGestPreviousMedication.FindControl("StartDateYY") as TextBox;
        x.ErrorMessage = "";
        if (Convert.ToInt16(StartDateYY.Text) > DateTime.Today.Year)
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>Start date</b> cannot be after the current date.</br>";
        }
        if (Convert.ToInt16(StartDateYY.Text) == DateTime.Today.Year)
        {
            if (StartDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(StartDateMM.SelectedValue) > DateTime.Today.Month)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Start date</b> cannot be after the current date.</br>";
                }
            }
        }
        if (Convert.ToInt16(EndDateYY.Text) > DateTime.Today.Year)
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>End date</b> cannot be after the current date.</br>";
        }
        if (Convert.ToInt16(EndDateYY.Text) == DateTime.Today.Year)
        {
            if (EndDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(EndDateMM.SelectedValue) > DateTime.Today.Month)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>End date</b> cannot be after the current date.</br>";
                }
            }
        }
        if (Convert.ToInt16(StartDateYY.Text) > Convert.ToInt16(EndDateYY.Text))
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Start date</b> cannot be after the <b>End date</b>.</br>";
        }
        if (Convert.ToInt16(StartDateYY.Text) == Convert.ToInt16(EndDateYY.Text))
        {
            if (StartDateMM.SelectedValue != "UK" && EndDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(StartDateMM.Text) > Convert.ToInt16(EndDateMM.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Start date</b> cannot be after the <b>End date</b>.</br>";
                }
            }
        }
        TextBox DataVisita = frwGestPreviousMedication.FindControl("DataVisita") as TextBox;
        if (Convert.ToInt16(StartDateYY.Text) > Convert.ToInt16(DataVisita.Text.Substring(6)))
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Start date</b> cannot be after the <b>Visit date</b>.</br>";
        }
        if (Convert.ToInt16(StartDateYY.Text) == Convert.ToInt16(DataVisita.Text.Substring(6)))
        {
            if (StartDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(StartDateMM.Text) > Convert.ToInt16(DataVisita.Text.Substring(3, 2)))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Start date</b> cannot be after the <b>Visit date</b>.</br>";
                }
            }
        }
        if (Convert.ToInt16(EndDateYY.Text) > Convert.ToInt16(DataVisita.Text.Substring(6)))
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>End date</b> cannot be after the <b>Visit date</b>.</br>";
        }
        if (Convert.ToInt16(EndDateYY.Text) == Convert.ToInt16(DataVisita.Text.Substring(6)))
        {
            if (EndDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(EndDateMM.Text) > Convert.ToInt16(DataVisita.Text.Substring(3,2)))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>End date</b> cannot be after the <b>Visit date</b>.</br>";
                }
            }
        }
       
    }

    protected void ControllaNaive(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList PreviousMedication = frwPreviousMedication.FindControl("PreviousMedication") as RadioButtonList;
        x.ErrorMessage = "";
        
    }
}
