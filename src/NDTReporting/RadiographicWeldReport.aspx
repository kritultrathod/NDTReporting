<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadiographicWeldReport.aspx.cs"
    Inherits="NDTReporting.RadiographicWeldReport" MasterPageFile="~/HomeMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Script/RadiographicWeldReport.js"></script>
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <link href="CSS/style-web.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            var obj = SaveRadiographicWelds;
            InitializeValidation(obj);
            $("#txtTestDate").datepicker();
            $("#txtTestDate").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#txtCalibrationDate").datepicker();
            $("#txtCalibrationDate").datepicker("option", "dateFormat", "dd/mm/yy");
        });
    
    </script>
</asp:Content>
<asp:Content ID="Main" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--<script type="text/javascript">    UserId = '<%=Session["id"]%>';</script>--%>
    <table class="TableValue" border="1px" cellpadding="0px" width="100%">
        <tr>
            <td colspan="2" class="TDHeader">
                Customer Details
            </td>
            <td colspan="2" class="TDHeader">
                Job Details
            </td>
            <td colspan="2" class="TDHeader">
                Test Details
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Unique No<hr />
                Customer Name (with address)<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input id="txtReportId" class="HiddenField" type="text" disabled="disabled" /><hr />
                <input type="text" id="txtClient" name="Client" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Job Description<hr />
                Material Specification
            </td>
            <td class="TDFieldCell">
                &nbsp;<input type="text" name="JobDescription" id="txtJobDescription" /><hr />
                &nbsp;<input type="text" id="txtMaterialSpecification" />
            </td>
            <td class="TDHeaderCell">
                Radiation Source
                <div class="RedFont">
                    *</div>
                <hr />
                &nbsp;Exposure Time
            </td>
            <td class="TDFieldCell">
                &nbsp;<select id="cmbRadiationSource" name="D1" class="{min:1, messages:{min:' is required!'}}">
                </select><hr />
                <input type="text" id="txtExposureTime" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                &nbsp;Location of work site
            </td>
            <td class="TDFieldCell">
                &nbsp;<input type="text" id="txtLocation" />
            </td>
            <td class="TDHeaderCell">
                Stage of Examination<hr />
                Surface Condition
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtStageofExamination" /><hr />
                &nbsp;<input type="text" id="txtSurfaceCondition" />
            </td>

            <td class="TDHeaderCell">
                Focal Spot Size
                <hr />
                Unit of Energy
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtFocalSpotSize" />
                <hr />
                <input type="text" id="txtUnitofEnergy" />
            </td>


            
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Report No.&nbsp;
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtTestReportNumber" />
            </td>
            <td class="TDHeaderCell">
                Welding Method
                <hr />
                Extent of Examination</td>
            <td class="TDFieldCell">
                <input type="text" id="txtWeldingMethod" /><hr />
                <input type="text" id="txtExtentofExamination" />
            </td>
            <td class="TDHeaderCell">
                Type of IQI<hr />
                IQI Batch No
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtTypeofIQI" /><hr />
                <input type="text" id="txtIQIBatchNo" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Contract No.
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtContractNumber" />
            </td>
            <td class="TDHeaderCell">
                Surface Temperature</td>
            <td class="TDFieldCell">
                &nbsp;
                <input type="text" id="txtSurfaceTemperature" /></td>
            <td class="TDHeaderCell">
                Shim Thickness
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtShimThickness" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell" style="height: 62px">
                Contact Person<hr />
                Contact No
            </td>
            <td class="TDFieldCell" style="height: 62px">
                &nbsp;<input type="text" id="txtContactPerson" /><hr />
                &nbsp;<input type="text" id="txtContactNumber" />
            </td>
            <td class="TDHeaderCell" style="height: 62px">
                Dimension<hr />
                Weld Thickness
            </td>
            <td class="TDFieldCell" style="height: 62px">
                &nbsp;<input type="text" id="txtDimension" /><hr />
                <input type="text" id="txtWeldThickness" /></td>
            <td class="TDHeaderCell" style="height: 62px">
                SFD
            </td>
            <td class="TDFieldCell" style="height: 62px">
                <input type="text" id="txtSFD" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Date of Testing<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtTestDate" name="DateofTesting" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Reference Code/ Standard<hr />
                TestSpecification</td>
            <td class="TDFieldCell">
                &nbsp;<input type="text" id="txtReferenceStandard" /><hr />
                <input type="text" id="txtTestSpecification" /></td>
            <td class="TDHeaderCell">
                Film Make And Type<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                &nbsp;<select id="cmbFilmMakeAndTypeId" name="cmbFilmMakeAndTypeId" style="width: 100%"
                    class="{min:1, messages:{min:' is required!'}}">
                </select>
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                &nbsp;
            </td>
            <td class="TDFieldCell">
                &nbsp;
            </td>
            <td class="TDHeaderCell">
                &nbsp;
                Acceptance Criteria<hr />
                Procedure /Tech. Sheet No.
                <br />
                </td>
            <td class="TDFieldCell">
                <input type="text" id="txtAcceptanceCriteria" /><hr />
                <input id="txtTechSheetNo" type="text" /></td>
            <td class="TDHeaderCell">
                Weld Preparation
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtWeldPreparation" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                &nbsp;
            </td>
            <td class="TDFieldCell">
                &nbsp;
            </td>
            <td class="TDHeaderCell">
                Densitometer No.<hr />
                Calibration Date
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtDensitometerNo" /><hr />
                <input type="text" id="txtCalibrationDate" />
            </td>
            <td class="TDHeaderCell">
                Technique Id<div class="RedFont">
                    *</div>
                <hr />
                Geometrical Unsharpness
            </td>
            <td class="TDFieldCell">
                <select id="cmbTechniqueId" style="width: 100%" name="D3" class="{min:1, messages:{min:' is required!'}}">
                </select><hr />
                <input type="text" id="txtGeometricalUnsharpness" />
            </td>
            <%--<td class="TDFieldCell">
                &nbsp;
            </td>--%>


        </tr>
        <tr>
            <td colspan="6" align="right">
                <img src="Images/plus.png" id="addButton" class="image" alt="add" />
                <img src="Images/minus.png" id="removeButton" class="image" alt="remove" />
                <%--<input type='image' src="Images/plus.png" style="border-style: none;" id='addButton' />
                <input type='image' src="Images/minus.png" style="border-style: none;" id='removeButton' />--%>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <div id="TestResultsHeader" style="width: 100%">
                    <div>
                        <div class="TableHeader left" style="width: 12%">
                            Identification No<div class="RedFont">
                                *</div>
                        </div>
                    </div>
                    <div class="TableHeader left" style="width: 11%">
                        Joint No<div class="RedFont">
                            *</div>
                    </div>
                    <div class="TableHeader left" style="width: 11%">
                        Welder</div>
                    <div class="TableHeader left" style="width: 11%">
                        Segment</div>
                    <div class="TableHeader left" style="width: 11%">
                        Size(>0)<div class="RedFont">
                            *</div>
                    </div>
                    <div class="TableHeader left" style="width: 11%">
                        Density<div class="RedFont">
                            *</div>
                    </div>
                    <div class="TableHeader left" style="width: 11%">
                        Sensitivity</div>
                    <div class="TableHeader left" style="width: 11%">
                        Observations</div>
                    <div class="TableHeader left" style="width: 11%">
                        Remarks</div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <div id="TestResults" style="width: 100%">
                    <div id="LineContent0">
                        <div class="TableValue left" style="width: 12%;">
                            <input type="hidden" style="clear: left; margin-left: inherit;" id="txtTestId0" />
                            <input type="text" style="width: 100%;" id="txtIdentificationNo0" name="txtIdentificationNo0"
                                class="{required:true, messages:{ required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 11%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtJointNo0" name="txtJointNo0" class="{required:true, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <input type="text" style="width: 100%;" id="txtWelderNo0" />
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <input type="text" style="width: 100%;" id="txtSegment0" />
                        </div>
                        <div class="TableValue left" style="width: 11%; text-align: center;">
                            <!-- class="{FilmSizeValidation:true}" -->
                            <input type="text" style="width: 40%;" id="txtFlimSizeX0" name="txtFlimSizeX0" class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />&nbsp;X
                            <input type="text" style="width: 40%;" id="txtFlimSizeY0" name="txtFlimSizeY0" class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 11%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtDensity0" name="txtDensity0" class="{required:true, number:true, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 11%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtSensitivity0" />
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <select style="width: 100%;" id="cmbObservation0">
                            </select>
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <select style="width: 100%;" id="cmbRemarks0">
                            </select>
                        </div>
                        <div class="clear" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <asp:Button runat="server" ID="Button1" Text="Submit" class="classname" />
                <a href="#" id="btnClose" class="classname" onclick="ClearValue();">Cancel</a>
            </td>
        </tr>
    </table>
</asp:Content>
