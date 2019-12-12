<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
    <cfdump var="#this#">
    <cfdump var="#application#">
    <!--- If you omit the datasource attribute then the default datasource specified in Application.cfm/cfc will be used --->
    <cfquery name="user" datasource="#this.datasource#">
        SELECT * FROM users
    </cfquery>
    <cfdump var="#user#">
</cfprocessingdirective>