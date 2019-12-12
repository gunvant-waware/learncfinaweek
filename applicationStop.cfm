<cfset applicationStop()/>

<h1>The application has been stopped...</h1>

<p class="em">
	Stopping application using <span class="code">applicationStop()</span> method does not end the session, the session is still persistent.
	<span class="code">applicationStop()</span> will will the application and <span class="code">onApplicationStart()</span> event will occured on the next request.
</p>

<p class="em">Here we are using applicationStop() to explicitely stop/end the application, this is the time where onApplicationEnd
will be executed before onRequestEnd. And after the request is completed the onRequestEnd will be executed, else the onApplicationEnd will automatically executed when there is an application timeout or the server is shutting down.</p>