<CFPARAM NAME="FORM.firstWeighInFormField" DEFAULT="0">
<CFPARAM NAME="FORM.secondWeighInFormField" DEFAULT="0">
<CFPARAM NAME="FORM.numberOfObjectsFormField" DEFAULT="0">
<CFPARAM NAME="submit" DEFAULT="no">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<HTML>

<HEAD>

<TITLE>Weigh-in</TITLE>

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--

var numberOfObjectsFormFieldJS = 0;
var firstWeighInFormFieldJS = 0;
var secondWeighInFormFieldJS = 0;
var heavierWeighInJS = 0;
var lighterWeighInJS = 0;
var resultsJS = "";
var heavierObjectWeightJS = 0;
var checkFields = 1;
var errorMessage;

window.onload = function() {
checkForm();
}

function checkForm() {

errorMessage = document.getElementById("errorMessage");

document.getElementById("submitButton").onmouseover = function(e) {

numberOfObjectsFormFieldJS = eval(document.forms[0].numberOfObjectsFormField.value);
firstWeighInFormFieldJS = eval(document.forms[0].firstWeighInFormField.value);
secondWeighInFormFieldJS = eval(document.forms[0].secondWeighInFormField.value);

if(numberOfObjectsFormFieldJS == "" || firstWeighInFormFieldJS == "" || secondWeighInFormFieldJS == ""){
checkFields = 0;
}
else{
checkFields = 1;
}

if(numberOfObjectsFormFieldJS == 0 || firstWeighInFormFieldJS == 0 || secondWeighInFormFieldJS == 0){
checkFields = 0;
}
else{
checkFields = 1;
}

if(typeof(numberOfObjectsFormFieldJS) == "undefined" || typeof(firstWeighInFormFieldJS) == "undefined" || typeof(secondWeighInFormFieldJS) == "undefined"){
checkFields = 0;
}
else{
checkFields = 1;
}

if(checkFields){

//alert("Number of objects: " + numberOfObjectsFormFieldJS + " First weigh-in field: " + firstWeighInFormFieldJS + " Second weigh-in field: " + secondWeighInFormFieldJS + "")

//alert(checkFields);

if(firstWeighInFormFieldJS > secondWeighInFormFieldJS){
heavierWeighInJS = firstWeighInFormFieldJS;
lighterWeighInJS = secondWeighInFormFieldJS;
}
else if(firstWeighInFormFieldJS < secondWeighInFormFieldJS){
heavierWeighInJS = secondWeighInFormFieldJS;
lighterWeighInJS = firstWeighInFormFieldJS; 
}
else{
resultsJS = "Please make sure that your two weigh-ins differ in weight";
//return alert(resultsJS);
document.forms[0].numberOfObjectsFormField.blur();
document.forms[0].firstWeighInFormField.blur();
document.forms[0].secondWeighInFormField.blur();
errorMessage.innerHTML = resultsJS;
document.getElementById("submitButton").disabled = true
return true;
}

heavierObjectWeightJS = heavierWeighInJS/(numberOfObjectsFormFieldJS-1);

if(lighterWeighInJS <= heavierObjectWeightJS*(numberOfObjectsFormFieldJS-2)){
resultsJS = "The lighter weigh-in must be greater than the heavier object's weight mutiplied by two less than the total amount of objects, otherwise the lighter object weighs nothing, in which case it doesn't exist";
document.forms[0].numberOfObjectsFormField.blur();
document.forms[0].firstWeighInFormField.blur();
document.forms[0].secondWeighInFormField.blur();
errorMessage.innerHTML = resultsJS;
document.getElementById("submitButton").disabled = true
//return alert(resultsJS);
return true;
}

}

}
}

//-->
</SCRIPT>

</HEAD>

<BODY>

<!--- Author: Charles Robertson
Function: weighIn
Description: takes three parameters. First weigh-in, second weigh-in and number of objects being weighed. The function evaluates the weight of the one object, which is lighter than the other objects, the rest of which are the same weight. The function also evaluates the weight of the heavier objects and the total weight of all objects.
Date: 15.05.09
Comments: extensive use of formulas
Language: CFScript --->

<CFSCRIPT>

