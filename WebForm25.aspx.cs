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
    public partial class WebForm25 : System.Web.UI.Page
    {

        protected List<string[]> Data { get; set; }

        protected List<string[]> Data1 { get; set; }
        protected List<string[]> Data2 { get; set; }
        protected List<string[]> Data3 { get; set; }
        protected List<string[]> Data4 { get; set; }

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
            string query = "select userr.UserID, userr.FName, (presence.total * 100) / (totall.total) as AttendancePercentagee from userr inner join attendance on attendance.StuID = userr.UserID inner join courses on courses.Ccode = attendance.Ccode inner join ( select userr.UserID, COUNT(Present) as total from userr inner join attendance on attendance.StuID = userr.UserID where Present = 1 group by userr.UserID) as presence on presence.UserID = userr.UserID inner join(select userr.UserID, COUNT(Present) as total from userr inner join attendance on attendance.StuID = userr.UserID group by userr.UserID) as totall on totall.UserID = userr.UserID group by userr.UserID, userr.FName, presence.total, totall.total";

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
            string query = "SELECT StuID, CID, SecID, Type, ObtainedMarks, TotalMarks, SemYear, (ObtainedMarks / TotalMarks) * 100 AS Percentage FROM evaluations;";

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
            string query = "SELECT distinct s.StuID, u.FName, u.LName, SUM(e.ObtainedMarks) AS Obtained_marks, SUM(e.TotalMarks) AS Total_marks FROM studentSection s JOIN Userr u ON s.StuID = u.UserID JOIN evaluations e ON s.StuID = e.StuID AND s.CCode = e.CID AND s.SecID = e.SecID WHERE s.CCode = 'Math101' GROUP BY s.StuID, u.FName, u.LName; ";

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
        protected void ExportToPDF3(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT Fname, PhoneNum from Userr WHERE Type = 'Student'";

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data3 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data3.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data3.Add(row);
            }

            // Close the data reader
            reader.Close();
            // create a string with the table HTML
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table><thead><tr>");

            // retrieve column names and add them as table headers
            foreach (string columnName in Data3[0])
            {
                htmlTable.Append("<th>" + columnName + "</th>");
            }

            htmlTable.Append("</tr></thead><tbody>");

            // iterate through the data rows and add them to the table
            for (int i = 1; i < Data3.Count; i++)
            {
                htmlTable.Append("<tr>");

                foreach (string value in Data3[i])
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
        protected void ExportToPDF4(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT grade, COUNT(*) AS grade_count FROM studentSection WHERE SecID = 1 AND grade IS NOT NULL AND grade <> '' GROUP BY grade;";

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data4 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data4.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data4.Add(row);
            }

            // Close the data reader
            reader.Close();
            // create a string with the table HTML
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table><thead><tr>");

            // retrieve column names and add them as table headers
            foreach (string columnName in Data4[0])
            {
                htmlTable.Append("<th>" + columnName + "</th>");
            }

            htmlTable.Append("</tr></thead><tbody>");

            // iterate through the data rows and add them to the table
            for (int i = 1; i < Data4.Count; i++)
            {
                htmlTable.Append("<tr>");

                foreach (string value in Data4[i])
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