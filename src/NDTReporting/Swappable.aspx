<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Swappable.aspx.cs" Inherits="NDTReporting.Swappable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery-1.7.2.js"></script> 
	<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.core.js"></script> 
	<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.widget.js"></script>  
	<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.mouse.js"></script>  
	<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.sortable.js"></script> 
	<script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery.ui.swappable.js"></script> 

    <script type="text/javascript">
        $(document).ready(function () {

            $("#JobDescription, #ReferenceDocuments, #RadiographyTechniqueDetail, #JobDetails, #Legend, #Signatures").swappable({
                items: '.DivCells',
                cursorAt: { top: -10, left: 0 }
            }).disableSelection();

            $("#JobDescriptionContainer, #ReferenceDocumentsContainer, #RadiographyTechniqueDetailsContainer, #JobDetailsContainer, #LegendContainer, #SignaturesContainer").swappable({
                items: '.body',
                cursorAt: { top: -10, left: 0 }
            }).disableSelection();

            $(".delete-tab").live('click', function () {
                $(this).parent().remove();
            });
        });
       
    </script>
    <link href="../CSS/style-web.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Banner">
    <table style="width: 100%;">
        <tr>
            <td style="width: 80%;" align="center">
                <span class="HeaderLarge">GEECY INDUSTRIAL SERVICES PVT. LTD.</span><br />
                <span class="HeaderSmall">B-6 / M- 206, Sector-3, Millenium Business Park, MIDC-Mahape,
                </span>
                <br />
                <span class="HeaderSmall">Navi Mumbai - 400 710. Maharashtra, India. </span>
                <br />
                <span class="HeaderSmall">Tel: +91-22-27782952 / +91-22-27782953&nbsp; Fax: +91-22-27782954
                </span>
                <br />
                <span class="HeaderSmall">Email:enquire@ndtgeecy.com</span>
            </td>
            <td style="width: 20%;" align="center">
                <img src="../Images/logo.gif" />
            </td>
        </tr>
    </table>
