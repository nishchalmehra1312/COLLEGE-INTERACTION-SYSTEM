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
    
         
    
    if( unique_key==null || !unique_key.equals("admin"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

%>
    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">AdminStrap</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="student.jsp">Student</a></li>
            <li><a href="faculty.jsp">Faculty</a></li>
            <li><a href="hod.jsp">Hod</a></li>
            <li><a href="admin.jsp">Admin</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Welcome, Brad</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Users<small>Manage Site Users</small></h1>
          </div>
          <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Create Content
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a type="button" data-toggle="modal" data-target="#addStudent">Add Student</a></li>
                 <li><a type="button" data-toggle="modal" data-target="#addManager">Add Faculty</a></li>
                  <li><a type="button" data-toggle="modal" data-target="#addManager">Add Hod</a></li>
                   <li><a type="button" data-toggle="modal" data-target="#addManager">Add Admin</a></li>
              
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>

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
                          
                        <th>Manager Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of birth</th>
                        <th></th>
                      </tr>
                      <%
                          ManagersDao s1=new ManagersDao();
                          List<ManagerDto> l1 = s1.getAllManagerData("admin");
                          Iterator<ManagerDto> itr=l1.iterator();
                          while(itr.hasNext())
                          {
                            ManagerDto manager = new ManagerDto();
                            manager=itr.next();
                          
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

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>

    <!-- Modals -->
      <!-- Add Student -->
    <div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertStudentData">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Student Info</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Enrollment Number</label>
          <input type="text" name="enrollment_number" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Student Name</label>
          <input type="text" name="student_name" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Enrollment Number</label>
          <input type="text" class="form-control" placeholder="Page Title">
        </div>
     </div> 
          
      <div class="modal-body">
        <div class="form-group">
          <label>Enrollment Number</label>
          <input type="text" name="fname" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>email</label>
          <input type="email" name="email" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
            <label>Password</label>
          <input type="password" name="password" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Address</label>
          <input type="text" name="address" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
           <div class="modal-body">
        <div class="form-group">
          <label>Date of birth</label>
          <input type="text" name="dob" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Course</label>
          <input type="text" name="course" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Branch</label>
          <input type="text" name="branch" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Contact</label>
          <input type="text" name="mobile" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Aadhar</label>
          <input type="text" name="aadhar" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Gender</label>
          <select  name="gender"  >
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Others</option>
          </select>
           
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Admission Year</label>
          <input type="text" name="admission_year" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Blood Group</label>
          <input type="text" name="blood_group" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add Student</button>
      </div>
    </form>
    </div>
  </div>
</div>
      <!-- Add Manager -->
    <div class="modal fade" id="addManager" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertManagerData">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Faculty Info</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Manager id</label>
          <input type="text" name="manager_id" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Manager Name</label>
          <input type="text" name="manager_name" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Date Of Birth</label>
          <input type="text" name="dob" class="form-control" placeholder="Page Title">
        </div>
     </div> 
          
      <div class="modal-body">
        <div class="form-group">
          <label>Email Id</label>
          <input type="email" name="email" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Password</label>
          <input type="Password" name="password" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
            <label>Mobile</label>
          <input type="password" name="mobile" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Address</label>
          <input type="text" name="address" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
           <div class="modal-body">
        <div class="form-group">
          <label>qualification</label>
          <input type="text" name="qualification" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Experience</label>
          <input type="text" name="experience" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Category</label>
          <select name="category" >
              <option value="faculty">Faculty</option>
              <option value="hod">Hod</option>
              <option value="admin">Admin</option>
          </select>
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Branch</label>
          <input type="text" name="branch" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Subjects</label>
          <input type="text" name="subjects" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
    
      <div class="modal-body">
        <div class="form-group">
          <label>Aadhar</label>
          <input type="text" name="aadhar" class="form-control" placeholder="Page Title">
        </div>
     </div>
              
      <div class="modal-body">
        <div class="form-group">
          <label>Specialization</label>
          <input type="text" name="specialization" class="form-control" placeholder="Page Title">
        </div>
     </div>
          

      <div class="modal-body">
        <div class="form-group">
          <label>Gender</label>
          <select  name="gender"  >
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Others</option>
          </select>
           
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Joining Year</label>
          <input type="text" name="joining  _year" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
     
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add Faculty</button>
      </div>
    </form>
    </div>
  </div>
</div>

    
  <script>
     CKEDITOR.replace( 'editor1' );
 </script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
