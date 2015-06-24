
<CFPARAM NAME="FORM.textFormField" DEFAULT="0">
<CFPARAM NAME="textString" DEFAULT="">
<CFPARAM NAME="submit" DEFAULT="no">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<HTML>

<HEAD>

<TITLE>wordCount</TITLE>

</HEAD>

<BODY>

<!--- Author: Charles Robertson
Function: wordCount
Description: takes a text string as the only argument and converts it into a two dimensional array of unique words & their respective value count
Date: 13.05.09
Comments: extensive use of list to array converion
Language: CFScript --->

<CFSCRIPT>

function wordCount(inputString){

//initialise variables

var thisString = Trim(LCase(ARGUMENTS.inputString));

// add to discount list, if more rules required; characters that act as regular expression operators, need to be escaped like '.' -> '\.'

var discountList = ';/\,/--/-/\./:/\"/=/%/£/!/@/~';

var tempString = "";
var valueCountList = "";

var discountArr = ArrayNew(1);
var thisStringArr = ArrayNew(1);
var tempStringArr = ArrayNew(1);
var valueCountArr = ArrayNew(1);
var stringValueCountValueArr = ArrayNew(1);

discountArr = ListToArray(discountList,"/");

for(i = 1;i lte Arraylen(discountArr);i=i+1){
thisString = REReplaceNoCase(thisString,discountArr[i]," ","ALL");
}

thisString = REReplaceNoCase(thisString," ",",","ALL");
thisString = REReplaceNoCase(thisString,"[,]+",",","ALL");
thisStringArr = ListToArray(thisString);

for(i = 1;i lte ArrayLen(thisStringArr);i=i+1){
if(ListFind(tempString,thisStringArr[i]) EQ 0){
valueCountList = ListAppend(valueCountList,ListValueCount(thisString,thisStringArr[i]));
tempString = ListAppend(tempString,thisStringArr[i]); 
}
}

tempStringArr = ListToArray(tempString);
valueCountArr = ListToArray(valueCountList);
stringValueCountValueArr = ArrayNew(2);

// two dimensional array

for(i = 1;i lte Arraylen(tempStringArr);i=i+1){
stringValueCountValueArr[i][1] = tempStringArr[i];
stringValueCountValueArr[i][2] = valueCountArr[i];
}

return stringValueCountValueArr;

}

</CFSCRIPT>

<CFSET wordAndCountInstance = createObject("component","wordAndCount").init()>

<CFIF textString IS "">
<CFSET  cfcVar = wordAndCountInstance.wordCount("The Sandman's coming in his train of cars. With moonbeam windows and with wheels of stars. So hush you little ones and have no fear. The man-in-the-moon he is the engineer.")>
<CFSET  cfVar = wordCount('The old lady pulled her spectacles down and looked over them about the room; then she put them up and looked out under them. She seldom or never looked THROUGH them for so small a thing as a boy; they were her state pair, the pride of her heart, and were built for "style," not service -- she could have seen through a pair of stove-lids just as well.')>
</CFIF>

