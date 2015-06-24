<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>

<TITLE>Technical test for 2ndByte</TITLE>

<!---
Candidate: Charles Robertson
Date: 16/01/2009 
--->
	
</HEAD>

<BODY>

<!--- Question 1 --->

<CFSET text = 'The old lady pulled her spectacles down and looked over them about the room; then she put them up and looked out under them. She seldom or never looked THROUGH them for so small a thing as a boy; they were her state pair, the pride of her heart, and were built for "style," not service -- she could have seen through a pair of stove-lids just as well.'>

<CFSET textList = "">
<CFSET textList = LCase(text)>

<CFSET discountList = ';/,/--/-/./"'>

<CFLOOP LIST="#discountList#" DELIMITERS="/" INDEX="d">
<CFSET textList = ReplaceNoCase(textList,d," ","ALL")>
</CFLOOP>

<CFSET textList = ReplaceNoCase(textList," ",",","ALL")>
<CFSET textList = REReplaceNoCase(textList, "[,]+", ",", "ALL")>

<CFSET textTemp = "">
<CFSET textTemp = textList>
<CFSET textTemp = Insert(",",textTemp,0)>

<CFLOOP LIST="#textList#" INDEX="t">
<CFSET textTemp = ReplaceNocase(textTemp,",#t#,",",","ALL")>
<CFSET textTemp = Insert(",#t#,",textTemp,0)>
</CFLOOP>

<CFSET textTemp = REReplaceNoCase(texttemp, "[,]+", ",", "ALL")>
<CFSET textTemp = RemoveChars(textTemp,1,1)>
<CFSET textTemp = RemoveChars(textTemp,Len(textTemp),1)>

<CFSET reverseList = "">

<CFSET countList  = 0>

<CFLOOP INDEX="tt" FROM="1" TO="#ListLen(textTemp)#">
<CFSET reverseList = ListAppend(reverseList,ListGetAt(textTemp,ListLen(textTemp)-countList))>
<CFSET countList  = countList + 1>
</CFLOOP>

<CFSET wordCountList = "">

<CFLOOP LIST="#reverseList#" INDEX="tt">
<CFSET valueCount = ListValueCount(textList,tt,",")>
<CFSET wordCountList = ListAppend(wordCountList,valueCount)>
</CFLOOP>

<CFSET counter = 1>

<TABLE BORDER="0" WIDTH="200" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 1</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<CFLOOP LIST="#reverseList#" INDEX="w">
<TR VALIGN="top">
<TD WIDTH="150" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#w#</CFOUTPUT></TD>
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#ListGetAt(wordCountList,counter)#</CFOUTPUT></TD>
<CFSET counter = counter + 1>
</TR>
</CFLOOP>
</TABLE><BR><BR>







<!--- Question 2 --->

<CFSCRIPT>

request.nmbArray = ArrayNew(1);

for(o = 1;o lte 50;o=o+1){
request.nmbArray[o] = o;
}

