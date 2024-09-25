using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DateDiffFunc;
using MySql.Data.MySqlClient;
public partial class ssl_anagrafica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = true;
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        Session["deleteRec"] = "0";
        Session["alertConferma"] = "0";
        SqlMenu.SelectCommand = "Select * from Prform where formid<>0 and vissual=1 order by orderform";
        SqlMenu.DataBind();
        frwMenu.DataBind();
        for (int i = 0; i < frwMenu.Items.Count; i++)
        {
            RepeaterItem r = frwMenu.Items[i];
            LinkButton lnk = r.FindControl("anagrafica") as LinkButton;
            if (lnk.ClientID == "frwMenu_anagrafica_0")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        if (IsPostBack) return;
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=1&Form=anagrafica.aspx&Pagina=Anagrafica&nomeVisit=&IDTIPVIS=1&SemId=" + Request["SemId"].ToString();
        
        frwDemog.DefaultMode = FormViewMode.Edit;
        SqlDemog.SelectCommand = "SELECT * FROM TbPazienti Where idpaziente=" + Session["idpaziente"].ToString();
        SqlDemog.DataBind();
        frwDemog.DataBind();
        
        HiddenField IdCentro = frwDemog.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();

        Button btnSalva = frwDemog.FindControl("btnSalva") as Button;
        Button btnElimina = frwDemog.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwDemog.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwDemog.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        RadioButtonList Gender = frwDemog.FindControl("Gender") as RadioButtonList;
        if (Gender.SelectedValue != "")
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
        Label lblAggiornamento = frwDemog.FindControl("lblAggiornamento") as Label;
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
        rrn.getRemoveRadioNull(frwDemog, "CI1,CI2,CI3,CI4,CE1,gender", 2);
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "1");

    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IdCentro"].ToString() != null)
            {
                frwDemog.UpdateItem(false);
            }
        }
    }

    protected void btnIndietro_Click(object sender, EventArgs e)
    {
        Response.Redirect("elencoVisita.aspx");
    }

    protected void frwDemog_ItemInsert(Object sender, FormViewInsertedEventArgs e)
    {
        
    }

    protected void frwDemog_ItemUpdate(Object sender, FormViewUpdatedEventArgs e)
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
        string semId = "1";
        HiddenField IdPaziente = frwDemog.FindControl("IdPaziente") as HiddenField;
        if (IdPaziente.Value == "" || IdPaziente.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbPazienti", "IdPaziente", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdPaziente.Value;
        }
        TextBox MotivoModifica = frwDemog.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Pazienti", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPaziente", valCI, operazione, MotivoModifica.Text);
        
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), valCI, "1", "1", semId);
        Session["IdPaziente"] = valCI;
        TextBox NumPaz = frwDemog.FindControl("NumPaz") as TextBox;
        TextBox DataConsenso = frwDemog.FindControl("DataConsenso") as TextBox;
        TextBox DateVisit = frwDemog.FindControl("DateVisit") as TextBox;
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        sql = "Select (CI1+CI2+CI3+CI4) as totinc,(CE1) as totesc from tbpazienti where idPaziente=" + valCI;
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
        rdrci.Close();
        cn.Close();
        TextBox Age = frwDemog.FindControl("Age") as TextBox;
        Session["Age"] = Age.Text;
        Session["DateVisit"] = DateVisit.Text;
        Session["DataConsenso"] = DataConsenso.Text;
        Response.Redirect("anagrafica.aspx?SemId=1&Aggiornamento=SI");
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdPaziente = frwDemog.FindControl("IdPaziente") as HiddenField;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Pazienti", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPaziente", IdPaziente.Value, "DELETE", "");

        SqlDemog.DeleteCommand = "Delete from tbPazienti where IdPaziente=" + IdPaziente.Value;
        SqlDemog.Delete();
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), IdPaziente.Value, "1", "1", "0");
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        Session["IdPaziente"] = null;
        Response.Redirect("elencoPazienti.aspx?semId=0");
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        lblMsg.Text = "<b>Conferma l'eliminazione del paziente?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }
    protected void OnSelectionChanged_CaricaData(object sender, EventArgs e)
    {
       
        Calendar Calendar1 = sender as Calendar;
        TextBox txt = frwDemog.FindControl(Calendar1.ID.Replace("cal","")) as TextBox;
        txt.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void VisualizzaCal(object sender, EventArgs e)
    {
        ImageButton imgb = sender as ImageButton;
        HtmlContainerControl divC = frwDemog.FindControl(imgb.ID.Replace("img", "div")) as HtmlContainerControl;
        divC.Visible = true;
        Calendar cal = frwDemog.FindControl(imgb.ID.Replace("img", "cal")) as Calendar;
        cal.Visible = !cal.Visible;
    }

    

    protected void ControllaAltro(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        DropDownList IdRace = frwDemog.FindControl("IdRace") as DropDownList;
        TextBox RaceOther = frwDemog.FindControl("RaceOther") as TextBox;
        x.ErrorMessage = "";
        if (IdRace.SelectedValue == "99" && RaceOther.Text.Trim() == "")
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>Ethnic group - Specify</b> is required.</br>";
        }
        
    }
}
