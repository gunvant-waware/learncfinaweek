<cfcomponent displayname="myCFC">
	<cfset this.myComponentThisScope = "myComponentThisScope!"/>
	<cfset variables.componentVariable = "componentVariable"/>
	<!--- The private function can only be called from the  --->
	<cffunction name="function1">
		<cfset localVar = "LocalVar"/>
		<cfset variables.var1 = 10 />
		<cfset this.myThisFunction1 = "myThisFunction1"/>
		<cfdump var="#this.myComponentThisScope#" label="function1">
		<cfdump var="#componentVariable#" label='function1'>
		<cfset function2() />
		<cfdump var="#variables.myVar#">
		<cfdump var="#this.myThisFunction2#" label="myThisFunction2">
		<cfdump var="#variables.result#">
		<cfreturn variables.result />
	</cffunction>

	<cffunction name="function2">
		<cfparam name="variables.var1" default="1"/>
		<cfset variables.result = variables.var1>
		<cfset variables.myVar = variables.result + rand() />
		<cfdump var="#this.myComponentThisScope#" label="function2">
		<cfdump var="#this.myThisFunction1#" label="myThisFunction1">
		<cfdump var="#componentVariable#" label='function2'>
		<cfset this.myThisFunction2 = "myThisFunction2"/>
		<cfdump var="#variables.myName#" label="variables.myName">
		<cfset privateFunction()/>
	</cffunction>

	<cffunction name="privateFunction" access="private">
		<cfoutput><h3>This is the private function called from the another CFC function :)</h3></cfoutput>
	</cffunction>

	
	<cffunction name="hello">
	<cfargument name="Name" Required=true>
	<cfset Variables.MyName="Hello " & Arguments.Name>
	<cfreturn Variables.MyName>
	</cffunction>
	<cffunction name="VarScopeInCfc">
	<cfoutput>Within the VarScopeInCfc method, Variables.MyName is: #variables.MyName#</cfoutput>
	</cffunction>
	
	<!--- The variable declared inside the cfcomponent will be available to all the functions, doesnt matter where the variable is declared --->
	<cfset Variables.MyName="Tuckerman">

</cfcomponent>

