<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true"
    CodeBehind="UltrasonicTestReport.aspx.cs" Inherits="NDTReporting.UltrasonicTestReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/style-web.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <script src="Script/UltrasonicTest.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            
            var obj = SaveUltrasonicTest;
            InitializeValidation(obj);
            $("#txtDateofTesting").datepicker();
            $("#txtDateofTesting").datepicker("option", "dateFormat", "dd/mm/yy");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                Customer Name<br/> (with address)<div class="RedFont">*</div>
            </td>
            <td class="TDFieldCell">
                <input id="txtReportId" class="HiddenField" type="text" disabled="disabled" /><hr />
                <input type="text" id="txtFabricatorName" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Instrument &amp; Sr No.
                <hr />
                Calibration Status
            </td>
            <td class="TDFieldCell">
                <input id="txtEquipment" type="text" />
                <hr />
                <input type="text" id="txtCalibration" />
            </td>
            <td class="TDHeaderCell">
                Calibration Block
                <hr />
                Reference Block
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtCalibrationBlock" /><hr />
                <input type="text" id="txtReferenceBlock" />
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
                Coupling Media
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtCouplingMedia" />
            </td>
            <td class="TDHeaderCell">
                Search Unit/Type<hr />
                Frequency
                
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtSearchUnit" /><hr />
                <input type="text" id="txtFrequency" />
                
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                UT Report No.
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
                Beam Angle<hr />
                Beam Index   
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtBeamAngle" /><hr /><hr />
                <input type="text" id="txtBeamIndex" /> 
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
                <input type="text" id="txtReferenceStandard" /><hr />
                <input type="text" id="txtTestSpecification" /></td>
            <td class="TDHeaderCell">
                Max Beam Path(mm) <hr />
                Time Base Range (mm)
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtMaxBeamPath" />
                <input type="text" id="txtTimeBaseRange" /><hr />
                
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
                Acceptance Criteria<hr />
                Procedure /Tech. Sheet No.
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtAcceptanceCriteria" /><hr />
                <input id="txtTechSheetNo" type="text" />
            </td>
            <td class="TDHeaderCell">
            Reflector(SDH/Notch mm)
                Gain (dB) (Ref)<hr />
                
            </td>
            <td class="TDFieldCell">
            <input type="text" id="txtReflector" />
                <hr />
                <input type="text" id="txtGain" /> 
            </td>
        </tr>
        <tr>
            <td class="TDHeaderCell">
                Date of testing<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtDateofTesting" name="Date" class="{required:true, messages:{required:' is required!'}}" />
            </td>
            <td class="TDHeaderCell">
                Extent of Coverage
                <hr />
                Consumables Type<div class="RedFont">
                    *</div>
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtExtentofCoverage" />
                <hr />
                <select id="cmbConsumablesType" name="cmbConsumablesType" class="{min:1, messages:{min:' is required!'}}">
                </select>
            </td>
            <td class="TDHeaderCell">
                Add correction(dB)<hr />
                Scan (dB) 
            </td>
            <td class="TDFieldCell">
            <input type="text" id="txtCorrection" />
                <hr />
                <input type="text" id="txtScan" />
                            </td>
        </tr>
        <tr>
            <td class="TDFieldCell" colspan="2">
                &nbsp;
            </td>
            <%--<td class="TDFieldCell">
                &nbsp;</td>--%>
            <td class="TDHeaderCell">
                &nbsp;</td>
            <td class="TDFieldCell">
                &nbsp;</td>
            <td class="TDHeaderCell">
            Rejection level(%reference level)<hr />
                Recording Level(%reference level)
            </td>
            <td class="TDFieldCell">
                <input type="text" id="txtRejectionLevel" /><hr />
                <input type="text" id="txtRecordingLevel" />

            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <img src="Images/plus.png" id="addButton" class="image" alt="add" />
                <img src="Images/minus.png" id="removeButton" class="image" alt="remove" />
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <div id="TestResultsHeader" style="width: 100%">
                    <div>
                        <div class="TableHeader left" style="width: 10%">
                            Sr No.<div class="RedFont">*</div>
                        </div>
                    </div>
                    <div class="TableHeader left" style="width: 10%">
                        Job Description<div class="RedFont">*</div>
                    </div>
                    <div class="TableHeader left" style="width: 10%">
                        Material</div>
                    <div class="TableHeader left" style="width: 10%">
                        Quantity(>0)<div class="RedFont">*</div>
                    </div>
                    <div class="TableHeader left" style="width: 8%">
                        Nominal Dimension</div>
                    <div class="TableHeader left" style="width: 11%">
                        Length of Indication(mm)<div class="RedFont">*</div>
                    </div>
                    <div class="TableHeader left" style="width: 11%">
                        Depth of Indication(mm)<div class="RedFont">*</div>
                    </div>
                    <div class="TableHeader left" style="width: 10%">
                        Observations</div>
                    <div class="TableHeader left" style="width: 10%">
                        Result</div>
                    <div class="TableHeader left" style="width: 10%">
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
                        <div class="TableValue left" style="width: 10%; text-align: center;">
                            <input type="text" style="width: 100%;" id="txtJobDescription0" name="txtJobDescription0"
                                class="{required:true, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 10%;">
                            <input type="text" style="width: 100%;" id="txtMaterial0" />
                        </div>
                        <div class="TableValue left" style="width: 10%;">
                            <input type="text" style="width: 40%;" id="txtUltrasonicQuantityX0" name="txtUltrasonicQuantityX0"
                                class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />&nbsp;X&nbsp;
                            <input type="text" style="width: 40%;" id="txtUltrasonicQuantityY0" name="txtUltrasonicQuantityY0"
                                class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 8%;">
                            <input type="text" style="width: 100%;" id="txtDimension0" />
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <input type="text" style="width: 100%;" id="txtLength0" name="txtLength0" class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 11%;">
                            <input type="text" style="width: 100%;" id="txtDepth0" name="txtDepth0" class="{required:true, number:true, minStrict:0, messages:{required:' is required!'}}" />
                        </div>
                        <div class="TableValue left" style="width: 10%; text-align: center;">
                            <select style="width: 100%;" id="cmbObservationsId0">
                            </select>
                        </div>
                        <div class="TableValue left" style="width: 10%; text-align: center;">
                            <select style="width: 100%;" id="cmbResult0">
                            </select>
                        </div>
                        <div class="TableValue left" style="width: 10%; text-align: center;">
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