<CFIF submit IS "yes">
<CFIF FORM.textFormField IS "">
<!--- <CFLOCATION URL="#cgi.SCRIPT_NAME###formPosition"> --->
<CFELSE>
<CFIF REFind('[A-Za-z]',textFormField)>
<CFIF REFind('[\+\*\?\[\]\^\$\(\)\{\}\|\\\/##]',textFormField) EQ 0>
<CFSET textString = wordCount(FORM.textFormField)>
<CFSET  cfcVar = wordAndCountInstance.wordCount(FORM.textFormField)>
<CFSET  cfVar = wordCount(FORM.textFormField)>
<!--- <CFLOCATION URL="#cgi.SCRIPT_NAME#?numberString=#URLEncodedFormat(numberString)#&cfcVar=#URLEncodedFormat(cfcVar)#&cfVar=#URLEncodedFormat(cfVar)###formPosition"> --->
</CFIF>
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
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;border:1px solid #838383;" BGCOLOR="#C0C0C0" ALIGN="center"><FONT FACE="Arial"><B>Converts a string into constituent unique word and value count pairs</B></FONT></TD>
</TR>
<TR VALIGN="top">
<TD WIDTH="300" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Author</B></FONT></TD>
<TD WIDTH="500" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">Charles Robertson</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Function</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">wordCount</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Description</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">takes a text string as the only argument and converts it into a two dimensional array of unique words & their respective value count</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Date</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">13.05.09</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Comments</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">extensive use of list to array converion</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Language</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">CFScript</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Example:</B><BR><BR>
Please type in a string.<BR>Screened characters: <I>; , - -- . " : = % £ ! @ ~</I><BR>Illegal characters: <I>+ * ? [ ] ^ $ ( ) { } | \ / #</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><INPUT TYPE="text" NAME="textFormField" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:350px;padding-left:5px;"><BR><BR>
<INPUT TYPE="image" SRC="images/submit.png"></FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFScript function called 'wordCount', on this page</B><BR><BR>Default value: <I>'The old lady pulled her spectacles down and looked over them about the room; then she put them up and looked out under them. She seldom or never looked THROUGH them for so small a thing as a boy; they were her state pair, the pride of her heart, and were built for "style," not service -- she could have seen through a pair of stove-lids just as well.'</I></FONT></TD>
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
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFC function called 'wordCount', written mainly in CFScript, and encapsulated within 'wordAndCount.cfc'</B><BR><BR>Default value: <I>'The Sandman's coming in his train of cars. With moonbeam windows and with wheels of stars. So hush you little ones and have no fear. The man-in-the-moon he is the engineer.'</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><TABLE BORDER="0" WIDTH="400" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 1</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<CFLOOP FROM=1 TO="#ArrayLen(cfcVar)#" INDEX="i">
<TR VALIGN="top">
<TD WIDTH="150" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#cfcVar[i][1]#</CFOUTPUT></TD>
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#cfcVar[i][2]#</CFOUTPUT></TD>
</TR>
</CFLOOP>
</TABLE></FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
</TABLE>

</FORM>

<DIV STYLE="position:relative;width:784px;height:400px;border:1px solid #838383;overflow-y:auto;overflow-x:hidden;padding:8px;scrollbar-arrow-color:#3C3C3C;scrollbar-track-color:#BEBEBE;scrollbar-shadow-color:#FFFFFF;scrollbar-face-color:#BEBEBE;scrollbar-highlight-color:#FFFFFF;scrollbar-darkshadow-color:#BEBEBE;scrollbar-3dlight-color:#BEBEBE;text-align:left;font-family:Arial;font-size:12px;color:#3C3C3C;word-wrap:break-word;">

<B>CFScript code as a standalone function or encapsulated within a CFC</B><BR>

<CFSET openingCFScriptTag = HTMLCodeFormat("<CFSCRIPT>")>

<CFOUTPUT>#openingCFScriptTag#</CFOUTPUT>

<CFSAVECONTENT VARIABLE="CFScriptcode">
function wordCount(inputString){

//initialise variables

var thisString = Trim(LCase(ARGUMENTS.inputString));

// add to discount list, if more rules required; characters that act as regular expression operators, need to be escaped like '.' -> '\.'

var discountList = ';/\,/--/-/\./:/\"/=/%/£/!/@/~';

var tempString = "";
var valueCountList = "";

var discountArr = ArrayNew(1);
var thisStringArr = ArrayNew(1);
var tempStringArr = ArrayNew(1);
var valueCountArr = ArrayNew(1);
var stringValueCountValueArr = ArrayNew(1);

discountArr = ListToArray(discountList,"/");

for(i = 1;i lte Arraylen(discountArr);i=i+1){
thisString = REReplaceNoCase(thisString,discountArr[i]," ","ALL");
}

thisString = REReplaceNoCase(thisString," ",",","ALL");
thisString = REReplaceNoCase(thisString,"[,]+",",","ALL");
thisStringArr = ListToArray(thisString);

for(i = 1;i lte ArrayLen(thisStringArr);i=i+1){
if(ListFind(tempString,thisStringArr[i]) EQ 0){
valueCountList = ListAppend(valueCountList,ListValueCount(thisString,thisStringArr[i]));
tempString = ListAppend(tempString,thisStringArr[i]); 
}
}

tempStringArr = ListToArray(tempString);
valueCountArr = ListToArray(valueCountList);
stringValueCountValueArr = ArrayNew(2);

// two dimensional array

for(i = 1;i lte Arraylen(tempStringArr);i=i+1){
stringValueCountValueArr[i][1] = tempStringArr[i];
stringValueCountValueArr[i][2] = valueCountArr[i];
}

return stringValueCountValueArr;

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