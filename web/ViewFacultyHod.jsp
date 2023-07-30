<%@page import="dao.GetCountInfo"%>
<%@page import="dto.ManagerDto"%>
<%@page import="dao.ManagersDao"%>
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
    
         
    String id = (String)session.getAttribute("id");
    if( unique_key==null || !unique_key.equals("hod"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

%>
    
    
<%@ include file="headerHod.jsp" %>



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
                          
                        <th>Manager Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of birth</th>
                        <th></th>
                      </tr>
                      <%
                          ManagersDao managerDao=new ManagersDao();
                          List<ManagerDto> listManager = managerDao.getAllManagerData("faculty");
                          Iterator<ManagerDto> itrManager=listManager.iterator();
                          while(itrManager.hasNext())
                          {
                            ManagerDto manager = new ManagerDto();
                            manager=itrManager.next();
                          
                      %>
                      <tr>
                          <td><%= manager.getManager_id() %></td>
                        <td><%= manager.getName() %></td>
                        <td><%= manager.getEmail() %></td>
                        <td><%= manager.getDob() %></td>
                        <td>
                            <form method="post" action="IdManData">
                                
                                <button class="btn btn-default"  >Edit</button> 
                                <input type="text" name="manager_id" hidden value="<%= manager.getManager_id() %>">
                                 <input type="text" name="category" hidden value="<%= manager.getCategory() %>">
                                <a class="btn btn-danger"  href="DeleteData?id=<%= manager.getManager_id() %>&cat=manager ">Delete</a>
                            </form>
                        </td>
                      </tr>
                     <%
                     }
                     %>
                    </table>
              </div>
              </div>

          </div>
        </div>
      </div>
    </section>

  
    
<%@ include file="footerHod.jsp" %>
