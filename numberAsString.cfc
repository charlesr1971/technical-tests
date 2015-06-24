
<!--- Author: Charles Robertson
Function: numberToString
Description: converts an integer between 1 and 999,999,999 into it's english text equivalent
Date: 11.05.09
Comments: extensive use of recursion to speed up execution, and simplify code
Language: CFScript --->

<CFCOMPONENT DISPLAYNAME = "numberAsString" HINT="component that converts an integer to its english text equivalent">

<CFFUNCTION NAME="init" RETURNTYPE="numberAsString" OUTPUT="false" ACCESS="public" HINT="function that initialise the numberAsString component">
<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="numberToString" RETURNTYPE="string" OUTPUT="true" ACCESS="public" HINT="function that converts an integer to its english text equivalent">
<CFARGUMENT NAME="inputNumber" TYPE="numeric" REQUIRED="yes" HINT="argument that is an integer to be converted to its english text equivalent">

<CFSCRIPT>

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

return result;

</CFSCRIPT>

</CFFUNCTION>

</CFCOMPONENT>