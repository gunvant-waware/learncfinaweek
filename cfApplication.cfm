<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
	<h1>Application.cfc</h1>
	<h3>Request Lifecycle Events</h3>
	<p>Lifecycle events add a lot of power and flexibility to your ColdFusion applications, so it's important to understand what events are available and why you might want to use each.</p>
	<ul>
		<li>
			<strong>onApplicationStart:</strong> The very first time your application is used (think immediately after a reboot), the onApplicationStart event is broadcast. This gives you an opportunity to define some application-specific configuration, prime caches, and do a lot more. The important part to remember is that, as a rule of thumb, it only happens once, until your application times out (hasn't been used in a while), the process is restarted, or the computer is restarted.
			<p class="em">The application first starts: when the first request for a page is processed or the first CFC method is invoked by an event gateway instance, Flash Remoting request, or a web service invocation. This method is useful for setting application-wide (Application scope) variables, such as the names of data sources.</p>
		</li>
		<li>
			<strong>onSessionStart:</strong> Any time that a user makes a request to your application and either they haven't used it before, or it's been long enough that their session has expired -- as identified by their cookies, usually -- the onSessionStart event is broadcast. This allows you to set session defaults, like a flag indicating that the user is not currently logged in; or to redirect to the login page.
			<p class="em">A new session is created as a result of a request that is not in an existing session, including ColdFusion event gateway sessions. The application must enable sessions for this event to happen.</p>
		</li>
		<li>
			<strong>onRequestStart:</strong> The two previous events have been specific to the first time something happens. onRequestStart is broadcast before every request, giving you an opportunity to set variables that should be accessible on every page in the site, or to validate that the user is allowed access to the requested page, for instance.
			<p class="em">ColdFusion receives any of the following: a request, an HTTP request (for example, from a browser), a message to an event gateway, a SOAP request, or a Flash Remoting request.</p>
		</li>
		<li>
			<strong>onRequest:</strong> The onRequestStart event has this weird cousin, onRequest, which for now we'll just say does almost the same thing, but differently. You can effectively use them both (onRequestStart is broadcast before onRequest), but they operate a little differently.
			<p class="em">The onRequestStart event has completed. This method acts as a filter for the requested page content.</p>
		</li>
		<li>
			<strong>onRequestEnd:</strong> Similarly to onRequestStart, onRequestEnd is broadcast after your template returns control to CF, giving you the opportunity to add code to every request after the requested template has executed. You might use this to add logging, for example.
			<p>All pages and CFCs in the request have been processed: equivalent to the OnRequestEnd.cfm page.</p>
		</li>
		<li>
			<strong>onSessionEnd:</strong> You may have guessed it, and if so, you were right. There is also an onSessionEnd event, which you can use to do things like empty a shopping cart that was never paid for (thus returning that reserved stock back to availability for other customers to buy).
			<p class="em">A session time-out setting is reached. This event is not triggered when the application ends or the server shuts down.</p>
		</li>
		<li>
			<strong>onApplicationEnd:</strong> And of course, there's an onApplicationEnd event, too. Lovely symmetry, isn't it? This event is broadcast when your application times out (hasn't been used in a while), or if ColdFusion server is shutting down.
			<p class="em">The application ends: when the application times out or the server shuts down.</p>
		</li>
		<li>
			<strong>onMissingTemplate:</strong> When ColdFusion receives a request for a nonexistent page. Page Not Found/404 Error.
		<p class="em">If this event is not implemented in the Application.cfc then the control will be sent to onError event. And also, onError is not implemented the the the default error page will be displayed</p>
		</li>
		<li>
			<strong>onError:</strong> Lastly, there is an onError event broadcast in the event of an un-caught exception, including any you might manually throw. This gives you a last line of defense to deal with any errors that might have slipped through the cracks in your application.
			<p class="em">When an exception occurs that is not caught by a try/catch block.</p>
		</li>

		<li>
			<strong>NOTE:</strong> 
			<p class="em">1. The default Session timeout is 20 minutes.<br/>2. The default application timeout is 2 days.</p>
			<p class="em">You can always overwrite this setting in Application.cfc or Application.cfm using <span class="code">this.sessionTimeout=createTimeSpan(0,0,20,0)</span> and <span class="code">this.applicationTimeout=createTimeSpan(2,0,0,0)</span></p>
		</li>
	</ul>

	<h4 class="em">The onApplicationEnd and onSessionEnd methods do not execute in the context of a page request, so they cannot access request variables or display information to the user. The onMissingTemplate method is triggered when a URL specifies a CFML page that does not exist. The OnError method does not always execute in the context of a request; use its Event argument to determine the context.</h4>
	<div class="">
		<p>Therefore, sessions always terminate after a time-out period of inactivity. If the user does not access a page of the application within this time-out period, ColdFusion interprets this as the end of the session and clears any variables associated with that session.</p>
		<p class="em">A ColdFusion session uses cfid and cftoken to identify the client. Whenever a client visits your app within a fixed time, the page requests are part of the same session. By default, the time is set to 20 minutes. If more than 20 minutes have passed and the client has not issued any new request, the page times out.</p>
		<p class="code">Bug in Lucee: This is not applicable for the page reloads requests. If your sessionTimeout is 5 minutes and you reload the page for 5 minutes,then your session will be expired. :)</p>
	</div>
</cfprocessingdirective>