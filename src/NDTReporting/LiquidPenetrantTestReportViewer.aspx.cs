using System;
using System.IO;
using System.Text;
using System.Web;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    public partial class LiquidPenetrantTestReportViewer : System.Web.UI.Page
    {
        private int ReportId;
        private int TemplateId;
        private int SubTestId;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportId = ConversionHandler.Instance.ConvertTo<Int32>(Session["ReportId"]);
            TemplateId = ConversionHandler.Instance.ConvertTo<Int32>(Session["TemplateId"]);
            SubTestId = ConversionHandler.Instance.ConvertTo<Int32>(Session["TestType"]);

            if (!IsPostBack)
            {
                if (ConversionHandler.Instance.ConvertTo<Int32>(Session["IsAdmin"]) == 0 || ConversionHandler.Instance.ConvertTo<string>(Session["Action"]) != "Authorize")
                {
                    btnAuthorize.Visible = false;
                }
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //TODO: KTR - Move to a common Class
            string template = string.Empty;
            PDFCreator pdfCreator = new PDFCreator();

            template = Server.HtmlDecode(txtTemplate.Value).ToString();
            string HTMLFileName = Session["UserName"].ToString().Replace(" ", "") + ".html";
            string filePath = Server.MapPath("~/PDF/Report" + HTMLFileName);

            pdfCreator.reRenderPageAtServer(filePath, template);

            //Convert HTML to PDF
            string var = string.Empty;

            string host = HttpContext.Current.Request.Url.Host.ToString();
            string port = HttpContext.Current.Request.Url.Port.ToString();
            string currentPath = "http://" + host + ":" + port + "/PDF/Report" + HTMLFileName;
            string pdfFileName = "GeneratedPDF_" + DateTime.Now.ToString("yyyy-MM-dd-hh-mm-ss-fff") + ".PDF";

            DbLiquidPenetrantTest obj = new DbLiquidPenetrantTest();
            LiquidPenetrantTestTemplate objLiquidPenetrantTestTemplate = new LiquidPenetrantTestTemplate();

            objLiquidPenetrantTestTemplate = obj.GetLiquidPenetrantTestReportById(ReportId);

            string paramBuild = "id=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.ReportId +
                "&location=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.Location +
            "&client=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.FabricatorName +
            "&contractno=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.ContractNo +
            "&reportno=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.ReportNo +
            "&description=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.JobDescription +
            "&testdate=" + string.Format("{0:dd/MM/yyyy}", objLiquidPenetrantTestTemplate.LiquidPenetrantTest.DateofTesting) +
            "&contactperson=" + objLiquidPenetrantTestTemplate.LiquidPenetrantTest.ContactPerson;

            PDFCreatorReq PDFreq = new PDFCreatorReq
            {
                pdfOutputLocation = "~/PDF/",
                outputFilename = pdfFileName,
                urls = new string[] { currentPath },
                pdfHtmlToPdfExePath = Server.MapPath("~/lib/wkhtmltopdf.exe"),
                param=paramBuild,
                SubTestType="Liquid"
            };

            var = pdfCreator.HtmlToPdf(PDFreq);

            if (pdfFileName == var)
            {
                DownloadableProduct_Tracking(var);
            }
        }
        private bool DownloadableProduct_Tracking(string pdfFileName)
        {
            //File Path and File Name
            string filePath = Server.MapPath("~/PDF/");
            string fullPath = filePath + pdfFileName;
            
            FileInfo fileInfo = new FileInfo(fullPath);
            FileStream myFile = new FileStream(fullPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            //Reads file as binary values
            BinaryReader _BinaryReader = new BinaryReader(myFile);
            
            if (fileInfo.Exists)
            {
                try
                {
                    long startBytes = 0;
                    string _EncodedData = HttpUtility.UrlEncode(fileInfo.Name, Encoding.UTF8);// +lastUpdateTiemStamp;

                    Response.Clear();
                    Response.Buffer = false;
                    Response.AddHeader("Accept-Ranges", "bytes");
                    Response.AppendHeader("ETag", "\"" + _EncodedData + "\"");
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + fileInfo.Name);
                    Response.AddHeader("Content-Length", (fileInfo.Length - startBytes).ToString());
                    Response.AddHeader("Connection", "Keep-Alive");
                    Response.ContentEncoding = Encoding.UTF8;

                    //Send data
                    _BinaryReader.BaseStream.Seek(startBytes, SeekOrigin.Begin);

                    Response.BinaryWrite(_BinaryReader.ReadBytes(Convert.ToInt32(fileInfo.Length)));
                    Response.Flush();
                    return true;

                }
                catch
                {
                    return false;
                }
                finally
                {
                    Response.End();
                    _BinaryReader.Close();
                    myFile.Close();

                    _BinaryReader.Dispose();
                    myFile.Dispose();
                }
            }
            else System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "FileNotFoundWarning", "alert('File is not available now!')", true);
            return false;
        }
        protected void btnAuthorize_Click(object sender, EventArgs e)
        {
            HandleError.HandleInternalError(() =>
            {
                DbSearchReports report = new DbSearchReports();
                ReportViewParams req = new ReportViewParams();

                req.ReportId = ReportId;
                req.TemplateId = TemplateId;
                req.SubTestId = SubTestId;

                req.AppId = ConversionHandler.Instance.ConvertTo<Int32>(Session["AppId"]);
                req.ClientId = ConversionHandler.Instance.ConvertTo<Int32>(Session["ClientId"]);
                req.CreatedBy = ConversionHandler.Instance.ConvertTo<Int32>(Session["id"]);
                req.CreatedDate = DateTime.Now;
                req.UpdatedBy = ConversionHandler.Instance.ConvertTo<Int32>(Session["id"]);
                req.UpdatedDate = DateTime.Now;
                req.DeletedStatus = 0;

                var ResultId = report.InsertReportAndTemplateAuthMap(req);
                if (ResultId > 0)
                {
                    Response.Redirect("LiquidPenetrantTestReportList.aspx?SubTestId=7");
                }
            },
            (m, ex) => { });
        }
    }
}