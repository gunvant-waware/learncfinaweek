<cfset applicationStop()/>

<h1>The application has been stopped...</h1>

<p class="em">
	Stopping application using <span class="code">applicationStop()</span> method does not end the session, the session is still persistent.
	<span class="code">applicationStop()</span> will will the application and <span class="code">onApplicationStart()</span> event will occured on the next request.
</p>