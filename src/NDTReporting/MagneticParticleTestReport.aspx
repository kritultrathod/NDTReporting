<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true"
    CodeBehind="MagneticParticleTestReport.aspx.cs" Inherits="NDTReporting.MagneticParticleTestReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/style-web.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <script src="Script/MagneticParticleTest.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            
            var obj = SaveMagneticParticleTest;
            InitializeValidation(obj);
            $("#txtDateofTesting").datepicker();
            $("#txtDateofTesting").datepicker("option", "dateFormat", "dd/mm/yy");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">        UserId = '<%=Session["id"]%>';</script>
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
                <input id="txtReportId" class="HiddenField" type="text" disabled="disabled"/><hr />
                <input type="text" id="txtFabricatorName" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Job Description
                <hr />
                Material
            </td>
            <td class="TDFieldCell">
                <input id="txtJobDescription" type="text" />
                <hr />
                <input type="text" id="txtMaterial" />
            </td>
            <td class="TDHeaderCell">
                MT Technique<hr />
                Direction of Magnetization
            </td>
            <td class="TDFieldCell">
                <select id="cmbTechniqueId">
                </select>
                <hr />
                <input type="text" id="txtDirection" />
                <input type="text" id="txtDirectionMagnetization" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Location of work site
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtLocation" />
            </td>
            <td class="TDHeaderCell">
                Dimesnion
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtDimension" />
            </td>
            <td class="TDHeaderCell">
                Magnetization Current
                
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtMagnetizationCurrent" />                
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Report No.
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtReportNo" />
            </td>
            <td class="TDHeaderCell">
                Surface Condition
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtSurfaceCondition" />
            </td>
            <td class="TDHeaderCell">
                Concentration<hr />
                Illuminance (LUX)
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtConcentration" />
                <hr />
                <input type="text" id="txtIlluminance" onclick="return Text1_onclick()" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Contract No.
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtContractNo" />
            </td>
            <td class="TDHeaderCell">
                Reference Code /Standard<hr />
                TestSpecification</td>
            <td class="TDFieldCell">
                &nbsp;<input type="text" id="txtReferenceStandard" /><hr />
                <input type="text" id="txtTestSpecification" /></td>
            <td class="TDHeaderCell">
                Contrast Paint<hr />
                Demagnetizing
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtContrastPaint" />
                <hr />
                <input type="text" id="txtDemagnetizing" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Contact Person
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtContactPerson" />
            </td>
            <td class="TDHeaderCell">
                Acceptance Criteria
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtAcceptanceCriteria" />
            </td>
            <td class="TDHeaderCell">
                Equipment &amp; Sr. No.
                <hr />
                Calibration Status
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtEquipment" /><hr />
                <input type="text" id="txtCalibrationStatus" />
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Date of testing<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtDateofTesting" name="DateofTesting" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Procedure /Tech. Sheet No.
            </td>
            <td class="TDFieldCell">
                <input id="txtTechSheetNo" type="text" />
            </td>
            <td class="TDHeaderCell">
                Amperage <hr />
                No. of Windings</td>
            <td class="TDFieldCell">
                <input type="text" id="txtAmperage" />
                <hr />
                <input type="text" id="txtWindings" /></td>
        </tr>
        <tr>
            <td class="TDFieldCell" colspan="2" rowspan="2">
                &nbsp;
            </td>
            <td class="TDHeaderCell">
                Extent of Coverage
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtExtentofCoverage" />
            </td>
            <td class="TDHeaderCell">
                Prod /Pole Spacing<hr />
                Black Light Intensity</td>
            <td class="TDFieldCell">
                &nbsp;<input type="text" id="txtSpacing" /><hr />
                <input type="text" id="txtBlackLightIntensity" />
                </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Surface Temperature
                <hr />
                Consumables Type<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtSurfaceTemperature" />
                <hr />
                <select id="cmbConsumablesType" name="cmbConsumablesType" class="{min:1, messages:{min:' is required!'}}">
                </select>
            </td>
            <td class="TDHeaderCell">
            Field Indicator 
                <hr />
                Final Cleaning
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtFieldIndicator" /><hr />
                <input type="text" id="txtFinalCleaning" />
            </td>
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
                        <div class="TableHeader left" style="width: 10%">
                            Sr No.<div class="RedFont">
                                *</div>
                        </div>
                    </div>
                    <div class="TableHeader left" style="width: 15%">
                        Job Description<div class="RedFont">
                            *</div>
                    </div>
                    <div class="TableHeader left" style="width: 15%">
                        Section / Seam</div>
                    <div class="TableHeader left" style="width: 15%">
                        Dimension(>0)</div>
                    <div class="TableHeader left" style="width: 15%">
                        Observations</div>
                    <div class="TableHeader left" style="width: 15%">
                        Result</div>
                    <div class="TableHeader left" style="width: 15%">
                        Sketch Reference</div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <div id="TestResults" style="width: 100%">
                    <div id="LineContent0">
                        <div class="TableValue left" style="width: 10%;">
                            <input type="hidden" style="clear: left; margin-left: inherit;" id="txtTestId0" />
                            <input type="text" style="width: 100%;" id="txtSerial0" name="txtSerial0" class="{required:true,  messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 15%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtJobDescription0" name="txtJobDescription0"
                                class="{required:true, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 15%;">
                            <input type="text" style="width: 100%;" id="txtSection0" />
                        </div>
                        <div class="TableValue left" style="width: 15%;">
                            <input type="text" style="width: 25%;" id="txtMagneticDimensionL0" name="txtMagneticDimensionL0" />&nbsp;X&nbsp;
                            <input type="text" style="width: 25%;" id="txtMagneticDimensionB0" name="txtMagneticDimensionB0" />&nbsp;X&nbsp;
                            <input type="text" style="width: 25%;" id="txtMagneticDimensionH0" name="txtMagneticDimensionH0" />
                        </div>
                        <div class="TableValue left" style="width: 15%; text-align: center;">
                            <select style="width: 100%;" id="cmbObservationsId0">
                            </select>
                        </div>
                        <div class="TableValue left" style="width: 15%; text-align: center;">
                            <select style="width: 100%;" id="cmbResult0">
                            </select>
                        </div>
                        <div class="TableValue left" style="width: 15%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtSketchReference0" />
                        </div>
                        <div class="clear" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <asp:Button runat="server" ID="btnValidate1" Text="Submit" class="classname" />
                <a href="#" id="btnClose" class="classname" onclick="ClearValue();">Cancel</a>
            </td>
        </tr>
    </table>
</asp:Content>
