<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestAutoCompleteDocumentation.aspx.cs" Inherits="NDTReporting.A1_Crap.TestAutoComplete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script>
        $(function () {
            $("#txtLanguage").autocomplete({
                //columnnames must have 2 values 1st the id name and next the text name 
                source: 'HTTPWebHandlers/Autocomplete.ashx?method=autolookuplist&ColumnNames=CustomReportTemplateId,TemplateName&SearchColumn=TemplateName&TableName=CustomReportTemplate',
                minLength: 1, // how many character when typing to display auto complete
                // After the value from auto complete is selected it will display the id in Id column
                select: function (event, ui) {
                    AutoloadMyPage(ui.item.value, ui.item.label);
                    return false;
                },
                focus: function (event, ui) {
                    // this is to prevent value change of text box while browsing on the selected items
                    event.preventDefault();
                    AutoloadMytext(ui.item.label);
                }
            });
        });
        $(function() {
            $("#txtTemplateAuto").autocomplete({
                //columnnames must have 2 values 1st the id name and next the text name (We know the id is of no use but still add it)
                source: "HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&ColumnNames=CustomReportTemplateId,TemplateName&SearchColumn=TemplateName&TableName=CustomReportTemplate"
                });
        });

        function AutoloadMytext(label) {
            $('#txtLanguage').val(label);
        }
        
        function AutoloadMyPage(value,label) {
            AutoloadMytext(label);
            $('#txtLangId').val(value);
            
        }
    </script>
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <strong>Demo on Auto complete + on Select event </strong> <br>
  <label for="Language">Template: </label>
    <input id="txtLanguage" class="txtLanguage"/>
        <input id="txtLangId" value="Actual id"/>
    
    <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(255, 255, 255); clear: both; word-wrap: break-word; color: rgb(0, 0, 0); font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;">
        You need to transform the object you are getting back into an array in the 
        format that jQueryUI expects.</p>
    <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(255, 255, 255); clear: both; word-wrap: break-word; color: rgb(0, 0, 0); font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;">
        You can use<span class="Apple-converted-space">&nbsp;</span><a 
            href="http://api.jquery.com/jquery.map" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(74, 107, 130); text-decoration: none; cursor: pointer; background-position: initial initial; background-repeat: initial initial;"><code 
            style="margin: 0px; padding: 1px 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">$.map</code></a><span 
            class="Apple-converted-space">&nbsp;</span>to transform the<span 
            class="Apple-converted-space">&nbsp;</span><code 
            style="margin: 0px; padding: 1px 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">dealers</code><span 
            class="Apple-converted-space">&nbsp;</span>object into that array.</p>
 
 
    <div class="post-text" 
        style="margin: 0px 5px 5px 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(255, 255, 255); width: 660px; line-height: 18px; color: rgb(0, 0, 0); font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;">
        <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; clear: both; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
            Note that when you select an item, the &quot;key&quot; will be placed in the text box. You 
            can change this by tweaking the<span class="Apple-converted-space">&nbsp;</span><code 
                style="margin: 0px; padding: 1px 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">label</code><span 
                class="Apple-converted-space">&nbsp;</span>and<span 
                class="Apple-converted-space">&nbsp;</span><code 
                style="margin: 0px; padding: 1px 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">value</code><span 
                class="Apple-converted-space">&nbsp;</span>properties that<span 
                class="Apple-converted-space">&nbsp;</span><code 
                style="margin: 0px; padding: 1px 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">$.map</code>&#39;s 
            callback function return.</p>
        <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; clear: both; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
            Alternatively, if you have access to the server-side code that is generating the 
            JSON, you could change the way the data is returned. As long as the data:</p>
        <ul style="margin: 0px 0px 1em 30px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; list-style: disc; background-position: initial initial; background-repeat: initial initial;">
            <li style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
                Is an array of objects that have a<span class="Apple-converted-space">&nbsp;</span><code 
                    style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">label</code><span 
                    class="Apple-converted-space">&nbsp;</span>property, a<span 
                    class="Apple-converted-space">&nbsp;</span><code 
                    style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;">value</code><span 
                    class="Apple-converted-space">&nbsp;</span>property, or both, or</li>
            <li style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
                Is a simple array of strings</li>
        </ul>
        <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; clear: both; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
            In other words, if you can format the data like this:</p>
        <pre class="default prettyprint prettyprinted" 
            style="margin: 0px 0px 10px; padding: 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; overflow: auto; width: auto; max-height: 600px; background-position: initial initial; background-repeat: initial initial;"><code 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;"><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">[{</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> value</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">:</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;1463&quot;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">,</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> label</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">:</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;dealer 5&quot;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">},</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">{</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> value</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">:</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;269&quot;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">,</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> label</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">:</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;dealer 6&quot;</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">}]</span></code></pre>
        <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; clear: both; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
            or this:</p>
        <pre class="default prettyprint prettyprinted" 
            style="margin: 0px 0px 10px; padding: 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; overflow: auto; width: auto; max-height: 600px; background-position: initial initial; background-repeat: initial initial;"><code 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;"><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">[</span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;dealer 5&quot;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">,</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;dealer 6&quot;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">]</span></code></pre>
        <p style="margin: 0px 0px 1em; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; clear: both; word-wrap: break-word; background-position: initial initial; background-repeat: initial initial;">
            Then your JavaScript becomes much simpler:</p>
        <pre class="default prettyprint prettyprinted" 
            style="margin: 0px 0px 10px; padding: 5px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; overflow: auto; width: auto; max-height: 600px; background-position: initial initial; background-repeat: initial initial;"><code 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: rgb(238, 238, 238); font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; background-position: initial initial; background-repeat: initial initial;"><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">$</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">(</span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&#39;#dealerName&#39;</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">).</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">autocomplete</span><span 
            class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">({</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">
    source</span><span class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">:</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;"> </span><span 
            class="str" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(128, 0, 0); background-position: initial initial; background-repeat: initial initial;">&quot;/example/location/example.json&quot;</span><span 
            class="pln" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">
