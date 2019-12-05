<cfprocessingdirective pageEncoding="utf-8" suppressWhitespace="true">
<cfcookie name="cfid" expires="now" value=""/>
	<cfcookie name="cftoken" expires='now' value=""/>
	<!---<cfset sessionInvalidate()/>--->
	<cfdump var="#session#">
	<h1>The session has been cleared!</h1>
	<p>Using <span class="code">StructClear(session)</span> or <span class="code">structCLear(cookie)</span> will not end the session,
	this will just clear the variables in the memory. The actual session stil remain there.
	So, expiring the <span class="code">cfid</span> and <span class="code">cftoken</span> from the session cookies or from the cookies will create a new sesion</p>

	<p>SO, expiring session cookies will end the active session -  and the new session will be started when you make the next request. It will take you to the <span class="code">onSessionStart()</span> in the Application.cfc</p>
	<p>However in Lucee<span class="code">sessionInvalidate()</span>, this also ends the active session but when the new request is made there is no call made to the <span class="code">onSessionStart()</span> in the Application.cfc</p>
</cfprocessingdirective>


<script>
// Sending an AJAX using javascript
var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      console.log(this.response);
    }
  };
  xhttp.open("GET", "http://playground.cf/learncfinaweek/", true);
  xhttp.send();
</script>



<!---Sending an ajax using jQuery--->
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>
<script type="text/javascript">
			$(document).ready(function () {
		
			$('#ajaxBtn').click(function(){
			
			$.ajax({
								url: './ajax/loadAjax.cfm', 
				type: 'POST',  // http method
				data: { myData: 'This is my data.' },  // data to submit
				success: function (data, status, xhr) {
					$('#textChange').append('status: ' + status + ', data: ' + data);
				},
				error: function (jqXhr, textStatus, errorMessage) {
						$('#textChange').append('Error: ' + errorMessage);
					}
			});
		});
	});
	</script>

	<button id="ajaxBtn">Send Ajax</button>
	<p id="textChange"></p>