<%@page import="dto.StudentDto"%>
<%@page import="dao.IndividualStudentDao"%>
<%@page import="controller.IndividualStudentGetData"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Edit Page</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    <script type="text/javascript" >document.getElementById("name").disabled = true;</script>
  </head>
  <body>
<%
String enrollment =(String)session.getAttribute("enrollment");
IndividualStudentDao iStudent = new IndividualStudentDao();
StudentDto student = new StudentDto();
student = iStudent.getIndividualStudentData(enrollment);
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
            <li><a href="login.html">Logout</a></li>
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
                 <li><a type="button" data-toggle="modal" data-target="#addFaculty">Add Faculty</a></li>
                  <li><a type="button" data-toggle="modal" data-target="#addHod">Add Hod</a></li>
                   <li><a type="button" data-toggle="modal" data-target="#addAdmin">Add Admin</a></li>
              
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>

    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="index.html">Dashboard</a></li>
          <li class="active">Users</li>
        </ol>
      </div>
    </section>
    <section id="main">
      <div class="container">
        <div class="row">
                 <div class="col-md-3">
            <div class="list-group">
              <a href="index.html" class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>
              <a href="student.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Student <span class="badge">12</span></a>
              <a href="faculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Faculty <span class="badge">33</span></a>
              <a href="hod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Hod <span class="badge">203</span></a>
              <a href="admin.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Admin <span class="badge">203</span></a>
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
                <h3 class="panel-title">Edit Page</h3>
              </div>
              <div class="panel-body">
                 <form method="post" action="UpdateStudentData">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Student Info</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
            <label>Enrollment Number</label><br>
            <h3>  <span style="color:red;"  ><%= student.getEnrollment_number() %></span></h3>
<!--<input id="enrollment" type="text" value="<%= student.getEnrollment_number() %>" name="enrollment_number" class="form-control" placeholder="Page Title">-->
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Student Name</label>
          <input type="text" value="<%= student.getStudent_name() %>" name="student_name" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
          
      <div class="modal-body">
        <div class="form-group">
          <label>Contact Number</label>
          <input type="text" value="<%= student.getMobile() %>" name="fname" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>email</label>
          <input type="email" name="email" value="<%= student.getEmail() %>" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
           
      <div class="modal-body">
        <div class="form-group">
          <label>Address</label>
          <input type="text" name="address" value="<%= student.getAddress() %>" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
           <div class="modal-body">
        <div class="form-group">
          <label>Date of birth</label>
          <input type="text" name="dob" value="<%= student.getDob() %>" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Course</label>
          <input type="text" name="course" value="<%= student.getCourse() %>" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Branch</label>
          <input type="text" value="<%= student.getBranch() %>" name="branch" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Contact</label>
          <input type="text" value="<%= student.getMobile() %>" name="mobile" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Aadhar</label>
          <input type="text" name="aadhar" value="<%= student.getAadhar() %>" class="form-control" placeholder="Page Title">
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
          <input type="text" value="<%= student.getAdmission_year() %>" name="admission_year" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Blood Group</label>
          <input type="text" value="<%= student.getBlood_group() %>" name="blood_group" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update Details</button>
      </div>
    </form>
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

    <!-- Add Page -->
    <div class="modal fade" id="addPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Page</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Page Title</label>
          <input type="text" class="form-control" placeholder="Page Title">
        </div>
        <div class="form-group">
          <label>Page Body</label>
          <textarea name="editor1" class="form-control" placeholder="Page Body"></textarea>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox"> Published
          </label>
        </div>
        <div class="form-group">
          <label>Meta Tags</label>
          <input type="text" class="form-control" placeholder="Add Some Tags...">
        </div>
        <div class="form-group">
          <label>Meta Description</label>
          <input type="text" class="form-control" placeholder="Add Meta Description...">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
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
