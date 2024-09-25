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

public partial class ssl_nuovoPaziente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        MaintainScrollPositionOnPostBack = true;
        Session["deleteRec"] = "0";
        string strNumPaz = "";
        if (IsPostBack) return;
        if (Request["IdPaziente"].ToString() != "0")
        {
            frwDemog.DefaultMode = FormViewMode.Edit;
            strNumPaz = Request["NumPaz"].ToString();
            Session["NumPaz"] = strNumPaz;
        }
        else
        {
            frwDemog.DefaultMode = FormViewMode.Insert;
            strNumPaz = Session["SiteId"].ToString() + "-" + String.Format("{0:0#}", Convert.ToInt32(Request["NumPaz"].ToString()) + 1);
        }
        if (Session["NumPaz"] != "" && Session["NumPaz"] != null)
        {
            Session["NumPaz"] = strNumPaz;
        }
        SqlDemog.SelectCommand = "SELECT * FROM TbPazienti Where NumPaz='" + Session["NumPaz"] + "' And IdCentro=" + Session["IdCentro"];
        SqlDemog.DataBind();
        frwDemog.DataBind();
        HiddenField IdCentro = frwDemog.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        TextBox NumPaz = frwDemog.FindControl("NumPaz") as TextBox;
        NumPaz.Text = strNumPaz;

        Button btnSalva = frwDemog.FindControl("btnSalva") as Button;
        if (Request["IdPaziente"].ToString() != "0")
        {
            dataVisita d = new dataVisita();
            TextBox DataVisita = frwDemog.FindControl("DataVisita") as TextBox;
            DataVisita.Text = d.getDataVisita(Session["IdPaziente"].ToString(), "1", Session["pathDb"].ToString());
            // btnSalva.CommandName = "Update";
        }
        HiddenField UrlDiretto = frwDemog.FindControl("UrlDiretto") as HiddenField;
        HiddenField AlphaCode = frwDemog.FindControl("AlphaCode") as HiddenField;
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select * from rlpazientecodice Where NumPaz='" + NumPaz.Text + "'";
        MySqlCommand cmd1 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr = cmd1.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            UrlDiretto.Value = rdr["UrlDiretto"].ToString();
            AlphaCode.Value = rdr["AlphaCode"].ToString();
        }
        rdr.Close();
        cn.Close();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=1&Form=nuovoPaziente.aspx&Pagina=Registrazione del soggetto&nomeVisit=&IDTIPVIS=&SemId=";

        RemoveRadioNull rrn = new RemoveRadioNull();
        rrn.getRemoveRadioNull(frwDemog, "CI1,CI2,CI3,CI4,CE1", 2);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IdCentro"].ToString() != null)
            {
                HiddenField IdPaziente = frwDemog.FindControl("IdPaziente") as HiddenField;
                if (IdPaziente.Value != "")
                {
                    frwDemog.UpdateItem(false);
                }
                else
                {
                    TextBox NumPaz = frwDemog.FindControl("NumPaz") as TextBox;
                    MySqlConnection cn;
                    cn = new MySqlConnection(Session["pathDb"].ToString());
                    cn.Open();
                    string sql = "Select * from tbpazienti Where NumPaz='" + NumPaz.Text + "' And IdCentro=" + Session["IdCentro"].ToString();
                    MySqlCommand cmd1 = new MySqlCommand(sql, cn);
                    MySqlDataReader rdr = cmd1.ExecuteReader();
                    if (!rdr.HasRows)
                    {
                        rdr.Close();
                        cn.Close();
                        if (NumPaz.Text == Session["SiteId"].ToString() + "-01")
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
        Response.Redirect("elencoPazienti.aspx");
    }

    protected void frwDemog_ItemInsert(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                TextBox NumPaz = frwDemog.FindControl("NumPaz") as TextBox;
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select IdPaziente from tbpazienti where IdCentro=" + Session["IdCentro"] + " And NumPaz='" + NumPaz.Text + "'";
                MySqlCommand cmd = new MySqlCommand(sql, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                string idpaz = rdr["IdPaziente"].ToString();
                rdr.Close();
                cn.Close();
                caricaStat(idpaz);
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
        string NuovoPaziente = "";
        HiddenField IdPaziente = frwDemog.FindControl("IdPaziente") as HiddenField;
        if (IdPaziente.Value == "" || IdPaziente.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID( "tbPazienti", "IdPaziente", Session["pathDb"].ToString());
            NuovoPaziente = "SI";
        }
        else
        {
            valCI = IdPaziente.Value;
        }
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
        if (Session["CriteriSOD"] == "SI" && Session["CriteriINS"] == "SI")
        {
            AssegnaNumeroDCE(valCI);
        }
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("Pazienti", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPaziente", valCI, operazione, "");
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), valCI, "1", "1", "2");
        TextBox NumPaz = frwDemog.FindControl("NumPaz") as TextBox;
        TextBox DateVisit = frwDemog.FindControl("DateVisit") as TextBox;
        TextBox DataConsenso = frwDemog.FindControl("DataConsenso") as TextBox;
        Session["IdPaziente"] = valCI;
        Session["DateVisit"] = DateVisit.Text;
        Session["DataConsenso"] = DataConsenso.Text;
        Response.Redirect("anagrafica.aspx?IdPaziente=" + valCI + "&NumPaz=" + NumPaz.Text + "&SemID=2&IdTipVis=1&Aggiornamento=NO");
        
    }

    protected void AssegnaNumeroDCE(string idPaz)
    {
        
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

    protected void AltraRazza_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        DropDownList Razza = frwDemog.FindControl("Razza") as DropDownList;
        if (Razza.SelectedValue == "99")
        {
            args.IsValid = false;
        }
    }

    protected void CloseDiv_Click(object sender, EventArgs e)
    {
        divConfermaAlert.Visible = false;
        Session["alertRec"] = "0";
        Response.Redirect("elencoPazienti.aspx?NuovoPaziente=SI");
    }
}