function weighIn(afirstWeighIn,asecondWeighIn,anumberOfObjects){

// initialise variables

var firstWeighIn = afirstWeighIn;
var secondWeighIn = asecondWeighIn;
var numberOfObjects = anumberOfObjects;
var lighterWeighIn = 0;
var heavierWeighIn = 0;
var heavierObjectWeight = 0;
var lighterObjectWeight = 0;
var totalWeight = 0;
var results = ArrayNew(2);

if(firstWeighIn GT secondWeighIn){
heavierWeighIn = firstWeighIn;
lighterWeighIn = secondWeighIn;
}
else if(firstWeighIn LT secondWeighIn){
heavierWeighIn = secondWeighIn;
lighterWeighIn = firstWeighIn; 
}
else{
results[1][1] = "Please make sure that your two weigh-ins differ in weight";
results[1][2] = "";
return results;
}

heavierObjectWeight = heavierWeighIn/(numberOfObjects-1);

if(lighterWeighIn LTE heavierObjectWeight*(numberOfObjects-2)){
results[1][1] = "The lighter weigh-in must be greater than the heavier object's weight mutiplied by two less than the total amount of objects, otherwise the lighter object weighs nothing, in which case it doesn't exist";
results[1][2] = "";
return results;
}

lighterObjectWeight = (heavierObjectWeight*(numberOfObjects-1)) - lighterWeighIn;
totalWeight = lighterObjectWeight + (heavierObjectWeight*(numberOfObjects-1));

results[1][1] = "Heavier object weight";
results[1][2] = heavierObjectWeight;
results[2][1] = "Lighter object weight";
results[2][2] = lighterObjectWeight;
results[3][1] = "Total weight";
results[3][2] = totalWeight;

return results;
}

</CFSCRIPT>

<!--- <CFSET weighInInstance = createObject("component","weighIn").init()>

<CFSET  cfVar = weighInInstance.weighIn(11,12,8)> --->

<CFSET  cfVar = weighIn(11,12,8)>

<CFIF FORM.firstWeighInFormField IS "0" OR FORM.secondWeighInFormField IS "0" OR FORM.numberOfObjectsFormField IS "0">
<CFSET  cfVar = weighIn(11,12,8)>
</CFIF>

<CFIF submit IS "yes">
<CFIF FORM.firstWeighInFormField EQ 0 OR FORM.secondWeighInFormField EQ 0 OR FORM.numberOfObjectsFormField EQ 0>
<CFELSE>
<CFIF ISNUMERIC (FORM.firstWeighInFormField) AND ISNUMERIC (FORM.secondWeighInFormField) AND ISNUMERIC (FORM.numberOfObjectsFormField)>
<CFSET  cfVar = weighIn(FORM.firstWeighInFormField,FORM.secondWeighInFormField,FORM.numberOfObjectsFormField)>
</CFIF>
</CFIF>
</CFIF>

<DIV>

<DIV STYLE="position:absolute;width:98%;text-align:center;">

<TABLE BORDER="0" WIDTH="100%" CELLPADDING="0" CELLSPACING="0">
<TR VALIGN="top">
<TD ALIGN="center">

<DIV STYLE="position:relative;width:800px;">

<FORM ACTION="<CFOUTPUT>#cgi.SCRIPT_NAME#</CFOUTPUT>?submit=yes" METHOD="post">

<TABLE BORDER="0" WIDTH="800" CELLPADDING="10" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;border:1px solid #838383;" BGCOLOR="#C0C0C0" ALIGN="center"><FONT FACE="Arial"><B>Evaluates the weight of the lighter object, the heavier objects and the total weight of all objects</B></FONT></TD>
</TR>
<TR VALIGN="top">
<TD WIDTH="300" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Author</B></FONT></TD>
<TD WIDTH="500" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">Charles Robertson</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Function</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">weighIn</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Description</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">takes three parameters. First weigh-in, second weigh-in and number of objects being weighed. The function evaluates the weight of the one object, which is lighter than the other objects, the rest of which are the same weight. The function also evaluates the weight of the heavier objects and the total weight of all objects.</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Example</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><B>Problem</B><BR><I>8 balls. 7 balls weigh the same and 1 ball weighs less than the rest. You are allowed to weigh any number of balls twice. Find out the weight of a heavier ball and the weight of the lighter ball, and the total weight of all balls</I><BR><B>Answer</B><BR><I>weigh 7 balls, then weigh 7 balls again, but include the ball that was not part of the first weigh-in. Record both weigh-ins. The heavier weigh-in will not include the one lighter ball, which means that a heavier ball is equal to the heavier weigh-in divided by 7. The lighter ball's weight is equal to the lighter weigh-in subtracted from the heavier weigh-in. Total weight is equal to the heavier ball multiplied by 7, added to the weight of the lighter ball... </I></FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Date</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">15.05.09</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Comments</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">extensive use of formulas</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Language</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">CFScript</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Example:</B><BR><BR>
Please type in the number of objects to be weighed, the first weigh-in weight (integer) and finally the second weigh-in weight (integer).</FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2">
<TABLE WIDTH="90%" BORDER="0">
<TR VALIGN="top">
<TD WIDTH="150"><FONT FACE="Arial"><SPAN STYLE="padding-right:10px;">object amount</SPAN><INPUT ONFOCUS="document.getElementById('submitButton').disabled = false; document.getElementById('errorMessage').innerHTML = '';" TYPE="text" NAME="numberOfObjectsFormField" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:50px;padding-left:5px;"><BR><SPAN STYLE="padding-right:17px;">1st weigh-in</SPAN><INPUT ONFOCUS="document.getElementById('submitButton').disabled = false;document.getElementById('errorMessage').innerHTML = '';"  TYPE="text" NAME="firstWeighInFormField" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:50px;padding-left:5px;"><BR><SPAN STYLE="padding-right:14px;">2nd weigh-in</SPAN><INPUT ONFOCUS="document.getElementById('submitButton').disabled = false;document.getElementById('errorMessage').innerHTML = '';" TYPE="text" NAME="secondWeighInFormField" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:50px;padding-left:5px;"><BR><BR>
<INPUT TYPE="image" SRC="images/submit.png" ID="submitButton"></FONT></TD>
<TD>
<DIV ID="errorMessage" STYLE="color:#FF3300;font-family:Arial;font-size:12px;font-weight:normal;text-align:left;"></DIV>
</TD>
</TR>
</TABLE>
</TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFScript function called 'weighIn', on this page</B><BR><BR>Default value: <I>weighIn(11,12,8)</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><TABLE BORDER="0" WIDTH="400" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 1</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<CFLOOP FROM=1 TO="#ArrayLen(cfVar)#" INDEX="i">
<TR VALIGN="top">
<TD WIDTH="150" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#cfVar[i][1]#</CFOUTPUT></TD>
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#cfVar[i][2]#</CFOUTPUT></TD>
</TR>
</CFLOOP>
</TABLE></FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
</TABLE>