function nmToSt(nmb)
{
var r = ""; 
var s1 = "";
var s2 = "";
var n = nmb;
var hvl = 0;
var pt = 0;
var ons = 0;
var tns = 0;
var hd = 0;
var td = 0;
var ml = 0;

if (NOT IsDefined("request.nmToS1"))
{
request.nmToS1 = StructNew();
request.nmToS1.ws = " ";
request.nmToS1.a = "&";
request.nmToS1.pt = "pt";
request.nmToS1.n0 = "Zero";
request.nmToS1.n1 = "One";
request.nmToS1.n2 = "Two";
request.nmToS1.n3 = "Three";
request.nmToS1.n4 = "Four";
request.nmToS1.n5 = "Five";
request.nmToS1.n6 = "Six";
request.nmToS1.n7 = "Seven";
request.nmToS1.n8 = "Eight";
request.nmToS1.n9 = "Nine";
request.nmToS1.n10 = "Ten";
request.nmToS1.n11 = "Eleven";
request.nmToS1.n12 = "Twelve";
request.nmToS1.n13 = "Thirteen";
request.nmToS1.n14 = "Fourteen";
request.nmToS1.n15 = "Fifteen";
request.nmToS1.n16 = "Sixteen";
request.nmToS1.n17 = "Seventeen";
request.nmToS1.n18 = "Eighteen";
request.nmToS1.n19 = "Nineteen";
request.nmToS1.n20 = "Twenty";
request.nmToS1.n30 = "Thirty";
request.nmToS1.n40 = "Forty";
request.nmToS1.n50 = "Fifty";
request.nmToS1.n60 = "Sixty";
request.nmToS1.n70 = "Seventy";
request.nmToS1.n80 = "Eighty";
request.nmToS1.n90 = "Ninety";
request.nmToS1.n100 = "Hundred";
request.nmToS1.nK = "Thousand";
request.nmToS1.nM = "Million";
}

if (NOT IsDefined("request.nmToS2"))
{
request.nmToS2 = ArrayNew(1);
ArrayResize(request.nmToS2, 91);
request.nmToS2[1] = request.nmToS1.n0;
request.nmToS2[2] = request.nmToS1.n1;
request.nmToS2[3] = request.nmToS1.n2;
request.nmToS2[4] = request.nmToS1.n3;
request.nmToS2[5] = request.nmToS1.n4;
request.nmToS2[6] = request.nmToS1.n5;
request.nmToS2[7] = request.nmToS1.n6;
request.nmToS2[8] = request.nmToS1.n7;
request.nmToS2[9] = request.nmToS1.n8;
request.nmToS2[10] = request.nmToS1.n9;
request.nmToS2[11] = request.nmToS1.n10;
request.nmToS2[12] = request.nmToS1.n11;
request.nmToS2[13] = request.nmToS1.n12;
request.nmToS2[14] = request.nmToS1.n13;
request.nmToS2[15] = request.nmToS1.n14;
request.nmToS2[16] = request.nmToS1.n15;
request.nmToS2[17] = request.nmToS1.n16;
request.nmToS2[18] = request.nmToS1.n17;
request.nmToS2[19] = request.nmToS1.n18;
request.nmToS2[20] = request.nmToS1.n19;
request.nmToS2[21] = request.nmToS1.n20;
request.nmToS2[31] = request.nmToS1.n30;
request.nmToS2[41] = request.nmToS1.n40;
request.nmToS2[51] = request.nmToS1.n50;
request.nmToS2[61] = request.nmToS1.n60;
request.nmToS2[71] = request.nmToS1.n70;
request.nmToS2[81] = request.nmToS1.n80;
request.nmToS2[91] = request.nmToS1.n90;
}

if(nmb is 0) return "zero";

ml = n\1000000;
if (ml)
{
n = n-(1000000*ml);
s1 = nmToSt(ml)&request.nmToS1.ws&request.nmToS1.nM;
if (Len(r))
r = r&request.nmToS1.ws;
r = r&s1;
s1 = "";
hvl = 1;
}

td = n\1000;
if (td)
{
n = n-(1000*td);
s1 = nmToSt(td)&request.nmToS1.ws&request.nmToS1.nK;
if (Len(r))
r = r&request.nmToS1.ws;
r = r&s1;
s1 = "";
hvl = 1;
}

hd = n\100;
if (hd)
{
n = n-(100*hd);
s1 = nmToSt(hd)&request.nmToS1.ws&request.nmToS1.n100;
if (Len(r))
r = r&request.nmToS1.ws;
r = r&s1;
s1 = "";
hvl = 1;
} 

tns = n\10;
if (tns)
n = n-(10*tns);

ons = n\1;
if (ons)
n = n-(ons);

if (Find(".", nmb))
pt = Val(ListLast(nmb, "."));

s1 = "";
if (tns IS 0)
{
if (ons IS 0)
{
if (NOT hvl)
s1 = request.nmToS2[0];
}
else
s1 = request.nmToS2[ons+1];
}
else if (tns IS 1)
{
s1 = request.nmToS2[ons+11];
}
else
{
s1 = request.nmToS2[(tns*10)+1];

if (ons)
s2 = nmToSt(ons);
s1 = s1&request.nmToS1.ws&s2;
}

if (Len(s1))
{
if (Len(r))
r = r&request.nmToS1.ws&request.nmToS1.a&request.nmToS1.ws;
r = r&s1;
}

if (pt)
{
s2 = nmToSt(pt);
r = r&request.nmToS1.ws&request.nmToS1.pt&request.nmToS1.ws&s2;
}

return r;
}

