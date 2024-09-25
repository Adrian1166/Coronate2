using System;
using System.Collections;
using System.Configuration;
using System.Globalization;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;

public partial class ssl_Pathologies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        Session["deleteRec"] = "0";
        Session["alertRec"] = "0";
        Session["alertRecPatol"] = "0";
        SqlMenu.SelectCommand = "Select * from Prform where formid<>0 and vissual=1 order by orderform";
        SqlMenu.DataBind();
        frwMenu.DataBind();
        for (int i = 0; i < frwMenu.Items.Count; i++)
        {
            RepeaterItem r = frwMenu.Items[i];
            LinkButton lnk = r.FindControl("anagrafica") as LinkButton;
            if (lnk.ClientID == "frwMenu_ctl04_anagrafica")
            {
                lnk.ForeColor = System.Drawing.Color.FromName("#FF7A22");
                break;
            }
        }
        MaintainScrollPositionOnPostBack = true;
        CaricaPathologies();
        lnkGestioneQuery.PostBackUrl = "~/ssl/gestioneQuery.aspx?FormID=5&Form=Pathologies.aspx&Pagina=Pathologies&nomeVisit=&IDTIPVIS=1&SemId=" + Request["SemId"].ToString();
    }

    protected void CaricaPathologies()
    {
        if (IsPostBack) return;
        string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Infarction,AtrialFibrillation,"+
            "Congestive,Arrhythmias,HCV,HIV,HBV,RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis,"+
            "Chron,Psoriasis,Uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
        string[] campi = s.Split(',');
        int i = 0;
        string sData = "";
        for (i = 0; i < campi.Length; i++)
        {
            sData = sData + "concat(" + campi[i] + "DODD,'/'," + campi[i] + "DOMM,'/'," + campi[i] + "DOYY) as " + campi[i] + "DO,";
        }
        SqlPathologies.SelectCommand = "Select " + sData + "TbPathologies.* from TbPathologies where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlPathologies.Select(DataSourceSelectArguments.Empty);
        SqlPathologies.DataBind();
        frwPathologies.DataBind();
        HiddenField IdCentro = frwPathologies.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwPathologies.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdPathologies = frwPathologies.FindControl("IdPathologies") as HiddenField;
        Button btnSalva = frwPathologies.FindControl("btnSalva") as Button;
        Button btnElimina = frwPathologies.FindControl("btnElimina") as Button;

        for (i = 0; i < campi.Length; i++)
        {
            CaricaData cd = new CaricaData();
            cd.getCaricaData(frwPathologies, campi[i] + "DO");
            prendiData(campi[i] + "DO", campi[i] + "DO", frwPathologies);
        }
        HtmlContainerControl divMotivo = frwPathologies.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwPathologies.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        if (IdPathologies.Value != "")
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
        Label lblAggiornamento = frwPathologies.FindControl("lblAggiornamento") as Label;
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
        divQuery.Visible = tq.getTrovaQuery(Session["pathDB"].ToString(), Session["IdPaziente"].ToString(), "1", "5");
        removeRadioNull();
        CaricaMajorSurgery();
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
    protected void SqlPathologies_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwPathologies.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwPathologies.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IdCentro"] != null)
            {
                RadioButtonList MajorSurgeries = frwPathologies.FindControl("MajorSurgeries") as RadioButtonList;
                HiddenField IdPathologies = frwPathologies.FindControl("IdPathologies") as HiddenField;
                HiddenField SemId = frwPathologies.FindControl("SemId") as HiddenField;
                SemId.Value = "1";
                if (MajorSurgeries.SelectedValue == "") SemId.Value = "2";
                string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Infarction,AtrialFibrillation," +
                    "Congestive,Arrhythmias,HCV,HIV,HBV,RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis," +
                    "Chron,Psoriasis,Uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
                string[] campi = s.Split(',');
                int i = 0;

                for (i = 0; i < campi.Length; i++)
                {
                    DropDownList DataInizioDD = frwPathologies.FindControl(campi[i] + "DODD") as DropDownList;
                    DropDownList DataInizioMM = frwPathologies.FindControl(campi[i] + "DOMM") as DropDownList;
                    DropDownList DataInizioYY = frwPathologies.FindControl(campi[i] + "DOYY") as DropDownList;

                    if (IdPathologies.Value != "")
                    {
                        SqlPathologies.UpdateParameters[campi[i] + "DODD"].DefaultValue = DataInizioDD.SelectedValue;
                        SqlPathologies.UpdateParameters[campi[i] + "DOMM"].DefaultValue = DataInizioMM.SelectedValue;
                        SqlPathologies.UpdateParameters[campi[i] + "DOYY"].DefaultValue = DataInizioYY.SelectedValue;
                    }
                    else
                    {
                        SqlPathologies.InsertParameters[campi[i] + "DODD"].DefaultValue = DataInizioDD.SelectedValue;
                        SqlPathologies.InsertParameters[campi[i] + "DOMM"].DefaultValue = DataInizioMM.SelectedValue;
                        SqlPathologies.InsertParameters[campi[i] + "DOYY"].DefaultValue = DataInizioYY.SelectedValue;
                    }
                }
                
                Utility utility = new Utility();
                string ConnString = utility.getStringConnection(Request.ApplicationPath);
                MySqlConnection cn = new MySqlConnection(ConnString);
                cn.Open();
                string sql = "Select * from tbcirsscore where idPaziente=" + Session["idPaziente"];
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                string msgError = "";
                if (rdr1.HasRows)
                {
                    rdr1.Read();
                    CheckBoxList Hypertension = frwPathologies.FindControl("Hypertension") as CheckBoxList;
                    if (rdr1["Vascular"].ToString() == "0" && Hypertension.SelectedValue=="1")
                    {
                        msgError = msgError+ "In CIRS score The field <b>Vascular</b> deve essere >0.<br/>";
                    }
                    CheckBoxList Dyslipidemia = frwPathologies.FindControl("Dyslipidemia") as CheckBoxList;
                    CheckBoxList Obesity = frwPathologies.FindControl("Obesity") as CheckBoxList;
                    CheckBoxList Diabetes = frwPathologies.FindControl("Diabetes") as CheckBoxList;
                    CheckBoxList Metabolic = frwPathologies.FindControl("Metabolic") as CheckBoxList;
                    if (rdr1["Metabolic"].ToString() == "0" && (Dyslipidemia.SelectedValue == "1" || Obesity.SelectedValue == "1" || Diabetes.SelectedValue == "1" || Metabolic.SelectedValue == "1"))
                    {
                        msgError = msgError + "In CIRS score The field <b>Endocrine-Metabolic</b> deve essere >0.<br/>";
                    }
                    CheckBoxList Depression = frwPathologies.FindControl("Depression") as CheckBoxList;
                    CheckBoxList Anxiety = frwPathologies.FindControl("Anxiety") as CheckBoxList;
                    if (rdr1["Psychiatric"].ToString() == "0" && (Depression.SelectedValue == "1" || Anxiety.SelectedValue == "1"))
                    {
                        msgError = msgError + "In CIRS score The field <b>Psychiatric/Behavioral</b> deve essere >0.<br/>";
                    }
                    CheckBoxList Cardiovascular = frwPathologies.FindControl("Cardiovascular") as CheckBoxList;
                    if (rdr1["Cardiac"].ToString() == "0" && Cardiovascular.SelectedValue == "1")
                    {
                        msgError = msgError + "In CIRS score The field <b>Cardiac</b> deve essere >0.<br/>";
                    }
                    CheckBoxList HBV = frwPathologies.FindControl("HBV") as CheckBoxList;
                    CheckBoxList HCV = frwPathologies.FindControl("HCV") as CheckBoxList;
                    if (rdr1["Hepatic"].ToString() == "0" && (HBV.SelectedValue == "1" || HCV.SelectedValue == "1"))
                    {
                        msgError = msgError + "In CIRS score The field <b>Hepatic and Pancreatic</b> deve essere >0.<br/>";
                    }
                    CheckBoxList RheumatoidArthritis = frwPathologies.FindControl("RheumatoidArthritis") as CheckBoxList;
                    CheckBoxList AxialSponylitis = frwPathologies.FindControl("AxialSponylitis") as CheckBoxList;
                    CheckBoxList Psoriasis = frwPathologies.FindControl("Psoriasis") as CheckBoxList;
                    CheckBoxList PsoriaticArthritis = frwPathologies.FindControl("PsoriaticArthritis") as CheckBoxList;
                    if (rdr1["Musculoskeletal"].ToString() == "0" && (RheumatoidArthritis.SelectedValue == "1" || AxialSponylitis.SelectedValue == "1" || Psoriasis.SelectedValue == "1" || PsoriaticArthritis.SelectedValue == "1"))
                    {
                        msgError = msgError + "In CIRS score The field <b>Musculoskeletal</b> deve essere >0.<br/>";
                    }
                    CheckBoxList UlcerativeColitis = frwPathologies.FindControl("UlcerativeColitis") as CheckBoxList;
                    CheckBoxList Chron = frwPathologies.FindControl("Chron") as CheckBoxList;
                    if (rdr1["LowerGI"].ToString() == "0" && (UlcerativeColitis.SelectedValue == "1" || Chron.SelectedValue == "1"))
                    {
                        msgError = msgError + "In CIRS score The field <b>Lower GI</b> deve essere >0.<br/>";
                    }
                    CheckBoxList Uveitis = frwPathologies.FindControl("Uveitis") as CheckBoxList;
                    if (rdr1["EENT"].ToString() == "0" && Uveitis.SelectedValue == "1")
                    {
                        msgError = msgError + "In CIRS score The field <b>EENT</b> deve essere >0.<br/>";
                    }
                }
                rdr1.Close();
                cn.Close();
                if (msgError != "")
                {
                    
                    MaintainScrollPositionOnPostBack = false;
                    lblAlertPatol.Text = "<b>WARNING:</b><br/>" + msgError;
                    Session["alertRecPatol"] = "1";
                    divConfermaAlertPatol.Visible = true;
                    divConfermaAlertPatol.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 350) / 2) + "px";
                    
                    return;
                }
                if (IdPathologies.Value != "")
                {
                    frwPathologies.UpdateItem(false);
                }
                else
                {
                    MySqlConnection cn1 = new MySqlConnection(ConnString);
                    cn1.Open();
                    sql = "Select * from tbPathologies where idPaziente=" + Session["idPaziente"];
                    MySqlCommand cmd1 = new MySqlCommand(sql, cn1);
                    MySqlDataReader rdr = cmd1.ExecuteReader();
                    if (!rdr.HasRows)
                    {
                        rdr.Close();
                        cn1.Close();
                        frwPathologies.InsertItem(false);
                    }
                    else
                    {
                        rdr.Close();
                        cn1.Close();
                    }
                }
            }
        }
    }

    protected void CloseDivPatol_Click(object sender, EventArgs e)
    {
        RadioButtonList MajorSurgeries = frwPathologies.FindControl("MajorSurgeries") as RadioButtonList;
        HiddenField IdPathologies = frwPathologies.FindControl("IdPathologies") as HiddenField;
        HiddenField SemId = frwPathologies.FindControl("SemId") as HiddenField;
        SemId.Value = "1";
        if (MajorSurgeries.SelectedValue == "") SemId.Value = "2";
        string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Infarction,AtrialFibrillation," +
            "Congestive,Arrhythmias,HCV,HIV,HBV,RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis," +
            "Chron,Psoriasis,Uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
        string[] campi = s.Split(',');
        int i = 0;

        for (i = 0; i < campi.Length; i++)
        {
            DropDownList DataInizioDD = frwPathologies.FindControl(campi[i] + "DODD") as DropDownList;
            DropDownList DataInizioMM = frwPathologies.FindControl(campi[i] + "DOMM") as DropDownList;
            DropDownList DataInizioYY = frwPathologies.FindControl(campi[i] + "DOYY") as DropDownList;

            if (IdPathologies.Value != "")
            {
                SqlPathologies.UpdateParameters[campi[i] + "DODD"].DefaultValue = DataInizioDD.SelectedValue;
                SqlPathologies.UpdateParameters[campi[i] + "DOMM"].DefaultValue = DataInizioMM.SelectedValue;
                SqlPathologies.UpdateParameters[campi[i] + "DOYY"].DefaultValue = DataInizioYY.SelectedValue;
            }
            else
            {
                SqlPathologies.InsertParameters[campi[i] + "DODD"].DefaultValue = DataInizioDD.SelectedValue;
                SqlPathologies.InsertParameters[campi[i] + "DOMM"].DefaultValue = DataInizioMM.SelectedValue;
                SqlPathologies.InsertParameters[campi[i] + "DOYY"].DefaultValue = DataInizioYY.SelectedValue;
            }
        }
        divConfermaAlertPatol.Visible = false;
        Session["alertRecPatol"] = "0";
        if (IdPathologies.Value != "")
        {
            frwPathologies.UpdateItem(false);
        }
        else
        {
            Utility utility = new Utility();
            string ConnString = utility.getStringConnection(Request.ApplicationPath);
            MySqlConnection cn = new MySqlConnection(ConnString);
            cn.Open();
            string sql = "Select * from tbPathologies where idPaziente=" + Session["idPaziente"];
            MySqlCommand cmd1 = new MySqlCommand(sql, cn);
            MySqlDataReader rdr = cmd1.ExecuteReader();
            if (!rdr.HasRows)
            {
                rdr.Close();
                cn.Close();
                frwPathologies.InsertItem(false);
            }
            else
            {
                rdr.Close();
                cn.Close();
            }
        }
    }

    protected void frwPathologies_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampi("INSERT");
            }
        }
    }

    protected void frwPathologies_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Cardiovascular,Infarction,AtrialFibrillation,"+
            "Congestive,Arrhythmias,HCV,HIV,HBV,Autoimmune,RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis,"+
            "Chron,Psoriasis,Uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
        string[] campi = s.Split(',');
        int i = 0;
        for (i = 0; i < campi.Length; i++)
        {
            try{
            CheckBoxList chk = frwPathologies.FindControl(campi[i]) as CheckBoxList;
            chk.Items.RemoveAt(1);
            }
            catch
            {
                Response.Write(campi[i] + "</br>");
            }
        }
        RadioButtonList Pathologies = frwPathologies.FindControl("Pathologies") as RadioButtonList;
        Pathologies.Items.RemoveAt(2);
        RadioButtonList MajorSurgeries = frwPathologies.FindControl("MajorSurgeries") as RadioButtonList;
        MajorSurgeries.Items.RemoveAt(2);
        RadioButtonList BenignMalignan = frwPathologies.FindControl("BenignMalignan") as RadioButtonList;
        BenignMalignan.Items.RemoveAt(2);
    }


    protected void controllaCampi(string operazione)
    {
        string valCI = "";
        HiddenField IdPathologies = frwPathologies.FindControl("IdPathologies") as HiddenField;
        HiddenField SemId = frwPathologies.FindControl("SemId") as HiddenField;
        if (IdPathologies.Value == "" || IdPathologies.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("TbPathologies", "IdPathologies", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdPathologies.Value;
        }
        AuditTrial at = new AuditTrial();
        TextBox MotivoModifica = frwPathologies.FindControl("MotivoModifica") as TextBox;
        at.getAuditTrial("Pathologies", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdPathologies", valCI, operazione, MotivoModifica.Text);
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", SemId.Value);
        Response.Redirect("Pathologies.aspx?Aggiornamento=SI&semid=1");
    }

    protected void ConfermaCanc_Click(object sender, EventArgs e)
    {
        if (Session["nomeForm"].ToString() == "Pathologies")
        {
            HiddenField IdPathologies = frwPathologies.FindControl("IdPathologies") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("Pathologies", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idPathologies", IdPathologies.Value, "DELETE","");

            SqlPathologies.DeleteCommand = "Delete from tbPathologies where IdPaziente=" + Session["IdPaziente"].ToString();
            SqlPathologies.Delete();

            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            AggiornaStato aggs = new AggiornaStato();
            aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", "0");
            Response.Redirect("Pathologies.aspx?SemID=0&Aggiornamento=");
        }
        else
        {
            HiddenField IdMajorSurgery = frwMajorSurgery.FindControl("IdMajorSurgery") as HiddenField;
            AuditTrial at = new AuditTrial();
            at.getAuditTrial("MajorSurgery", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "idMajorSurgery", IdMajorSurgery.Value, "DELETE","");

            SqlPathologies.DeleteCommand = "Delete from tbmajorsurgery where Idmajorsurgery=" + IdMajorSurgery.Value;
            SqlPathologies.Delete();
            divConferma.Visible = false;
            Session["deleteRec"] = "0";
            divMajorSurgery.Visible = false;
            Session["ConfermaPatCom"] = "0";
            GridView grwElencoConc= frwPathologies.FindControl("grwElenco") as GridView;
            if (grwElencoConc.Rows.Count == 1)
            {
                AggiornaStato aggs = new AggiornaStato();
                aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", "2");
            }
            Response.Redirect("Pathologies.aspx?SemID=2&Aggiornamento=");
        }
    }

    protected void Delete_Clicked(object sender, EventArgs e)
    {
        Session["nomeForm"] = "Pathologies";
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

    protected void DataFine_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Infarction,AtrialFibrillation," +
            "Congestive,Arrhythmias,HCV,HIV,HBV,RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis," +
            "Chron,Psoriasis,Uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
        string[] campi = s.Split(',');
        string sDesc = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic syndrome,Other neoplasia,Depression,Anxiety,Previous myocardial infarction,Atrial fibrillation," +
            "Congestive heart failure,Arrhythmias other than AF,HCV,HIV,HBV,Rheumatoid Arthritis,Psoriatic Arthritis,Axial Spondylitis,Connective tissue disease,Ulcerative Colitis," +
            "Chron,Psoriasis,Non infectious uveitis,Other1,Other2,Other3,Other4,Other5,Other6";
        string[] campiDesc = sDesc.Split(',');

        int i = 0;
        x.ErrorMessage = "";
        
        for (i = 0; i < campi.Length; i++)
        {
            CheckBoxList chk = frwPathologies.FindControl(campi[i]) as CheckBoxList;
            if (chk.SelectedValue == "1")
            {
                CheckBoxList InCorso = frwPathologies.FindControl(campi[i] + "Ongoing") as CheckBoxList;
                DropDownList DataInizioDD = frwPathologies.FindControl(campi[i] + "DODD") as DropDownList;
                DropDownList DataInizioMM = frwPathologies.FindControl(campi[i] + "DOMM") as DropDownList;
                DropDownList DataInizioYY = frwPathologies.FindControl(campi[i] + "DOYY") as DropDownList;
                
                if (DataInizioDD.SelectedValue != "" || DataInizioMM.SelectedValue != "" || DataInizioYY.SelectedValue != "")
                {
                    if (DataInizioDD.SelectedValue == "")
                    {
                        x.ErrorMessage = x.ErrorMessage + "The field <b>" + campiDesc[i] + ": Day - Onset date</b> deve essere compilato.<br/>";
                        args.IsValid = false;
                    }
                    if (DataInizioMM.SelectedValue == "")
                    {
                        x.ErrorMessage = x.ErrorMessage + "The field <b>" + campiDesc[i] + ": Month - Onset date</b> deve essere compilato.<br/>";
                        args.IsValid = false;
                    }
                    if (DataInizioYY.SelectedValue == "")
                    {
                        x.ErrorMessage = x.ErrorMessage + "The field <b>" + campiDesc[i] + ": Year - Onset date</b> deve essere compilato.<br/>";
                        args.IsValid = false;
                    }
                }
                else
                {
                    x.ErrorMessage = x.ErrorMessage + "The field <b>" + campiDesc[i] + ": Onset date</b> deve essere compilato.<br/>";
                    args.IsValid = false;
                }
                
                if (DataInizioDD.SelectedValue != "" && DataInizioMM.SelectedValue != "" && DataInizioYY.SelectedValue != "")
                {
                    if (Convert.ToInt16(DataInizioYY.SelectedValue) > Convert.ToInt16(Session["DateVisit"].ToString().Substring(6,4)))
                    {
                        x.ErrorMessage = x.ErrorMessage + "<b>" + campiDesc[i] + ": Onset date</b> è successiva alla <b>Date of visit (" + Session["DateVisit"].ToString().Substring(0, 10) + ")</b>.<br/>";
                        args.IsValid = false;
                    }
                    else
                    {
                        if (Convert.ToInt16(DataInizioYY.SelectedValue) == Convert.ToInt16(Session["DateVisit"].ToString().Substring(6,4)))
                        {
                            if (DataInizioMM.SelectedValue != "UK")
                            {
                                if (Convert.ToInt16(DataInizioMM.SelectedValue) > Convert.ToInt16(Session["DateVisit"].ToString().Substring(3,2)))
                                {
                                    x.ErrorMessage = x.ErrorMessage + "<b>" + campiDesc[i] + ": Onset date</b> è successiva alla <b>Date of visit (" + Session["DateVisit"].ToString().Substring(0, 10) + ").<br/>";
                                    args.IsValid = false;
                                }
                                else
                                {
                                    if (DataInizioDD.SelectedValue != "UK")
                                    {
                                        if (Convert.ToInt16(DataInizioDD.SelectedValue) > Convert.ToInt16(Session["DateVisit"].ToString().Substring(0, 2)) && Convert.ToInt16(DataInizioMM.SelectedValue) == Convert.ToInt16(Session["DateVisit"].ToString().Substring(3, 2)))
                                        {
                                            x.ErrorMessage = x.ErrorMessage + "<b>" + campiDesc[i] + ": Onset date</b> è successiva alla <b>Date of visit (" + Session["DateVisit"].ToString().Substring(0,10) + ").<br/>";
                                            args.IsValid = false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        CheckBoxList Other1 = frwPathologies.FindControl("Other1") as CheckBoxList;
        RadioButtonList MajorSurgeries = frwPathologies.FindControl("MajorSurgeries") as RadioButtonList;
        if (Other1.SelectedValue == "" && MajorSurgeries.SelectedValue != "1")
        {
            Utility utility = new Utility();
            string ConnString = utility.getStringConnection(Request.ApplicationPath);
            MySqlConnection cn = new MySqlConnection(ConnString);
            cn.Open();
            string sql = "Select * from tbcirsscore where idPaziente=" + Session["idPaziente"];
            MySqlCommand cmd2 = new MySqlCommand(sql, cn);
            MySqlDataReader rdr1 = cmd2.ExecuteReader();
            string msgError = "";
            if (rdr1.HasRows)
            {
                rdr1.Read();
                CheckBoxList Hypertension = frwPathologies.FindControl("Hypertension") as CheckBoxList;
                if (rdr1["Vascular"].ToString() != "0" && Hypertension.SelectedValue == "")
                {
                    msgError = msgError + "In CIRS, score di <b>Vascular</b> è >0. The field <b>Hypertension</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList Dyslipidemia = frwPathologies.FindControl("Dyslipidemia") as CheckBoxList;
                CheckBoxList Obesity = frwPathologies.FindControl("Obesity") as CheckBoxList;
                CheckBoxList Diabetes = frwPathologies.FindControl("Diabetes") as CheckBoxList;
                CheckBoxList Metabolic = frwPathologies.FindControl("Metabolic") as CheckBoxList;
                if (rdr1["Metabolic"].ToString() != "0" && (Dyslipidemia.SelectedValue == "" && Obesity.SelectedValue == "" && Diabetes.SelectedValue == "" && Metabolic.SelectedValue == ""))
                {
                    msgError = msgError + "In CIRS, score di <b>Endocrine-Metabolic</b> è >0. Almeno uno tra i campi <b>Dyslipidemia/Obesity/Diabetes/Metabolic syndrome</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList Depression = frwPathologies.FindControl("Depression") as CheckBoxList;
                CheckBoxList Anxiety = frwPathologies.FindControl("Anxiety") as CheckBoxList;
                if (rdr1["Psychiatric"].ToString() != "0" && (Depression.SelectedValue == "" && Anxiety.SelectedValue == ""))
                {
                    msgError = msgError + "In CIRS, score di <b>Psychiatric/Behavioral</b> è >0. Almeno uno tra i campi <b>Depression/Anxiety</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList Cardiovascular = frwPathologies.FindControl("Cardiovascular") as CheckBoxList;
                if (rdr1["Cardiac"].ToString() != "0" && Cardiovascular.SelectedValue == "")
                {
                    msgError = msgError + "In CIRS, score di <b>Cardiac</b> è >0. The field <b>Cardiovascular disease</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList HBV = frwPathologies.FindControl("HBV") as CheckBoxList;
                CheckBoxList HCV = frwPathologies.FindControl("HCV") as CheckBoxList;
                if (rdr1["Hepatic"].ToString() != "0" && (HBV.SelectedValue == "" && HCV.SelectedValue == ""))
                {
                    msgError = msgError + "In CIRS, score di <b>Hepatic and Pancreatic</b> è >0. Almeno uno tra i campi <b>HBV/HCV</b> oppure unìaltra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList RheumatoidArthritis = frwPathologies.FindControl("RheumatoidArthritis") as CheckBoxList;
                CheckBoxList AxialSponylitis = frwPathologies.FindControl("AxialSponylitis") as CheckBoxList;
                CheckBoxList Psoriasis = frwPathologies.FindControl("Psoriasis") as CheckBoxList;
                CheckBoxList PsoriaticArthritis = frwPathologies.FindControl("PsoriaticArthritis") as CheckBoxList;
                if (rdr1["Musculoskeletal"].ToString() != "0" && (RheumatoidArthritis.SelectedValue == "" && AxialSponylitis.SelectedValue == "" && Psoriasis.SelectedValue == "" && PsoriaticArthritis.SelectedValue == ""))
                {
                    msgError = msgError + "In CIRS, score di <b>Musculoskeletal</b> è >0. Almeno uno tra i campi <b>Rheumatoid Arthritis/Axial Spondylitis/Psoriasis/Psoriatic Arthritis</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList UlcerativeColitis = frwPathologies.FindControl("UlcerativeColitis") as CheckBoxList;
                CheckBoxList Chron = frwPathologies.FindControl("Chron") as CheckBoxList;
                if (rdr1["LowerGI"].ToString() != "0" && (UlcerativeColitis.SelectedValue == "" && Chron.SelectedValue == "") )
                {
                    msgError = msgError + "In CIRS, score di <b>Lower GI</b> è >0. Almeno uno tra i campi <b>Ulcerative Colitis/Chron</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                CheckBoxList Uveitis = frwPathologies.FindControl("Uveitis") as CheckBoxList;
                if (rdr1["EENT"].ToString() != "0" && Uveitis.SelectedValue == "1")
                {
                    msgError = msgError + "In CIRS, score di <b>EENT</b> è >0. The field <b>Non infectious uveitis</b> oppure un'altra patologia <b>Other</b> deve essere selezionato.<br/>";
                }
                if (msgError != "")
                {
                    args.IsValid = false;
                    x.ErrorMessage = x.ErrorMessage + msgError;
                }
            }
            rdr1.Close();
            cn.Close();
        }
    }

    protected void AltroNeoplasia_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        TextBox AltroSpec = frwPathologies.FindControl("OtherNeoplasiaSpec") as TextBox;
        CheckBoxList Altro = frwPathologies.FindControl("OtherNeoplasia") as CheckBoxList;
        if (Altro.SelectedValue == "1" && AltroSpec.Text.Trim() == "")
        {
            args.IsValid = false;
        }
    }

    protected void Altro_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        TextBox AltroSpec = frwPathologies.FindControl(x.ControlToValidate) as TextBox;
        CheckBoxList Altro = frwPathologies.FindControl(x.ControlToValidate.Substring(0, 6)) as CheckBoxList;
        if (Altro.SelectedValue == "1" && AltroSpec.Text.Trim() == "")
        {
            args.IsValid = false;
        }
    }

    protected void Pathologies_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        RadioButtonList Pathologies = frwPathologies.FindControl("Pathologies") as RadioButtonList;
        x.ErrorMessage = "";
        if (Pathologies.SelectedValue == "1")
        {
            string s = "Hypertension,Dyslipidemia,Obesity,Diabetes,Metabolic,OtherNeoplasia,Depression,Anxiety,Cardiovascular," +
            "HCV,HIV,HBV,Autoimmune,Other1,Other2,Other3,Other4,Other5,Other6";
            string[] campi = s.Split(',');
            int i = 0;
            for (i = 0; i < campi.Length; i++)
            {
                CheckBoxList chk = frwPathologies.FindControl(campi[i]) as CheckBoxList;
                if (chk.SelectedValue == "1") break;
            }
            if (i == campi.Length)
            {
                x.ErrorMessage = "Almeno una <b>Other major pathologie</b> deve essere selezionata.</br>";
                args.IsValid = false;
            }
            CheckBoxList Cardiovascular = frwPathologies.FindControl("Cardiovascular") as CheckBoxList;
            if (Cardiovascular.SelectedValue == "1")
            {
                string s1 = "Infarction,AtrialFibrillation,Congestive,Arrhythmias";
                string[] campi1 = s1.Split(',');
                for (i = 0; i < campi1.Length; i++)
                {
                    CheckBoxList chk1 = frwPathologies.FindControl(campi1[i]) as CheckBoxList;
                    if (chk1.SelectedValue == "1") break;
                }
                if (i == campi1.Length)
                {
                    x.ErrorMessage = x.ErrorMessage + "Almeno una patologia per <b>Cardiovascular disease</b> deve essere selezionata.</br>";
                    args.IsValid = false;
                }
            }
            CheckBoxList Autoimmune = frwPathologies.FindControl("Autoimmune") as CheckBoxList;
            if (Autoimmune.SelectedValue == "1")
            {
                string s1 = "RheumatoidArthritis,PsoriaticArthritis,AxialSponylitis,ConnectiveTissue,UlcerativeColitis,Chron,Psoriasis,Uveitis";
                string[] campi1 = s1.Split(',');
                for (i = 0; i < campi1.Length; i++)
                {
                    CheckBoxList chk1 = frwPathologies.FindControl(campi1[i]) as CheckBoxList;
                    if (chk1.SelectedValue == "1") break;
                }
                if (i == campi1.Length)
                {
                    x.ErrorMessage = x.ErrorMessage + "Almeno una patologia per <b>Autoimmune disease</b> deve essere selezionata.";
                    args.IsValid = false;
                }
            }
        }
        CheckBoxList OtherNeoplasia = frwPathologies.FindControl("OtherNeoplasia") as CheckBoxList;
        RadioButtonList BenignMalignan = frwPathologies.FindControl("BenignMalignan") as RadioButtonList;
        if (OtherNeoplasia.SelectedValue == "1" && BenignMalignan.SelectedValue == "")
        {
            x.ErrorMessage = x.ErrorMessage + "Specificare se <b>Neoplasia</b> è <b>Benign</b> o <b>Malignant</b>.";
            args.IsValid = false;
        }
        Utility utility = new Utility();
        string ConnString = utility.getStringConnection(Request.ApplicationPath);
        MySqlConnection cn = new MySqlConnection(ConnString);
        cn.Open();
        string sql = "Select BMI from tbsegnivitali where idPaziente=" + Session["idPaziente"];
        MySqlCommand cmd2 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr1 = cmd2.ExecuteReader();
        string BMI = "0";
        if (rdr1.HasRows)
        {
            rdr1.Read();
            BMI = rdr1[0].ToString();
        }
        rdr1.Close();
        cn.Close();
        CheckBoxList Obesity = frwPathologies.FindControl("Obesity") as CheckBoxList;
        if (BMI != "")
        {
            if (Convert.ToDouble(BMI.Replace(".", ",")) > 30 && Obesity.SelectedValue == "")
            {
                x.ErrorMessage = x.ErrorMessage + "BMI del paziente è >30, The field <b>Obesity</b> deve essere selezionato.";
                args.IsValid = false;
            }
        }
    }


    protected void CaricaMajorSurgery()
    {
        SqlDataSource SqlElenco = frwPathologies.FindControl("SqlElenco") as SqlDataSource;
        SqlElenco.SelectCommand = "Select concat(DateSurgeryMM,'/',DateSurgeryYY) as DateSurgery,tbMajorSurgery.* from tbmajorsurgery where IdPaziente=" + Session["IdPaziente"].ToString();
        SqlElenco.DataBind();
        GridView grwElenco = frwPathologies.FindControl("grwElenco") as GridView;
        grwElenco.DataBind();
        RadioButtonList MajorSurgeries = frwPathologies.FindControl("MajorSurgeries") as RadioButtonList;
        if (grwElenco.Rows.Count > 0)
        {
            MajorSurgeries.SelectedValue = "1";
            MajorSurgeries.Enabled = false;
        }
        else
        {
            MajorSurgeries.Enabled = true;
        }
    }

    //tratamento per CLL
    protected void btnNuovaMajorSurgery_Click(object sender, EventArgs e)
    {
        string idMajorSurgery = "0";
        frwMajorSurgery.ChangeMode(FormViewMode.Insert);
        SqlMajorSurgery.SelectCommand = "Select concat('01','/',DateSurgeryMM,'/',DateSurgeryYY) as DateSurgery,tbMajorSurgery.* from tbMajorSurgery where idMajorSurgery=" + idMajorSurgery;
        SqlMajorSurgery.DataBind();
        frwMajorSurgery.DataBind();
        divMajorSurgery.Visible = true;
        Session["GestioneMajorSurgery"] = "1";
        divMajorSurgery.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        divMajorSurgery.Style["top"] = "1000px";
        HiddenField IdCentro = frwMajorSurgery.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwMajorSurgery.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField SemId = frwMajorSurgery.FindControl("SemId") as HiddenField;
        SemId.Value = "1";
        Button btnElimina = frwMajorSurgery.FindControl("btnElimina") as Button;
        btnElimina.Visible = false;
        TextBox DataVisita = frwMajorSurgery.FindControl("DataVisita") as TextBox;
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwMajorSurgery.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwMajorSurgery.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = false;
        rfvMotivoModifica.Enabled = false;
    }

    protected void SqlMajorSurgery_OnSelected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            frwMajorSurgery.ChangeMode(FormViewMode.Insert);
        }
        else
        {
            frwMajorSurgery.ChangeMode(FormViewMode.Edit);
        }
    }

    protected void grwElenco_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView grwElenco = sender as GridView;
        frwMajorSurgery.ChangeMode(FormViewMode.Edit);
        SqlMajorSurgery.SelectCommand = "Select concat('01','/',DateSurgeryMM,'/',DateSurgeryYY) as DateSurgery,tbMajorSurgery.* from tbMajorSurgery where idMajorSurgery=" + grwElenco.DataKeys[grwElenco.SelectedIndex].Value;
        SqlMajorSurgery.DataBind();
        frwMajorSurgery.DataBind();
        Button btnElimina = frwMajorSurgery.FindControl("btnElimina") as Button;
        btnElimina.Visible = true;
        divMajorSurgery.Visible = true;
        Session["GestioneMajorSurgery"] = "1";
        divMajorSurgery.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 670) / 2) + "px";
        divMajorSurgery.Style["top"] = "1000px";
        TextBox DataVisita = frwMajorSurgery.FindControl("DataVisita") as TextBox;
        DataVisita.Text = Session["DateVisit"].ToString().Substring(0, 10);
        HtmlContainerControl divMotivo = frwMajorSurgery.FindControl("divMotivo") as HtmlContainerControl;
        RequiredFieldValidator rfvMotivoModifica = frwMajorSurgery.FindControl("rfvMotivoModifica") as RequiredFieldValidator;
        divMotivo.Visible = true;
        rfvMotivoModifica.Enabled = true;
    }

    protected void btnSalvaMajorSurgery_Click(object sender, EventArgs e)
    {
        if (Session["IdCentro"] != null && Page.IsValid)
        {
            Button btn = sender as Button;
            HiddenField SemID = frwMajorSurgery.FindControl("SemID") as HiddenField;
            SemID.Value = "1";

            HiddenField IdMajorSurgery = frwMajorSurgery.FindControl("IdMajorSurgery") as HiddenField;
            if (IdMajorSurgery.Value != "")
            {
                frwMajorSurgery.UpdateItem(false);
            }
            else
            {
                frwMajorSurgery.InsertItem(false);
            }
        }

    }

    protected void frwMajorSurgery_ItemInserted(Object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                controllaCampiTer("INSERT");
            }
        }
    }

    protected void frwMajorSurgery_ItemUpdated(Object sender, FormViewUpdatedEventArgs e)
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
        HiddenField SemID = frwPathologies.FindControl("SemID") as HiddenField;
        string vSemID = SemID.Value;
        HiddenField IdMajorSurgery = frwMajorSurgery.FindControl("IdMajorSurgery") as HiddenField;
        if (IdMajorSurgery.Value == "" || IdMajorSurgery.Value == "0")
        {
            ChiaveID ci = new ChiaveID();
            valCI = ci.getChiaveID("tbMajorSurgery", "IdMajorSurgery", Session["pathDb"].ToString());
        }
        else
        {
            valCI = IdMajorSurgery.Value;
        }

        TextBox MotivoModifica = frwMajorSurgery.FindControl("MotivoModifica") as TextBox;
        if (SemID.Value == "2") vSemID = "1";
        if (SemID.Value == "") vSemID = "2";
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), "1", "5", vSemID);
        AuditTrial at = new AuditTrial();
        at.getAuditTrial("MajorSurgery", Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "IdMajorSurgery", valCI, operazione, MotivoModifica.Text);
        Response.Redirect("Pathologies.aspx?Aggiornamento=&semid=" + SemID.Value);
    }

    protected void MajorSurgeryDate(object source, ServerValidateEventArgs args)
    {
        CustomValidator x = source as CustomValidator;
        DropDownList DateSurgeryMM = frwMajorSurgery.FindControl("DateSurgeryMM") as DropDownList;
        DropDownList DateSurgeryYY = frwMajorSurgery.FindControl("DateSurgeryYY") as DropDownList;
        TextBox DataVisita = frwMajorSurgery.FindControl("DataVisita") as TextBox;
        x.ErrorMessage = "";
        if (Convert.ToInt16(DateSurgeryYY.SelectedValue) > Convert.ToInt16(DataVisita.Text.Substring(6)))
        {
            args.IsValid = false;
            x.ErrorMessage = "<b>Date Surgery</b> it cannot be after the <b>Visit date</b>.<br>";
        }
        else
        {
            if (DateSurgeryMM.SelectedValue != "UK")
            {
                if (Convert.ToInt16(DateSurgeryYY.SelectedValue) == Convert.ToInt16(DataVisita.Text.Substring(6)) && Convert.ToInt16(DateSurgeryMM.SelectedValue) > Convert.ToInt16(DataVisita.Text.Substring(3, 2)))
                {
                    args.IsValid = false;
                    x.ErrorMessage = "<b>Date Surgery</b> it cannot be after the <b>Visit date</b>.<br>";
                }
            }
        }

        
    }
}
