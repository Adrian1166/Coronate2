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

public partial class ssl_CurrentMedication : System.Web.UI.Page
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
            if (lnk.ClientID == "frwMenu_anagrafica_3")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        CaricaCurrentMedication();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=4&Form=CurrentMedication.aspx&Pagina=CurrentMedication&nomeVisit=&IDTIPVIS=1&SemId=" + Request["SemId"].ToString();
    }

    protected void CaricaCurrentMedication()
    {
        if (IsPostBack) return;
        Session["deleteRec"] = "0";
        Session["alertRec"] = "0";
        Session["DaDove"] = "FORM";
        Session["ConfermaPatCom"] = "0";
        Session["ConfermaPatAxSpA"] = "0";
        SqlCurrentMedication.SelectCommand = "Select * from TbCurrentMedication where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlCurrentMedication.Select(DataSourceSelectArguments.Empty);
        SqlCurrentMedication.DataBind();
        frwCurrentMedication.DataBind();
        HiddenField IdCentro = frwCurrentMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwCurrentMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdTipVis = frwCurrentMedication.FindControl("IdTipVis") as HiddenField;
        IdTipVis.Value = "1";
        HiddenField IdCurrentMedication = frwCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
        Button btnSalva = frwCurrentMedication.FindControl("btnSalva") as Button;
        Button btnElimina = frwCurrentMedication.FindControl("btnElimina") as Button;
        if (IdCurrentMedication.Value != "")
        {
            //btnSalva.CommandName = "Update";
            btnElimina.Visible = false;
        }
        else
        {
            //btnSalva.CommandName = "Insert";
            btnElimina.Visible = false;
        }
        RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        Button btnNuovo1 = frwCurrentMedication.FindControl("btnNuovo1") as Button;
        if (CurrentMedication.SelectedValue == "1")
        {
            btnNuovo1.Visible = true;
        }
        else
        {
            btnNuovo1.Visible = false;
        }
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "4");
        Label lblAggiornamento = frwCurrentMedication.FindControl("lblAggiornamento") as Label;
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

    protected void SqlCurrentMedication_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwCurrentMedication.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwCurrentMedication.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void frwCurrentMedication_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwCurrentMedication_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        CurrentMedication.Items.RemoveAt(2);
    }

    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        string semId = "1";
        RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
        if (CurrentMedication.SelectedValue == "1" && grwElencoConc.Rows.Count == 0) semId = "2";
        HiddenField IdCurrentMedication = frwCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
        if (IdCurrentMedication.Value == "" || IdCurrentMedication.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID( "TbCurrentMedication", "IdCurrentMedication", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdCurrentMedication.Value;
        }
        AuditTrial at = new AuditTrial();
        at.getAuditTrial( "CurrentMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdCurrentMedication", valCI, operazione,"");

        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "4", semId);
 
        string msgVis = "NO";


        Response.Redirect("CurrentMedication.aspx?Aggiornamento=SI&SemID=" + semId + "&msgVis=" + msgVis);
        
    }

    protected void CaricaElencoPatologie()
    {
        GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
        SqlDataSource SqlElencoConc = frwCurrentMedication.FindControl("SqlElencoConc") as SqlDataSource;
        SqlElencoConc.SelectCommand = "Select IdCurrentMedication, TreatmentPso as Treatment, " +
                "StartDate,if(Dose=1,'Standard dose',if(Dose=2,'Increased dose',if(Dose=3,'Decreased dose',''))) as newDose,if(Frequency=1,'Standard frequency',if(Frequency=2,'Increased frequency',if(Frequency=3,'Decreased frequency',''))) as newFrequency from tbCurrentMedication Left join lsTreatmentPso on tbCurrentMedication.IdTreatmentPso=lsTreatmentPso.IdTreatmentPso" +
                " where IdPaziente=" + Session["IdPaziente"].ToString() + " And IdTipVis=" + "1" + " and StartDate is not null order by 1";
        SqlElencoConc.DataBind();
        grwElencoConc.DataBind();
        RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        Button btnSalva = frwCurrentMedication.FindControl("btnSalva") as Button;
        Button btnElimina = frwCurrentMedication.FindControl("btnElimina") as Button;
        Button btnNuovo1 = frwCurrentMedication.FindControl("btnNuovo1") as Button;
        //Response.Write(SqlElencoConc.SelectCommand);
        if (grwElencoConc.Rows.Count > 0)
        {
            CurrentMedication.SelectedValue = "1";
            btnElimina.Visible = false;
            btnSalva.Visible = false;
            btnNuovo1.Visible = true;
        }
        else
        {
            //btnNuovo1.Visible = false;
        }
        CurrentMedication.Items[0].Enabled = (grwElencoConc.Rows.Count == 0);
        CurrentMedication.Items[1].Enabled = (grwElencoConc.Rows.Count == 0);
        divGestCurrentMedication.Visible = false;
        Session["ConfermaPatCom"] = "0";
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = false;
        lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
        Session["nomeForm"] = "CurrentMedication";
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        if (Session["nomeForm"].ToString() == "CurrentMedication")
        {
            HiddenField IdCurrentMedication = frwCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("CurrentMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idCurrentMedication", IdCurrentMedication.Value, "DELETE","");

            SqlCurrentMedication.DeleteCommand = "Delete from tbCurrentMedication where IdPaziente=" + Session["IdPaziente"].ToString();
            SqlCurrentMedication.Delete();

            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            AggiornaStato aggs = new AggiornaStato();
            aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "4", "0");
            Response.Redirect("CurrentMedication.aspx?Aggiornamento=&SemID=0");
        }
        else
        {
            HiddenField IdCurrentMedication = frwCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("CurrentMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idCurrentMedication", IdCurrentMedication.Value, "DELETE","");

            SqlCurrentMedication.DeleteCommand = "Delete from tbCurrentMedication where IdCurrentMedication=" + IdCurrentMedication.Value;
            SqlCurrentMedication.Delete();
            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            divGestCurrentMedication.Visible = false;
            Session["ConfermaPatCom"] = "0";
            GridView grwElencoConc= frwCurrentMedication.FindControl("grwElencoConc") as GridView;
            if (grwElencoConc.Rows.Count == 1)
            {
                AggiornaStato aggs = new AggiornaStato();
                aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "4", "2");
            }
            Response.Redirect("CurrentMedication.aspx?SemID=1&Aggiornamento=");
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
        frwGestCurrentMedication.ChangeMode(FormViewMode.Edit);
        SqlGestCurrentMedication.SelectCommand = "Select * from TbCurrentMedication where IdCurrentMedication=" + grw.DataKeys[grw.SelectedIndex].Value.ToString();
        SqlGestCurrentMedication.DataBind();
        frwGestCurrentMedication.DataBind();
        Session["ConfermaPatCom"] = "1";
        divGestCurrentMedication.Visible = true;
        divGestCurrentMedication.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        HiddenField IdCentro = frwGestCurrentMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwGestCurrentMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdCurrentMedication = frwGestCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
        Button btnElimina = frwGestCurrentMedication.FindControl("btnElimina") as Button;
        btnElimina.Visible = true;
        
        TextBox DataVisita = frwGestCurrentMedication.FindControl("DataVisita") as TextBox;
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwGestCurrentMedication.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwGestCurrentMedication.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = true;
        rfvMotivoModifica.Enabled = true;
        Label lblWorsening = frwCurrentMedication.FindControl("lblWorsening") as Label;
        lblWorsening.Visible = false;
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
        //HtmlContainerControl divElencoTer1 = frwCurrentMedication.FindControl("divElencoTer1") as HtmlContainerControl;
        //RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        //divElencoTer1.Visible = (CurrentMedication.SelectedValue == "1");
    }

    protected void btnNuovaCurrentMedication_Click(object sender, EventArgs e)
    {
        bool primo = false;
        GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
        if (grwElencoConc.Rows.Count == 0)
        {
            primo = true;
        }

        frwGestCurrentMedication.ChangeMode(FormViewMode.Insert);
        SqlGestCurrentMedication.SelectCommand = "Select * from TbCurrentMedication" +
           " WHERE " + (primo == true ? "IdPaziente=" + Session["IdPaziente"].ToString() : " IdCurrentMedication = 0");
        SqlGestCurrentMedication.DataBind();
        frwGestCurrentMedication.DataBind();
        
        divGestCurrentMedication.Visible = true;
        Session["ConfermaPatCom"] = "1";
        divGestCurrentMedication.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";

        HiddenField IdCentro = frwGestCurrentMedication.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwGestCurrentMedication.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField SemId = frwGestCurrentMedication.FindControl("SemId") as HiddenField;
        SemId.Value = "1";
        Button btnElimina = frwGestCurrentMedication.FindControl("btnElimina") as Button;
        btnElimina.Visible = false;
       
        TextBox DataVisita = frwGestCurrentMedication.FindControl("DataVisita") as TextBox;
        
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwGestCurrentMedication.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwGestCurrentMedication.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
        Label lblWorsening = frwCurrentMedication.FindControl("lblWorsening") as Label;
        lblWorsening.Visible = false;
    }

    protected void SqlGestCurrentMedication_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwGestCurrentMedication.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwGestCurrentMedication.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {

        if (Session["IdCentro"] != null)
        {
            GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
            RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
            HiddenField SemID = frwCurrentMedication.FindControl("SemID") as HiddenField;
            SemID.Value = "1";
            if (CurrentMedication.SelectedValue == "1" && grwElencoConc.Rows.Count == 0) SemID.Value = "2";
            HiddenField IdCurrentMedication = frwCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
            if (IdCurrentMedication.Value != "")
            {
                frwCurrentMedication.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from TBCurrentMedication where idPaziente=" + Session["idPaziente"];
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwCurrentMedication.InsertItem(false);
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
        if (Session["IdCentro"] != null && Page.IsValid)
        {
            bool primo = false;
            string tabella = e.CommandArgument.ToString();
            GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
            if (grwElencoConc.Rows.Count == 0)
            {
                primo = true;
            }
            HiddenField IdCurrentMedication = frwGestCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
            DropDownList IdTreatmentPso = frwGestCurrentMedication.FindControl("IdTreatmentPso") as DropDownList;
            TextBox OtherTreatment = frwGestCurrentMedication.FindControl("OtherTreatment") as TextBox;
            DropDownList Dose = frwGestCurrentMedication.FindControl("Dose") as DropDownList;
            DropDownList Frequency = frwGestCurrentMedication.FindControl("Frequency") as DropDownList;
            TextBox StartDate = frwGestCurrentMedication.FindControl("StartDate") as TextBox;
            string sql = "";
            if (IdCurrentMedication.Value != "" || primo == true)
            {
                sql = "UPDATE TbCurrentMedication SET  IdTreatmentPso=" + IdTreatmentPso.SelectedValue + ", " +
                       "StartDate=" + (StartDate.Text == "" ? "null" : "'" + String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(StartDate.Text)) + "'") + ",SemID=1,Dose=" + Dose.SelectedValue + ",Frequency=" + Frequency.SelectedValue;

                sql = sql + " WHERE " + (primo == true ? "IdPaziente=" + Session["IdPaziente"].ToString() : " IdCurrentMedication = " + IdCurrentMedication.Value);
                //Response.Write(sql);
                SqlGestCurrentMedication.UpdateCommand = sql;
                frwGestCurrentMedication.UpdateItem(false);
            }
            else
            {
                sql = "INSERT INTO TbCurrentMedication (IdCentro, IdPaziente, IdTipVis, IdTreatmentPso," +
                        " StartDate,Dose,Frequency,SemID)" +
                        " Values (" + Session["IdCentro"] + "," + Session["IdPaziente"] + ", " + "1" + "," + IdTreatmentPso.SelectedValue + "," +
                        (StartDate.Text == "" ? "null" : "'" + String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(StartDate.Text)) + "'") + "," + Dose.SelectedValue + "," + Frequency.SelectedValue + "," + "1)";
                                
                //Response.Write(sql);
                SqlGestCurrentMedication.InsertCommand = sql;
                frwGestCurrentMedication.InsertItem(false);
            }
        }
    }

    protected void frwGestCurrentMedication_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiConc("INSERT", "Conc");
            }
        }
    }

    protected void frwGestCurrentMedication_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        HiddenField IdCurrentMedication = frwGestCurrentMedication.FindControl("IdCurrentMedication") as HiddenField;
        if (IdCurrentMedication.Value == "" || IdCurrentMedication.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("TbCurrentMedication", "IdCurrentMedication", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdCurrentMedication.Value;
        }
        TextBox MotivoModifica = frwGestCurrentMedication.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("CurrentMedication", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdCurrentMedication", valCI, operazione, MotivoModifica.Text);
        
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato( Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "4", "1");
        DropDownList IdTreatmentPso = frwGestCurrentMedication.FindControl("IdTreatmentPso") as DropDownList;
        DropDownList Dose = frwGestCurrentMedication.FindControl("Dose") as DropDownList;
        DropDownList Frequency = frwGestCurrentMedication.FindControl("Frequency") as DropDownList;
        if ((IdTreatmentPso.SelectedValue == "6" || IdTreatmentPso.SelectedValue == "17") && Dose.SelectedValue != "1" && Frequency.SelectedValue != "1")
        {
            Label lblWorsening = frwCurrentMedication.FindControl("lblWorsening") as Label;
            lblWorsening.Visible = true;
        }
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
                        GridView grwElencoConc = frwCurrentMedication.FindControl("grwElencoConc") as GridView;
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
        DropDownList IdTreatmentPso = frwGestCurrentMedication.FindControl("IdTreatmentPso") as DropDownList;
        TextBox OtherTreatment = frwGestCurrentMedication.FindControl("OtherTreatment") as TextBox;
        x.ErrorMessage = "";
        if (IdTreatmentPso.SelectedValue == "99" && OtherTreatment.Text.Trim() == "")
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>Treatment - Other, specify</b> deve essere compilato.</br>";
        }
    }

    protected void CurrentMedication(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList CurrentMedication = frwCurrentMedication.FindControl("CurrentMedication") as RadioButtonList;
        x.ErrorMessage = "";
        
    }
}