</FORM>

<!--- <A HREF='javascript:alert("Number of objects: " + numberOfObjectsFormFieldJS + " First weigh-in field: " + firstWeighInFormFieldJS + " Second weigh-in field: " + secondWeighInFormFieldJS + "\n heavierObjectWeightJS: " + heavierWeighInJS/(numberOfObjectsFormFieldJS-1) + "\n heavier weigh-in: " + heavierWeighInJS + "\n lighter weigh-in: " + lighterWeighInJS + "");'>javascript</A><BR> --->

<DIV STYLE="position:relative;width:784px;height:400px;border:1px solid #838383;overflow-y:auto;overflow-x:hidden;padding:8px;scrollbar-arrow-color:#3C3C3C;scrollbar-track-color:#BEBEBE;scrollbar-shadow-color:#FFFFFF;scrollbar-face-color:#BEBEBE;scrollbar-highlight-color:#FFFFFF;scrollbar-darkshadow-color:#BEBEBE;scrollbar-3dlight-color:#BEBEBE;text-align:left;font-family:Arial;font-size:12px;color:#3C3C3C;word-wrap:break-word;">

<B>CFScript code as a standalone function or encapsulated within a CFC</B><BR>

<CFSET openingCFScriptTag = HTMLCodeFormat("<CFSCRIPT>")>

<CFOUTPUT>#openingCFScriptTag#</CFOUTPUT>

<CFSAVECONTENT VARIABLE="CFScriptcode">
// CFScript function

function weighIn(afirstWeighIn,asecondWeighIn,anumberOfObjects){

// initialise variables

var firstWeighIn = afirstWeighIn;
var secondWeighIn = asecondWeighIn;
var numberOfObjects = anumberOfObjects;
var lighterWeighIn = 0;
var heavierWeighIn = 0;
var heavierObjectWeight = 0;
var lighterObjectWeight = 0;
var totalWeight = 0;
var results = ArrayNew(2);

if(firstWeighIn GT secondWeighIn){
heavierWeighIn = firstWeighIn;
lighterWeighIn = secondWeighIn;
}
else if(firstWeighIn LT secondWeighIn){
heavierWeighIn = secondWeighIn;
lighterWeighIn = firstWeighIn; 
}
else{
results[1][1] = "Please make sure that your tw0 weigh-ins differ in weight";
results[1][2] = "";
return results;
}

heavierObjectWeight = heavierWeighIn/(numberOfObjects-1);

if(lighterWeighIn LTE heavierObjectWeight*(numberOfObjects-2)){
results[1][1] = "The lighter weigh-in must be greater than the heavier object's weight mutiplied by two less than the total amount of objects, otherwise the lighter ball weighs nothing, in which case it doesn't exist";
results[1][2] = "";
return results;
}

lighterObjectWeight = (heavierObjectWeight*(numberOfObjects-1)) - lighterWeighIn;
totalWeight = lighterObjectWeight + (heavierObjectWeight*(numberOfObjects-1));

results[1][1] = "Heavier object weight";
results[1][2] = heavierObjectWeight;
results[2][1] = "Lighter object weight";
results[2][2] = lighterObjectWeight;
results[3][1] = "Total weight";
results[3][2] = totalWeight;

return results;
}
</CFSAVECONTENT>

<CFSET CFScriptcoreCode = HTMLCodeFormat(CFScriptcode)>

<CFOUTPUT>#CFScriptcoreCode#</CFOUTPUT>

<CFSET endCFScriptTag = HTMLCodeFormat("</CFSCRIPT>")>

<CFOUTPUT>#endCFScriptTag#</CFOUTPUT>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR><BR>

</DIV><BR><BR>

</DIV>

</TD>
</TR>
</TABLE>

</DIV>

</DIV>

</BODY>

</HTML>