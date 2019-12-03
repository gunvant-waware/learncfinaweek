<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true" />
<cfcookie name="cfid" expires="now" value="" preserveCase="yes"/>
<cfcookie name="cftoken" expires='now' value="" preserveCase="yes"/>
<!--- <cfset sessionInvalidate()/> --->
<cfdump var="#session#">
<h1>The session has been cleared!</h1>
<p>Using <span class="code">StructClear(session)</span> or <span class="code">structCLear(cookie)</span> will not end the session,
this will just clear the variables in the memory. The actual session stil remain there.
So, expiring the <span class="code">cfid</span> and <span class="code">cftoken</span> from the session cookies or from the cookies will create a new sesion</p>

<p>SO, expiring session cookies will end the active session -  and the new session will be started when you make the next request. It will take you to the <span class="code">onSessionStart()</span> in the Application.cfc</p>
<p>However <span class="code">sessionInvalidate()</span>, this also ends the active session but when the new request is made there is no call made to the <span class="code">onSessionStart()</span> in the Application.cfc</p>