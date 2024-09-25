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

public partial class ssl_elencoCentri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        AggiornaAccesso aggacc = new AggiornaAccesso();
        aggacc.getAggiornaAccesso(Session["pathDb"].ToString(), Session["IdUtente"].ToString(), "NO");
        SqlCentro.SelectCommand = "SELECT count(NumPaz) As totPazTrat,NumCentro,Citta,Descrizione,Primario,tbCentri.idCentro from tbCentri left join RLCENTREUSER on tbCentri.idCentro=RLCENTREUSER.idCentro" +
                            " left join Tbpazienti on tbCentri.idCentro=Tbpazienti.idCentro Where RLCENTREUSER.idutente=" + Session["IdUtente"] + " And NumCentro not in ('99')" +
                            " Group by NumCentro,Citta,Descrizione,Primario,tbCentri.idCentro order by NumCentro";
        SqlCentro.DataBind();
        grwCentro.DataBind();

        if (Session["IdCentro"] != null && grwCentro.Rows.Count > 0)
        {
            for (int j = 0; j < grwCentro.PageCount; j++)
            {
                grwCentro.PageIndex = j;
                grwCentro.DataBind();
                int i = 0;
                for (i = 0; i < grwCentro.Rows.Count; i++)
                {
                    if (grwCentro.DataKeys[i].Value.ToString() == Session["IdCentro"].ToString())
                    {
                        grwCentro.SelectedIndex = i;

                        //grwPaziente_SelectedIndexChanged(grwPaziente, EventArgs.Empty);
                        break;
                    }
                }
                if (i < grwCentro.Rows.Count)
                {
                    break;
                }
            }
        }
        else
        {
            if (grwCentro.Rows.Count > 0)
            {
                grwCentro.SelectedIndex = 0;
                Session["IdCentro"] = grwCentro.DataKeys[0].Values[0].ToString();

            }
        }
        
        //lnkGestioneQuery.Visible = false;
        Session["NumPaz"] = null;
        Session["IdPaziente"] = null;

    }


    protected void lnkApprova_OnClick(object sender, CommandEventArgs e)
    {
        Button lnkApprova = sender as Button;
        for (int i = 0; i < grwCentro.Rows.Count; i++)
        {
            Button lnk = grwCentro.Rows[i].FindControl("lnkApprova") as Button;
            if (lnk.ClientID == lnkApprova.ClientID)
            {
                TextBox Soggetti_N = grwCentro.Rows[i].FindControl("Soggetti_N") as TextBox;
                TextBox Soggetti_T = grwCentro.Rows[i].FindControl("Soggetti_T") as TextBox;
                SqlDataPaziente.UpdateCommand = "Update tbCentri set Approvato=1,Soggetti_Nprima=Soggetti_Nprima+" + Soggetti_N.Text + ",Soggetti_Tprima=Soggetti_Tprima+" + Soggetti_T.Text + " where IdCentro=" + e.CommandArgument;
                SqlDataPaziente.Update();
                SqlDataPaziente.UpdateCommand = "Update tbCentri set Soggetti_N=0,Soggetti_T=0 where IdCentro=" + e.CommandArgument;
                SqlDataPaziente.Update();

                break;
            }
        }
        
        Response.Redirect("elencoCentri.aspx");
    }

    protected void grwCentro_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView grw = sender as GridView;
        Session["IdCentro"] = grw.DataKeys[grw.SelectedIndex].Values[0].ToString();
        Session["SiteId"] = grw.Rows[grw.SelectedIndex].Cells[1].Text;
        Response.Redirect("elencoPazienti.aspx");
    }

    protected void grwCentro_OnPageIndexChanged(object sender, EventArgs e)
    {
        SqlCentro.SelectCommand = "SELECT  * from tbCentri left join RLCENTREUSER on tbCentri.idCentro=RLCENTREUSER.idCentro" +
                            " Where RLCENTREUSER.idutente=" + Session["IdUtente"] + " order by NumCentro";
        SqlCentro.DataBind();
        grwCentro.DataBind();
        grwCentro.SelectedIndex = 0;
    }

    protected void CreaTabelleTotali(object sender, EventArgs e)
    {
        SqlTotale.SelectCommand = "SELECT TbPazienti.IdPaziente,Primario, concat('\"',NumCentro,'\"') as newNumCentro, Descrizione, Citta, concat('\"',NumPaz,'\"') as NumPaz, " +
                  "DateVisit,gender,Age,if(Naive=1,'Naive','Treated') as Naive,NrControl,TotalScore,DCEn, if(DCE=1,'Yes (on iPAD)',if(DCE=2,'Yes (on paper)',if(DCE=3,'No',''))) as DCE," +
                  "if(EQ5D_5L=1,'Yes (on iPAD)',if(EQ5D_5L=2,'Yes (on paper)',if(EQ5D_5L=3,'No',''))) as EQ5D_5L, if(QLQ_C30=1,'Yes (on iPAD)',if(QLQ_C30=2,'Yes (on paper)',if(QLQ_C30=3,'No',''))) as QLQ_C30,"+
                   " if(CLL_16=1,'Yes (on iPAD)',if(CLL_16=2,'Yes (on paper)',if(CLL_16=3,'No',''))) as CLL_16 " +
        " FROM (((TbCentri " +
        " Left JOIN TbPazienti ON TbCentri.IdCentro = TbPazienti.IdCentro)" +
        " left JOIN tbcirsscore ON TbPazienti.IdPaziente = tbcirsscore.IdPaziente)" +
        " left JOIN tbquestionari ON TbPazienti.IdPaziente = tbquestionari.IdPaziente)" +
	" where tbcentri.NumCentro not in ('00','99')" +
        " Order BY TbCentri.NumCentro, Descrizione, Citta, NumPaz";
        SqlTotale.DataBind();
        grwTotale.DataBind();

        
        Response.Clear();

        Response.AddHeader("content-disposition", "attachment;filename=Export1.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        htmlWrite.WriteLine();
        //calcolo il totale dei pazienti
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "";
        sql = "Select count(*) as TotPaz from tbpazienti where IdCentro<>1 and IdCentro<>2";
        MySqlCommand cmdci = new MySqlCommand(sql, cn);
        MySqlDataReader rdrci = cmdci.ExecuteReader();
        string TotalePaz = "0";
        if (rdrci.HasRows)
        {
            rdrci.Read();
            TotalePaz = rdrci[0].ToString();
        }
        rdrci.Close();

        sql = "Select sum(TotR1),sum(TotR2) from (Select (case when Naive=1 then 1 else 0 end) as TotR1, (case when Naive=2 then 1 else 0 end) as TotR2 " +
            " from tbpazienti " +
            " where IdCentro<>1 and IdCentro<>2) as t1";
        MySqlCommand cmdr = new MySqlCommand(sql, cn);
        MySqlDataReader rdrr = cmdr.ExecuteReader();
        string TotaleR1 = "0";
        string TotaleR2 = "0";
       

        if (rdrr.HasRows)
        {
            rdrr.Read();
            TotaleR1 = rdrr[0].ToString();
            TotaleR2 = rdrr[1].ToString();
           
        }
        rdrr.Close();

        //pazienti drop out
        sql = "Select count(*) as TotDrop from tbuscitastudio where IdCentro<>1 and IdCentro<>2 and StudioCompletato=2";
        MySqlCommand cmddo = new MySqlCommand(sql, cn);
        MySqlDataReader rdrdo = cmddo.ExecuteReader();
        string TotDrop = "0";
        if (rdrdo.HasRows)
        {
            rdrdo.Read();
            TotDrop = rdrdo[0].ToString();
        }
        rdrdo.Close();
        cn.Close();
        htmlWrite.WriteLine("<strong><font size='4'>Coronate Study &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total patients: " + TotalePaz + "; Naive=" + TotaleR1 + "; Treated=" + TotaleR2 + "; Total drop out=" + TotDrop + "</font></strong>");
        // viene reindirizzato il rendering verso la stringa in uscita 
        grwTotale.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }

	protected string TreatmentLines(string idpaz, string pNaive)
    {
        string pathSem = "";
if (idpaz!="" && pNaive!="Naive"){
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select count(IdTreatment) from tbtreatment where idpaziente=" + idpaz;
        MySqlCommand cmd3 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr2 = cmd3.ExecuteReader();

        if (rdr2.HasRows)
        {
            rdr2.Read();
            pathSem = rdr2[0].ToString();
        }
        else
        {
            pathSem = "";
        }
        rdr2.Close();
        cn.Close();
}
        return pathSem;
    }

	protected string TreatmentOngoing(string idpaz, string pNaive)
    {
        string pathSem = "";
if (idpaz!="" && pNaive!="Naive"){
        MySqlConnection cn;
        cn = new MySqlConnection(Session["pathDb"].ToString());
        cn.Open();
        string sql = "Select if(tbCurrentMedication.IdTreatmentPso=99,OtherTreatment, TreatmentCLL) as Treatment " +
                " from tbCurrentMedication Left join lsTreatmentPso on tbCurrentMedication.IdTreatmentPso=lsTreatmentPso.IdTreatmentPso" +
                " where IdPaziente=" + idpaz + " and StartDateMM is not null order by 1"; 
        MySqlCommand cmd3 = new MySqlCommand(sql, cn);
        MySqlDataReader rdr2 = cmd3.ExecuteReader();

        while (rdr2.Read())
        {
             pathSem = pathSem + rdr2[0].ToString() + "<br/>";
        }
        
        rdr2.Close();
        cn.Close();
}
        return pathSem;
    }

    protected void CreaVisite(object sender, EventArgs e)
    {
        SqlPaziente.SelectCommand = "SELECT concat('\"',NumCentro,'\"') as NumCentro, Descrizione, Citta," +
              "tbpazienti.IdPaziente," +
              "concat('\"',NumPaz,'\"') as NumPaz," +
              "tbvisita.IDTIPVIS as R1,tbvisita1.IDTIPVIS as R2,tbvisita2.IDTIPVIS as R3" +
            " FROM " +
             " tbpazienti right join tbcentri on tbpazienti.IdCentro=tbcentri.IdCentro" +
             " LEFT OUTER JOIN tbvisita ON (tbpazienti.IdPaziente = tbvisita.IdPaziente and tbvisita.IDTIPVIS = 1)" +
             " LEFT OUTER JOIN tbvisita tbvisita1 ON (tbpazienti.IdPaziente = tbvisita1.IdPaziente and tbvisita1.IDTIPVIS = 2)" +
             " LEFT OUTER JOIN tbvisita tbvisita2 ON (tbpazienti.IdPaziente = tbvisita2.IdPaziente and tbvisita2.IDTIPVIS = 3)" +
              " where tbvisita.IdCentro<>1 and tbcentri.IdCentro<>2" +
            " order BY NumCentro, Descrizione, Citta, NumPaz";

        //SqlPaziente.SelectCommand = "SELECT if(sesso=1,'M',if(sesso=2,'F','')) as newsesso, (case when ConsensoInformato=1 then 'Si' else 'No' end) as newConsensoInformato, tb.DatVis, TbPazienti.*  FROM TbPazienti " +
        //    " left join (Select DatVis,IdPaziente from TbVisita where idtipvis=1) as tb on TbPazienti.IdPaziente=Tb.IdPaziente where TbPazienti.IdCentro=" + Session["IdCentro"] + " order by NumPaz";
        SqlPaziente.DataBind();
        grwPaziente.DataBind();
        for (int i = 0; i < grwPaziente.Rows.Count; i++)
        {
            GridViewRow gvr = grwPaziente.Rows[i];
            Label img1 = gvr.Cells[3].FindControl("img1") as Label;
            switch (img1.Text)
            {
                case "Non effettuata":
                    img1.ForeColor = System.Drawing.Color.Black;
                    break;
                case "Incompleta":
                    img1.ForeColor = System.Drawing.Color.YellowGreen;
                    break;
                case "Completa":
                    img1.ForeColor = System.Drawing.Color.Green;
                    break;
                case "Frezze":
                    img1.ForeColor = System.Drawing.Color.Blue;
                    break;
                case "Visita lock":
                    img1.ForeColor = System.Drawing.Color.OrangeRed;
                    break;
            }
            Label img2 = gvr.Cells[4].FindControl("img2") as Label;
            switch (img2.Text)
            {
                case "Non effettuata":
                    img2.ForeColor = System.Drawing.Color.Black;
                    break;
                case "Incompleta":
                    img2.ForeColor = System.Drawing.Color.YellowGreen;
                    break;
                case "Completa":
                    img2.ForeColor = System.Drawing.Color.Green;
                    break;
                case "Frezze":
                    img2.ForeColor = System.Drawing.Color.Blue;
                    break;
                case "Visita lock":
                    img2.ForeColor = System.Drawing.Color.OrangeRed;
                    break;
            }
            Label img3 = gvr.Cells[5].FindControl("img3") as Label;
            switch (img3.Text)
            {
                case "Non effettuata":
                    img3.ForeColor = System.Drawing.Color.Black;
                    break;
                case "Incompleta":
                    img3.ForeColor = System.Drawing.Color.YellowGreen;
                    break;
                case "Completa":
                    img3.ForeColor = System.Drawing.Color.Green;
                    break;
                case "Frezze":
                    img3.ForeColor = System.Drawing.Color.Blue;
                    break;
                case "Visita lock":
                    img3.ForeColor = System.Drawing.Color.OrangeRed;
                    break;
            }
            
        }
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Export1.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";

        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        htmlWrite.WriteLine();
        htmlWrite.WriteLine("<strong><font size='4'>Studio HepaDisk</font><strong>");
        // viene reindirizzato il rendering verso la stringa in uscita 
        grwPaziente.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }

    protected string TrovaSemVisita(string visita, string idpaz, string tipvis)
    {
        string pathSem = "";
        if (visita != "")
        {
            MySqlConnection cn;
            cn = new MySqlConnection(Session["pathDb"].ToString());
            cn.Open();
            string sql = "Select PrStat.SEMID,Presentato from PrStat inner join tbvisita on (tbvisita.idpaziente=PrStat.subjid" +
                " and tbvisita.IDTIPVIS=PrStat.TIPVISID) where subjid=" + idpaz + " And (PrStat.semid=2 or PrStat.semid=0) and FormId<>0 and TIPVISID=" + tipvis;
            MySqlCommand cmd1 = new MySqlCommand(sql, cn);
            MySqlDataReader rdr = cmd1.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (rdr["Presentato"].ToString() != "1" && tipvis!="1")
                {
                    pathSem = "Non effettuata";
                }
                else
                {
                    pathSem = "Incompleta";
                }
            }
            else
            {
                pathSem = "Completa";
            }
            rdr.Close();
            if (pathSem != "Non effettuata")
            {
                sql = "Select SEMID from PrStat where subjid=" + idpaz + " and FormId=0 and TIPVISID=" + tipvis;
                MySqlCommand cmd2 = new MySqlCommand(sql, cn);
                MySqlDataReader rdr1 = cmd2.ExecuteReader();
                rdr1.Read();
                if (rdr1[0].ToString() == "5")
                {
                    pathSem = "Frozen";
                }
                if (rdr1[0].ToString() == "6")
                {
                    pathSem = "Visita lock";
                }
                rdr1.Close();
            }
            cn.Close();
        }
        else
        {
            pathSem = "";
        }
        return pathSem;
    }

    protected override void Render(HtmlTextWriter writer) {
    // Ensure that the control is nested in a server form.
    if (Page != null) {
        Page.VerifyRenderingInServerForm(this);
    }
    base.Render(writer);
}


    public override void VerifyRenderingInServerForm(Control control){
        //Do nothing
    }

}
