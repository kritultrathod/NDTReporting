
using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Web;

namespace NDTReporting.Common
{
    public class PDFCreator
    {
        internal string PdfHeaderPath = string.Empty;
        internal string PdfFooterPath = string.Empty;

        public string HtmlToPdf(PDFCreatorReq req)
        {
            string urlsSeparatedBySpaces = string.Empty;
            try
            {
                string output;
                string errorOutput;
                int returnCode;

                PdfHeaderPath = ConfigManager.SiteUrl + "/PDF/header";
                PdfFooterPath = ConfigManager.SiteUrl + "/PDF/footer";

                //string[] options = null;
                string switches = "--page-size A4 ";
                switches += "--margin-top 88mm --margin-bottom 35mm --margin-right 5mm --margin-left 10mm --zoom 1.2 ";
                switches += "--header-html \"" + PdfHeaderPath + req.SubTestType + ".html" + "?" + req.param.Replace(@"""", @"\""") +"\" ";
                switches += "--footer-right [page]-of-[topage] ";
                switches += "--footer-html \"" + PdfFooterPath + req.SubTestType + ".html" + "\" ";

                //Determine inputs
                if ((req.urls == null) || (req.urls.Length == 0))
                {
                    throw new Exception("No input URLs provided for HtmlToPdf");
                }
                else
                {
                    urlsSeparatedBySpaces = String.Join(" ", req.urls); //Concatenate URLs
                }
                string outputFolder = req.pdfOutputLocation;
                string outputFilename = req.outputFilename; // assemble destination PDF file name

                using (Process pdfCreatorProcess = new Process()
                {
                    #region Set Process Initialisation Parameters

                    StartInfo =
                        {
                            FileName = req.pdfHtmlToPdfExePath,
                            Arguments = switches + " " + urlsSeparatedBySpaces + " " + outputFilename,
                            UseShellExecute = false, // needs to be false in order to redirect output
                            CreateNoWindow = true,
                            RedirectStandardOutput = true,
                            RedirectStandardError = true,
                            RedirectStandardInput = true, // redirect all 3, as it should be all 3 or none
                            WorkingDirectory = HttpContext.Current.Server.MapPath(outputFolder)
                            
                        }
                    #endregion
                })
                { // using (Process pdfCreatorProcess starts here
                    pdfCreatorProcess.Start();

                    // read the output here...
                    output = pdfCreatorProcess.StandardOutput.ReadToEnd();
                    errorOutput = pdfCreatorProcess.StandardError.ReadToEnd();

                    // ...then wait n milliseconds for exit (as after exit, it can't read the output)
                    pdfCreatorProcess.WaitForExit(60000);

                    // read the exit code, close process
                    returnCode = pdfCreatorProcess.ExitCode;
                    pdfCreatorProcess.Close();
                } // using (Process pdfCreatorProcess ends here

                // if 0 or 2, it worked so return path of pdf
                if ((returnCode == 0) || (returnCode == 2))
                {
                    return outputFilename;
                }
                else
                {
                    HandleError.LogAppMessage("pdfCreatorProcess - errorOutput:- " + errorOutput);
                    throw new Exception(errorOutput);
                }
            }
            catch (Exception exc)
            {
                string sErrMesage = "Problem generating PDF from HTML, URLs: " + urlsSeparatedBySpaces + ", outputFilename: " + req.outputFilename;
                HandleError.LogAppMessage(sErrMesage);
                throw new Exception(sErrMesage, exc);
            }
        }

        public void reRenderPageAtServer(string filePath, string template)
        {
            string head =
                "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
                "<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />" +
                "<html xmlns=\"http://www.w3.org/1999/xhtml\">" +
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"Css/style-web.css\" media=\"screen\" />" +
                "<script type=\"text/javascript\">" +
                " function MainJobDesc() {" +
                " document.getElementById(\"JobDescriptionContainer\").style.display = 'none'; " +
                "}</script>" +
                "</head><body onload=\"MainJobDesc()\"> "; //onload=\"subst()\"

            string tail = " </body></html>";

            //Prepare the HTML
            StringBuilder HTML = new StringBuilder();
            HTML.Append(head);
            HTML.Append(template);
            HTML.Append(tail);

            //Send the HTML as a text file
            using (FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                using (StreamWriter sw = new StreamWriter(fs))
                {
                    sw.Write(HTML.ToString());
                    sw.Close();
                    sw.Dispose();
                }
                fs.Close();
                fs.Dispose();
            }
        }
    }

    public class PDFCreatorReq
    {
        public string pdfOutputLocation { get; set; }
        public string outputFilename { get; set; }
        public string[] urls { get; set; }
        public string[] options { get; set; }
        public string pdfHtmlToPdfExePath { get; set; }
        public string param { get; set; }
        public string SubTestType { get; set; }
        public string paramCompanyDetails { get; set; }
    }
}