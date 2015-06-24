
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<HTML>

<HEAD>

<TITLE>numberSequencer</TITLE>

</HEAD>

<BODY>

<!--- Author: Charles Robertson
Function: numberSequencer
Description: takes 3 arguments with integer values and converts them into a Fibonacci number sequence
Date: 03.02.10
Comments: 
Language: CFScript --->

<CFFUNCTION NAME="numberSequencer" RETURNTYPE="string" OUTPUT="true" ACCESS="public" HINT="function that creates a factorial number sequence">
<CFARGUMENT NAME="n" TYPE="numeric" REQUIRED="yes" HINT="first seed value" />
<CFARGUMENT NAME="m" TYPE="numeric" REQUIRED="yes" HINT="second seed value" />
<CFARGUMENT NAME="end" TYPE="numeric" REQUIRED="yes" HINT="end value" />

<CFSCRIPT>

//initialise variables

var sequence = ArrayNew(1);
var sequenceList = "";
var i = 0;

sequence[1] = ARGUMENTS.n;
sequence[2] = ARGUMENTS.m;

for(i = 3;i lte ARGUMENTS.end;i=i+1){
sequence[i] = sequence[i-1] + sequence[i-2];
if(sequence[i] EQ ARGUMENTS.end){
break;
}
else if(sequence[i] GT ARGUMENTS.end){
ArrayDeleteAt(sequence,i);
break;
}
}

sequenceList = ArrayToList(sequence);

return sequenceList;

</CFSCRIPT>

</CFFUNCTION>

<CFIF ISDEFINED('FORM.end')>
<CFIF ISNUMERIC(FORM.end)>
<CFIF FORM.end GT 1>
<CFSET cfVar = numberSequencer(1,1,FORM.end)>
<CFELSE>
<CFSET cfVar = numberSequencer(1,1,21)>
</CFIF>
<CFELSE>
<CFSET cfVar = numberSequencer(1,1,21)>
</CFIF>
<CFELSE>
<CFSET cfVar = numberSequencer(1,1,21)>
</CFIF>

<DIV>

<DIV STYLE="position:absolute;width:98%;text-align:center;">

<TABLE BORDER="0" WIDTH="100%" CELLPADDING="0" CELLSPACING="0">
<TR VALIGN="top">
<TD ALIGN="center">

<DIV STYLE="position:relative;width:800px;">

<FORM ACTION="#cgi.SCRIPT_NAME#" METHOD="post">

<TABLE BORDER="0" WIDTH="800" CELLPADDING="10" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;border:1px solid #838383;" BGCOLOR="#C0C0C0" ALIGN="center"><FONT FACE="Arial"><B>Fibonacci number sequencer</B></FONT></TD>
</TR>
<TR VALIGN="top">
<TD WIDTH="300" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Author</B></FONT></TD>
<TD WIDTH="500" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">Charles Robertson</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Function</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">numberSequencer</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Description</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">takes 3 arguments with integer values and converts them into a Fibonacci number sequence</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Date</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">03.02.10</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Comments</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"></FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Language</B></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">CFScript</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFB66C"><FONT FACE="Arial"><B>Example:</B><BR><BR>
Please type in an integer, greater than one<BR><I>if you type in an integer less than two, or a non-integer value, then the result will default to the example below (an 'end' value of 21)</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial">

<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
<TR VALIGN="top">
<TD><FONT FACE="Arial"><B>n:</B></FONT></TD>
<TD><FONT FACE="Arial">1</FONT></TD>
</TR>
<TR VALIGN="top">
<TD><FONT FACE="Arial"><B>m:</B></FONT></TD>
<TD><FONT FACE="Arial">1</FONT></TD>
</TR>
<TR VALIGN="top">
<TD><FONT FACE="Arial"><B>end:</B></FONT></TD>
<TD><INPUT TYPE="text" NAME="end" STYLE="border-right:dimgray 1px solid;border-top:dimgray 1px solid;font-size: 10pt;border-left:dimgray 1px solid;border-bottom:dimgray 1px solid;font-family:Arial,Helvetica;background-color:transparent;background:#FFF url('images/textfield_bck.gif') repeat-x;width:50px;padding-left:5px;" VALUE="21"></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2"><INPUT TYPE="image" SRC="images/submit.png"></TD>
</TR>
</TABLE>