</span><span class="pun" 
            style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background-color: transparent; color: rgb(0, 0, 0); background-position: initial initial; background-repeat: initial initial;">});</span></code></pre>
    </div>
    <br class="Apple-interchange-newline" />
 <br> 
   <strong>Demo on Auto complete a standard string list. <span class="style2">Using 
    just one line of code</span></strong><br>
  <label for="Language">Template: </label>
    <input id="txtTemplateAuto" class="txtLanguage"/>
    <br />
    <br />
    The below block of code needs to be added in .js file . placing it in bottom of 
    the file<pre 
        style="font-family: Monaco; font-size: 5; color: #f8fff9; background: #1b1d1e;">&nbsp;<span 
        class="style1">$(</span><span 
        style="color:#aeee00;" class="style1">function</span><span class="style1">&nbsp;()&nbsp;{</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(</span><span 
        style="color:#ff6e0e;" class="style1">&quot;#txtLocation&quot;</span><span 
        class="style1">).autocomplete({</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span 
        style="color:#5a7085;" class="style1">//columnnames&nbsp;must&nbsp;have&nbsp;2&nbsp;values&nbsp;1st&nbsp;the&nbsp;id&nbsp;name&nbsp;and&nbsp;next&nbsp;the&nbsp;text&nbsp;name&nbsp;(We&nbsp;know&nbsp;the&nbsp;id&nbsp;is&nbsp;of&nbsp;no&nbsp;use&nbsp;but&nbsp;still&nbsp;add&nbsp;it)</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source:&nbsp;</span><span 
        style="color:#ff6e0e;" class="style1">&quot;HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&amp;&amp;ColumnNames=Reportid,Location&amp;SearchColumn=Location&amp;TableName=MagneticParticleExaminationTest&quot;</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;});</span></pre>
        
 </form>
   
    <p>
        There are 4 values need to be chnaged for each control</p>
    <p>
        1) <span style="color: #ff6e0e;">txtLocation = Control name</span></p>
    <p>
        2) <span style="color: #ff6e0e;">Reportid = some running id mostly it will be 
        report id</span></p>
    <p>
        3)<span style="color: #ff6e0e;">Location = both columnnames and search column 
        must be same a coulmn saved from the text box</span></p>
    <p>
        4) <span style="color: #ff6e0e;">MagneticParticleExaminationTest = its the table 
        name.</span></p>
    <p>
        Just replace the texts from the above code block for each control.</p>
   
    <p>
   <strong><span class="style2">Using just one line of code by creating a function.</span></strong></p>
    <pre style="font-family: Monaco; font-size: 13; color: #f8fff9; background: #1b1d1e;"><span 
        class="style1" style="color:#5a7085;">//All&nbsp;simple&nbsp;auto&nbsp;complete&nbsp;and&nbsp;details&nbsp;comments&nbsp;on&nbsp;the&nbsp;first&nbsp;function</span>

