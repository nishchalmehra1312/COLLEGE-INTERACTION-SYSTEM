
<%@page import="dao.GetCountInfo"%>
<nav class="navbar navbar-default">s
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><%= (String)session.getAttribute("id") %></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="homeStudent.jsp">Dashboard</a></li>
            <li><a href="ViewAssignmentByStudent.jsp">View All Assignments</a></li>
            <li><a href="ViewNoticeBoardByStudent.jsp">View Notice Board</a></li>
            <li><a href="ViewComplaintByStudent.jsp">View Complaints By You</a></li>
            
          </ul>
          <ul class="nav navbar-nav navbar-right">
              
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small>Manage Your Site</small></h1>
          </div>
          <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
               Add Something
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a type="button" data-toggle="modal" data-target="#addComplaint">New Complaint</a></li>
                
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>
 <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </section>

    <section id="main">
     <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
              <a href="homeStudent.jsp" class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>
              <%
                  GetCountInfo count = new GetCountInfo();
              %>
              <a href="ViewAssignmentByStudent.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Assignments <span class="badge"><%= count.getAssignmentCountStudent(id) %></span></a>
              <a href="ViewComplaintByStudent.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Complaints <span class="badge"><%= count.getComplaintCountStudent(id) %></span></a>
              <a href="ViewNoticeBoardByStudent.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Notice Board <span class="badge"><%= count.getComplaintCountStudent(id)%></span></a>
           
                          </div>