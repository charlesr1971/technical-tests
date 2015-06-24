
<!--- Author: Charles Robertson
Function: wordCount
Description: takes a text string as the only argument and converts it into a two dimensional array of unique words & their respective value count
Date: 13.05.09
Comments: extensive use of list to array converion
Language: CFScript --->

<CFCOMPONENT DISPLAYNAME = "wordAndCount" HINT="component that takes a text string as the only argument and converts it into a two dimensional array of unique words & their respective value count">

<CFFUNCTION NAME="init" RETURNTYPE="wordAndCount" OUTPUT="false" ACCESS="public" HINT="function that initialise the wordAndCount component">
<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="wordCount" RETURNTYPE="array" OUTPUT="true" ACCESS="public" HINT="function that converts an integer to its english text equivalent">
<CFARGUMENT NAME="inputString" TYPE="string" REQUIRED="yes" HINT="argument that is a string, which is converted into a two dimensional array of unique words & their respective value count">

<CFSCRIPT>

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

</CFSCRIPT>

</CFFUNCTION>

</CFCOMPONENT>