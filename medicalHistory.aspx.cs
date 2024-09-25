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

public partial class ssl_MedicalHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        Session["deleteRec"] = "0";
        Session["alertRec"] = "0";
        SqlMenu.SelectCommand = "Select * from Prform where formid<>0 and vissual=1 order by orderform";
        SqlMenu.DataBind();
        frwMenu.DataBind();
        for (int i = 0; i < frwMenu.Items.Count; i++)
        {
            RepeaterItem r = frwMenu.Items[i];
            LinkButton lnk = r.FindControl("anagrafica") as LinkButton;
            if (lnk.ClientID == "frwMenu_anagrafica_1")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        if (IsPostBack) return;
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=2&Form=MedicalHistory.aspx&IDTIPVIS=1&nomeVisit=&Pagina=MedicalHistory&SemId=" + Request["SemId"].ToString();
        CaricaMedicalHistory();
    }

    protected void CaricaMedicalHistory()
    {

        SqlMedicalHistory.SelectCommand = "Select * from tbMedicalHistory where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlMedicalHistory.Select(DataSourceSelectArguments.Empty);
        SqlMedicalHistory.DataBind();
        frwMedicalHistory.DataBind();
        HiddenField IdCentro = frwMedicalHistory.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwMedicalHistory.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdMedicalHistory = frwMedicalHistory.FindControl("IdMedicalHistory") as HiddenField;
        Button btnSalva = frwMedicalHistory.FindControl("btnSalva") as Button;
        Button btnElimina = frwMedicalHistory.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwMedicalHistory.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwMedicalHistory.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        if (IdMedicalHistory.Value != "")
        {
            divMotivo.Visible = true;
            rfvMotivoModifica.Enabled = true;
            btnElimina.Visible = true;
        }
        else
        {
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
            btnElimina.Visible = false;
        }
        Label lblAggiornamento = frwMedicalHistory.FindControl("lblAggiornamento") as Label;
        if (Request["Aggiornamento"].ToString() == "SI")
        {
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
            btnElimina.Visible = false;
            btnSalva.Visible = false;
            lblAggiornamento.Visible = true;
            MaintainScrollPositionOnPostBack = true;
        }
        else
        {
            lblAggiornamento.Visible = false;
        }
        RemoveRadioNull rrn = new RemoveRadioNull();
        rrn.getRemoveRadioNull(frwMedicalHistory, "SmokingHabits", 4);
        rrn.getRemoveRadioNull(frwMedicalHistory, "AlcoholConsumption", 5);
        rrn.getRemoveRadioNull(frwMedicalHistory, "DiabetesMellitus,DiabetesMellitusCT,Hypertension,HypertensionCT,Ischemic,IschemicCT,Hyperlipidemia,HyperlipidemiaCT,Anxiety,AnxietyCT,Malignancy,MalignancyCT,Obesity,ObesityCT,PsoriaticArthritis,PsoriaticArthritisCT,OtherPathology,OtherPathology1CT,OtherPathology2CT,OtherPathology3CT", 2);
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "2");
    }

   

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Session["IdCentro"].ToString() != null && Page.IsValid)
        {
            Button btn = sender as Button;
            HiddenField SemID = frwMedicalHistory.FindControl("SemID") as HiddenField;
            SemID.Value = "1";
            
            HiddenField IdMedicalHistory = frwMedicalHistory.FindControl("IdMedicalHistory") as HiddenField;
            if (IdMedicalHistory.Value != "")
            {
                frwMedicalHistory.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from TBMedicalHistory where idPaziente=" + Session["idPaziente"] + " And IDTIPVIS=1";
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwMedicalHistory.InsertItem(false);
                }
                else
                {
                    rdr1.Close();
                    cn.Close();
                }
            }
        }
        
    }

    protected void SqlMedicalHistory_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwMedicalHistory.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwMedicalHistory.ChangeMode(FormViewMode.Edit);
        }
    }

    
    protected void frwMedicalHistory_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwMedicalHistory_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("UPDATE");
            }
        }
    }

    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        HiddenField IdMedicalHistory = frwMedicalHistory.FindControl("IdMedicalHistory") as HiddenField;
        if (IdMedicalHistory.Value == "" || IdMedicalHistory.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbMedicalHistory", "IdMedicalHistory", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdMedicalHistory.Value;
        }
        HiddenField SemID = frwMedicalHistory.FindControl("SemID") as HiddenField;
        TextBox MotivoModifica = frwMedicalHistory.FindControl("MotivoModifica") as TextBox;
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "2", SemID.Value);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("MedicalHistory", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdMedicalHistory", valCI, operazione, MotivoModifica.Text);
        Response.Redirect("MedicalHistory.aspx?Aggiornamento=SI&semid=" + SemID.Value);
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdTreatment = frwTreatment.FindControl("IdTreatment") as HiddenField;
        TextBox MotivoModifica = frwTreatment.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Treatment", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdTreatment", IdTreatment.Value, "DELETE", MotivoModifica.Text);

        SqlTreatment.DeleteCommand = "Delete from tbTreatment where IdTreatment=" + IdTreatment.Value;
        SqlTreatment.Delete();
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        GridView grwElenco = frwMedicalHistory.FindControl("grwElenco") as GridView;
        if (grwElenco.Rows.Count==1)
        {
            AggiornaStato aggs = new AggiornaStato();
            aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "2", "2");
        }
        Response.Redirect("MedicalHistory.aspx?Aggiornamento=SI&semid=0");
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
            Session["deleteRec"] = "1";
            divConferma.Visible = true;
            divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
        }
    }

    protected void DeleteTer_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
            Session["deleteRec"] = "1";
            divConferma.Visible = true;
            divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
        }
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    //tratamento per CLL
    protected void btnNuovaTreatment_Click(object sender, EventArgs e)
    {

        string idTreatment = "0";
        frwTreatment.ChangeMode(FormViewMode.Insert);
        SqlTreatment.SelectCommand = "Select * from tbTreatment where idTreatment=" + idTreatment;
        SqlTreatment.DataBind();
        frwTreatment.DataBind();
        divTreatment.Visible = true;
        Session["GestioneTreatment"] = "1";
        divTreatment.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        divTreatment.Style["top"] = "100px";
        HiddenField IdCentro = frwTreatment.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwTreatment.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField SemId = frwTreatment.FindControl("SemId") as HiddenField;
        SemId.Value = "1";
        Button btnElimina = frwTreatment.FindControl("btnElimina") as Button;
        btnElimina.Visible = false;
        dataVisita dtv = new dataVisita();
        HtmlContainerControl divMotivo = frwTreatment.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwTreatment.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
    }

    protected void SqlTreatment_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwTreatment.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwTreatment.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void grwElenco_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView grwElenco = sender as GridView;
        frwTreatment.ChangeMode(FormViewMode.Edit);
        SqlTreatment.SelectCommand = "Select * from tbTreatment where idTreatment=" + grwElenco.DataKeys[grwElenco.SelectedIndex].Value;
        SqlTreatment.DataBind();
        frwTreatment.DataBind();
        Button btnElimina = frwTreatment.FindControl("btnElimina") as Button;
        btnElimina.Visible = true;
        divTreatment.Visible = true;
        Session["GestioneTreatment"] = "1";
        divTreatment.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        divTreatment.Style["top"] = "100px";
        HtmlContainerControl divMotivo = frwTreatment.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwTreatment.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = true;
        rfvMotivoModifica.Enabled = true;
    }

    protected void btnSalvaTer_Click(object sender, EventArgs e)
    {
        if (Session["IdCentro"] != null && Page.IsValid)
        {
            Button btn = sender as Button;
            HiddenField SemID = frwTreatment.FindControl("SemID") as HiddenField;
            SemID.Value = "1";

            HiddenField IdTreatment = frwTreatment.FindControl("IdTreatment") as HiddenField;
            if (IdTreatment.Value != "")
            {
                frwTreatment.UpdateItem(false);
            }
            else
            {
                frwTreatment.InsertItem(false);
            }
        }

    }

    protected void frwTreatment_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiTer("INSERT");
            }
        }
    }

    protected void frwTreatment_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiTer("UPDATE");
            }
        }
    }

    protected void controllaCampiTer(string operazione)
    {
        string valCI = "";
        HiddenField SemID = frwMedicalHistory.FindControl("SemID") as HiddenField;
        string vSemID = SemID.Value;
        HiddenField IdTreatment = frwTreatment.FindControl("IdTreatment") as HiddenField;
        if (IdTreatment.Value == "" || IdTreatment.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbTreatment", "IdTreatment", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdTreatment.Value;
        }
        
        TextBox MotivoModifica = frwTreatment.FindControl("MotivoModifica") as TextBox;
        if (SemID.Value == "2") vSemID = "1";
        if (SemID.Value == "") vSemID = "2";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "2", vSemID);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Treatment", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdTreatment", valCI, operazione, MotivoModifica.Text);
        Response.Redirect("MedicalHistory.aspx?Aggiornamento=SI&semid=" + SemID.Value);
    }

    protected void ControllaDiagnosisDate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList SmokingHabits = frwMedicalHistory.FindControl("SmokingHabits") as RadioButtonList;
        TextBox YearsSmoking = frwMedicalHistory.FindControl("YearsSmoking") as TextBox;
        TextBox NoCigarettesDay = frwMedicalHistory.FindControl("NoCigarettesDay") as TextBox;
        x.ErrorMessage = "";
        if (SmokingHabits.SelectedValue == "1" && YearsSmoking.Text == "")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Number of years smoking</b> is required.<br/>";
        }
        if (SmokingHabits.SelectedValue == "1" && NoCigarettesDay.Text == "")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Daily consumption</b> is required.<br/>";
        }
        string s = "DiabetesMellitus,Hypertension,Ischemic,Hyperlipidemia,Anxiety,Malignancy,Obesity,PsoriaticArthritis";
        string s1 = "Diabetes Mellitus,Hypertension,Ischemic heart disease,Hyperlipidemia,Anxiety/Depression,Malignancy,Obesity,Psoriatic Arthritis";
        string[] campi = s.Split(',');
        string[] campi1 = s1.Split(',');
        for (int i = 0; i < campi.Length; i++)
        {
            RadioButtonList rbl = frwMedicalHistory.FindControl(campi[i]) as RadioButtonList;
            if (rbl.SelectedValue == "")
            {
                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>" + campi1[i] + "</b> is required.<br/>";
            }
            TextBox txt = frwMedicalHistory.FindControl(campi[i] + "YD") as TextBox;
            if (rbl.SelectedValue == "1" && txt.Text == "")
            {
                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>" + campi1[i] + " - Year of Diagnosis</b> is required.<br/>";
            }
            if (txt.Text != "")
            {
                if (Convert.ToInt16(txt.Text) > DateTime.Today.Year)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>" + campi1[i] + " - Year of Diagnosis</b> is after the current year.<br/>";
                }
            }
            RadioButtonList rblCT = frwMedicalHistory.FindControl(campi[i] + "CT") as RadioButtonList;
            if (rbl.SelectedValue == "1" && rblCT.SelectedValue=="")
            {
                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>" + campi1[i] + " - Currently Treated</b> is required.<br/>";
            }
            if (Session["Age"] != null && txt.Text != "")
            {
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(txt.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>" + campi1[i] + " - Year of Diagnosis</b> must be after the year of birth.<br>";
                }
            }
        }
        RadioButtonList OtherPathology = frwMedicalHistory.FindControl("OtherPathology") as RadioButtonList;
        if (OtherPathology.SelectedValue == "")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology</b> is required.<br/>";
        }
        if (OtherPathology.SelectedValue == "1")
        {
            TextBox txt1 = frwMedicalHistory.FindControl("OtherPathology1Spec") as TextBox;
            TextBox txt2 = frwMedicalHistory.FindControl("OtherPathology2Spec") as TextBox;
            TextBox txt3 = frwMedicalHistory.FindControl("OtherPathology3Spec") as TextBox;
            if (txt1.Text == "" && txt2.Text == "" && txt3.Text == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "At least one <b>Other pathology</b> must be filled out.<br/>";
            }
            TextBox txt1YD = frwMedicalHistory.FindControl("OtherPathology1YD") as TextBox;
            TextBox txt2YD = frwMedicalHistory.FindControl("OtherPathology2YD") as TextBox;
            TextBox txt3YD = frwMedicalHistory.FindControl("OtherPathology3YD") as TextBox;
            RadioButtonList rblCT1 = frwMedicalHistory.FindControl("OtherPathology1CT") as RadioButtonList;
            RadioButtonList rblCT2 = frwMedicalHistory.FindControl("OtherPathology2CT") as RadioButtonList;
            RadioButtonList rblCT3 = frwMedicalHistory.FindControl("OtherPathology3CT") as RadioButtonList;
            if (txt1.Text != "" && txt1YD.Text == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 1 - Year of Diagnosis</b> is required.<br/>";
            }
            if (txt1.Text != "" && rblCT1.SelectedValue == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 1 - Currently Treated</b> is required.<br/>";
            }
            if (txt1YD.Text != "")
            {
                if (Convert.ToInt32(txt1YD.Text) > DateTime.Today.Year)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 1 - Year of Diagnosis</b> is after the current year.<br/>";
                }
            }
            if (txt2.Text != "" && txt2YD.Text == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 2 - Year of Diagnosis</b> is required.<br/>";
            }
            if (txt2.Text != "" && rblCT2.SelectedValue == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 2 - Currently Treated</b> is required.<br/>";
            }
            if (txt2YD.Text != "")
            {
                if (Convert.ToInt16(txt2YD.Text) > DateTime.Today.Year)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 2 - Year of Diagnosis</b> is after the current year.<br/>";
                }
            }
            if (txt3.Text != "" && txt3YD.Text == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 3 - Year of Diagnosis</b> is required.<br/>";
            }
            if (txt3.Text != "" && rblCT3.SelectedValue == "")
            {

                args.IsValid = false;
                x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 3 - Currently Treated</b> is required.<br/>";
            }
            if (txt3YD.Text != "")
            {
                if (Convert.ToInt16(txt3YD.Text) > DateTime.Today.Year)
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 3 - Year of Diagnosis</b> is after the current year.<br/>";
                }
            }
            if (Session["Age"] != null && txt1YD.Text != "")
            {
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(txt1YD.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 1 - Year of Diagnosis</b> must be after the year of birth.<br>";
                }
            }
            if (Session["Age"] != null && txt2YD.Text != "")
            {
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(txt2YD.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 2 - Year of Diagnosis</b> must be after the year of birth.<br>";
                }
            }
            if (Session["Age"] != null && txt3YD.Text != "")
            {
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(txt3YD.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Other Pathology 1 - Year of Diagnosis</b> must be after the year of birth.<br>";
                }
            }
        }
    }

    protected void TreatmentDate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        DropDownList StartDateMM = frwTreatment.FindControl("StartDateMM") as DropDownList;
        TextBox StartDateYY = frwTreatment.FindControl("StartDateYY") as TextBox;
        DropDownList EndDateMM = frwTreatment.FindControl("EndDateMM") as DropDownList;
        TextBox EndDateYY = frwTreatment.FindControl("EndDateYY") as TextBox;
        x.ErrorMessage = "";
        if (Convert.ToInt16(StartDateYY.Text) > Convert.ToInt16(EndDateYY.Text))
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>Start date</b> non può essere successivo alla <b>End date</b>.<br>";
        }
        else
        {
            if (StartDateMM.SelectedValue != "UK" && EndDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(StartDateYY.Text) == Convert.ToInt16(EndDateYY.Text) && Convert.ToInt16(StartDateMM.SelectedValue) > Convert.ToInt16(EndDateMM.SelectedValue))
                {
                    args.IsValid = false;
                    x.ErrorMessage = "The field <b>Start date</b> non può essere successivo alla <b>End date</b>.<br>";
                }
            }
        }

        if (Convert.ToInt16(EndDateYY.Text) > DateTime.Today.Year)
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>End date</b> non può essere successivo alla data corrente.<br>";
        }
        else
        {
            if (EndDateMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(EndDateYY.Text) == DateTime.Today.Year && Convert.ToInt16(EndDateMM.SelectedValue) > DateTime.Today.Month)
                {
                    args.IsValid = false;
                    x.ErrorMessage = "The field <b>End date</b> non può essere successivo alla data corrente.<br>";
                }
            }
        }
        DropDownList IdTreatmentPso = frwTreatment.FindControl("IdTreatmentPso") as DropDownList;
        TextBox OtherTreatmentCLL = frwTreatment.FindControl("OtherTreatmentCLL") as TextBox;
        if (IdTreatmentPso.SelectedValue == "99" && OtherTreatmentCLL.Text.Trim()=="")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Treatment - If Other, please specifiy</b> deve essere compilato.</br>";
        }
        DropDownList IdReasonDiscontinuation = frwTreatment.FindControl("IdReasonDiscontinuation") as DropDownList;
        TextBox OtherReason = frwTreatment.FindControl("OtherReason") as TextBox;
        if (IdReasonDiscontinuation.SelectedValue == "99" && OtherReason.Text.Trim() == "")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>Reason for discontinuation - If Other, please specifiy</b> deve essere compilato.";
        }
    }
}
