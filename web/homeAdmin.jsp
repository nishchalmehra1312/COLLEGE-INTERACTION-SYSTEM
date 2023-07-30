<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.NoticeDao"%>
<%@page import="java.util.Random"%>
<%@page import="dao.GetCountInfo"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>
<%
    String category = (String)session.getAttribute("category");
    
         
    
    if( category==null || !category.equals("admin"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

%>
   <%@ include file="headerAdmin.jsp" %>
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

           
          </div>
          <div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Website Overview</h3>
              </div>
              <div class="panel-body">
                <div class="col-md-3">
                  <div class="well dash-box">
                    <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <%= count.getStudentCount() %></h2>
                    <h4>Student</h4>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="well dash-box">
                    <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <%= count.getFacultyCount() %></h2>
                    <h4>Faculty</h4>
                  </div>
                </div>
                    
                <div class="col-md-3">
                  <div class="well dash-box">
                    <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <%= count.getHodCount() %></h2>
                    <h4>Hod</h4>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="well dash-box">
                    <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> <%= count.getAdminCount() %></h2>
                    <h4>Admins</h4>
                  </div>
                </div>
              </div>
              </div>

              <!-- Latest Users -->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Latest Notifications</h3>
                </div>
                <div class="panel-body">
                  <table class="table table-striped table-hover">
                      <tr>
                        <th>Notice ID</th>
                        <th>Description</th>
                        <th>Date</th>
                      </tr>
                      <% NoticeDao n = new NoticeDao();
                         List<NoticeDto> l = new ArrayList<NoticeDto>();
                         l=n.getAllNoticesData();
                         Iterator<NoticeDto> i = l.iterator();
                         while(i.hasNext())
                         {
                             NoticeDto notice = new NoticeDto();
                             notice=i.next();
                      %>
                      <tr>
                        <td><%= notice.getNoticeId() %></td>
                        <td><%= notice.getDescription() %></td>
                        <td><%= notice.getIssuedDate() %></td>
                      </tr>
                      <% } %>
                     
                    </table>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>
<%@ include file="footerAdmin.jsp" %>