//Custom Declarations
{
    var masterhandler = "MasterPageHandler.ashx";
    var ReportID = 0;

    var myRadiographicWeldsTestResults1 = [];
    var datatype = "json";
    var empty = "";
}
//Entity Construction
{
    function PageDetailReq(testTypeId, currentPageId) {
        this.TestTypeId = testTypeId;
        this.CurrentPageId = currentPageId;
    }
}
//Page Functions
{
    var ndtReportingIsFormValid = false;
    var UserName = "Guest";
    var isTestTypeChanged = false;
    {
        var ClientId = '0';
        var ssnTestTypeId = '0';
        var ssnCurrentPageId = '0';
        var ssnIsAdmin = '0';
    } //Initialize Session Variables

    $(document).ready(function () {
        
        if (ssnCurrentPageId == '' || ssnTestTypeId == '') LogoutComplete(); // Session values cleared force relogin.

        SetSessionTestType(ssnTestTypeId, ssnCurrentPageId);
        SetTestTypeMenuDescription(ssnTestTypeId);
        SetUserGreeting();

        var selectedMenuElement = $('#' + ssnCurrentPageId);
        SetCurrentMenuItem(selectedMenuElement);

        $('#more').click(function () {
            $(this).next('.dropdown').toggle();
            return false;
        });

        $('.dropdown a').click(function () {
            $(this).parent('.dropdown').toggle();
            return false;
        });
        
        if (ssnIsAdmin != "1") {
            $('.MASTER').addClass('hide');
        }

        $(".Logout").live('click', function () {
            DoAjaxCall(masterhandler, "LogoutComplete", "Logout", "", datatype, "");
        });

        $(".TTYPE").live('click', function () {
            isTestTypeChanged = true;
            ssnTestTypeId = $(this).attr('id');
            SetSessionTestType(ssnTestTypeId, ssnCurrentPageId);
        });

        $(".PAGE").live('click', function () {
        
            if (isTestTypeChanged != true) {
                ssnCurrentPageId = $(this).attr('id');
                $('.current').removeClass('current');
                $(this).addClass('current');
            }
            GetPageRedirectURL(ssnTestTypeId, ssnCurrentPageId);
        });
    });
    function SetCurrentMenuItem(mnuItem) {
        $('.current').removeClass('current');
        mnuItem.addClass('current');
    }
    function SetSessionTestType(ssnTestTypeId, ssnCurrentPageId) {
        var data = new PageDetailReq(ssnTestTypeId, ssnCurrentPageId);
        DoAjaxCall(masterhandler, "SetSessionTestTypeComplete", "SetSessionTestType", "", datatype, JSON.stringify(data));
    }

    function SetSessionTestTypeComplete(data, message) {
        SetTestTypeMenuDescription(message.toString());
        if (isTestTypeChanged) {
            GetPageRedirectURL(ssnTestTypeId, ssnCurrentPageId);
            isTestTypeChanged = false;
        }
    }

    {
        //Action	Description
        //1	        Create Report
        //2	        Edit Report
        //3	        Print Report
        //4	        Create Template
        //5	        Edit Template

        //TestType  Description
        //1	        RadioGraphicWeld
        //3	        UltraSonic
        //5	        Magnetic
        //7	        Liquid
    } // TODO: Make these as Enums

    function SetTestTypeMenuDescription(testType) {
        var testTypeName = "Error: No Test Type Selected!";

        switch (testType) {
            case "1":
                testTypeName = "RadioGraphicWeld";
                break;
            case "3":
                testTypeName = "UltraSonic";
                break;
            case "5":
                testTypeName = "Magnetic";
                break;
            case "7":
                testTypeName = "Liquid";
                break;
        }
        $(".dvTestType").text("Test Type: " + testTypeName);
    }

    function GetPageRedirectURL(strTestType, strCurrentPageId) {
        var data = new PageDetailReq(strTestType, strCurrentPageId);
        DoAjaxCall(masterhandler, "GetPageRedirectURLComplete", "GetPageRedirectURL", '', datatype, JSON.stringify(data));
    }

    function GetPageRedirectURLComplete(data, message) {
        
        $("#CurrentPage").val(data.Title);
        window.location.href = data.Page;
    }

    function SetUserGreeting() {
        $(".dvUserGreeting").text("Welcome: " + UserName);
    }

    function LogoutComplete() {
        window.location.href = "../PresentationLayer/LoginPage.aspx";
    }
}
