
<!--- Author: Charles Robertson
Function: weighIn
Description: takes three parameters. First weigh-in, second weigh-in and number of objects being weighed. The function evaluates the weight of the one object, which is lighter than the other objects, the rest of which are the same weight. The function also evaluates the weight of the heavier objects and the total weight of all objects.
Date: 15.05.09
Comments: extensive use of formulas
Language: CFScript --->

<CFCOMPONENT DISPLAYNAME = "weighIn" HINT="component that weighs objects">

<CFFUNCTION NAME="init" RETURNTYPE="weighIn" OUTPUT="false" ACCESS="public" HINT="function that initialise the weighIn component">
<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="weighIn" RETURNTYPE="array" OUTPUT="true" ACCESS="public" HINT="function that weighs objects">
<CFARGUMENT NAME="afirstWeighIn" TYPE="numeric" REQUIRED="yes" HINT="argument that is an integer that represents the weight of the first weigh-in">
<CFARGUMENT NAME="asecondWeighIn" TYPE="numeric" REQUIRED="yes" HINT="argument that is an integer that represents the weight of the second weigh-in">
<CFARGUMENT NAME="anumberOfObjects" TYPE="numeric" REQUIRED="yes" HINT="argument that is an integer that represents the number of objects to be weighed">

<CFSCRIPT>

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

</CFSCRIPT>

</CFFUNCTION>

</CFCOMPONENT>