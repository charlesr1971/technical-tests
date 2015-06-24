

<!-- 

AUTHOR: Charles Robertson
COMPANY: CDESIGN
DATE: 24.06.2015
DESCRIPTION: Coldfusion component providing functions that create data sequences

-->


<cfcomponent displayname="sequence" hint="component description: provides functions that create sequences">


    <!-- FUNCTION INIT: constructor -->
    
    <cffunction name="init" access="public" output="false" hint="function description: constructor function for the sequence component">
      <!-- arguments -->
      <!-- local variables -->
      <!-- cfc variables, accessible to all methods -->
    <cfreturn this />
    </cffunction> 
    
    
    <!-- FUNCTION UDF: outputs a fibonacci sequence -->

    <cffunction name="Fibonacci" access="public" returntype="string" output="false" hint="function description: outputs a fibonacci number sequence">
      <!-- arguments -->
      <cfargument name="n" required="true" type="numeric" default="1" hint="argument description: n">
      <cfargument name="m" required="true" type="numeric" default="1" hint="argument description: m">
      <cfargument name="end" required="true" type="numeric" default="21" hint="argument description: end"> 
      <!-- local variables -->
      <cfset var result = arguments.n> 
      <cfset var current = arguments.m>
      <cfset var previous = 0>
      <!-- logic -->
      <cfloop condition="current LT arguments.end">
        <cfset current = current + previous>
        <cfset previous = current - previous>
        <cfset result = ListAppend(result,current)>
      </cfloop>
    <cfreturn result /> 
    </cffunction>
    
	
</cfcomponent>