</CFSCRIPT>

<TABLE BORDER="0" WIDTH="300" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 2</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<CFLOOP INDEX="ii" FROM="1" TO="#ArrayLen(request.nmbArray)#">
<TR VALIGN="top">
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#request.nmbArray[ii]#</CFOUTPUT></TD>
<TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#nmToSt(request.nmbArray[ii])#</CFOUTPUT></TD>
</TR>
</CFLOOP>
</TABLE><BR><BR>

<!--- <!--- Question 3 --->

<CFSCRIPT>

function numberToString(number)
{
var numberAppend = ""; 
var numberReplace = "";
var thisNumber = number;
var point = 0;
var one = 0;
var ten = 0;
var hundred = 0;
var thousand = 0;
var million = 0;
var r = "";
var hvl = 0; 
var s2 = "";

if (NOT IsDefined("request.aNumberToString"))
{
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
request.aNumberToString[104] = "pt";
request.aNumberToString[105] = "&";
request.aNumberToString[106] = " ";
}

if(thisNumber is 0){return request.aNumberToString[103];}

million = thisNumber\1000000;
if (million)
{
thisNumber = thisNumber-(1000000*million);
//thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(million)&request.aNumberToString[106]&request.aNumberToString[102];
if (Len(r)){
r = r&request.aNumberToString[106];
}
r = r&numberAppend;
numberAppend = "";
hvl = 1;
}

thousand = thisNumber\1000;
if (thousand)
{
thisNumber = thisNumber-(1000*thousand);
//thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(thousand)&request.aNumberToString[106]&request.aNumberToString[101];
if (Len(r)){
r = r&request.aNumberToString[106];
}
r = r&numberAppend;
numberAppend = "";
hvl = 1;
}

hundred = thisNumber\100;
if (hundred)
{
thisNumber = thisNumber-(100*hundred);
//thisNumber = thisNumber MOD 1000000;
numberAppend = numberToString(hundred)&request.aNumberToString[106]&request.aNumberToString[100];
if (Len(r)){
r = r&request.aNumberToString[106];
}
r = r&numberAppend;
numberAppend = "";
hvl = 1;
}

ten = thisNumber\10;
if (ten){
thisNumber = thisNumber-(10*ten);
}

one = thisNumber\1;
if (one){
thisNumber = thisNumber-(one);
}

if (Find(".", number)){
point = Val(ListLast(number, "."));
}

numberAppend = "";
if (ten IS 0)
{

if (one IS 0)
{
if (NOT hvl){
numberAppend = request.aNumberToString[106];
}
}
else
numberAppend = request.aNumberToString[one];
}

else if (ten IS 1)
{
numberAppend = request.aNumberToString[one+10];
}
else
{
numberAppend = request.aNumberToString[ten*10];
if (one){
s2 = numberToString(one);
}
numberAppend = numberAppend&request.aNumberToString[106]&s2;
}

if (Len(numberAppend))
{
if (Len(r)){
r = r&request.aNumberToString[106]&request.aNumberToString[105]&request.aNumberToString[106];
}
r = r&numberAppend;
}

if (point)
{
s2 = numberToString(point);
r = r&request.aNumberToString[106]&request.aNumberToString[104]&request.aNumberToString[106]&s2;
}

return r;
}

// this function tests variable scope changes during recursion; the global variable is set to 30 initially, but is changed temporarily when the function calls itself from within. This is known as 'recursion'. The variable changes to 10 for 6 successive loops, and once the loop ends, the global variable's initial value returns to 30.

