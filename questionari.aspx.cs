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

public partial class ssl_questionari : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        Session["deleteRec"] = "0";
        Session["visualAlert"] = "0";
        SqlMenu.SelectCommand = "Select * from Prform where formid<>0 and vissual=1 order by orderform";
        SqlMenu.DataBind();
        frwMenu.DataBind();
        for (int i = 0; i < frwMenu.Items.Count; i++)
        {
            RepeaterItem r = frwMenu.Items[i];
            LinkButton lnk = r.FindControl("anagrafica") as LinkButton;
            if (lnk.ClientID == "frwMenu_anagrafica_6")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        MaintainScrollPositionOnPostBack = true;
        CaricaQuestionari();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=6&Form=questionari.aspx&Pagina=Questionari e strumenti di valutazione allegati&nomeVisit=" + Request["nomeVisit"] + "&IDTIPVIS=" + "1" + "&SemId=" + Request["SemId"].ToString();
    }

    protected void CaricaQuestionari()
    {
        if (IsPostBack) return;
        Session["ConfermaTerapia"] = "0";
        SqlQuestionari.SelectCommand = "Select * from TbQuestionari where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlQuestionari.Select(DataSourceSelectArguments.Empty);
        SqlQuestionari.DataBind();
        frwQuestionari.DataBind();
        HiddenField IdCentro = frwQuestionari.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwQuestionari.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdQuestionari = frwQuestionari.FindControl("IdQuestionari") as HiddenField;
        Button btnSalva = frwQuestionari.FindControl("btnSalva") as Button;
        Button btnElimina = frwQuestionari.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwQuestionari.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwQuestionari.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        if (IdQuestionari.Value == "")
        {
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
            btnElimina.Visible = false;
        }
        else
        {
            btnElimina.Visible = false;
            rfvMotivoModifica.Enabled = true;
            divMotivo.Visible = true;
        }
        Label lblAggiornamento = frwQuestionari.FindControl("lblAggiornamento") as Label;
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
        rrn.getRemoveRadioNull(frwQuestionari, "CORONATE,Health,COPE,MLCDP", 2);
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "6");
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IdCentro"].ToString() != null)
            {
               
                HiddenField IdQuestionari = frwQuestionari.FindControl("IdQuestionari") as HiddenField;
                if (IdQuestionari.Value != "")
                {
                    frwQuestionari.UpdateItem(false);
                }
                else
                {
                    Utility utility = new Utility();
                    string ConnString = utility.getStringConnection(Request.ApplicationPath);
                    MySqlConnection cn = new MySqlConnection(ConnString);
                    cn.Open();
                    string sql = "Select * from tbquestionari where idPaziente=" + Session["idPaziente"] + " And IDTIPVIS=" + "1";
                    MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                    MySqlDataReader rdr1 = cmd2.ExecuteReader();
                    if (!rdr1.HasRows)
                    {
                        rdr1.Close();
                        cn.Close();
                        frwQuestionari.InsertItem(false);
                    }
                    else
                    {
                        rdr1.Close();
                        cn.Close();
                    }
                }
            }
        }
    }

    protected void SqlQuestionari_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwQuestionari.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwQuestionari.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void frwQuestionari_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwQuestionari_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        RadioButtonList Uqest = frwQuestionari.FindControl("Uqest") as RadioButtonList;
        Uqest.Items.RemoveAt(3);
        RadioButtonList SF12 = frwQuestionari.FindControl("SF12") as RadioButtonList;
        SF12.Items.RemoveAt(3);
        RadioButtonList VFQ25 = frwQuestionari.FindControl("VFQ25") as RadioButtonList;
        VFQ25.Items.RemoveAt(3);
        RadioButtonList WPAIuveitis = frwQuestionari.FindControl("WPAIuveitis") as RadioButtonList;
        WPAIuveitis.Items.RemoveAt(3);
        RadioButtonList SatisfactionQuest = frwQuestionari.FindControl("SatisfactionQuest") as RadioButtonList;
        SatisfactionQuest.Items.RemoveAt(3);
    }

    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        HiddenField IdQuestionari = frwQuestionari.FindControl("IdQuestionari") as HiddenField;
        if (IdQuestionari.Value == "" || IdQuestionari.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("TbQuestionari", "IdQuestionari", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdQuestionari.Value;
        }
        TextBox MotivoModifica = frwQuestionari.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Questionari", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdQuestionari", valCI, operazione, MotivoModifica.Text);
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "6", "1");
        Response.Redirect("questionari.aspx?Aggiornamento=SI&SemId=1");
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdQuestionari = frwQuestionari.FindControl("IdQuestionari") as HiddenField;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Questionari", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idQuestionari", IdQuestionari.Value, "DELETE", "");

        SqlQuestionari.DeleteCommand = "Delete from tbQuestionari where IdQuestionari=" + IdQuestionari.Value;
        SqlQuestionari.Delete();
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "6", "0");

        Response.Redirect("Questionari.aspx?SemId=0");
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = false;
        lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] =Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    protected void ConfermaAlertSi_Click(object sender, EventArgs e)
    {
        HiddenField IdQuestionari = frwQuestionari.FindControl("IdQuestionari") as HiddenField;
        if (IdQuestionari.Value != "")
        {
            frwQuestionari.UpdateItem(false);
        }
        else
        {
            Utility utility = new Utility();
            string ConnString = utility.getStringConnection(Request.ApplicationPath);
            MySqlConnection cn = new MySqlConnection(ConnString);
            cn.Open();
            string sql = "Select * from tbquestionari where idPaziente=" + Session["idPaziente"] + " And IDTIPVIS=" + "1";
            MySqlCommand cmd2 = new MySqlCommand(sql, cn);
            MySqlDataReader rdr1 = cmd2.ExecuteReader();
            if (!rdr1.HasRows)
            {
                rdr1.Close();
                cn.Close();
                frwQuestionari.InsertItem(false);
            }
            else
            {
                rdr1.Close();
                cn.Close();
            }
        }
        divVissAlert.Visible = false;
        Session["visualAlert"] = "0";
    }

    protected void ConfermaAlertNo_Click(object sender, EventArgs e)
    {
        divVissAlert.Visible = false;
        Session["visualAlert"] = "0";
    }
    
    protected void VAS_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList VAS = frwQuestionari.FindControl("VAS") as RadioButtonList;
        TextBox TerRefTSQM = frwQuestionari.FindControl("TerRefVAS") as TextBox;
        x.ErrorMessage = "";
        if (VAS.SelectedValue == "1" && TerRefTSQM.Text.Trim() == "")
        {
            x.ErrorMessage = "Inserire il farmaco di riferimento per il questionario VAS";
            args.IsValid = false;
        }
    }

    protected void ControllaAltro(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList CORONATE = frwQuestionari.FindControl("CORONATE") as RadioButtonList;
        TextBox CORONATENo = frwQuestionari.FindControl("CORONATENo") as TextBox;
        RadioButtonList Health = frwQuestionari.FindControl("Health") as RadioButtonList;
        TextBox HealthNo = frwQuestionari.FindControl("HealthNo") as TextBox;
        RadioButtonList COPE = frwQuestionari.FindControl("COPE") as RadioButtonList;
        TextBox COPENo = frwQuestionari.FindControl("COPENo") as TextBox;
        RadioButtonList MLCDP = frwQuestionari.FindControl("MLCDP") as RadioButtonList;
        TextBox MLCDPNo = frwQuestionari.FindControl("MLCDPNo") as TextBox;
        x.ErrorMessage = "";
        if (CORONATE.SelectedValue == "2" && CORONATENo.Text.Trim() == "")
        {
            x.ErrorMessage = "The field <b>CORONATE questionnaire - If No, please add the reason</b> is required.<br/>";
            args.IsValid = false;
        }
        if (Health.SelectedValue == "2" && HealthNo.Text.Trim() == "")
        {
            x.ErrorMessage = x.ErrorMessage + "The field <b>Health-related questions - If No, please add the reason</b> is required.<br/>";
            args.IsValid = false;
        }
        if (COPE.SelectedValue == "2" && COPENo.Text.Trim() == "")
        {
            x.ErrorMessage = "The field <b>COPE questionnaire - If No, please add the reason</b> is required.<br/>";
            args.IsValid = false;
        }
        if (MLCDP.SelectedValue == "2" && MLCDPNo.Text.Trim() == "")
        {
            x.ErrorMessage = x.ErrorMessage + "The field <b>MLCDP - If No, please add the reason</b> is required.<br/>";
            args.IsValid = false;
        }
    }

}
