<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4"><s:message code="register.title"/></h1>
                    <h6 style="color: red;" class="text-center">${message}</h6>
                  </div>
				<form:form modelAttribute="users" methodParam="POST">        
          <div class="form-group">
                      <label><s:message code="register.fullname"/></label>
                      <form:input path="fullname"  class="form-control" />
                    </div>                                    
                    <div class="form-group">
                      <label><s:message code="register.username"/></label>
                    <form:input path="username"  class="form-control" />
                    </div>
                    <div class="form-group">
                      <label><s:message code="register.password"/></label>
                    <form:password path="passwords"  class="form-control" />
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block"><s:message code="register.register"/></button>
                    </div>
                    </form:form>  
                    <hr>
                    <a href="index.html" class="btn btn-google btn-block">
                      <i class="fab fa-google fa-fw"></i> Register with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                    </a>
                
                  <hr>
                  <div class="text-center">
                    <a class="font-weight-bold small" href="login.html"><s:message code="register.acount"/></a>
                  </div>
                  <div class="text-center">
                  </div>
                </div>
              </div>
            </div>
          </div>