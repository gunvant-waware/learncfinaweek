<cfcomponent hint="ColdFusion Component - Application.cfc" displayname="Application.cfc">
	
	<!--- Application Variables --->
	<cfset this.datasource = "testing" />
	<cfset this.sessionManagement = true/>

	<!--- When the very first request is made or the first CFC request is made --->
	<cffunction name="onApplicationStart">
		<cfset this.applicationDateInitialized = now() />
		<cfdump var="The Application Started for the first time"/>
	</cffunction>

	<!--- WHen the session started for the first time --->
	<cffunction name="onSessionStart">
		<cfset this.sessionDateInitialized = now() />
		<cfdump var="The session started for the first time"/>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetPage" required="false" />
		<cfoutput>
			<link rel="stylesheet" type="text/css" href="css/style.css?#createUUID()#">
		</cfoutput>
		<cfdump var="The request started"/>
	</cffunction>

	<!--- If you implement this method you need to include the target page else your page will not be displayedsd --->
	<cffunction name="onRequest">
		<cfargument name="targetPage" required="false" />
		<cfdump var="I am in onRequest"/>
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
					<div class="site-links">
						<a href="./">Home</a>
						<a href="./about/">About</a>
						<a href="./contact/">Contact</a>
						<a href="./privacy-policy/">Privacy Policy</a>
					</div>
				</div>
			</div>
		</div>
		<cfdump var="The request ends here.. The footer is added in onRequestEnd()..."/>		
	</cffunction>

	<cffunction name="onSessionEnd">
		<cfdump var="The session has been ended"/>
	</cffunction>

	<cffunction name="onApplicationEnd">
		<cfdump var="The Application ended..."/>
	</cffunction>

	<cffunction name="onMissingTemplate">
		<cfinclude template="error/pageNotFound.cfm" />
	</cffunction>

	<!--- <cffunction name="onError">
		<cfdump var="I am in onError"/>
	</cffunction> --->

</cfcomponent>