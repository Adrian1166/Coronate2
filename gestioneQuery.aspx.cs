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

public partial class ssl_gestioneQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Risposta"] = "0";
        if (IsPostBack) return;
        Session["NuovaQuery"] = "0";
        ddlForm.SelectedValue = Request["FormId"].ToString();
        ddlForm.DataBind();
        ddlVisita.SelectedValue = Request["IDTIPVIS"].ToString();
        ddlVisita.DataBind();
        SqlPazienti.SelectCommand = "Select 'Tutti' as NumPaz, 0 as IdPaziente from tbPazienti union Select NumPaz,IdPaziente from tbPazienti where IdCentro=" + Session["IdCentro"] + " order by IdPaziente";
        SqlPazienti.DataBind();
        if (Session["IdPaziente"] != null)
        {
            ddlPazienti.SelectedValue = Session["IdPaziente"].ToString();
        }
        ddlPazienti.DataBind();
        btnCerca_Click(btnCerca, EventArgs.Empty);
	
    }

    protected void btnCerca_Click(object sender, EventArgs e)
    {
        string sql = "";
        sql = "SELECT" +
            " NumPaz,lsstatoquery.StatoQuery, tbquery.DataQuery, tbquery.IdQuery, lstipoquery.TipoQuery, RlFormCampo.Descrizione as newCampo, " +
            " tbquery.TestoQuery, Count(tbqryris.IdQryRis) AS NRisp, tbquery.IdPaziente, tbquery.IDTIPVIS,lstipvis.DESC, " +
            " TABELLA,prform.desc as descForm, max(tbqryris.DataOraRisp) as DataOraRisp, " +
            " tbquery.IdForm " +
            " FROM " +
            " ((((lstipoquery RIGHT JOIN (lsstatoquery RIGHT JOIN tbquery ON lsstatoquery.IdStatoQuery = tbquery.StatoQuery) " +
            " ON lstipoquery.IdTipoQuery = tbquery.TipoQuery) " +
            " LEFT JOIN tbqryris ON tbquery.IdQuery = tbqryris.IdQuery) left join lstipvis on tbquery.IDTIPVIS=lstipvis.TIPVISID) " +
            " Left Join prform ON tbquery.IdForm = prform.FORMID) left join RlFormCampo on tbquery.IdForm=RlFormCampo.IdForm and tbquery.Campo=RlFormCampo.Campo " +
            " left join tbPazienti on tbquery.IdPaziente=tbPazienti.IdPaziente" +
            " where tbquery.IdPaziente";
        if (ddlPazienti.SelectedValue == "0")
        {
            sql = sql + " >0";
        }
        else
        {
            sql = sql + "=" + ddlPazienti.SelectedValue;
        }
        if (ddlVisita.SelectedValue != "0" && ddlVisita.SelectedValue != "")
        {
            sql = sql + " AND tbquery.IDTIPVIS=" + ddlVisita.SelectedValue;
        }
        if (StatoQuery.SelectedValue != "0" && StatoQuery.SelectedValue != "")
        {
            sql = sql + " AND lsstatoquery.Idstatoquery=" + StatoQuery.SelectedValue;
        }
        if (TipoQuery.SelectedValue != "0" && TipoQuery.SelectedValue != "")
        {
            sql = sql + " AND lstipoquery.Idtipoquery=" + TipoQuery.SelectedValue;
        }
        if (ddlForm.SelectedValue != "0" && ddlForm.SelectedValue != "")
        {
            sql = sql + " AND tbquery.IdForm= " + ddlForm.SelectedValue;
        }
        sql = sql + " AND tbquery.IdCentro=" + Session["IdCentro"];
        sql = sql + " GROUP BY lsstatoquery.StatoQuery, tbquery.DataQuery, tbquery.IdQuery, lstipoquery.TipoQuery, tbquery.campo, " +
          " tbquery.TestoQuery, tbquery.IdPaziente, tbquery.IDTIPVIS, lsstatoquery.Idstatoquery, lstipoquery.IdTipoQuery, " +
          " tbquery.IdForm ";
            
        //Response.Write(sql);
        SqlElencoQuery.SelectCommand = sql;
        SqlElencoQuery.DataBind();
        rptElenco.DataBind();
	for (int i = 0; i < rptElenco.Items.Count;i++)
        {
            RepeaterItem rpi = rptElenco.Items[i];
            ImageButton imgb = rpi.FindControl("imgRisposta") as ImageButton;

                Label IdQry = rpi.FindControl("IdQuery") as Label;
                HtmlContainerControl divRisposta = rpi.FindControl("divRisposta") as HtmlContainerControl;
                if (imgb.AlternateText == "OPEN")
                {
                    Repeater rpt = rpi.FindControl("rptRisposta") as Repeater;
                    SqlDataSource SqlRis = rpi.FindControl("SqlElencoRis") as SqlDataSource;
                    SqlRis.SelectCommand = "Select * from tbqryris left join tbutente on tbqryris.idutente=tbutente.idutente where IdQuery=" + IdQry.Text.Trim() + " order by DataOraRisp desc";
                    SqlRis.DataBind();
                    rpt.DataBind();
                    divRisposta.Visible = true;
                    imgb.ImageUrl = "../images/comprire.jpg";
                    imgb.AlternateText = "CHIUDI";
                }
                else
                {
                    imgb.ImageUrl = "../images/add.jpg";
                    imgb.AlternateText = "OPEN";
                    divRisposta.Visible = false;
                }
                
           
        }
    }

    protected void btnNuovo_Click(object sender, EventArgs e)
    {
        SqlQuery.SelectCommand = "Select * from tbquery where IdQuery=0";
        SqlQuery.DataBind();
        frwQuery.DataBind();
        HiddenField IdCentro = frwQuery.FindControl("IdCentro") as HiddenField;
        IdCentro.Value = Session["IdCentro"].ToString();
        HiddenField IdPaziente = frwQuery.FindControl("IdPaziente") as HiddenField;
        IdPaziente.Value = Session["IdPaziente"].ToString();
        HiddenField IdTipVis = frwQuery.FindControl("IdTipVis") as HiddenField;
        IdTipVis.Value = Request["IdTipVis"].ToString();
        divQuery.Visible = true;
        divQuery.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 600) / 2) + "px";
        DropDownList ddlPazientiQry = frwQuery.FindControl("ddlPazienti") as DropDownList;
        ddlPazientiQry.SelectedValue = ddlPazienti.SelectedValue;
        CaricaCampiVisita(ddlPazienti, EventArgs.Empty);
        DropDownList ddlFormQry = frwQuery.FindControl("ddlForm") as DropDownList;
        ddlFormQry.SelectedValue = ddlForm.SelectedValue;
        Session["NuovaQuery"] = "1";
        SqlPazientiQry.SelectCommand = "Select 'Tutti' as NumPaz, 0 as IdPaziente from tbPazienti union Select NumPaz,IdPaziente from tbPazienti where IdCentro=" + Session["IdCentro"] + " order by IdPaziente";
        SqlPazientiQry.DataBind();
        ddlPazientiQry.SelectedValue = Session["IdPaziente"].ToString();
        ddlPazientiQry.DataBind();
        CaricaCampiForm(sender, EventArgs.Empty);
    }

    protected void CaricaCampiVisita(object sender, EventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        DropDownList ddlVisitaQry = frwQuery.FindControl("ddlVisita") as DropDownList;
        DropDownList ddlFormQry = frwQuery.FindControl("ddlForm") as DropDownList;
        DropDownList ddlCampoQry = frwQuery.FindControl("ddlCampo") as DropDownList;
        SqlFormQry.SelectCommand = "Select FORMID,prForm.DESC as descrizione,ORDERFORM from prForm inner join prformtipvis on prForm.FORMID=prformtipvis.IdForm where IdTipoVisite=" + ddlVisitaQry.SelectedValue + " order by 3";
        SqlFormQry.DataBind();
        ddlFormQry.DataBind();
        if (ddl.ID == "ddlVisita")
        {
            CaricaCampiForm(sender, EventArgs.Empty);
        }
    }

    protected void CaricaCampiForm(object sender, EventArgs e)
    {
        DropDownList ddlVisitaQry = frwQuery.FindControl("ddlVisita") as DropDownList;
        DropDownList ddlFormQry = frwQuery.FindControl("ddlForm") as DropDownList;
        DropDownList ddlCampoQry = frwQuery.FindControl("ddlCampo") as DropDownList;
        SqlCampo.SelectCommand = "Select 0,'' as Campo,'' as descrizione,0 as ordine union Select * from RlFormCampo where idform=" + ddlFormQry.SelectedValue + " order by ordine";
        SqlCampo.DataBind();
        ddlCampoQry.DataBind();

    }
    protected void btnIndietro_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request["Form"].ToString() + "?pagina=" + Request["pagina"] + "&IDTIPVIS=" + Request["IDTIPVIS"].ToString() + "&nomeVisit=" + Request["nomeVisit"] + "&SemID=" + Request["SemId"].ToString() + "&FormID=" + Request["FormID"].ToString()+"&Aggiornamento=");
    }

    protected void btnRispondi_Click(object sender, EventArgs e)
    {
        ImageButton imgRisposta = sender as ImageButton;
        for (int i = 0; i < rptElenco.Items.Count;i++)
        {
            RepeaterItem rpi = rptElenco.Items[i];
            ImageButton imgb = rpi.FindControl("imgRisposta") as ImageButton;
            if (imgb.ClientID == imgRisposta.ClientID)
            {
                Label IdQry = rpi.FindControl("IdQuery") as Label;
                HtmlContainerControl divRisposta = rpi.FindControl("divRisposta") as HtmlContainerControl;
                if (imgRisposta.AlternateText == "OPEN")
                {
                    Repeater rpt = rpi.FindControl("rptRisposta") as Repeater;
                    SqlDataSource SqlRis = rpi.FindControl("SqlElencoRis") as SqlDataSource;
                    SqlRis.SelectCommand = "Select * from tbqryris left join tbutente on tbqryris.idutente=tbutente.idutente where IdQuery=" + IdQry.Text.Trim() + " order by DataOraRisp desc";
                    SqlRis.DataBind();
                    rpt.DataBind();
                    divRisposta.Visible = true;
                    imgRisposta.ImageUrl = "../images/comprire.jpg";
                    imgRisposta.AlternateText = "CHIUDI";
                }
                else
                {
                    imgRisposta.ImageUrl = "../images/add.jpg";
                    imgRisposta.AlternateText = "OPEN";
                    divRisposta.Visible = false;
                }
                break;
            }
        }
    }

    protected void btnNuovaRisposta_Click(object sender, EventArgs e)
    {
        Button btnRispondi = sender as Button;
        for (int i = 0; i < rptElenco.Items.Count;i++)
        {
            RepeaterItem rpi = rptElenco.Items[i];
            Button btn = rpi.FindControl("btnRispondi") as Button;
            if (btn.ClientID == btnRispondi.ClientID)
            {
                Label IdQry = rpi.FindControl("IdQuery") as Label;
                SqlRisposta.SelectCommand = "Select * from tbqryris where IdQryRis=0";
                SqlRisposta.DataBind();
                frwRisposta.DataBind();
                HiddenField IdUtente = frwRisposta.FindControl("IdUtente") as HiddenField;
                IdUtente.Value = Session["IdUtente"].ToString();
                HiddenField IdQuery = frwRisposta.FindControl("IdQuery") as HiddenField;
                IdQuery.Value = IdQry.Text.Trim();
                Session["IdQuery"] = IdQuery.Value;
                break;
            }
        }
        divRisposta.Visible = true;
        Session["RispostaQuery"] = "1";
        divRisposta.Style["left"] = Convert.ToString((Convert.ToInt16(Session["SchermoWidth"].ToString()) - 600) / 2) + "px";
        MaintainScrollPositionOnPostBack = false;
        
    }

    protected void btnSalvaRisposta_Click(object sender, EventArgs e)
    {
        Session["RispostaQuery"] = "0";
        divRisposta.Visible = false;
        Response.Redirect(Request["Form"].ToString() + "?pagina=" + Request["pagina"] + "&IDTIPVIS=" + Request["IDTIPVIS"].ToString() + "&nomeVisit=" + Request["nomeVisit"] + "&SemID=" + Request["SemId"].ToString() + "&Aggiornamento=");
    }

    protected void TrovaItem()
    {
        MaintainScrollPositionOnPostBack = true;
        for (int i = 0; i < rptElenco.Items.Count; i++)
        {
           RepeaterItem rpi = rptElenco.Items[i];
           Label IdQuery = rpi.FindControl("IdQuery") as Label;
           if (Session["IdQuery"]== null)
            {
                ImageButton imgRisposta = rpi.FindControl("imgRisposta") as ImageButton;
                imgRisposta.AlternateText = "APRI";
                btnRispondi_Click(imgRisposta, EventArgs.Empty);
                break;
            }else{
		if (Session["IdQuery"].ToString() == IdQuery.Text.Trim())
            {
                ImageButton imgRisposta = rpi.FindControl("imgRisposta") as ImageButton;
                imgRisposta.AlternateText = "APRI";
                btnRispondi_Click(imgRisposta, EventArgs.Empty);
                break;
            }
}
        }
    }

    protected void btnChiudi_Click(object sender, EventArgs e)
    {

        Button btnChiudiQry = sender as Button;
        for (int i = 0; i < rptElenco.Items.Count;i++)
        {
            RepeaterItem rpi = rptElenco.Items[i];
            Button btn = rpi.FindControl("btnChiudiQry") as Button;
            if (btn.ClientID == btnChiudiQry.ClientID)
            {
                Label IdQry = rpi.FindControl("IdQuery") as Label;
                Label lblIdTipVis = rpi.FindControl("lblIdTipVis") as Label;
                Label lblIdForm = rpi.FindControl("lblIdForm") as Label;
                Label lblTabella = rpi.FindControl("lblTabella") as Label;
                SqlChiudiQry.UpdateCommand = "Update TBQuery Set StatoQuery=2 where IdQuery=" + IdQry.Text;
                SqlChiudiQry.Update();
                AggiornaStatoMonitor aggsm = new AggiornaStatoMonitor();
                aggsm.getAggiornaStatoMonitor(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), lblIdTipVis.Text, lblIdForm.Text, lblTabella.Text);
                AggiornaStato aggs = new AggiornaStato();
                aggs.getAggiornaStato(Session["pathDb"].ToString(), Session["IdPaziente"].ToString(), lblIdTipVis.Text, "0", "0");
                Response.Redirect("gestioneQuery.aspx?pagina=" + Request["pagina"] + "&IDTIPVIS=" + lblIdTipVis.Text + "&nomeVisit=" + Request["nomeVisit"] + "&FormId=" + lblIdForm.Text + "&Form=" + Request["Form"].ToString() + "&SemID=" + Request["SemId"].ToString() + "&Aggiornamento=");
                break;
            }
        }
  
    }

    protected void btnSalvaQuery_Click(object sender, EventArgs e)
    {
        DropDownList ddlPazienti = frwQuery.FindControl("ddlPazienti") as DropDownList;
        DropDownList ddlForm = frwQuery.FindControl("ddlForm") as DropDownList;
        DropDownList ddlCampo = frwQuery.FindControl("ddlCampo") as DropDownList;
        DropDownList ddlVisita = frwQuery.FindControl("ddlVisita") as DropDownList;
        TextBox TestoQuery = frwQuery.FindControl("TestoQuery") as TextBox;
        SqlQuery.InsertCommand = "INSERT INTO TBQuery (IdCentro, IdPaziente, IdTipVis, IdForm, Campo, DataQuery, TipoQuery, StatoQuery, IdTxtQry, TestoQuery, IdChiave)" +
                        " Values (" + Session["IdCentro"].ToString() + ", " + ddlPazienti.SelectedValue + ", " + ddlVisita.SelectedValue + ", " + ddlForm.SelectedValue + ", '" + ddlCampo.SelectedValue + "', NOW(), 2, 1, 0, '" + TestoQuery.Text.Replace("'", "''") + "', 0)";
        SqlQuery.Insert();

        divQuery.Visible = false;
        AggiornaStato aggs = new AggiornaStato();
        aggs.getAggiornaStato(Session["pathDb"].ToString(), ddlPazienti.SelectedValue, ddlVisita.SelectedValue, ddlForm.SelectedValue, "3");
        aggs.getAggiornaStato(Session["pathDb"].ToString(), ddlPazienti.SelectedValue, ddlVisita.SelectedValue, "0", "0");
        Session["NuovaQuery"] = "0";
        Response.Redirect("gestioneQuery.aspx?pagina=" + Request["pagina"] + "&IDTIPVIS=" + Request["IdTipVis"] + "&nomeVisit=" + Request["nomeVisit"] + "&FormId=" + Request["FormId"] + "&Form=" + Request["Form"].ToString() + "&SemID=" + Request["SemId"].ToString() + "&Aggiornamento=");
    }

    protected void CreaTabelleQuery(object sender, EventArgs e)
    {
        SqlTotale.SelectCommand = "SELECT concat('\"',NumPaz,'\"') as NumPaz,lstipvis.DESC as newDesc,prform.DESC as newDescForm," +
                 " if(StatoQuery=1,'Aperto','Chiuso') as StatoQuery,tbqryris.DataOraRisp,Risposta, tbquery.* FROM tbpazienti " +
       " inner JOIN tbquery  ON (tbquery.IdPaziente = tbpazienti.IdPaziente)" +
       " left JOIN prform ON (tbquery.IdForm = prform.formid)" +
       " left JOIN lstipvis ON (lstipvis.TIPVISID = tbquery.Idtipvis)" +
       " left JOIN tbqryris ON (tbqryris.IdQuery = tbquery.IdQuery)" +
       " where tbpazienti.IdCentro<>1 and tbpazienti.IdCentro<>2 order by NumPaz, tbquery.Idtipvis,DataOraRisp";
        SqlTotale.DataBind();
        grwTotale.DataBind();

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Export1.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        htmlWrite.WriteLine();
        htmlWrite.WriteLine("<strong><font size='4'>Elenco query</font></strong>");
        // viene reindirizzato il rendering verso la stringa in uscita 
        grwTotale.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }

    protected override void Render(HtmlTextWriter writer)
    {
        // Ensure that the control is nested in a server form.
        if (Page != null)
        {
            Page.VerifyRenderingInServerForm(this);
        }
        base.Render(writer);
    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        //Do nothing
    }
}
