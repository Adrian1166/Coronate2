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

public partial class ssl_uscitaStudio : System.Web.UI.Page
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
            if (lnk.ClientID == "frwMenu_anagrafica_7")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        CaricaUscitaStudio();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=7&Form=uscitaStudio.aspx&Pagina=UscitaStudio&nomeVisit=&IDTIPVIS=1&SemId=" + Request["SemId"];
    }
    protected void CaricaUscitaStudio()
    {
        if (IsPostBack) return;
        SqlUscitaStudio.SelectCommand = "Select * from TbUscitaStudio where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlUscitaStudio.Select(DataSourceSelectArguments.Empty);
        SqlUscitaStudio.DataBind();
        frwUscitaStudio.DataBind();
        HiddenField IdCentro = frwUscitaStudio.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwUscitaStudio.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdUscitaStudio = frwUscitaStudio.FindControl("IdUscitaStudio") as HiddenField;
        Button btnSalva = frwUscitaStudio.FindControl("btnSalva") as Button;
        Button btnElimina = frwUscitaStudio.FindControl("btnElimina") as Button;
        HtmlContainerControl divMotivo = frwUscitaStudio.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwUscitaStudio.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
        if (IdUscitaStudio.Value != "")
        {
            rfvMotivoModifica.Enabled = true;
            btnElimina.Visible = false;
            divMotivo.Visible = true;
        }
        else
        {
            btnElimina.Visible = false;
            divMotivo.Visible = false;
            rfvMotivoModifica.Enabled = false;
        }
        Label lblAggiornamento = frwUscitaStudio.FindControl("lblAggiornamento") as Label;
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
        TrovaQuery tq = new TrovaQuery();
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "7");
        RemoveRadioNull rrn = new RemoveRadioNull();
        rrn.getRemoveRadioNull(frwUscitaStudio, "StudioCompletato", 2);
    }

    protected void SqlUscitaStudio_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwUscitaStudio.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwUscitaStudio.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            HiddenField SemId = frwUscitaStudio.FindControl("SemId") as HiddenField;
            SemId.Value = "1";

            HiddenField IdUscitaStudio = frwUscitaStudio.FindControl("IdUscitaStudio") as HiddenField;
            if (IdUscitaStudio.Value != "")
            {
                frwUscitaStudio.UpdateItem(false);
            }
            else
            {
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from tbUscitaStudio where idPaziente=" + Session["idPaziente"];
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                if (!rdr1.HasRows)
                {
                    rdr1.Close();
                    cn.Close();
                    frwUscitaStudio.InsertItem(false);
                }
                else
                {
                    rdr1.Close();
                    cn.Close();
                }
            }
            
        }
    }

    protected void frwUscitaStudio_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwUscitaStudio_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("UPDATE");
            }
        }
    }

    protected void OnSelectionChanged_CaricaData(object sender, EventArgs e)
    {

        Calendar Calendar1 = sender as Calendar;
        TextBox txt = frwUscitaStudio.FindControl(Calendar1.ID.Replace("cal", "")) as TextBox;
        txt.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void VisualizzaCal(object sender, EventArgs e)
    {
        ImageButton imgb = sender as ImageButton;
        HtmlContainerControl divC = frwUscitaStudio.FindControl(imgb.ID.Replace("img", "div")) as HtmlContainerControl;
        divC.Visible = true;
        Calendar cal = frwUscitaStudio.FindControl(imgb.ID.Replace("img", "cal")) as Calendar;
        cal.Visible = !cal.Visible;
    }

    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        HiddenField IdUscitaStudio = frwUscitaStudio.FindControl("IdUscitaStudio") as HiddenField;
        if (IdUscitaStudio.Value == "" || IdUscitaStudio.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("TbUscitaStudio", "IdUscitaStudio", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdUscitaStudio.Value;
        }
        TextBox MotivoModifica = frwUscitaStudio.FindControl("MotivoModifica") as TextBox;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("UscitaStudio", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdUscitaStudio", valCI, operazione, MotivoModifica.Text);
        HiddenField SemId = frwUscitaStudio.FindControl("SemId") as HiddenField;
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "7", "1");
        Response.Redirect("uscitaStudio.aspx?Aggiornamento=SI&SemID=1");
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        HiddenField IdUscitaStudio = frwUscitaStudio.FindControl("IdUscitaStudio") as HiddenField;
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("UscitaStudio", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idUscitaStudio", IdUscitaStudio.Value, "DELETE","");

        SqlUscitaStudio.DeleteCommand = "Delete from TbUscitaStudio where IdUscitaStudio=" + IdUscitaStudio.Value;
        SqlUscitaStudio.Delete();
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "7", "0");

        Response.Redirect("uscitaStudio.aspx?SemID=0");
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = false;
        lblMsg.Text = "<b>Conferma eliminazione?</b><br/> ";
        Session["deleteRec"] = "1";
        divConferma.Visible = true;
        divConferma.Style["left"] =Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
    }

    protected void ConfermaNonCanc_Click(object sender, EventArgs e)
    {
        divConferma.Visible = false;
        Session["deleteRec"] = "0";
    }

    protected void StudioCompletato_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList StudioCompletato = frwUscitaStudio.FindControl("StudioCompletato") as RadioButtonList;
        DropDownList IdMotivoUscita = frwUscitaStudio.FindControl("IdMotivoUscita") as DropDownList;
        TextBox AltroMotivo = frwUscitaStudio.FindControl("AltroMotivo") as TextBox;
        x.ErrorMessage = "";
        if (StudioCompletato.SelectedValue == "2")
        {
            if (IdMotivoUscita.SelectedValue == "0")
            {
                args.IsValid = false;
                x.ErrorMessage = "The field <b>Reason</b> is required.</br>";
            }
            else
            {
                if (IdMotivoUscita.SelectedValue == "99" && AltroMotivo.Text.Trim() == "")
                {

                    args.IsValid = false;
                    x.ErrorMessage = "The field <b>Other, specify</b> is required.";
                }
            }
        }
	
    }

    
}
