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

public partial class ssl_DermatologicHistory : System.Web.UI.Page
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
            if (lnk.ClientID == "frwMenu_anagrafica_2")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        if (IsPostBack) return;
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=3&Form=DermatologicHistory.aspx&IDTIPVIS=1&nomeVisit=&Pagina=DermatologicHistory&SemId=" + Request["SemId"].ToString();
        CaricaDermatologicHistory();
    }

    protected void CaricaDermatologicHistory()
    {

        SqlDermatologicHistory.SelectCommand = "Select * from tbDermatologicHistory where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlDermatologicHistory.Select(DataSourceSelectArguments.Empty);
        SqlDermatologicHistory.DataBind();
        frwDermatologicHistory.DataBind();
        HiddenField IdCentro = frwDermatologicHistory.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwDermatologicHistory.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdDermatologicHistory = frwDermatologicHistory.FindControl("IdDermatologicHistory") as HiddenField;
        Button btnSalva = frwDermatologicHistory.FindControl("btnSalva") as Button;
        Button btnElimina = frwDermatologicHistory.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwDermatologicHistory.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwDermatologicHistory.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        if (IdDermatologicHistory.Value != "")
        {
            divMotivo.Visible = true;
            rfvMotivoModifica.Enabled = true;
            btnElimina.Visible = false;
        }
        else
        {
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
            btnElimina.Visible = false;
        }
        Label lblAggiornamento = frwDermatologicHistory.FindControl("lblAggiornamento") as Label;
        Label lblWorsening = frwDermatologicHistory.FindControl("lblWorsening") as Label;
        if (Request["Aggiornamento"].ToString() == "SI")
        {
            if (Request["Worsening"].ToString() == "SI")
            {
                lblWorsening.Visible = true;
            }
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
        rrn.getRemoveRadioNull(frwDermatologicHistory, "Scalp,ScalpCV,Face,FaceCV,Trunk,TrunkCV,Arms,ArmsCV,Legs,LegsCV,Nails,NailsCV,Hands,"+
            "HandsCV,Feet,FeetCV,BodyFolds,BodyFoldsCV,GenitalArea,GenitalAreaCV", 3);
        rrn.getRemoveRadioNull(frwDermatologicHistory, "GeneralPsoriasis,CoursePsoriasis", 5);
        rrn.getRemoveRadioNull(frwDermatologicHistory, "FamilyHistory", 2);
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "3");
    }

    protected void CaricaElencoTerapie()
    {
        GridView grwElenco = frwDermatologicHistory.FindControl("grwElenco") as GridView;
        SqlDataSource SqlElenco = frwDermatologicHistory.FindControl("SqlElenco") as SqlDataSource;
        SqlElenco.SelectCommand = "Select IdTreatment, if(tbTreatment.IdTreatmentPso=99,OtherTreatmentCLL,treatmentcll) as treatment, if(tbTreatment.idreasondiscontinuation=99,OtherReason,reasondiscontinuation) as Reason,responsetherapy,concat(startdatemm,'/',startdateyy) as startdate, concat(enddatemm,'/',enddateyy) as enddate from tbTreatment  Left join lsTreatmentPso on tbTreatment.IdTreatmentPso=lsTreatmentPso.IdTreatmentPso" +
                " Left join lsreasondiscontinuation on tbTreatment.Idreasondiscontinuation=lsreasondiscontinuation.Idreasondiscontinuation" +
                " Left join lsresponsetherapy on tbTreatment.Idresponsetherapy=lsresponsetherapy.Idresponsetherapy"+
                " where IdPaziente=" + Session["IdPaziente"].ToString() + " order by StartDate,EndDate";
        SqlElenco.DataBind();
        grwElenco.DataBind();
        RadioButtonList PreviousTreatment = frwDermatologicHistory.FindControl("PreviousTreatment") as RadioButtonList;
        if (grwElenco.Rows.Count > 0)
        {
            PreviousTreatment.SelectedValue = "1";
        }
        PreviousTreatment.Items[0].Enabled = (grwElenco.Rows.Count == 0);
        PreviousTreatment.Items[1].Enabled = (grwElenco.Rows.Count == 0);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Session["IdCentro"].ToString() != null && Page.IsValid)
        {
            Button btn = sender as Button;
            HiddenField SemID = frwDermatologicHistory.FindControl("SemID") as HiddenField;
            SemID.Value = "1";
            HiddenField IdDermatologicHistory = frwDermatologicHistory.FindControl("IdDermatologicHistory") as HiddenField;
            if (IdDermatologicHistory.Value != "")
            {
                frwDermatologicHistory.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from TBDermatologicHistory where idPaziente=" + Session["idPaziente"] + " And IDTIPVIS=1";
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwDermatologicHistory.InsertItem(false);
                }
                else
                {
                    rdr1.Close();
                    cn.Close();
                }
            }
        }
        
    }

    protected void SqlDermatologicHistory_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwDermatologicHistory.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwDermatologicHistory.ChangeMode(FormViewMode.Edit);
        }
    }

    
    protected void frwDermatologicHistory_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwDermatologicHistory_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        HiddenField IdDermatologicHistory = frwDermatologicHistory.FindControl("IdDermatologicHistory") as HiddenField;
        if (IdDermatologicHistory.Value == "" || IdDermatologicHistory.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbDermatologicHistory", "IdDermatologicHistory", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdDermatologicHistory.Value;
        }
        HiddenField SemID = frwDermatologicHistory.FindControl("SemID") as HiddenField;
        TextBox MotivoModifica = frwDermatologicHistory.FindControl("MotivoModifica") as TextBox;
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "3", SemID.Value);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("DermatologicHistory", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdDermatologicHistory", valCI, operazione, MotivoModifica.Text);
        RadioButtonList CoursePsoriasis = frwDermatologicHistory.FindControl("CoursePsoriasis") as RadioButtonList;
        RadioButtonList GeneralPsoriasis = frwDermatologicHistory.FindControl("GeneralPsoriasis") as RadioButtonList;
        string Worsening = "NO";
        if (CoursePsoriasis.SelectedValue == "5" || GeneralPsoriasis.SelectedValue == "5")
        {
            Worsening = "SI";
        }
        Response.Redirect("DermatologicHistory.aspx?Aggiornamento=SI&semid=" + SemID.Value + "&Worsening=" + Worsening);
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
        GridView grwElenco = frwDermatologicHistory.FindControl("grwElenco") as GridView;
        if (grwElenco.Rows.Count==1)
        {
            AggiornaStato aggs = new AggiornaStato();
            aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "3", "2");
        }
        Response.Redirect("DermatologicHistory.aspx?Aggiornamento=SI&semid=0");
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
        HiddenField SemID = frwDermatologicHistory.FindControl("SemID") as HiddenField;
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
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "3", vSemID);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Treatment", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdTreatment", valCI, operazione, MotivoModifica.Text);
        RadioButtonList CoursePsoriasis = frwDermatologicHistory.FindControl("CoursePsoriasis") as RadioButtonList;
        RadioButtonList GeneralPsoriasis = frwDermatologicHistory.FindControl("GeneralPsoriasis") as RadioButtonList;
        string Worsening = "NO";
        if (CoursePsoriasis.SelectedValue == "5" || GeneralPsoriasis.SelectedValue == "5")
        {
            Worsening = "SI";
        }
        Response.Redirect("DermatologicHistory.aspx?Aggiornamento=SI&semid=" + SemID.Value + "&Worsening=" + Worsening);
    }

    protected void ControllaDiagnosisDate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList FamilyHistory = frwDermatologicHistory.FindControl("FamilyHistory") as RadioButtonList;
        TextBox NrAffectedPersons = frwDermatologicHistory.FindControl("NrAffectedPersons") as TextBox;
        x.ErrorMessage = "";
        if (FamilyHistory.SelectedValue == "1" && NrAffectedPersons.Text == "")
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>If Yes, No. of affected persons</b> is required.<br>";
        }
        TextBox YearPsoriasis = frwDermatologicHistory.FindControl("YearPsoriasis") as TextBox;
        TextBox YearFirstDiagnosis = frwDermatologicHistory.FindControl("YearFirstDiagnosis") as TextBox;
        TextBox YearModerate = frwDermatologicHistory.FindControl("YearModerate") as TextBox;
        if (Session["Age"] != null)
        {
            if (Session["Age"].ToString() != "&nbsp;")
            {
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(YearPsoriasis.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Year of onset of first skin manifestations related to psoriasis</b> must be after the year of birth.<br>";
                }
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(YearFirstDiagnosis.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Year of first psoriasis diagnosis by a dermatologist</b> must be after the year of birth.<br>";
                }
                if (Convert.ToDateTime(Session["DataConsenso"].ToString()).Year - Convert.ToInt16(Session["Age"].ToString()) > Convert.ToInt16(YearModerate.Text))
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Year of diagnosis of moderate to severe plaque psoriasis</b> must be after the year of birth.<br>";
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
