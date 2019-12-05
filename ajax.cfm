<!---Sending an ajax using jQuery--->
<script type="text/javascript">
			$(document).ready(function () {
		
        $('#ajaxBtn').click(function(){
          $('#textChange').html('Loading ajax...');
          $.ajax({
              url: './ajax/loadAjax.cfm', 
              type: 'POST',  // http method
              data: { myData: 'This is my data.' },  // data to submit
              success: function (data, status, xhr) {
                $('#textChange').html('status: ' + status + ', data: ' + data);
              },
              error: function (jqXhr, textStatus, errorMessage) {
                  $('#textChange').html('Error: ' + errorMessage);
                }
          });
		    });
	});
	</script>
  <h1>Send ajax call</h1>

  <h2>Using jQuery</h2>
  <p>You need to include the jQeury library in order to get this processed.</p>
  <div class="cf-code">
    <pre>
      &lt;script type="text/javascript"&gt;
          $(document).ready(function () {
        
            $('#ajaxBtn').click(function(){
              $('#textChange').html('Loading ajax...');
              $.ajax({
                  url: './ajax/loadAjax.cfm', 
                  type: 'POST',  // http method
                  data: { myData: 'This is my data.' },  // data to submit
                  success: function (data, status, xhr) {
                    $('#textChange').html('status: ' + status + ', data: ' + data);
                  },
                  error: function (jqXhr, textStatus, errorMessage) {
                      $('#textChange').html('Error: ' + errorMessage);
                    }
              });
            });
      });
      &lt;/script&gt;
    </pre>
  </div>
  <button id="ajaxBtn">Send Ajax</button>
	<p id="textChange"></p>
  <hr/>
  <h2>Using Javascripts</h2>
  <p>Check the browser console for this</p>
  <div class="cf-code">
    <pre>
        &lt;script&gt;
          // Sending an AJAX using javascript
          var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
                console.log(this.response);
              }
            };
            xhttp.open("GET", "http://playground.cf/learncfinaweek/", true);
            xhttp.send();
        &lt;/script&gt;
    </pre>
  </div>
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
  