</FONT></TD>
</TR>
<TR VALIGN="top">
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#FFCECE"><FONT FACE="Arial"><B>Output from a CFScript function called 'numberSequencer', on this page, where 'n' and 'm' are the two seed values i.e. in this example about n=1 and m=1, and 'end' is the value to stop at, or before </B><BR><BR>Default 'end' value: <I>21</I></FONT></TD>
<TD STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;text-align:left;" BGCOLOR="#E2E2E2"><FONT FACE="Arial"><TABLE BORDER="0" WIDTH="400" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 1</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<TR VALIGN="top">
<TD WIDTH="150" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#cfVar#</CFOUTPUT></TD>
<TD WIDTH="50">&nbsp;</TD>
</TR>
</TABLE></FONT></TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
</TABLE>

</FORM>

<DIV STYLE="position:relative;width:784px;height:400px;border:1px solid #838383;overflow-y:auto;overflow-x:hidden;padding:8px;scrollbar-arrow-color:#3C3C3C;scrollbar-track-color:#BEBEBE;scrollbar-shadow-color:#FFFFFF;scrollbar-face-color:#BEBEBE;scrollbar-highlight-color:#FFFFFF;scrollbar-darkshadow-color:#BEBEBE;scrollbar-3dlight-color:#BEBEBE;text-align:left;font-family:Arial;font-size:12px;color:#3C3C3C;word-wrap:break-word;">

<B>CFScript code as a standalone function</B><BR>

<CFSET CFFunctionheadcoreCode = HTMLCodeFormat('<CFFUNCTION NAME="numberSequencer" RETURNTYPE="string" OUTPUT="true" ACCESS="public" HINT="function that creates a factorial number sequence">
<CFARGUMENT NAME="n" TYPE="numeric" REQUIRED="yes" HINT="first seed value" />
<CFARGUMENT NAME="m" TYPE="numeric" REQUIRED="yes" HINT="second seed value" />
<CFARGUMENT NAME="end" TYPE="numeric" REQUIRED="yes" HINT="end value" />')>

<CFOUTPUT>#CFFunctionheadcoreCode#</CFOUTPUT>

<CFSET openingCFScriptTag = HTMLCodeFormat("<CFSCRIPT>")>

<CFOUTPUT>#openingCFScriptTag#</CFOUTPUT>

<CFSAVECONTENT VARIABLE="CFScriptcode">
//initialise variables

var sequence = ArrayNew(1);
var sequenceList = "";
var i = 0;

sequence[1] = ARGUMENTS.n;
sequence[2] = ARGUMENTS.m;

for(i = 3;i lte ARGUMENTS.end;i=i+1){
sequence[i] = sequence[i-1] + sequence[i-2];
if(sequence[i] EQ ARGUMENTS.end){
break;
}
else if(sequence[i] GT ARGUMENTS.end){
ArrayDeleteAt(sequence,i);
break;
}
}

sequenceList = ArrayToList(sequence);

return sequenceList;
</CFSAVECONTENT>

<CFSET CFScriptcoreCode = HTMLCodeFormat(CFScriptcode)>

<CFOUTPUT>#CFScriptcoreCode#</CFOUTPUT>

<CFSET endCFScriptTag = HTMLCodeFormat("</CFSCRIPT>")>

<CFOUTPUT>#endCFScriptTag#</CFOUTPUT>

<CFSET CFFunctionfootcoreCode = HTMLCodeFormat('
</CFFUNCTION>')>

<CFOUTPUT>#CFFunctionfootcoreCode#</CFOUTPUT>

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