    <%@page import="java.util.Random"%>
<%@page import="dao.GetCountInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Users</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>
<%
    String unique_key = (String)session.getAttribute("unique_key");
    
         
    
    if( unique_key==null || unique_key.equals("student  "))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

%>
    

    </footer>
    <%@ include file="headerAdmin.jsp" %>
    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="homeAdmin.jsp">Dashboard</a></li>
          <li class="active">Users</li>
        </ol>
      </div>
    </section>

    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="list-group">
              <a href="homeAdmin.jsp" class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>
               <%
                  GetCountInfo count = new GetCountInfo();
              %>
              <a href="student.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Student <span class="badge"><%= count.getStudentCount() %></span></a>
              <a href="faculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Faculty <span class="badge"><%= count.getFacultyCount() %></span></a>
              <a href="hod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Hod <span class="badge"><%= count.getHodCount() %></span></a>
              <a href="admin.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Admin <span class="badge"><%= count.getAdminCount() %></span></a>
            </div>


            <div class="well">
              <h4>Disk Space Used</h4>
              <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                      60%
              </div>
            </div>
            <h4>Bandwidth Used </h4>
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                    40%
            </div>
          </div>
            </div>
          </div>
          <div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Users</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                      <div class="col-md-12">
                          <input class="form-control" type="text" placeholder="Filter Users...">
                      </div>
                </div>
                <br>
                <table class="table table-striped table-hover">
                      <tr>
                          
                        <th>Enrollment</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of birth</th>
                        <th></th>
                      </tr>
                      <%
                          StudentDao s1=new StudentDao();
                          List<StudentDto> l1 = s1.getAllStudentData();
                          Iterator<StudentDto> itr=l1.iterator();
                          while(itr.hasNext())
                          {
                            StudentDto student = new StudentDto();
                            student=itr.next();
                          
                      %>
                      <tr>
                          <td><%= student.getEnrollment_number() %></td>
                        <td><%= student.getStudent_name() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><%= student.getDob() %></td>
                        <td>
                            <form method="post" action="IndividualStudentGetData">
                                
                                <button class="btn btn-default"  >Edit</button> 
                                
                                <input type="text" name="enrollment" hidden value="<%= student.getEnrollment_number() %>">
                                <a class="btn btn-danger"  href="DeleteData?uid=<%= student.getEnrollment_number() %>&cat=student ">Delete</a>
                                <a class="btn btn-danger"  href="ViewData?uid=<%= student.getEnrollment_number() %>&cat=student ">view Info</a>
                            </form>
                        </td>
                      </tr>
                     <%
                     }
                     %>
                    </table>
                       <li><button class="btn btn-danger" data-toggle="modal" data-target="#addStudent">Add Student</button></li>
              </div>
              </div>

          </div>
        </div>
      </div>
    </section>

    <%@ include file="footerAdmin.jsp" %>
                    