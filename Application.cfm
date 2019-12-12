<cfapplication name="learncfinaweek" 
							datasource="learncfinaweek"
							sessionmanagement="true"
							clientmanagement="false"
							sessiontimeout="#createTimeSpan(0,0,20,0)#"
							applicationtimeout="#createTimeSpan(0,0,0,10)#" />

<cffunction name="onApplicationStart">
</cffunction>
<cfdump var="#variables#">