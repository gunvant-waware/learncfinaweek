<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
	<cfif thisTag.executionMode EQ "start">

	    <cfset fullName = attributes.firstName & " " & attributes.lastName>

	    <cfoutput>
	          <h3>Hello, #fullName#</h3>
	    </cfoutput>
	<cfelse>
		<h2>This Tag is being closed!</h2>
	</cfif>
</cfprocessingdirective>