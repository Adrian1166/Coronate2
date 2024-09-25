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

public partial class ssl_CurrentDisease : System.Web.UI.Page
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
            if (lnk.ClientID == "frwMenu_anagrafica_5")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        if (IsPostBack) return;
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=5&Form=CurrentDisease.aspx&IDTIPVIS=1&nomeVisit=&Pagina=CurrentDisease&SemId=" + Request["SemId"].ToString();
        CaricaCurrentDisease();
    }

    protected void CaricaCurrentDisease()
    {
        
        SqlCurrentDisease.SelectCommand = "Select * from tbCurrentDisease where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlCurrentDisease.Select(DataSourceSelectArguments.Empty);
        SqlCurrentDisease.DataBind();
        frwCurrentDisease.DataBind();
        HiddenField IdCentro = frwCurrentDisease.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwCurrentDisease.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdCurrentDisease = frwCurrentDisease.FindControl("IdCurrentDisease") as HiddenField;
        Button btnSalva = frwCurrentDisease.FindControl("btnSalva") as Button;
        Button btnElimina = frwCurrentDisease.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwCurrentDisease.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwCurrentDisease.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        if (IdCurrentDisease.Value != "")
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
        Label lblAggiornamento = frwCurrentDisease.FindControl("lblAggiornamento") as Label;
        Label lblWorsening = frwCurrentDisease.FindControl("lblWorsening") as Label;
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
        rrn.getRemoveRadioNull(frwCurrentDisease, "PsoriasisIs", 7);
        rrn.getRemoveCheckNull(frwCurrentDisease, "VAS_ND,DLQI_ND", 1);
        
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "5");
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Button btn = sender as Button;
            HiddenField SemID = frwCurrentDisease.FindControl("SemID") as HiddenField;
            SemID.Value = "1";
            HiddenField IdCurrentDisease = frwCurrentDisease.FindControl("IdCurrentDisease") as HiddenField;
            if (IdCurrentDisease.Value != "")
            {
                frwCurrentDisease.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from TBCurrentDisease where idPaziente=" + Session["idPaziente"] + " And IDTIPVIS=1";
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwCurrentDisease.InsertItem(false);
                }
                else
                {
                    rdr1.Close();
                    cn.Close();
                }
            }
        }
        
    }

    protected void SqlCurrentDisease_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwCurrentDisease.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwCurrentDisease.ChangeMode(FormViewMode.Edit);
        }
    }

    
    protected void frwCurrentDisease_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwCurrentDisease_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        HiddenField IdCurrentDisease = frwCurrentDisease.FindControl("IdCurrentDisease") as HiddenField;
        if (IdCurrentDisease.Value == "" || IdCurrentDisease.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbCurrentDisease", "IdCurrentDisease", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdCurrentDisease.Value;
        }
        HiddenField SemID = frwCurrentDisease.FindControl("SemID") as HiddenField;
        TextBox MotivoModifica = frwCurrentDisease.FindControl("MotivoModifica") as TextBox;
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", SemID.Value);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("CurrentDisease", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdCurrentDisease", valCI, operazione, MotivoModifica.Text);
        RadioButtonList PsoriasisIs = frwCurrentDisease.FindControl("PsoriasisIs") as RadioButtonList;
        string Worsening = "NO";
        if (PsoriasisIs.SelectedValue == "5" || PsoriasisIs.SelectedValue == "6" || PsoriasisIs.SelectedValue == "7")
        {
            Worsening = "SI";
        }
        Response.Redirect("CurrentDisease.aspx?Aggiornamento=SI&semid=" + SemID.Value + "&Worsening=" + Worsening);
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdCurrentDisease = frwCurrentDisease.FindControl("IdCurrentDisease") as HiddenField;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("CurrentDisease", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdCurrentDisease", IdCurrentDisease.Value, "DELETE", "");

        SqlCurrentDisease.DeleteCommand = "Delete from tbCurrentDisease where IdCurrentDisease=" + IdCurrentDisease.Value;
        SqlCurrentDisease.Delete();
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", "0");
        Response.Redirect("CurrentDisease.aspx?semid=0");
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        lblMsg.Text = "<b>Confirm the deletion?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    protected void ControllaAltro(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        CheckBoxList VAS_ND = frwCurrentDisease.FindControl("VAS_ND") as CheckBoxList;
        TextBox VAS = frwCurrentDisease.FindControl("VAS") as TextBox;
        x.ErrorMessage = "";
        if (VAS_ND.SelectedValue == "" && VAS.Text.Trim() == "")
        {
            args.IsValid = false;
            x.ErrorMessage = "The field <b>VAS or Not done</b> is required.</br>";
        }
        CheckBoxList DLQI_ND = frwCurrentDisease.FindControl("DLQI_ND") as CheckBoxList;
        TextBox DLQI = frwCurrentDisease.FindControl("DLQI") as TextBox;
        if (DLQI_ND.SelectedValue == "" && DLQI.Text.Trim() == "")
        {
            args.IsValid = false;
            x.ErrorMessage = x.ErrorMessage + "The field <b>DLQI or Not done</b> is required.</br>";
        }
    }
}
