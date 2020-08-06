<%@ page pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


 <c:if test="${username == 'admin'}">
<ul class="navbar-nav sidebar sidebar-light accordion toggled" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin/index.htm">
        <div class="sidebar-brand-icon">
			<img src="Resources/img/logo/LogoA.png"/>
			
        </div>
        <div class="sidebar-brand-text mx-3">ABCGroup</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="admin/index.htm">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span><s:message code="home.index" /></span></a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Features
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap" aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="far fa-fw fa-window-maximize"></i>
          <span><s:message code="home.page" /></span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
           
            <a class="collapse-item" href="admin/Achievements/index.htm"><span><s:message code="achi.manager" /></span></a>
            <a class="collapse-item" href="admin/ManagerStaff/index.htm"><span><s:message code="staff.title" /></span></a>
            <a class="collapse-item" href="admin/ManergerDepart.htm"><span><s:message code="depart.title" /></span></a>
            <a class="collapse-item" href="admin/Report/index.htm"><span><s:message code="report.home" /></span></a>
            <a class="collapse-item" href="admin/ManagerAcount.htm"><span><s:message code="user.title" /></span></a>
           
          </div>
        </div>
      </li>
      
      
      
    
      
      
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>
    </c:if>