using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for RadiographicWelds
    /// </summary>
    public class RadiographicWeldList : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {

        string MethodName = string.Empty;
        string CallBackMethodName = string.Empty;
        object Parameter = string.Empty;
        private DbRadiographicWelds _DbRadiographicWelds = new DbRadiographicWelds();

        String CreatedBy = string.Empty;
        String ClientId = string.Empty;
        String AppId = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            if (context != null)
            {
                context.Response.ContentType = "application/json";
                MethodName = context.Request.Params["method"];
                Parameter = context.Request.Params["param"];
                CallBackMethodName = context.Request.Params["callbackmethod"];

                CreatedBy = context.Session["id"].ToString();
                ClientId = context.Session["ClientId"].ToString();
                AppId = context.Session["AppId"].ToString();

                switch (MethodName.ToLower())
                {
                    case "getbyid":
                        context.Response.Write(GetRadiographicWeldReportById());
                        break;
                    case "insert":
                        context.Response.Write(Insert(context));
                        break;
                    case "update":
                        context.Response.Write(Update(context));
                        break;
                    case "deleteradiographicweldreport":
                        context.Response.Write(DeleteRadiographicWeldReport(context));
                        break;
                    case "getremarks":
                        context.Response.Write(GetRemarks(context));
                        break;
                    case "getfilmmakeandtypes":
                        context.Response.Write(GetFilmMakeAndTypes(context));
                        break;
                    case "getobservations":
                        context.Response.Write(GetObservations(context));
                        break;
                    case "getconsumablestype":
                        context.Response.Write(GetConsumablesType(context));
                        break;
                    case "getradiationsource":
                        context.Response.Write(GetRadiationSource());
                        break;
                    case "gettechnique":
                        context.Response.Write(GetTechnique());
                        break;
                }
            }
        }

        public string Insert(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer =
                         new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {
                                                    RadiographicWeldsTemplate _P = new RadiographicWeldsTemplate();
                                                    using (var reader = new StreamReader(context.Request.InputStream))
                                                    {
                                                        string jsonValue = reader.ReadToEnd();
                                                        var js = new JavaScriptSerializer();
                                                        _P = js.Deserialize<RadiographicWeldsTemplate>(jsonValue);

                                                        _P.RadiographicWeld.CreatedBy = Convert.ToInt32(CreatedBy);
                                                        _P.RadiographicWeld.ClientId = Convert.ToInt32(ClientId);
                                                        _P.RadiographicWeld.AppId = Convert.ToInt32(AppId);
                                                        _P.RadiographicWeld.CreatedDate = Convert.ToDateTime(DateTime.Now);
                                                        _P.RadiographicWeld.UpdatedBy = Convert.ToInt32(CreatedBy);
                                                        _P.RadiographicWeld.UpdatedDate = Convert.ToDateTime(DateTime.Now);

                                                        foreach (RadiographicWeldsTestResult item in _P.RadiographicWeldsTestResult)
                                                        {
                                                            item.CreatedBy = Convert.ToInt32(CreatedBy);
                                                            item.ClientId = Convert.ToInt32(ClientId);
                                                            item.AppId = Convert.ToInt32(AppId);
                                                            item.CreatedDate = Convert.ToDateTime(DateTime.Now);
                                                            item.UpdatedBy = Convert.ToInt32(CreatedBy);
                                                            item.UpdatedDate = Convert.ToDateTime(DateTime.Now);
                                                        }
                                                    }
                                                    _response.IsSucess = true;
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData =
                                                        _DbRadiographicWelds.InsertRadiographicWeld(_P);
                                                    _response.Message = _response.ResponseData.ToString();
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });

            return jSearializer.Serialize(_response);
        }

        public string Update(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                {
                    RadiographicWeldsTemplate _P = new RadiographicWeldsTemplate();
                    using (var reader = new StreamReader(context.Request.InputStream))
                    {
                        string jsonValue = reader.ReadToEnd();
                        var js = new JavaScriptSerializer();
                        _P = js.Deserialize<RadiographicWeldsTemplate>(jsonValue);

                        _P.RadiographicWeld.ClientId = Convert.ToInt32(ClientId);
                        _P.RadiographicWeld.AppId = Convert.ToInt32(AppId);
                        _P.RadiographicWeld.UpdatedBy = Convert.ToInt32(CreatedBy);
                        _P.RadiographicWeld.UpdatedDate = Convert.ToDateTime(DateTime.Now);

                        foreach (RadiographicWeldsTestResult item in _P.RadiographicWeldsTestResult)
                        {
                            item.ClientId = Convert.ToInt32(ClientId);
                            item.AppId = Convert.ToInt32(AppId);
                            item.UpdatedBy = Convert.ToInt32(CreatedBy);
                            item.UpdatedDate = Convert.ToDateTime(DateTime.Now);
                        }
                    }
                    _response.IsSucess = true;
                    _response.CallBack = CallBackMethodName;
                    _response.ResponseData = _DbRadiographicWelds.UpdateRadiographicWeld(_P);
                    _response.Message = "SucessFully Updated";
                }, (m, e) =>
                    {
                        _response.Message = e.Message;
                        _response.IsSucess = false;
                    });
            return jSearializer.Serialize(_response);
        }


        private string DeleteRadiographicWeldReport(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {
                                                    _response.IsSucess = true;
                                                    _response.Message = "Record Sucessfully Deleted";
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData =
                                                        _DbRadiographicWelds.DeleteRadiographicWeldReport(
                                                            Convert.ToInt32(Parameter));
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }
        private string GetRadiographicWeldReportById()
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {
                                                    _response.IsSucess = true;
                                                    _response.Message = "Record Sucessfully Edited";
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData =
                                                        _DbRadiographicWelds.GetRadiographicWeldReportById(
                                                            Convert.ToInt32(Parameter));
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public string GetRemarks(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {

                                                    List<RadiographicWeld> _lstRemarks = new List<RadiographicWeld>();
                                                    _lstRemarks = _DbRadiographicWelds.GetRemarks(Convert.ToInt32(Parameter), Convert.ToInt32(ClientId));

                                                    _response.IsSucess = true;
                                                    _response.Message = string.Empty;
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData = _lstRemarks;
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }

        public string GetFilmMakeAndTypes(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {

                List<RadiographicWeld> _lstFilmMakeAndTypes = new List<RadiographicWeld>();
                string[] Ids = Parameter.ToString().Split(',');
                _lstFilmMakeAndTypes = _DbRadiographicWelds.GetFilmMakeAndTypes(Convert.ToInt32(Ids[0]), Convert.ToInt32(ClientId));

                _response.IsSucess = true;
                _response.Message = string.Empty;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = _lstFilmMakeAndTypes;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        public string GetObservations(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {

                                                    List<RadiographicWeld> _lstObservations =
                                                        new List<RadiographicWeld>();
                                                    _lstObservations = _DbRadiographicWelds.GetObservations(Convert.ToInt32(Parameter), Convert.ToInt32(ClientId));

                                                    _response.IsSucess = true;
                                                    _response.Message = string.Empty;
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData = _lstObservations;
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }


        public string GetConsumablesType(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                List<MagneticParticleTest> _lstRadiographicWeld =
                    new List<MagneticParticleTest>();
                _lstRadiographicWeld = _DbRadiographicWelds.GetConsumablesType(Convert.ToInt32(Parameter), Convert.ToInt32(ClientId));
                _response.IsSucess = true;
                _response.Message = string.Empty;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = _lstRadiographicWeld;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }
        //TODO: KTR - SOURCE MASTER Combo & Master Table
        public string GetRadiationSource()
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {
                                                    List<RadiographicWeld> _lstRadiographicWeld =
                                                        new List<RadiographicWeld>();
                                                    _lstRadiographicWeld = _DbRadiographicWelds.GetRadiationSource();
                                                    _response.IsSucess = true;
                                                    _response.Message = string.Empty;
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData = _lstRadiographicWeld;
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }

        public string GetTechnique()
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                                                {
                                                    List<RadiographicWeld> _lstRadiographicWeld =
                                                        new List<RadiographicWeld>();
                                                    _lstRadiographicWeld = _DbRadiographicWelds.GetTechnique(Convert.ToInt32(Parameter), Convert.ToInt32(ClientId));
                                                    _response.IsSucess = true;
                                                    _response.Message = string.Empty;
                                                    _response.CallBack = CallBackMethodName;
                                                    _response.ResponseData = _lstRadiographicWeld;
                                                }, (m, e) =>
                                                       {
                                                           _response.Message = e.Message;
                                                           _response.IsSucess = false;
                                                       });
            return jSearializer.Serialize(_response);
        }



    }
}
public class FeedCrd
{
    public string Name { get; set; }
    public int Subject { get; set; }
}

