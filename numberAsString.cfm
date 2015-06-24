
<CFPARAM NAME="FORM.numberFormField" DEFAULT="0">
<CFPARAM NAME="numberString" DEFAULT="">
<CFPARAM NAME="submit" DEFAULT="no">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<HTML>

<HEAD>

<TITLE>numberToString</TITLE>

</HEAD>

<BODY SCROLL="no">

<!--- Author: Charles Robertson
Function: numberToString
Description: converts an integer between 1 and 999,999,999 into it's english text equivalent
Date: 11.05.09
Comments: extensive use of recursion to speed up execution, and simplify code
Language: CFScript --->

<CFSCRIPT>

function numberToString(number){

//initialise variables

var thisNumber = number;
var numberAppend = "";
var haveValue = 0;
var tempString = "";
var million = 0;
var thousand = 0;
var hundred = 0;
var ten = 0;
var one = 0;
var point = 0;
var result = "";

// create array to hold english equivalents

if(NOT isdefined("request.aNumberToString")){
request.aNumberToString = ArrayNew(1);
ArrayResize(request.aNumberToString,106);
request.aNumberToString[1] = "One";
request.aNumberToString[2] = "Two";
request.aNumberToString[3] = "Three";
request.aNumberToString[4] = "Four";
request.aNumberToString[5] = "Five";
request.aNumberToString[6] = "Six";
request.aNumberToString[7] = "Seven";
request.aNumberToString[8] = "Eight";
request.aNumberToString[9] = "Nine";
request.aNumberToString[10] = "Ten";
request.aNumberToString[11] = "Eleven";
request.aNumberToString[12] = "Twelve";
request.aNumberToString[13] = "Thirteen";
request.aNumberToString[14] = "Fourteen";
request.aNumberToString[15] = "Fifteen";
request.aNumberToString[16] = "Sixteen";
request.aNumberToString[17] = "Seventeen";
request.aNumberToString[18] = "Eighteen";
request.aNumberToString[19] = "Nineteen";
request.aNumberToString[20] = "Twenty";
request.aNumberToString[30] = "Thirty";
request.aNumberToString[40] = "Forty";
request.aNumberToString[50] = "Fifty";
request.aNumberToString[60] = "Sixty";
request.aNumberToString[70] = "Seventy";
request.aNumberToString[80] = "Eighty";
request.aNumberToString[90] = "Ninety";
request.aNumberToString[100] = "Hundred";
request.aNumberToString[101] = "Thousand";
request.aNumberToString[102] = "Million";
request.aNumberToString[103] = "Zero";
request.aNumberToString[104] = "&";
request.aNumberToString[105] = "point";
request.aNumberToString[106] = " ";
}

if(thisNumber IS 0){return request.aNumberToString[103];}

million = thisNumber\1000000;

if(million){
thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(million)&request.aNumberToString[106]&request.aNumberToString[102];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

thousand = thisNumber\1000;

if(thousand){
thisNumber = thisNumber MOD 1000;
numberAppend = numberToString(thousand)&request.aNumberToString[106]&request.aNumberToString[101];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

hundred = thisNumber\100;

if(hundred){
thisNumber = thisNumber MOD 100;
numberAppend = numberToString(hundred)&request.aNumberToString[106]&request.aNumberToString[100];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

ten = thisNumber\10;

if(ten){
thisNumber = thisNumber MOD 10;
}

one = thisNumber\1;

if(one){
thisNumber = thisNumber MOD 1;
}

if(find(".",number)){
point = Val(ListLast(number,"."));
}

numberAppend = "";

if(ten IS 0){

if(one IS 0){

if(NOT haveValue){
numberAppend = request.aNumberToString[106];
}

}
else{
numberAppend = request.aNumberToString[one];
}

}
else if(ten IS 1){
numberAppend = request.aNumberToString[one+10];
}
else{
numberAppend = request.aNumberToString[ten*10];

if(one){
tempString = request.aNumberToString[one];
}

numberAppend = numberAppend&request.aNumberToString[106]&tempString;
}

// compile result and inesrt ampersands

if(Len(numberAppend)){
if(Len(result)){
result = result&request.aNumberToString[106]&request.aNumberToString[104]&request.aNumberToString[106];
}
result = result&numberAppend;
}

// deal with decimal point

if(point){
tempString = numberToString(point);
result = result&request.aNumberToString[106]&request.aNumberToString[105]&request.aNumberToString[106]&tempString;
}

return result;
}

</CFSCRIPT>

<CFSET numberAsStringInstance = createObject("component","numberAsString").init()>
<CFIF numberString IS "">
<CFSET  cfcVar = numberAsStringInstance.numberToString(145276.1)>
<CFSET  cfVar = numberToString(1256000)>
</CFIF>

<CFIF submit IS "yes">
<CFIF FORM.numberFormField EQ 0 OR FORM.numberFormField IS "" OR FORM.numberFormField GT 999999999>
<CFLOCATION URL="#cgi.SCRIPT_NAME###formPosition">
<CFELSE>
<CFSET numberString = numberToString(FORM.numberFormField)>
<CFSET  cfcVar = numberAsStringInstance.numberToString(FORM.numberFormField)>
<CFSET  cfVar = numberToString(FORM.numberFormField)>
<CFLOCATION URL="#cgi.SCRIPT_NAME#?numberString=#URLEncodedFormat(numberString)#&cfcVar=#URLEncodedFormat(cfcVar)#&cfVar=#URLEncodedFormat(cfVar)###formPosition">
</CFIF>
</CFIF>

<DIV>

<DIV STYLE="position:absolute;width:98%;text-align:center;">

<TABLE BORDER="0" WIDTH="100%" CELLPADDING="0" CELLSPACING="0">
<TR VALIGN="top">
<TD ALIGN="center">

<DIV STYLE="position:relative;width:800px;">

<TABLE BORDER="0" WIDTH="800" CELLPADDING="10" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;border:1px solid #838383;" BGCOLOR="#C0C0C0" ALIGN="center"><FONT FACE="Arial"><B>Formatting a number as a string</B></FONT></TD>
</TR>
<TR VALIGN="top">
<TD WIDTH="300" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Author</B></FONT></TD>
<TD WIDTH="500" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">Charles Robertson</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Function</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">numberToString</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Description</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">converts an integer between 1 and 999,999,999 into it's english text equivalent</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Date</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">11.05.09</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Comments</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">extensive use of recursion to speed up execution, and simplify code</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Language</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">CFScript</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFScript function called 'numberToString', on this page</B><BR><BR>Default value: <I>1256000</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><CFOUTPUT>#cfVar#</CFOUTPUT></FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFC function called 'numberToString', written mainly in CFScript, and encapsulated within 'numberAsString.cfc'</B><BR><BR>Default value: <I>145276.1</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><CFOUTPUT>#cfcVar#</CFOUTPUT></FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#990000;font-family:Arial;font-size:11px;font-weight:normal;border:1px solid #838383;text-align:left;"><FONT FACE="Arial">Please scroll to the bottom of the text box below to use this example</FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
</TABLE>

<DIV STYLE="position:relative;width:784px;height:400px;border:1px solid #838383;overflow-y:auto;overflow-x:hidden;padding:8px;scrollbar-arrow-color:#3C3C3C;scrollbar-track-color:#BEBEBE;scrollbar-shadow-color:#FFFFFF;scrollbar-face-color:#BEBEBE;scrollbar-highlight-color:#FFFFFF;scrollbar-darkshadow-color:#BEBEBE;scrollbar-3dlight-color:#BEBEBE;text-align:left;font-family:Arial;font-size:12px;color:#3C3C3C;word-wrap:break-word;">

<B>CFScript function code</B><BR>

<CFSET openingCFScriptTag = HTMLCodeFormat("<CFSCRIPT>")>

<CFOUTPUT>#openingCFScriptTag#</CFOUTPUT>

<CFSAVECONTENT VARIABLE="CFScriptcode">
// CFScript function

function numberToString(number){

//initialise variables

var thisNumber = number;
var numberAppend = "";
var haveValue = 0;
var tempString = "";
var million = 0;
var thousand = 0;
var hundred = 0;
var ten = 0;
var one = 0;
var point = 0;
var result = "";

// create array to hold english equivalents

if(NOT isdefined("request.aNumberToString")){
request.aNumberToString = ArrayNew(1);
ArrayResize(request.aNumberToString,106);
request.aNumberToString[1] = "One";
request.aNumberToString[2] = "Two";
request.aNumberToString[3] = "Three";
request.aNumberToString[4] = "Four";
request.aNumberToString[5] = "Five";
request.aNumberToString[6] = "Six";
request.aNumberToString[7] = "Seven";
request.aNumberToString[8] = "Eight";
request.aNumberToString[9] = "Nine";
request.aNumberToString[10] = "Ten";
request.aNumberToString[11] = "Eleven";
request.aNumberToString[12] = "Twelve";
request.aNumberToString[13] = "Thirteen";
request.aNumberToString[14] = "Fourteen";
request.aNumberToString[15] = "Fifteen";
request.aNumberToString[16] = "Sixteen";
request.aNumberToString[17] = "Seventeen";
request.aNumberToString[18] = "Eighteen";
request.aNumberToString[19] = "Nineteen";
request.aNumberToString[20] = "Twenty";
request.aNumberToString[30] = "Thirty";
request.aNumberToString[40] = "Forty";
request.aNumberToString[50] = "Fifty";
request.aNumberToString[60] = "Sixty";
request.aNumberToString[70] = "Seventy";
request.aNumberToString[80] = "Eighty";
request.aNumberToString[90] = "Ninety";
request.aNumberToString[100] = "Hundred";
request.aNumberToString[101] = "Thousand";
request.aNumberToString[102] = "Million";
request.aNumberToString[103] = "Zero";
request.aNumberToString[104] = "&";
request.aNumberToString[105] = "point";
request.aNumberToString[106] = " ";
}

if(thisNumber IS 0){return request.aNumberToString[103];}

million = thisNumber\1000000;

if(million){
thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(million)&request.aNumberToString[106]&request.aNumberToString[102];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

thousand = thisNumber\1000;

if(thousand){
thisNumber = thisNumber MOD 1000;
numberAppend = numberToString(thousand)&request.aNumberToString[106]&request.aNumberToString[101];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

hundred = thisNumber\100;

if(hundred){
thisNumber = thisNumber MOD 100;
numberAppend = numberToString(hundred)&request.aNumberToString[106]&request.aNumberToString[100];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

ten = thisNumber\10;

if(ten){
thisNumber = thisNumber MOD 10;
}

one = thisNumber\1;

if(one){
thisNumber = thisNumber MOD 1;
}

if(find(".",number)){
point = Val(ListLast(number,"."));
}

numberAppend = "";

if(ten IS 0){

if(one IS 0){

if(NOT haveValue){
numberAppend =  request.aNumberToString[106];
}

}
else{
numberAppend =  request.aNumberToString[one];
}

}
else if(ten IS 1){
numberAppend =  request.aNumberToString[one+10];
}
else{
numberAppend =  request.aNumberToString[ten*10];

if(one){
tempString = request.aNumberToString[one];
}

numberAppend = numberAppend&request.aNumberToString[106]&tempString;
}

// compile result and inesrt ampersands

if(Len(numberAppend)){
if(Len(result)){
result = result&request.aNumberToString[106]&request.aNumberToString[104]&request.aNumberToString[106];
}
result = result&numberAppend;
}

// deal with decimal point

if(point){
tempString = numberToString(point);
result = result&request.aNumberToString[106]&request.aNumberToString[105]&request.aNumberToString[106]&tempString;
}

return result;
}
</CFSAVECONTENT>

<CFSET CFScriptcoreCode = HTMLCodeFormat(CFScriptcode)>

<CFOUTPUT>#CFScriptcoreCode#</CFOUTPUT>

<CFSET endCFScriptTag = HTMLCodeFormat("</CFSCRIPT>")>

<CFOUTPUT>#endCFScriptTag#</CFOUTPUT>

<CFSET initCFScriptTag = HTMLCodeFormat("<CFOUTPUT>##numberToString(1256000)##</CFOUTPUT>")>

<CFOUTPUT>#initCFScriptTag#</CFOUTPUT>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR>

<B>CFC code</B><BR>

<CFSET startCFCScriptcode = HTMLCodeFormat('<CFCOMPONENT DISPLAYNAME = "numberAsString" HINT="converts an integer to its english equivalent">

<CFFUNCTION NAME="init" RETURNTYPE="numberAsString" OUTPUT="false" ACCESS="public">
<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="numberToString" RETURNTYPE="string" OUTPUT="true" ACCESS="public">
<CFARGUMENT NAME="inputNumber" TYPE="numeric" REQUIRED="yes">')>

<CFOUTPUT>#startCFCScriptcode#</CFOUTPUT>

<CFSET openingCFCScriptTag = HTMLCodeFormat("<CFSCRIPT>")>

<CFOUTPUT>#openingCFCScriptTag#</CFOUTPUT>

<CFSAVECONTENT VARIABLE="CFCScriptcode">
// CFC

//initialise variables

var number = ARGUMENTS.inputNumber;
var thisNumber = number;
var numberAppend = "";
var haveValue = 0;
var tempString = "";
var million = 0;
var thousand = 0;
var hundred = 0;
var ten = 0;
var one = 0;
var point = 0;
var result = "";

// create array to hold english equivalents

if(NOT isdefined("request.aNumberToString")){
request.aNumberToString = ArrayNew(1);
ArrayResize(request.aNumberToString,106);
request.aNumberToString[1] = "One";
request.aNumberToString[2] = "Two";
request.aNumberToString[3] = "Three";
request.aNumberToString[4] = "Four";
request.aNumberToString[5] = "Five";
request.aNumberToString[6] = "Six";
request.aNumberToString[7] = "Seven";
request.aNumberToString[8] = "Eight";
request.aNumberToString[9] = "Nine";
request.aNumberToString[10] = "Ten";
request.aNumberToString[11] = "Eleven";
request.aNumberToString[12] = "Twelve";
request.aNumberToString[13] = "Thirteen";
request.aNumberToString[14] = "Fourteen";
request.aNumberToString[15] = "Fifteen";
request.aNumberToString[16] = "Sixteen";
request.aNumberToString[17] = "Seventeen";
request.aNumberToString[18] = "Eighteen";
request.aNumberToString[19] = "Nineteen";
request.aNumberToString[20] = "Twenty";
request.aNumberToString[30] = "Thirty";
request.aNumberToString[40] = "Forty";
request.aNumberToString[50] = "Fifty";
request.aNumberToString[60] = "Sixty";
request.aNumberToString[70] = "Seventy";
request.aNumberToString[80] = "Eighty";
request.aNumberToString[90] = "Ninety";
request.aNumberToString[100] = "Hundred";
request.aNumberToString[101] = "Thousand";
request.aNumberToString[102] = "Million";
request.aNumberToString[103] = "Zero";
request.aNumberToString[104] = "&";
request.aNumberToString[105] = "point";
request.aNumberToString[106] = " ";
}

if(thisNumber IS 0){return request.aNumberToString[103];}

million = thisNumber\1000000;

if(million){
thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(million)&request.aNumberToString[106]&request.aNumberToString[102];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

thousand = thisNumber\1000;

if(thousand){
thisNumber = thisNumber MOD 1000;
numberAppend = numberToString(thousand)&request.aNumberToString[106]&request.aNumberToString[101];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

hundred = thisNumber\100;

if(hundred){
thisNumber = thisNumber MOD 100;
numberAppend = numberToString(hundred)&request.aNumberToString[106]&request.aNumberToString[100];
if(Len(result)){
result = result&request.aNumberToString[106];
}
result = result&numberAppend;
numberAppend = "";
haveValue = 1;
}

ten = thisNumber\10;

if(ten){
thisNumber = thisNumber MOD 10;
}

one = thisNumber\1;

if(one){
thisNumber = thisNumber MOD 1;
}

if(find(".",number)){
point = Val(ListLast(number,"."));
}

numberAppend = "";

if(ten IS 0){

if(one IS 0){

if(NOT haveValue){
numberAppend =  request.aNumberToString[106];
}

}
else{
numberAppend =  request.aNumberToString[one];
}

}
else if(ten IS 1){
numberAppend =  request.aNumberToString[one+10];
}
else{
numberAppend =  request.aNumberToString[ten*10];

if(one){
tempString = request.aNumberToString[one];
}

numberAppend = numberAppend&request.aNumberToString[106]&tempString;
}

// compile result and inesrt ampersands

if(Len(numberAppend)){
if(Len(result)){
result = result&request.aNumberToString[106]&request.aNumberToString[104]&request.aNumberToString[106];
}
result = result&numberAppend;
}

// deal with decimal point

if(point){
tempString = numberToString(point);
result = result&request.aNumberToString[106]&request.aNumberToString[105]&request.aNumberToString[106]&tempString;
}

</CFSAVECONTENT>

<CFSET CFCScriptcoreCode = HTMLCodeFormat(CFCScriptcode)>

<CFOUTPUT>#CFCScriptcoreCode#</CFOUTPUT>

<CFSET endCFCScriptTag = HTMLCodeFormat("</CFSCRIPT>")>

<CFOUTPUT>#endCFCScriptTag#</CFOUTPUT>

<CFSET initCFCScriptTag = HTMLCodeFormat('<CFRETURN result>
</CFFUNCTION>

</CFCOMPONENT>

------------------------------------------------------------------------------------------------------------

<B>Instantiate the CFC</B><BR>

<CFSET numberAsStringInstance = createObject("component","numberAsString").init()>

<CFSET  cfcVar = numberAsStringInstance.numberToString(145276.1)>')>

<CFOUTPUT>#initCFCScriptTag#</CFOUTPUT>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<BR><BR>

<DIV STYLE="position:relative;height:100px;">

<FORM ACTION="<CFOUTPUT>#cgi.SCRIPT_NAME#</CFOUTPUT>?submit=yes" METHOD="post">

<A NAME="formPosition"></A>

<TABLE BORDER="0" WIDTH="100%" CELLPADDING="10" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;border:1px solid #838383;" BGCOLOR="#C0C0C0" ALIGN="center"><FONT FACE="Arial"><B>Example</B></FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#838383;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E4E4E4">
<FONT FACE="Arial">Please type a number between 1 and 999,999,999 into the text field below:</FONT>
</TD>
</TR>
<TR VALIGN="middle">
<TD STYLE="color:#838383;font-family:Arial;font-size:11px;font-weight:normal;border:1px solid #838383;text-align:left;"><INPUT TYPE="text" NAME="numberFormField" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:100px;padding-left:5px;"></TD><TD WIDTH="700" STYLE="color:#838383;font-family:Arial;font-size:11px;font-weight:normal;border:1px solid #838383;text-align:left;">
<INPUT TYPE="image" SRC="images/submit.gif" HSPACE="10"></TD>
</TR>
<CFIF numberString IS "">
<CFELSE>
<TR VALIGN="middle">
<TD STYLE="color:#838383;font-family:Arial;font-size:11px;font-weight:normal;border:1px solid #838383;text-align:left;" BGCOLOR="#FFD2D2">
<FONT FACE="Arial"><B>Result</B></FONT></TD><TD STYLE="color:#838383;font-family:Arial;font-size:11px;font-weight:normal;border:1px solid #838383;text-align:left;"> <FONT FACE="Arial"><I><CFOUTPUT>#URLDecode(numberString)#</CFOUTPUT></I></FONT>
</TD>
</TR>
</CFIF>
</TABLE><BR><BR>

</FORM>

</DIV>

</DIV>

</DIV>

</TD>
</TR>
</TABLE>

</DIV>

</DIV>

</BODY>

</HTML>