function testFunction(vnumber,cnt){
var globalVar = " ";
var numberAppended = "";
var thisNmb = vnumber;
var counter = cnt;
if(thisNmb IS 30 AND counter IS 0){
globalVar = globalVar&thisNmb;
}
if(counter lte 5){
counter = counter + 1;
numberAppended = testFunction(10,counter)&" ";
globalVar = globalVar&numberAppended;
}
if(thisNmb IS 30){
globalVar = globalVar&thisNmb;
}
if(thisNmb IS 10){
globalVar = globalVar&thisNmb;
}
return globalVar;
}

</CFSCRIPT>

<TABLE BORDER="0" WIDTH="300" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 3</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<!--- <CFLOOP INDEX="ii" FROM="1" TO="#ArrayLen(request.nmbArray)#">
<TR VALIGN="top">
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#request.numberArray[ii]#</CFOUTPUT></TD>
<TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#numberToString(request.numberArray[ii])#</CFOUTPUT></TD>
</TR>
</CFLOOP> --->
<TR VALIGN="top">
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"></TD>
<!--- <TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#numberToString(1452761)#</CFOUTPUT></TD> --->
<TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#testFunction(30,0)#</CFOUTPUT></TD>
</TR>
</TABLE> --->


<!--- Question 3 --->

<CFSCRIPT>

function numberToString(number){

var thisNumber = number;
var numberAppend = "";
var result = "";
var tempString = "";
var haveValue = "";
var million = 0;
var thousand = 0;
var hundred = 0;
var ten = 0;
var one = 0;
var point = 0;

if(NOT ISDEFINED ("request.aNumberToString")){
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
request.aNumberToString[104] = "Point";
request.aNumberToString[105] = "&";
request.aNumberToString[106] = " ";
}

if(thisNumber IS 0){
return request.aNumberToString[103];
}

million = thisNumber\1000000;
if(million){
//thisNumber = thisNumber - (1000000*million);
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
//thisNumber = thisNumber - (1000*thousand);
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
//thisNumber = thisNumber - (100*hundred);
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
//thisNumber = thisNumber - (10*ten);
thisNumber = thisNumber MOD 10;
}

one = thisNumber\1;
if(one){
//thisNumber = thisNumber - (one);
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
else if (ten IS 1){
numberAppend = request.aNumberToString[one+10];
}
else{
numberAppend = request.aNumberToString[ten*10];

if(one){
tempString = request.aNumberToString[one];
}

numberAppend = numberAppend&request.aNumberToString[106]&tempString;

}

// compile result

if(Len(numberAppend)){
if(Len(result)){
result = result&request.aNumberToString[106]&request.aNumberToString[105]&request.aNumberToString[106];
}
result = result&numberAppend;
}

if(point){
tempString = numberToString(point);
result = result&request.aNumberToString[106]&request.aNumberToString[104]&request.aNumberToString[106]&tempString;
}


return result;
}

</CFSCRIPT>

<TABLE BORDER="0" WIDTH="300" CELLPADDING="0" CELLSPACING="2">
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">Question 3</TD>
</TR>
<TR VALIGN="top">
<TD COLSPAN="2" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:bold;">&nbsp;</TD>
</TR>
<!--- <CFLOOP INDEX="ii" FROM="1" TO="#ArrayLen(request.nmbArray)#">
<TR VALIGN="top">
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#request.numberArray[ii]#</CFOUTPUT></TD>
<TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#numberToString(request.numberArray[ii])#</CFOUTPUT></TD>
</TR>
</CFLOOP> --->
<TR VALIGN="top">
<TD WIDTH="50" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"></TD>
<!--- <TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#numberToString(1452761)#</CFOUTPUT></TD> --->
<TD WIDTH="250" STYLE="color:#000000;font-family:Arial;font-size:11px;font-weight:normal;"><CFOUTPUT>#numberToString(1452761)#</CFOUTPUT></TD>
</TR>
</TABLE>


</BODY>
</HTML>
