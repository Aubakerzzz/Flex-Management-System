using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm55 : System.Web.UI.Page
    {

        protected List<string[]> Data { get; set; }

        protected List<string[]> Data1 { get; set; }
        protected List<string[]> Data2 { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
        }


        protected void ExportToPDF(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT DISTINCT courses.Cname, courses.CCode, courses.Credits FROM courses JOIN studentSection ON courses.CCode = studentSection.CCode WHERE studentSection.SemNum = 1;";

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data.Add(row);
            }

            // Close the data reader
            reader.Close();
            // create a string with the table HTML
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table><thead><tr>");

            // retrieve column names and add them as table headers
            foreach (string columnName in Data[0])
            {
                htmlTable.Append("<th>" + columnName + "</th>");
            }

            htmlTable.Append("</tr></thead><tbody>");

            // iterate through the data rows and add them to the table
            for (int i = 1; i < Data.Count; i++)
            {
                htmlTable.Append("<tr>");

                foreach (string value in Data[i])
                {
                    htmlTable.Append("<td>" + value + "</td>");
                }

                htmlTable.Append("</tr>");
            }

            htmlTable.Append("</tbody></table>");

            // store the HTML string in ViewState
            ViewState["htmlTable"] = htmlTable.ToString();

            // retrieve the HTML string from ViewState
            string htmlTable1 = ViewState["htmlTable"].ToString();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    hw.Write(htmlTable1); // write the HTML string to the writer
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Report_Student.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
        protected void ExportToPDF1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT u.UserID, u.FName, u.MName, u.LName FROM Userr u JOIN studentSection ss ON u.UserID = ss.StuID JOIN sections s ON s.SecID = ss.SecID AND s.CCode = ss.CCode WHERE s.SecID =1 ORDER BY u.UserID ASC; ";

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data1 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data1.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data1.Add(row);
            }

            // Close the data reader
            reader.Close();
            // create a string with the table HTML
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table><thead><tr>");

            // retrieve column names and add them as table headers
            foreach (string columnName in Data1[0])
            {
                htmlTable.Append("<th>" + columnName + "</th>");
            }

            htmlTable.Append("</tr></thead><tbody>");

            // iterate through the data rows and add them to the table
            for (int i = 1; i < Data1.Count; i++)
            {
                htmlTable.Append("<tr>");

                foreach (string value in Data1[i])
                {
                    htmlTable.Append("<td>" + value + "</td>");
                }

                htmlTable.Append("</tr>");
            }

            htmlTable.Append("</tbody></table>");

            // store the HTML string in ViewState
            ViewState["htmlTable"] = htmlTable.ToString();

            // retrieve the HTML string from ViewState
            string htmlTable1 = ViewState["htmlTable"].ToString();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    hw.Write(htmlTable1); // write the HTML string to the writer
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Report_Student.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }

        }
        protected void ExportToPDF2(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT c.CName AS Course_Name, s.SecNo AS Section_Number, u.FName AS Instructor_First_Name, u.LName AS Instructor_Last_Name FROM courses c INNER JOIN sections s ON c.CCode = s.CCode INNER JOIN courseTaught ct ON s.SecID = ct.SecID AND c.CCode = ct.CCode INNER JOIN Userr u ON ct.FacID = u.UserID WHERE c.CCode = 'MATH101';";

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data2 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data2.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data2.Add(row);
            }

            // Close the data reader
            reader.Close();
            // create a string with the table HTML
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table><thead><tr>");

            // retrieve column names and add them as table headers
            foreach (string columnName in Data2[0])
            {
                htmlTable.Append("<th>" + columnName + "</th>");
            }

            htmlTable.Append("</tr></thead><tbody>");

            // iterate through the data rows and add them to the table
            for (int i = 1; i < Data2.Count; i++)
            {
                htmlTable.Append("<tr>");

                foreach (string value in Data2[i])
                {
                    htmlTable.Append("<td>" + value + "</td>");
                }

                htmlTable.Append("</tr>");
            }

            htmlTable.Append("</tbody></table>");

            // store the HTML string in ViewState
            ViewState["htmlTable"] = htmlTable.ToString();

            // retrieve the HTML string from ViewState
            string htmlTable1 = ViewState["htmlTable"].ToString();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    hw.Write(htmlTable1); // write the HTML string to the writer
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Report_Student.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}