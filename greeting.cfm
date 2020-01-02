<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
<cfdump var="#thisTag#">
	<cfif thisTag.executionMode EQ "Start">
	    <cfset fullName = attributes.firstName & " " & attributes.lastName>

	    <cfoutput>
	          <h3>Hello, #fullName#</h3>
	    </cfoutput>
	    <div class="em">This is when the execution mode is  <span class="code">Start</span></div>
	<cfelse>
		<h2>This Tag is being closed!</h2>
		<div class="em">This is when the execution mode is  <span class="code">End</span></div>
	</cfif>
</cfprocessingdirective>