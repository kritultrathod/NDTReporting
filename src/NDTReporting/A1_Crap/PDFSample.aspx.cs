using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NDTReporting
{
    public partial class PDFSample1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            var pdfUrl = NDTReporting.PDFSample1.HtmlToPdf(pdfOutputLocation: "~/PDFs/", outputFilenamePrefix: "GeneratedPDF", urls: new string[] { "http://google.com" });
        }

        public static string HtmlToPdf(string pdfOutputLocation, string outputFilenamePrefix, string[] urls,
            string[] options = null,
            string pdfHtmlToPdfExePath = "E:\\Artha\\Code\\NDTReporting\\lib\\wkhtmltopdf.exe")
        {
            string urlsSeparatedBySpaces = string.Empty;
            try
            {
                //Determine inputs
                if ((urls == null) || (urls.Length == 0))
                    throw new Exception("No input URLs provided for HtmlToPdf");
                else
                    urlsSeparatedBySpaces = String.Join(" ", urls); //Concatenate URLs

                string outputFolder = pdfOutputLocation;
                string outputFilename = outputFilenamePrefix + "_" + DateTime.Now.ToString("yyyy-MM-dd-hh-mm-ss-fff") + ".PDF"; // assemble destination PDF file name

                var p = new System.Diagnostics.Process()
                {
                    StartInfo =
                    {
                        FileName = pdfHtmlToPdfExePath,
                        Arguments = ((options == null) ? "" : String.Join(" ", options)) + " " + urlsSeparatedBySpaces + " " + outputFilename,
                        UseShellExecute = false, // needs to be false in order to redirect output
                        RedirectStandardOutput = true,
                        RedirectStandardError = true,
                        RedirectStandardInput = true, // redirect all 3, as it should be all 3 or none
                        WorkingDirectory = HttpContext.Current.Server.MapPath(outputFolder)
                    }
                };

                p.Start();

                // read the output here...
                p.StandardOutput.ReadToEnd();
                var errorOutput = p.StandardError.ReadToEnd();

                // ...then wait n milliseconds for exit (as after exit, it can't read the output)
                p.WaitForExit(60000);

                // read the exit code, close process
                int returnCode = p.ExitCode;
                p.Close();

                // if 0 or 2, it worked so return path of pdf
                if ((returnCode == 0) || (returnCode == 2))
                    return outputFolder + outputFilename;
                else
                    throw new Exception(errorOutput);
            }
            catch (Exception exc)
            {
                throw new Exception("Problem generating PDF from HTML, URLs: " + urlsSeparatedBySpaces + ", outputFilename: " + outputFilenamePrefix, exc);
            }
        }
    }
}