</div>
<div class="Sections">
    <div class="Section" id="JobDescriptionContainer">
    <div class="body">
        <div class="SectionHeading">
            Job Description
        </div>
        <div id="JobDescription" class="border">
            <div class="DivColumns left">
                <div id="Div1" class="DivCells ">
                    <div class="DivFieldLabel">
                        Report No:
                    </div>
                    <div class="DivFieldValue">
                        ##reportnoValue##
                    </div>
                    <div class="delete-tab"></div>
                </div>
                <div id="Div2" class="DivCells">
                    <div class="DivFieldLabel">
                        Location:
                    </div>
                    <div class="DivFieldValue">
                        ##LocationValue##
                    </div>
                </div>
                <div id="Div3" class="DivCells">
                    <div class="DivFieldLabel">
                        Description:
                    </div>
                    <div class="DivFieldValue">
                        ##descriptionValue##
                    </div>
                </div>
                <div id="Div4" class="DivCells">
                    <div class="DivFieldLabel">
                        Client:
                    </div>
                    <div class="DivFieldValue">
                        ##ClientValue##
                    </div>
                </div>
            </div>
            <div class="DivColumns right">
                <div id="Div5" class="DivCells">
                    <div class="DivFieldLabel">
                        Test Date:
                    </div>
                    <div class="DivFieldValue">
                        ##testdateValue##
                    </div>
                </div>
                <div id="Div6" class="DivCells">
                    <div class="DivFieldLabel">
                        Contact Person1:
                    </div>
                    <div class="DivFieldValue">
                        ##contactperson1Value##
                    </div>
                </div>
                <div id="Div7" class="DivCells">
                    <div class="DivFieldLabel">
                        Contact No:
                    </div>
                    <div class="DivFieldValue">
                        ##contactnoValue##
                    </div>
                </div>
                <div id="Div8" class="DivCells">
                    <div class="DivFieldLabel">
                        Contact Person:
                    </div>
                    <div class="DivFieldValue">
                        ##contactpersonValue##
                    </div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
    </div>
    <div class="Section" id="ReferenceDocumentsContainer">
    <div class="body">
        <div class="SectionHeading">
        Reference Documents 
        </div>
        <div id="ReferenceDocuments" class="border">
            <div class="DivColumns left">
                <div id="code" class="DivCells">
                    <div class="DivFieldLabel">
                        Code:
                    </div>
                    <div class="DivFieldValue">
                        ##CodeValue##
                    </div>
                </div>
                <div id="TestSpecification" class="DivCells">
                    <div class="DivFieldLabel">
                        TestSpecification:
                    </div>
                    <div class="DivFieldValue">
                        ##TestSpecificationValue##
                    </div>
                </div>
            </div>
            <div class="DivColumns right">
                <div id="TestProcedureNo" class="DivCells">
                    <div class="DivFieldLabel">
                        Test Procedure No.:</div>
                    <div class="DivFieldValue">
                        ##TestProcedureValue##
                    </div>
                </div>
                <div id="AcceptanceStandard" class="DivCells">
                    <div class="DivFieldLabel">
                        Acceptance Standard:</div>
                    <div class="DivFieldValue">
                        ##AcceptanceStandardValue##
                    </div>
                </div>
            </div>
            <div class="clear"> </div>
        </div>
        </div>
    </div>
    <div class="Section" id="RadiographyTechniqueDetailsContainer">
    <div class="body">
        <div class="SectionHeading">
            Radiography Technique Details
        </div>
        <div id="RadiographyTechniqueDetail" class="border">
            <div class="DivColumns left">
                <div id="TypeofSource" class="DivCells">
                    <div class="DivFieldLabel">
                        Type of Source:</div>
                    <div class="DivFieldValue">
                        ##TypeofSourceValue##</div>
                </div>
                <div id="UnitofEnergy" class="DivCells">
                    <div class="DivFieldLabel">
                        Unit of Energy:</div>
                    <div class="DivFieldValue">
                        ##UnitofEnergyValue##</div>
                </div>
                <div id="Identification" class="DivCells">
                    <div class="DivFieldLabel">
                        Identification:</div>
                    <div class="DivFieldValue">
                        ##IdentificationValue##
                    </div>
                </div>
                <div id="FocalSpotSize" class="DivCells">
                    <div class="DivFieldLabel">
                        Focal Spot Size:</div>
                    <div class="DivFieldValue">
                        ##FocalSpotSizeValue##
                    </div>
                </div>
                <div id="FilmMakeAndType" class="DivCells">
                    <div class="DivFieldLabel">
                        Film Make And Type:</div>
                    <div class="DivFieldValue">
                        ##FilmMakeAndTypeValue##</div>
                </div>
                <div id="TypeofIQI" class="DivCells">
                    <div class="DivFieldLabel">
                        Type of IQI:</div>
                    <div class="DivFieldValue">
                        ##TypeofIQIValue##</div>
                </div>
                
            </div>
            <div class="DivColumns right">
                <div id="IQIBatchNo" class="DivCells">
                    <div class="DivFieldLabel">
                        IQI BatchNo:</div>
                    <div class="DivFieldValue">
                        ##IQIBatchNoValue##
                    </div>
                </div>  
                <div id="TechniqueName" class="DivCells">
                    <div class="DivFieldLabel">
                        Technique:</div>
                    <div class="DivFieldValue">
                        ##TechniqueNameValue##
                    </div>
                </div>
                <div id="ShimThickness" class="DivCells">
                    <div class="DivFieldLabel">
                        Shim Thickness:</div>
                    <div class="DivFieldValue">
                        ##ShimThicknessValue##</div>
                </div>
                <div id="DensitometerNo" class="DivCells">
                    <div class="DivFieldLabel">
                        Densitometer No:</div>
                    <div class="DivFieldValue">
                        ##DensitometerNoValue##</div>
                </div>
                <div id="CalibrationDate" class="DivCells">
                    <div class="DivFieldLabel">
                        Calibration Date:</div>
                    <div class="DivFieldValue">
                        ##CalibrationDateValue##
                    </div>
                </div>
                <div id="GeometricalUnsharpness" class="DivCells">
                    <div class="DivFieldLabel">
                        Geometrical Unsharpness:</div>
                    <div class="DivFieldValue">
                        ##GeometricalUnsharpnessValue##
                    </div>
                </div>
                <div id="ExposureTime" class="DivCells">
                    <div class="DivFieldLabel">
                        Exposure Time:</div>
                    <div class="DivFieldValue">
                        ##ExposureTime##
                    </div>
                </div>
                
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
    </div>
    <div class="Section" id="JobDetailsContainer">
    <div class="body">
        <div class="SectionHeading">
            Test Results
        </div>
        <div id="JobDetails" class="border">
            <div class="DivColumns left">
                <table style="width: 100%">
                    <thead>
                        <tr>
                            <th style="width: 5%" class="TableHeader">
                                No
                            </th>
                            <th style="width: 13%" class="TableHeader">
                                Identification No
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Joint No
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Welder
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Segment
                            </th>
                            <th style="width: 7%" class="TableHeader">
                                Size
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Density
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Sensitivity
                            </th>
                            <th style="width: 10%" class="TableHeader">
                                Observation
                            </th>
                            <th style="width: 15%" class="TableHeader">
                                Remarks
                            </th>
                        </tr>
                    </thead>
                    <tbody id="JobDetailsTableRowTemplateContainer">
                       <tr id="JobDetailsTableRowTemplate">  
                       <td style="WIDTH: 5%" class="TableValueCenter">##SrNo## </td>  
                       <td style="WIDTH: 13%" class="TableValue">##IdentificationNo## </td>  
                       <td style="WIDTH: 10%" class="TableValueCenter">##JointNo## </td>  
                       <td style="WIDTH: 10%" class="TableValue">##Welder## </td>  
                       <td style="WIDTH: 10%" class="TableValue">##Segment## </td>  
                       <td style="WIDTH: 7%" class="TableValueCenter">##FilmSize## </td>  
                       <td style="WIDTH: 10%" class="TableValueCenter">##Density## </td>  
                       <td style="WIDTH: 10%" class="TableValueCenter">##Sensitivity## </td>  
                       <td style="WIDTH: 10%" class="TableValue">##Observations## </td>  
                       <td style="WIDTH: 15%" class="TableValue">##Remarks## </td></tr>
                    </tbody>
                </table>
            </div>
            <div class="DivColumns right">
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
    </div>
    <div class="Section" id="LegendContainer">
    <div class="body">
        <div class="SectionHeading">
            Legend
        </div>
        <div id="Legend" class="border">
            <div id="Div9" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    IP/LP
                </div>
                <div class="DivFieldValue">
                    Incomplete Penetration
                </div>
            </div>
            <div id="Div10" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    LF
                </div>
                <div class="DivFieldValue">
                    Lack of Fusion
                </div>
            </div>
            <div id="Div11" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    SL
                </div>
                <div class="DivFieldValue">
                    Slag Line
                </div>
            </div>
            <div id="Div12" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    UC
                </div>
                <div class="DivFieldValue">
                    Under Cut
                </div>
            </div>
            <div id="Div13" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    AD
                </div>
                <div class="DivFieldValue">
                    Accumulated Defects
                </div>
            </div>
            <div id="Div14" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    Por
                </div>
                <div class="DivFieldValue">
                    Porosity
                </div>
            </div>
            <div id="Div15" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    Gr Por
                </div>
                <div class="DivFieldValue">
                    Group Porosity
                </div>
            </div>
            <div id="Div16" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    BT
                </div>
                <div class="DivFieldValue">
                    Burn Thru
                </div>
            </div>
            <div id="Div17" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    RT
                </div>
                <div class="DivFieldValue">
                    Retake
                </div>
            </div>
            <div id="Div18" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    RS
                </div>
                <div class="DivFieldValue">
                    Reshoot
                </div>
            </div>
            <div id="Div19" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    Rep
                </div>
                <div class="DivFieldValue">
                    Repair
                </div>
            </div>
            <div id="Div20" class="DivCellsFourCols">
                <div class="DivFieldLabel">
                    Acc
                </div>
                <div class="DivFieldValue">
                    Acceptable
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
    </div>
    <div class="Section" id="SignaturesContainer">
    <div class="body">
        <div class="SectionHeading">
            Radiographer:
        </div>
        <div id="Signatures" class="border">
            <div class="DivCellsFourCols Header">
                Radiographs Viewed By
            </div>
            <div class="DivCellsFourCols Header">
                Client Approval
            </div>
            <div class="DivCellsFourCols Header">
                Authority Witness
            </div>
            <div class="DivCellsFourCols Header">
                Client Witness
            </div>
            <div class="DivCellsFourCols border sign">
                &nbsp;
            </div>
            <div class="DivCellsFourCols border sign">
                &nbsp;
            </div>
            <div class="DivCellsFourCols border sign">
                &nbsp;
            </div>
            <div class="DivCellsFourCols border sign">
                &nbsp;
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
    </div>
</div>

</asp:Content>
