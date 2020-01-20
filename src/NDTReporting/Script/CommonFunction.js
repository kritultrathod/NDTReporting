//Common Work
{
    /*
    handler: HTTP Handler File Name                         completed: Callback Function to handle HTTP response, 
    method: Method to Call on the server side,              parameter: Parameters to pass to the method, 
    datatype: (Confirm),                                    data: (Confirm)
    */
    var AjaxCallCounter = 0;
    function DoAjaxCall(handler, completed, method, parameter, datatype, data) {
        
        addAjaxCallCounter();
        jQuery.ajax({
            type: 'POST',
            url: "HTTPWebHandlers/" + handler + "?callbackmethod=" + completed + "&method=" + method + "&param=" + parameter, //"ProductList.ashx" + parameter,
            data: data,
            dataType: datatype,
            success: function (data, textStatus) {
                try {
                    
                    chkAjaxCallCounter();
                    var jsonData = eval(data);
                    if (jsonData.IsSucess) {
                        eval(jsonData.CallBack + '(jsonData.ResponseData, jsonData.Message)');
                    }
                    else {
                        alert(jsonData.Message + jsonData.IsSucess);
                    }
                }
                catch (err) {
                    alert(err);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                
                chkAjaxCallCounter();
                alert("Error:" + errorThrown + " and " + jqXHR + " and " + textStatus);
            }
        });
    }

    function addAjaxCallCounter() {
        
        AjaxCallCounter++;
        $('#dvLoading').fadeIn(100);
    }
    function chkAjaxCallCounter() {
        
        AjaxCallCounter--;
        if (AjaxCallCounter < 1) {
        
            $('#dvLoading').fadeOut(700);
        }
    }

    /*
    Pass the query string paramter name and get the value
    */
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = "[\\?&]" + name + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(window.location.href);
        if (results == null)
            return "";
        else
            return decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    $('#loadingDiv')
    .hide()  // hide it initially
    .ajaxStart(function () {
        $(this).show();
    })
    .ajaxStop(function () {
        $(this).hide();
    });

    //JavaScript Enums
    {
        var enDeletedStatus = {
            enActive: 1,  // Active Records
            enDeleted: 0, // Deleted Records - Permenent Deleted. should not be used for historic data as well.
            enArchived: 3 // Archived Records - used for historical data
        };
    }

    function addSelectOneOption(combo) {
        var newOption = document.createElement("option");
        newOption.text = '--Select One--';
        newOption.value = 0;
        combo.add(newOption);
    }
}
//Class
{
    var sortField = '5';
    var sortDir = 'D';

    function SearchTestRecordReq(reportId, createdBy, pageIndex, sortField, sortDir, testReportNo, client, location, contactPerson, contractNo, testDateStart, testDateEnd) {
        this.ReportId = reportId;
        this.CreatedBy = createdBy;
        this.PageIndex = pageIndex;
        this.SortField = sortField;
        this.SortDir = sortDir;
        this.TestReportNo = testReportNo;
        this.Client = client;
        this.Location = location;
        this.ContactPerson = contactPerson;
        this.ContractNo = contractNo;
        this.TestDateStartString = testDateStart;
        this.TestDateEndString = testDateEnd;
    }

    function TemplateParams(reportId, subTestId, action) {
        this.ReportId = reportId;
        this.SubTestId = subTestId;
        this.Action = action;
    }
    function ReportViewParams(reportId, TemplateId, action) {
        this.ReportId = reportId;
        this.TemplateId = TemplateId;
        this.Action = action;
    }
    function GetPrintLabel(isAuthorized) {
        if (isAuthorized) return "Print";
        return "Authorize";
    }
    function GetLinkState() {
        if (!ssnIsAdmin) return "PrintReport'";
        return 'PrintReport\' title="Admin rights required"';
    }
    function GetDisableButtonState(isAuthorized) {
        if (ssnIsAdmin == 0) {
            if (!isAuthorized) {
                return 'disabled';
            }
            else {
                return '';
            }
        }
        else {
            return '';
        }
    }
}