<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style1" style="color:#aeee00;">function</span><span 
        class="style1">&nbsp;AutoCompleteControl(IdOfControl,SearchColumnname)&nbsp;{</span>
 
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(IdOfControl).autocomplete({</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style1" style="color:#5a7085;">//columnnames&nbsp;must&nbsp;have&nbsp;2&nbsp;values&nbsp;1st&nbsp;the&nbsp;id&nbsp;name&nbsp;and&nbsp;next&nbsp;the&nbsp;text&nbsp;name&nbsp;(We&nbsp;know&nbsp;the&nbsp;id&nbsp;is&nbsp;of&nbsp;no&nbsp;use&nbsp;but&nbsp;still&nbsp;add&nbsp;it)</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source:&nbsp;</span><span class="style1" 
        style="color:#ff6e0e;">&quot;HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&amp;&amp;ColumnNames=Reportid,&quot;</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;SearchColumnname&nbsp;+&nbsp;</span><span class="style1" 
        style="color:#ff6e0e;">&quot;&amp;SearchColumn=&quot;</span><span class="style1">&nbsp;+&nbsp;SearchColumnname&nbsp;+&nbsp;</span><span 
        class="style1" style="color:#ff6e0e;">&quot;&amp;TableName=UltrasonicExaminationTest&quot;</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</span>
<span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;}</span></pre>
    <p>
        Call one line of function with control name and search column name inside 
        document.ready</p>
    <pre style="font-family: Monaco; font-size: 13; color: #f8fff9; background: #1b1d1e;"><span 
        class="style3">$(</span><span class="style3" style="color:#aeee00;">function</span><span 
        class="style3">&nbsp;()&nbsp;{</span>
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AutoCompleteControl(</span><span class="style3" 
        style="color:#ff6e0e;">&quot;#txtFabricatorName&quot;</span><span class="style3">,&nbsp;</span><span 
        class="style3" style="color:#ff6e0e;">&quot;FabricatorName&quot;</span><span 
        class="style3">);</span>
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AutoCompleteControl(</span><span class="style3" 
        style="color:#ff6e0e;">&quot;#txtLocation&quot;</span><span class="style3">,&nbsp;</span><span 
        class="style3" style="color:#ff6e0e;">&quot;Location&quot;</span><span class="style3">);</span>
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AutoCompleteControl(</span><span class="style3" 
        style="color:#ff6e0e;">&quot;#txtReportNo&quot;</span><span class="style3">,&nbsp;</span><span 
        class="style3" style="color:#ff6e0e;">&quot;ReportNo&quot;</span><span class="style3">);</span>
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AutoCompleteControl(</span><span class="style3" 
        style="color:#ff6e0e;">&quot;#txtContactPerson&quot;</span><span class="style3">,&nbsp;</span><span 
        class="style3" style="color:#ff6e0e;">&quot;ContactPerson&quot;</span><span 
        class="style3">);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</span></pre>
    <p>
        &nbsp;</p>
   
</body>
</html>
