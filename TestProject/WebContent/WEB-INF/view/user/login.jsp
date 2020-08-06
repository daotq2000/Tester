<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<style>
span{
color: red;

}
</style>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>

 var googleUser = {};
 var startApp = function() {
   gapi.load('auth2', function(){
     // Retrieve the singleton for the GoogleAuth library and set up the client.
     auth2 = gapi.auth2.init({
       client_id: '1045280647911-nh3smq3e2lilcs4aeccn8ojrctbggo41.apps.googleusercontent.com',
       cookiepolicy: 'single_host_origin',
       // Request scopes in addition to 'profile' and 'email'
       //scope: 'additional_scope'
     });
     attachSignin(document.getElementById('customBtn'));
   });
 };
 function attachSignin(element) {
	    console.log(element.id);
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {	        		
	        			 var profile = googleUser.getBasicProfile();
	        		     var redirectUrl = 'user/LoginWithGoogle.htm';   
	        		     var form = $('<form action="' + redirectUrl + '" method="post">' +
	        		                      '<input type="hidden" name="id_token" value="' +
	        		                       googleUser.getAuthResponse().id_token + '" />' +
	        		                       '<input type="hidden" name="id" value="' +
	        		                       profile.getId().toString()+ '" />' +
	        		                                                            '</form>');
	        		     $('body').append(form);
	        			$(form).submit();
	        	  
	        }, function(error) {
	          alert(JSON.stringify(error, undefined, 2));
	        });
	  }
  	
    </script>
<div class="card-body p-0">

	<div class="row">
		<div class="col-lg-12">
			<div class="login-form">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-4"><s:message code="login.title"/></h1>
					<h6 style="color: red;" class="text-center">${message}</h6>
					
				</div>
				
				<form:form action="user/login.htm" modelAttribute="users" methodParam="POST" class="user">

					<div class="form-group">
						<form:input path="username"  class="form-control" /><br>
						<form:errors path="username"/> 
						
					</div>
					<div class="form-group">
					<form:password path="passwords"  class="form-control" /><br>
					 <form:errors path="passwords"/>
					</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox small"
							style="line-height: 1.5rem;">
							<input type="checkbox" class="custom-control-input"
								id="customCheck"> <label class="custom-control-label"
								for="customCheck"><s:message code="login.checkbox"/></label>
						</div>
					</div>
					<div class="form-group">
						<button   type="submit" class="btn btn-primary btn-block"><s:message code="login.submit"/></button>
					</div>
						</form:form>
					<hr>
                    
				 <div id="gSignInWrapper">
				<button  id="customBtn" class="btn btn-google btn-block">
                      <i class="fab fa-google fa-fw"></i> <s:message code="login.google"/>
                    </button>
				</div>
				<hr>
				<script>startApp();</script>
				<div class="text-center"></div>
			</div>
		</div>
	</div>
</div>