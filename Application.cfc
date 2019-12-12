<cfcomponent hint="ColdFusion Component - Application.cfc" displayname="Application.cfc">
	
	<!--- Application Variables --->
	<cfset this.datasource = "learncfinaweek" />
	<cfset this.sessionManagement = true/>
	<!--- The default session timeout is 20 minutes --->
	<cfset this.sessionTimeout = createTimeSpan(0,0,0,5) />
	<!--- The default application timeout is 2 days --->
	<cfset this.applicationTimeout = createTimeSpan(0,0,0,10) />
	<cfset this.hostName = "http://#cgi.HTTP_HOST#/learncfinaweek"/>

	<cfoutput>
		<link rel="stylesheet" type="text/css" href="#this.hostName#/css/style.css?#createUUID()#">
	</cfoutput>

	<!--- When the very first request is made or the first CFC request is made --->
	<cffunction name="onApplicationStart">
		<cfset application.applicationDateInitialized = now() />
		<p class="event blinking">onApplicationStart: The Application Started for the first time</p>
		
		<cfset addApplicationLog('onApplicationStart', 'The application started for the first time') />

	</cffunction>

	<!--- WHen the session started for the first time --->
	<cffunction name="onSessionStart">
		<cfset application.sessionDateInitialized = now() />
		<p class="event blinking">onSessionStart: The session started for the first time</p>
		<cfset addApplicationLog('onSessionStart', 'Session started for the first time') />
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetPage" required="false" />
		<cfoutput>
			<link rel="stylesheet" type="text/css" href="css/style.css?#createUUID()#">
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		</cfoutput>
		<cfdump var="The request started"/>
	</cffunction>

	<!--- If you implement this method you need to include the target page else your page will not be displayedsd --->
	<cffunction name="onRequest">
		<cfargument name="targetPage" required="false" />
		<cfoutput><p class="event blinking">onRequest: The request started for #cgi.SCRIPT_NAME# after onRequestStart()</p></cfoutput>
		<cfset addApplicationLog('onRequest', 'Page on request started for: #cgi.SCRIPT_NAME#') />
		<!--- This can be a header, I want table of contents to be displayed in the all the pages --->
		<cfinclude template="./tableOfContents.cfm" />
		<cfinclude template="#arguments.targetPage#" />
	</cffunction>

	<cffunction name="onRequestEnd">
		<!--- This will be added to the every page request --->
		<div class="footer">
			<div class="footer-container">
				<div class="footer-text">
					<div class="social-links">
						<a href="https://www.facebook.com/imgunvant/">Facebook</a>
						<a href="https://www.linkedin.com/imgunvant/">LinkedIn</a>
						<a href="https://www.instagram.com/imgunvant/">Instagram</a>
					</div>
					<cfoutput>
						<div class="site-links">
							<a href="#this.hostName#/">Home</a>
							<a href="#this.hostName#/about/">About</a>
							<a href="#this.hostName#/contact/">Contact</a>
							<a href="#this.hostName#/privacy-policy/">Privacy Policy</a>
						</div>
					</cfoutput>
				</div>
			</div>
		</div>
		<p class="em">This footer above is added on the onRequestEnd() in Application.cfc, I want this to be added on every page when the request is successful.</p>
		<cfset addApplicationLog('onRequestEnd', 'The request Completed Successfully: #cgi.SCRIPT_NAME#') />
		<p class="event blinking">onRequestEnd: The request ends here..</p>
	</cffunction>

	<cffunction name="onSessionEnd">
		<cfargument name="sessionScope" required="true" />
		<Cfargument name="applicationScope" required="true" />
		<p class="event blinking">onSessionEnd: The session has been timeout</p>
		<cfset addApplicationLog('onSessionEnd', 'The session has been ended') />
	</cffunction>

	<cffunction name="onApplicationEnd">
		<cfargument name="applicationScope" required="true" />
		<p class="event blinking">onApplicationEnd: The Application ended...</p>
		<cfset addApplicationLog('onApplicationEnd', 'Application Ended: #cgi.SCRIPT_NAME# AND ApplicationScope: #serializeJSON(arguments.applicationScope)#') />
	</cffunction>

	<cffunction name="onMissingTemplate">
		<cfset addApplicationLog('onMissingTemplate', 'Page Not Found: #cgi.SCRIPT_NAME#') />
		<cfinclude template="./error/pageNotFound.cfm" />
		<cfoutput><p class="event blinking">onMissingTemplate: Page not Found #cgi.script_name#</p></cfoutput>
	</cffunction>

	<cffunction name="onError">
		<cfargument name="error" default="" required="true"/>
		<cfset addApplicationLog('onError', 'Error Occured on page: #cgi.SCRIPT_NAME#, Message: #arguments.error.message#') />
		<cfoutput><p class="event blinking">onError: #arguments.error.message#</p></cfoutput>
	</cffunction>

	<cffunction name="addApplicationLog" access="public">
		<cfargument name="eventName" default="" />
		<cfargument name="comment" default="" />
		<cfquery datasource="#this.datasource#">
			INSERT INTO application_logs(event_name, comment, created_at) VALUES(
				<cfqueryparam value="#arguments.eventName#" cfsqltype="cf_sql_varchar"/>,
				<cfqueryparam value="#arguments.comment#" cfsqltype="cf_sql_varchar"/>,
				now());
		</cfquery>
		<cflog text="#arguments.eventName#: #arguments.comment#, Date: #dateTimeFormat(now(), 'dd/nn/yyyy hh:mm:ss tt')#" application="Yes" type="information" log="Application"/>
	</cffunction>

</cfcomponent>