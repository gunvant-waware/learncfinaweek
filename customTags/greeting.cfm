<cfif thisTag.executionMode EQ "start">

    <cfset fullName = attributes.firstName & " " & attributes.lastName>

    <cfoutput>
          <h3>Hello, #fullName#</h3>
    </cfoutput>
    <p>I am inside the folder</p>
</cfif>