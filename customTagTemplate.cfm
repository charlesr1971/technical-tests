<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<CFMODULE TEMPLATE="customTag.cfm" FUNCTIONLIBRARY="numberSequencer" ARGN="1" ARGM="1" ARGEND="50" SEQUENCE="thisResult">

<CFLOOP INDEX="i" FROM="1" TO="#ArrayLen(thisResult)#">
<CFOUTPUT><SPAN STYLE="color:000000;font-family:Arial;font-size:12px;font-weight:normal;">#thisResult[i]#</SPAN><BR></CFOUTPUT>
</CFLOOP><BR><BR>

</body>
</html>
