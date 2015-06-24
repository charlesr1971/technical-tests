
<CFSWITCH EXPRESSION="#attributes.functionLibrary#">

<CFCASE VALUE="numberSequencer">

<CFFUNCTION NAME="numberSequencer" RETURNTYPE="array" OUTPUT="true" ACCESS="public">
<CFARGUMENT NAME="argN" TYPE="numeric" REQUIRED="yes">
<CFARGUMENT NAME="argM" TYPE="numeric" REQUIRED="yes">
<CFARGUMENT NAME="argEnd" TYPE="numeric" REQUIRED="yes">

<CFSCRIPT>

//function numberSequencer(argN,argM,argEnd) {

//initialise variables

var n = ARGUMENTS.argN;
var m = ARGUMENTS.argM;
var end = ARGUMENTS.argEnd;
var sequence = ArrayNew(1);

sequence[1] = n;
sequence[2] = m;

for(i = 3;i lte end;i=i+1){
sequence[i] = sequence[i-1] + sequence[i-2];
if(sequence[i] EQ end){
break;
}
else if(sequence[i] GT end){
ArrayDeleteAt(sequence,i);
break;
}
}

return sequence;

//}

</CFSCRIPT>

<CFRETURN sequence>
</CFFUNCTION>

<CFSET result = numberSequencer(ATTRIBUTES.argN,ATTRIBUTES.argM,ATTRIBUTES.argEnd)>

<CFSET "CALLER.#ATTRIBUTES.sequence#" = result> 

</CFCASE>

</CFSWITCH>