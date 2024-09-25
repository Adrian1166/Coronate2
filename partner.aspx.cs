using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;
using DateDiffFunc;

public partial class ssl_Partner : System.Web.UI.Page
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
            if (lnk.ClientID == "frwMenu_anagrafica_8")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        string strNumPar = "";
        if (IsPostBack) return;
        strNumPar = "P"+Session["NumPaz"].ToString();
        SqlDemog.SelectCommand = "SELECT * FROM TbPartner Where IdPaziente=" + Session["IdPaziente"];
        SqlDemog.DataBind();
        frwDemog.DataBind();
        HiddenField IdCentro = frwDemog.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwDemog.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString(); 
        TextBox NumPar = frwDemog.FindControl("NumPar") as TextBox;
        NumPar.Text = strNumPar;

        HiddenField IdPartner = frwDemog.FindControl("IdPartner") as HiddenField;
        Button btnSalva = frwDemog.FindControl("btnSalva") as Button;
        Button btnElimina = frwDemog.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwDemog.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwDemog.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
        if (IdPartner.Value != "")
        {
            rfvMotivoModifica.Enabled = true;
            btnElimina.Visible = true;
            divMotivo.Visible = true;
        }
        else
        {
            btnElimina.Visible = false;
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
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
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=9&Form=Partner.aspx&Pagina=Partner&nomeVisit=&IDTIPVIS=1&SemId=";
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "9");
        RemoveRadioNull rrn = new RemoveRadioNull();
        rrn.getRemoveRadioNull(frwDemog, "CI1,Questio1,Questio2,Questio3", 2);
        rrn.getRemoveRadioNull(frwDemog, "ParticipateStudy", 3);
    }

    protected void SqlDemog_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwDemog.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwDemog.ChangeMode(FormViewMode.Edit);
        }
    }
    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IdCentro"].ToString() != null)
            {
                HiddenField IdPartner = frwDemog.FindControl("IdPartner") as HiddenField;
                if (IdPartner.Value != "")
                {
                    frwDemog.UpdateItem(false);
                }
                else
                {
                    TextBox NumPar = frwDemog.FindControl("NumPar") as TextBox;
                    MySqlConnection cn;
                    cn = new MySqlConnection(Session["pathDb"].ToString());
                    cn.Open();
                    string sql = "Select * from tbPartner Where NumPar='" + NumPar.Text + "' And IdCentro=" + Session["IdCentro"].ToString();
                    MySqlCommand cmd1 = new MySqlCommand(sql, cn);
                    MySqlDataReader rdr = cmd1.ExecuteReader();
                    if (!rdr.HasRows)
                    {
                        rdr.Close();
                        cn.Close();
                        if (NumPar.Text == Session["SiteId"].ToString() + "-01")
                        {
                            InviaEmailAbbott email = new InviaEmailAbbott();
                            string oggetto = "Coronate STUDY";
                            string strbody = "Il centro: " + Session["SiteID"].ToString() + " ha inserito il primo soggetto.";
                            email.sendMail("Coronate@fullcro.org", "valentina.granelli@fullcro.org,giuliana.gualberti@abbvie.com,Coronate@abbvie.com", "", "", oggetto, strbody);
                        }
                        frwDemog.InsertItem(false);
                    }
                    else
                    {
                        rdr.Close();
                        cn.Close();
                    }
                }
            } 
        }
    }

    protected void btnIndietro_Click(object sender, EventArgs e)
    {
        Response.Redirect("elencoPartner.aspx");
    }

    protected void frwDemog_ItemInsert(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
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
        string Partner = "";
        HiddenField IdPartner = frwDemog.FindControl("IdPartner") as HiddenField;
        if (IdPartner.Value == "" || IdPartner.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID( "tbPartner", "IdPartner", Session["pathDb"].ToString());
            Partner = "SI";
        }
        else
        {
            valCI = IdPartner.Value;
        }
        TextBox MotivoModifica = frwDemog.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Partner", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPartner", valCI, operazione, MotivoModifica.Text);
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "9", "1");
        //Response.Write(valCI);
        Response.Redirect("Partner.aspx?Aggiornamento=SI&SemID=1");
        
    }
    protected void Delete_Clicked(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = false;
        lblMsg.Text = "<b>Conferma eliminazione?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
    }
    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdPartner = frwDemog.FindControl("IdPartner") as HiddenField;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Partner", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idPartner", IdPartner.Value, "DELETE", "");

        SqlDemog.DeleteCommand = "Delete from TbPartner where IdPartner=" + IdPartner.Value;
        SqlDemog.Delete();
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "9", "0");

        Response.Redirect("Partner.aspx?SemID=0");
    }
    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    protected void caricaStat(string idPaz)
    {
        String ConnString = Session["pathDb"].ToString();
        MySqlConnection cn = new MySqlConnection(ConnString);
        cn.Open();
        MySqlConnection cn1 = new MySqlConnection(ConnString);
        cn1.Open();
        string sql = "Select * from PrFormTipVis order by IdTipoVisite, OrdVis";
        MySqlCommand cmd1 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr = cmd1.ExecuteReader();
        while (rdr.Read())
        {
            sql = "Insert into PrStat (SUBJID, TIPVISID, FORMID,SemId) values (" + idPaz + "," + rdr["IdTipoVisite"].ToString() + "," + rdr["IdForm"].ToString() + ",0)";
            MySqlCommand cmd = new MySqlCommand(sql, cn1);
            cmd.ExecuteNonQuery();
        }
        rdr.Close();
        cn.Close();
        cn1.Close();
    }

    protected void ControllaAltro(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList ParticipateStudy = frwDemog.FindControl("ParticipateStudy") as RadioButtonList;
        RadioButtonList CI1 = frwDemog.FindControl("CI1") as RadioButtonList;
        RadioButtonList Questio1 = frwDemog.FindControl("Questio1") as RadioButtonList;
        RadioButtonList Questio2 = frwDemog.FindControl("Questio2") as RadioButtonList;
        RadioButtonList Questio3 = frwDemog.FindControl("Questio3") as RadioButtonList;
        TextBox DataConsenso = frwDemog.FindControl("DataConsenso") as TextBox;
        TextBox Questio1No = frwDemog.FindControl("Questio1No") as TextBox;
        TextBox Questio2No = frwDemog.FindControl("Questio2No") as TextBox;
        TextBox Questio3No = frwDemog.FindControl("Questio3No") as TextBox;
        x.ErrorMessage = "";
        if (ParticipateStudy.SelectedValue == "1")
        {
            if (DataConsenso.Text == "")
            {
                x.ErrorMessage = "The field <b>Date of informed consent signature</b> is required!<br/>";
                args.IsValid = false;
            }
            if (CI1.SelectedValue == "")
            {
                x.ErrorMessage = x.ErrorMessage + "The field <b>Inclusion criteria</b> is required!<br/>";
                args.IsValid = false;
            }
            if (CI1.SelectedValue == "1")
            {
                if (Questio1.SelectedValue == "")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>CORONATE questionnaire for PARTNER</b> is required!<br/>";
                    args.IsValid = false;
                }
                if (Questio2.SelectedValue == "")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Has the partner filled in the socio-demographic/health-related questions</b> is required!<br/>";
                    args.IsValid = false;
                }
                if (Questio3.SelectedValue == "")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Has the partner filled in the health-related question about the patient he/she has a relationship with</b> is required!<br/>";
                    args.IsValid = false;
                }
                if (Questio1.SelectedValue == "2" && Questio1No.Text=="")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>CORONATE questionnaire for PARTNER - please add the reason</b> is required!<br/>";
                    args.IsValid = false;
                }
                if (Questio2.SelectedValue == "2" && Questio2No.Text == "")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Has the partner filled in the socio-demographic/health-related questions - please add the reason</b> is required!<br/>";
                    args.IsValid = false;
                }
                if (Questio3.SelectedValue == "2" && Questio3No.Text == "")
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>Has the partner filled in the health-related question about the patient he/she has a relationship with - please add the reason</b> is required!<br/>";
                    args.IsValid = false;
                }
            }
        }
    }

}
